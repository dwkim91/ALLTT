package com.app.alltt.member.dao;

import java.util.List;
import java.util.Map;

import com.app.alltt.main.dto.FilterDTO;
import com.app.alltt.main.dto.FilteredDTO;
import com.app.alltt.member.dto.MemberDTO;

public interface MemberDAO {

	public MemberDTO selectMemberByUsrId(String usrId);
	public void insertMember(MemberDTO member);
	public void deleteMember(long memberId);
	public MemberDTO selectOneMemberByMemberId(long memberId);
	
	
	public void insertWishContent(FilteredDTO filteredDTO);
	public void deleteWishContent(Map<String, Long> wishMap);
	public List<MemberDTO> selectListNickName(String nickName);
	public void updateNickname(MemberDTO memberDTO);
	public int selectWishCntByMember(long memberId);
	public int selectNetflixWishCntByMemberId(long memberId);
	public int selectTvingWishCntByMemberId(long memberId);
	public int selectWavveWishCntByMemberId(long memberId);
	public void deleteSubscriptionByMemberId(long memberId);
	public void insertSubscription(FilterDTO filterDTO);
	public List<Integer> selectListSubscription(long memberId);
	public boolean selectOneIsWishContent(FilteredDTO filteredDTO);
	public FilterDTO selectOneContentFilter(FilterDTO filterDTO);
	public void insertContentFilter(FilterDTO filterDTO);
	public void updateContentFilter(FilterDTO filterDTO);
	public List<FilteredDTO> selectListWishContentByFilterDTO(FilterDTO filterDTO);
	public void deleteWishContent(FilteredDTO filteredDTO);
	public List<FilteredDTO> selectListWishContentByMemberInfo(Map<String, Object> memberInfo);
	public void updateThumbnailImg(MemberDTO memberDTO);
	public int selectOnePlatformCntByFilterDTO(FilterDTO filterDTO);
	public void updateProfileImg(MemberDTO memberDTO);
	public MemberDTO selectOneMemberSimpleInfoByMemberId(long memberId);
}