package com.app.alltt.member.sns;

public interface KakaoUrls {
	
	// 카카오 인가코드 발급 URL
	static final String KAKAO_AUTH = "https://kauth.kakao.com/oauth/authorize";
	// 카카오 토큰 발급 URL
	static final String KAKAO_ACCESS_TOKEN = "https://kauth.kakao.com/oauth/token";
	// 카카오 사용자 정보 요청 URL
	static final String KAKAO_PROFILE_URL = "https://kapi.kakao.com/v2/user/me";
	// 카카오 연결끊기(회원탈퇴) 요청 URL
	static final String KAKAO_WITHDRAW = "https://kapi.kakao.com/v1/user/unlink";
	
}
