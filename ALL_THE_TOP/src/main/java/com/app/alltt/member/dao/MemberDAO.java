package com.app.alltt.member.dao;

import java.util.List;
import java.util.Map;

import com.app.alltt.member.dto.MemberDTO;

public interface MemberDAO {

	public MemberDTO selectMemberByUsrId(String usrId);
	public void insertMember(MemberDTO member);
	public void deleteMember(long memberId);
	public MemberDTO selectOneMemberByMemberId(long memberId);
	
	public void insertWishContent(Map<String, Long> wishMap);
	public void deleteWishContent(Map<String, Long> wishMap);
	public List<MemberDTO> selectListNickName(String nickName);
	public boolean selectOneIsWishContent(Map<String, Long> wishMap);
}