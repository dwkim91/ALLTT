package com.app.alltt.member.sns;

import com.github.scribejava.core.builder.api.DefaultApi20;

public class KaKaoAPI extends DefaultApi20 implements KakaoUrls {

	private KaKaoAPI() {}
	
	public static KaKaoAPI instance = new KaKaoAPI();
	
	public static KaKaoAPI getInstance() {
		return instance; 
	}
	
	
	@Override
	public String getAccessTokenEndpoint() {
		return KAKAO_ACCESS_TOKEN;
	}

	@Override
	protected String getAuthorizationBaseUrl() {
		return KAKAO_AUTH;
	}
	
}
