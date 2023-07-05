package com.app.alltt.member.sns;

// NAVER api를 사용할 때 contact을 위해 필요한 url들
// NaverAPI 에서 DefaultApi20 을 상속받으며 필요하며
// 인증 과정에서 또한 다수 필요하게 되므로 interface로 선언 후 해당 class들에서 implements로 받아서 사용할 수 있도록 함
public interface NaverUrls {

	// 최초 contact 및 code 발급을 요청하는 url
	static final String NAVER_AUTH = "https://nid.naver.com/oauth2.0/authorize";
	// access token 발급, refresh token을 발급해주는 url
	static final String NAVER_TOKEN = "https://nid.naver.com/oauth2.0/token?grant_type=";
	// 발급받은 access token을 바탕으로 회원정보를 가져오기 위한 url
	static final String NAVER_PROFILE_URL = "https://openapi.naver.com/v1/nid/me";
	
}