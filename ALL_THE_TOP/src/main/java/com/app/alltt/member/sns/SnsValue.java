package com.app.alltt.member.sns;

import org.apache.commons.lang3.StringUtils;

import com.github.scribejava.core.builder.api.DefaultApi20;

// properties 에 담겨있는 NAVER 에서 발급받은 정보들을 받아주는 class
public class SnsValue {
	
	private String service;
	private String clientId;
	private String clientSecret;
	private String redirectUrl;
	// oauth20service 사용을 위해 정보를 받으며 생성되어야 함
	private DefaultApi20 api20;
	
	// Naver/Kakao 서비스 구분을 위한 변수
	private boolean isNaver;
	private boolean isKakao;
	
	//login/withdraw 
	private String source;
	
	public SnsValue(String service, String clientId, String clientSecret, String redirectUrl) {
		this.service = service;
		this.clientId = clientId;
		this.clientSecret = clientSecret;
		this.redirectUrl = redirectUrl;
		
		this.isNaver = StringUtils.equalsIgnoreCase(service, "naver");
		this.isKakao = StringUtils.equalsIgnoreCase(service, "kakao");
		
		if (isNaver) {
			// 해당 정보는 singleton으로 생성되어서 중복 생성되지 않게 해야 함
			this.api20 = NaverAPI.getInstance();
		}
		else if (isKakao) {
			this.api20 = KaKaoAPI.getInstance();
		}
	
	}

	public String getSource() {
		return source;
	}
	public void setSource(String source) {
		this.source = source;
	}
	public boolean isNaver() {
		return isNaver;
	}
	public void setNaver(boolean isNaver) {
		this.isNaver = isNaver;
	}
	public boolean isKakao() {
		return isKakao;
	}
	public void setKakao(boolean isKakao) {
		this.isKakao = isKakao;
	}
	public DefaultApi20 getApi20() {
		return api20;
	}
	public void setApi20(DefaultApi20 api20) {
		this.api20 = api20;
	}
	public String getService() {
		return service;
	}
	public void setService(String service) {
		this.service = service;
	}
	public String getClientId() {
		return clientId;
	}
	public void setClientId(String clientId) {
		this.clientId = clientId;
	}
	public String getClientSecret() {
		return clientSecret;
	}
	public void setClientSecret(String clientSecret) {
		this.clientSecret = clientSecret;
	}
	public String getRedirectUrl() {
		return redirectUrl;
	}
	public void setRedirectUrl(String redirectUrl) {
		this.redirectUrl = redirectUrl;
	}

	@Override
	public String toString() {
		return "SnsValue [service=" + service + ", clientId=" + clientId + ", clientSecret=" + clientSecret
				+ ", redirectUrl=" + redirectUrl + ", api20=" + api20 + "]";
	}

	
}