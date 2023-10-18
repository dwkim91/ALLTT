package com.app.alltt.member.sns;

import java.io.InputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.util.UUID;

import javax.servlet.http.HttpSession;

import org.springframework.http.HttpEntity;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpMethod;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Component;
import org.springframework.util.LinkedMultiValueMap;
import org.springframework.util.MultiValueMap;
import org.springframework.web.client.RestTemplate;

import com.app.alltt.member.dto.MemberDTO;
import com.fasterxml.jackson.databind.JsonNode;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.github.scribejava.core.builder.ServiceBuilder;
import com.github.scribejava.core.model.OAuthRequest;
import com.github.scribejava.core.model.Response;
import com.github.scribejava.core.model.Verb;
import com.github.scribejava.core.oauth.OAuth20Service;

@Component
// oauth20service 를 통해 naver와 contact을 진행하는 module
public class AuthModule implements NaverUrls, KakaoUrls {

	// sns 정보가 달라지면 해당 변수에다가 받아서 처리 가능
	private SnsValue sns;
	
	private OAuth20Service oauth20Service;
	
	// sns 정보를 받아서, oauth20service를 설정
	public void setSns(SnsValue sns, String source) {
		this.oauth20Service = new ServiceBuilder(sns.getClientId())
				  .apiSecret(sns.getClientSecret())
				  .callback(sns.getRedirectUrl() + "/" + source)
				  .defaultScope("profile")
				  .build(sns.getApi20());
		
		this.sns = sns;
		this.sns.setSource(source);
	}
	
	// naver와 주고받는 요청이 ALLTT application 에서 보낸 것이라는 확인을 위한 난수 생성을 위한 method
	private String generateState() {
		return UUID.randomUUID().toString();
	}
	
	public String getSnsAuthUrl(HttpSession session) throws Exception {
		String source = null;
		if (sns.getSource().equals("login")) {
			source = "login";
		}
		else if (sns.getSource().equals("withdraw")) {
			source = "withdraw";
		}
		
		String snsAuth = null;
		// 사이트 간 요청 위조(cross-site request forgery) 공격을 방지하기 위해 애플리케이션에서 생성한 상태 토큰값으로 URL 인코딩을 적용한 값을 사용
		String state = generateState();
		// 해당 난수값을 브라우저의 session에다가 저장하고, 다시 return이 왔을 때 해당 난수값으로 우리가 요청한 값인지 구분
		session.setAttribute("state", state);
		
		// SNS 구분하여 NaverUrls, KakaoUrls에서 설정한 고정값 지정 
		if (this.sns.isNaver()) snsAuth = NAVER_AUTH;
		else if (this.sns.isKakao()) snsAuth = KAKAO_AUTH;
		
		String uri = snsAuth + "?response_type=code&client_id=" + sns.getClientId()
		+ "&state=" + state
		+ "&redirect_uri=" + sns.getRedirectUrl() + "/" + source;
		return uri;
	}
	
	public String getAccessToken(String code) throws Exception {
		
		String accessToken = null;
		String source = null;
		if (sns.getSource().equals("login")) {
			source = "login";
		}
		else if (sns.getSource().equals("withdraw")) {
			source = "withdraw";
		}
		if (this.sns.isNaver()) {
			accessToken = oauth20Service.getAccessToken(code).getAccessToken();
		}
		else if (this.sns.isKakao()) {
			RestTemplate restTemplate = new RestTemplate();
			HttpHeaders headers = new HttpHeaders();
			// 헤더에 필요한 추가 정보를 설정
		    headers.add("Content-Type", "application/x-www-form-urlencoded");
		    
		    // 토큰 요청을 위해 필요한 파라미터를 설정
		    MultiValueMap<String, String> parameters = new LinkedMultiValueMap<>();
		    parameters.add("grant_type", "authorization_code");
		    parameters.add("client_id", sns.getClientId());
		    parameters.add("redirect_uri", sns.getRedirectUrl() + "/" + source);
		    parameters.add("code", code);
		    parameters.add("client_secret", sns.getClientSecret());

		    // RestTemplate 등을 사용하여 토큰 요청을 보내고 결과 받기
		    ResponseEntity<String> responseEntity = restTemplate.exchange(
		    		KAKAO_ACCESS_TOKEN,
		            HttpMethod.POST,
		            new HttpEntity<>(parameters, headers),
		            String.class
		    );
		    
		    String response = responseEntity.getBody();
		    
		    // json을 mapping 해주는 역할
	 		ObjectMapper mapper = new ObjectMapper();
	 		JsonNode rootNode = mapper.readTree(responseEntity.getBody());
	 		String access_token = rootNode.get("access_token").asText();

	 		accessToken = access_token;
		}
		return accessToken;
	}
	
