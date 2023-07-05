package com.app.alltt.member.service;

import java.util.Map;

import com.app.alltt.member.dto.MemberDTO;

public interface MemberService {

	public String genNickName();
	public MemberDTO getMemberByUserId(String userId);
	public void addNewMember(MemberDTO member);
	public void removeMember(long memberId);
	public MemberDTO getMemberByMemberId(long memberId);
	public void addWishContentByMemberId(Map<String, Long> wishMap);
	public void deleteWishContentByMemberId(Map<String, Long> wishMap);

}
