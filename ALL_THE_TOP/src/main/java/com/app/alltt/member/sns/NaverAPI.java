package com.app.alltt.member.sns;

import com.github.scribejava.core.builder.api.DefaultApi20;

// Oauth20Service 를 build 하기 위한 객체
// DefaultApi20 을 상속받아야 하며
// Override 되는 두 method의 return 값으로 Oauth20Service 가 동작
// 해당 객체는 singleton으로 생성되어야 인증 정보의 유지, 상태 공유, 성능 및 리소스 관리를 효율적으로 처리
public class NaverAPI extends DefaultApi20 implements NaverUrls {
	
	private NaverAPI() {}
	private static NaverAPI instance = new NaverAPI();
	public static NaverAPI getInstance() {return instance;}
	
	@Override
	public String getAccessTokenEndpoint() {
		return NAVER_TOKEN + "authorization_code";
	}
	
	@Override
	protected String getAuthorizationBaseUrl() {
		return NAVER_AUTH;
	}
	
	public String getTokenAddress() {
		return NAVER_TOKEN;
	}
}