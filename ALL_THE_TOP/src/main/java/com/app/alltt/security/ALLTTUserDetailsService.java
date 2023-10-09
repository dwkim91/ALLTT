package com.app.alltt.security;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.security.core.Authentication;
import org.springframework.security.core.GrantedAuthority;
import org.springframework.security.core.authority.SimpleGrantedAuthority;
import org.springframework.security.core.context.SecurityContextHolder;
import org.springframework.security.core.userdetails.User;
import org.springframework.security.core.userdetails.UserDetails;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.core.userdetails.UsernameNotFoundException;
import org.springframework.stereotype.Service;

import com.app.alltt.member.dao.MemberDAO;
import com.app.alltt.member.dto.MemberDTO;

@Service("authService")
public class ALLTTUserDetailsService implements UserDetailsService{
	
	@Autowired
	private MemberDAO memberDAO;
	
	@Override
	public UserDetails loadUserByUsername(String username) throws UsernameNotFoundException {
		
		MemberDTO newMember = memberDAO.selectMemberByUsrId(username);
		
		// 사용자의 권한 정보를 설정
		List<GrantedAuthority> authorities = new ArrayList<>();
		authorities.add(new SimpleGrantedAuthority(newMember.getManagerYn().equals("Y") ? "ROLE_ADMIN" : "ROLE_USER"));
		
		UserDetails test = new User(newMember.getUserId(), newMember.getNickName(), authorities);
		
        // UserDetails 객체를 포장한 Authentication 객체 생성
        Authentication authentication = new UsernamePasswordAuthenticationToken(
        		test, // UserDetails
            test.getPassword(), // 비밀번호 (또는 인증 토큰)
            test.getAuthorities() // 권한 정보
        );
        
        // SecurityContextHolder에 Authentication 객체 저장을 해줘야 security 에서 권한 정보를 가져와서 비교 가능
        SecurityContextHolder.getContext().setAuthentication(authentication);
		
		return test;
	}
	
	public void byeUser() {
		SecurityContextHolder.clearContext();
	}

}