	// 탈퇴를 진행한다면, access token 과 함께 탈퇴 요청을 전달
	public boolean withdraw(String token) throws Exception {
		OAuthRequest request = null;
		if (this.sns.isNaver()) {
			// oauth2.0 에서 지원하는 request, token의 grant_type을 delete로 설정해서 우리가 전달하는 access token을 가지는 계정의 연동 해지를 요청
			request = new OAuthRequest(Verb.GET, NAVER_TOKEN + "delete");
			request.addQuerystringParameter("client_id", this.sns.getClientId());
			request.addQuerystringParameter("client_secret", this.sns.getClientSecret());
			request.addQuerystringParameter("service_provider", this.sns.getService());
			//request.addQuerystringParameter("access_token", token.getAccessToken());
			request.addQuerystringParameter("access_token", token);
			
		}
		else if (this.sns.isKakao()) {
			
			request = new OAuthRequest(Verb.POST, KAKAO_WITHDRAW);
			// 헤더에 필요한 추가 정보를 설정
			request.addHeader("Content-Type", "application/x-www-form-urlencoded");
			request.addHeader("Authorization", "Bearer " + token);
			
		}
		oauth20Service.signRequest(token, request);
		// 응답 확인
		Response response = oauth20Service.execute(request);
		// json을 mapping 해주는 역할
		ObjectMapper mapper = new ObjectMapper();
		JsonNode rootNode = mapper.readTree(response.getBody());
		
		return response.isSuccessful();
	}
	
	
	
	// 가져온 user의 token 값을 바탕으로 회원정보를 요청하는 method
	public MemberDTO getMemberProfile(String token) throws Exception {
		String profileUrl = "";
		if (this.sns.isNaver()) profileUrl = NAVER_PROFILE_URL;
		else if (this.sns.isKakao()) profileUrl = KAKAO_PROFILE_URL;
		MemberDTO member = new MemberDTO();
		OAuthRequest request = new OAuthRequest(Verb.GET, profileUrl);
		
		// 카카오 프로필정보요청시 필요한 헤더 추가
		if (this.sns.isKakao()) request.addHeader("Authorization", "Bearer " + token);
		
		// oauth20에서 지원하는 method
		oauth20Service.signRequest(token, request);
		// response 값으로는 하기와 같은 응답이 발생
		// {"resultcode":"00","message":"success","response":{"id":"PwoN_bbaasdfXzAjUWVHeFuQj1yZ345XWas817-AT9XsdfzxcvAU","email":"life4603@naver.com"}}
		Response response = oauth20Service.execute(request);
		
		// 위와 같은 JSON 응답을 parsing 해서 필요한 정보들을 가져옴
		// json을 mapping 해주는 역할
		ObjectMapper mapper = new ObjectMapper();
		JsonNode rootNode = mapper.readTree(response.getBody());
		
		if (this.sns.isNaver()) {
			// 네이버 액세스 토큰 요청방식으로 가져온 사용자 정보
			member.setUserId(rootNode.get("response").get("id").asText());
			//member.setThumbnailImg(rootNode.get("response").get("profile_image").asText());
			String imgUrl = rootNode.get("response").get("profile_image").asText();
			member.setImgData(imgUrlToByte(imgUrl));
			member.setImgExtension(extractFileExtensionFromUrl(imgUrl));
			member.setSocialNm(this.sns.getService());
			
		}
		else if (this.sns.isKakao()) {
			// 카카오 액세스 토큰 요청방식으로 가져온 사용자 정보
			member.setUserId(rootNode.get("id").asText());
			//member.setThumbnailImg(rootNode.get("kakao_account").get("profile").get("thumbnail_image_url").asText());
			String imgUrl = rootNode.get("kakao_account").get("profile").get("thumbnail_image_url").asText();
			member.setImgData(imgUrlToByte(imgUrl));
			member.setImgExtension(extractFileExtensionFromUrl(imgUrl));
			member.setSocialNm(this.sns.getService());
		}
		return member;
	}
	
	// 프로필 이미지 URL에서 byte[] 변환
	private byte[] imgUrlToByte (String imgUrl) throws Exception {
		// URL 연결 설정
	    URL url = new URL(imgUrl);
	    HttpURLConnection connection = (HttpURLConnection) url.openConnection();

	    // 이미지 읽어오기
	    InputStream inputStream = connection.getInputStream();

	    // 이미지 데이터를 byte[]로 반환
	    return inputStream.readAllBytes();
	}
	
	// 이미지 URL에서 파일 확장자 추출
	public String extractFileExtensionFromUrl(String url) {
	    // URL 문자열에서 파일 이름 부분 추출
	    String[] urlParts = url.split("/");
	    String fileName = urlParts[urlParts.length - 1];
	    
	    // 파일 이름에서 확장자 추출
	    String[] fileNameParts = fileName.split("\\.");
	    if (fileNameParts.length > 1) {
	        // 확장자가 존재하는 경우
	        String fileExtension = fileNameParts[fileNameParts.length - 1];
	        return fileExtension.toLowerCase(); // 확장자를 소문자로 반환
	    } else {
	        // 확장자가 없는 경우
	        return null;
	    }
	}
	
}