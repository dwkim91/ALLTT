//package com.app.alltt.security;
//
//import org.springframework.security.authentication.AuthenticationProvider;
//import org.springframework.security.core.Authentication;
//import org.springframework.security.core.AuthenticationException;
//import org.springframework.stereotype.Component;
//
//@Component
//public class CustomAuthenticationProvider implements AuthenticationProvider {
//
//	@Override
//	public Authentication authenticate(Authentication authentication) throws AuthenticationException {
//		
//		if (authentication != null) {
//			System.out.println(authentication.getName());
//		}
//		
//		return null;
//	}
//
//	@Override
//	public boolean supports(Class<?> authentication) {
//		System.out.println("=================================");
//		return false;
//	}
//}