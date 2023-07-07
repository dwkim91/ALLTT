package com.app.alltt.member.service;

import java.util.Map;

import com.app.alltt.main.dto.FilterDTO;
import com.app.alltt.member.dto.MemberDTO;

public interface MemberService {

	public String genNickName();
	public MemberDTO getMemberByUserId(String userId);
	public void addNewMember(MemberDTO member);
	public void removeMember(long memberId);
	public MemberDTO getMemberByMemberId(long memberId);
	public void addWishContentByMemberId(Map<String, Long> wishMap);
	public void deleteWishContentByMemberId(Map<String, Long> wishMap);
<<<<<<< HEAD
	public boolean isWishContent(Map<String, Long> wishMap);

=======
	public void changeNickname(MemberDTO memberDTO);
	public boolean nickNameDuplChecker (String nickName);
	public int getWishCntByMember(long memberId);
	public int getNetflixWishCntByMemberId(long memberId);
	public int getTvingWishCntByMemberId(long memberId);
	public int getWavveWishCntByMemberId(long memberId);
	public void setSubscriptionByMemberId(FilterDTO filterDTO);
	public FilterDTO getSubscriptionByMemberId(long memberId);
>>>>>>> 0065b03d9df961f9e8b06e7378c93be964be765a
}
