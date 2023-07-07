package com.app.alltt.member.dao;

import java.util.List;
import java.util.Map;

import com.app.alltt.main.dto.FilterDTO;
import com.app.alltt.member.dto.MemberDTO;

public interface MemberDAO {

	public MemberDTO selectMemberByUsrId(String usrId);
	public void insertMember(MemberDTO member);
	public void deleteMember(long memberId);
	public MemberDTO selectOneMemberByMemberId(long memberId);
	
	public void insertWishContent(Map<String, Long> wishMap);
	public void deleteWishContent(Map<String, Long> wishMap);
	public List<MemberDTO> selectListNickName(String nickName);
<<<<<<< HEAD
	public boolean selectOneIsWishContent(Map<String, Long> wishMap);
=======
	public void updateNickname(MemberDTO memberDTO);
	public int selectWishCntByMember(long memberId);
	public int selectNetflixWishCntByMemberId(long memberId);
	public int selectTvingWishCntByMemberId(long memberId);
	public int selectWavveWishCntByMemberId(long memberId);
	public void deleteSubscriptionByMemberId(long memberId);
	public void insertSubscription(FilterDTO filterDTO);
	public List<Integer> selectListSubscription(long memberId);
>>>>>>> 0065b03d9df961f9e8b06e7378c93be964be765a
}