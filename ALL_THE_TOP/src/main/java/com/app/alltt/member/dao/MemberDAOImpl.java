package com.app.alltt.member.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.alltt.main.dto.FilterDTO;
import com.app.alltt.member.dto.MemberDTO;

@Repository
public class MemberDAOImpl implements MemberDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public MemberDTO selectMemberByUsrId(String usrId) {
		return sqlSession.selectOne("memberMapper.selectOneMemberByUsrId", usrId);
	}

	@Override
	public void insertMember(MemberDTO member) {
		sqlSession.insert("memberMapper.insertMember", member);
	}

	@Override
	public void deleteMember(long memberId) {
		sqlSession.delete("memberMapper.deleteMember", memberId);
	}
	
	@Override
	public MemberDTO selectOneMemberByMemberId(long memberId) {
		return sqlSession.selectOne("memberMapper.selectOneMemberByMemberId", memberId);
	}

	@Override
	public void insertWishContent(Map<String, Long> wishMap) {
		sqlSession.insert("memberMapper.insertWishContent", wishMap);
	}

	@Override
	public void deleteWishContent(Map<String, Long> wishMap) {
		sqlSession.delete("memberMapper.deleteWishContent", wishMap);
	}

	@Override
	public List<MemberDTO> selectListNickName(String nickName) {
		return sqlSession.selectList("memberMapper.selectListNickName", nickName);
	}

	@Override
	public void updateNickname(MemberDTO memberDTO) {
		sqlSession.update("memberMapper.updateNickname", memberDTO);
	}

	@Override
	public int selectWishCntByMember(long memberId) {
		return sqlSession.selectOne("memberMapper.selectWishCntByMember", memberId);
	}

	@Override
	public int selectNetflixWishCntByMemberId(long memberId) {
		return sqlSession.selectOne("memberMapper.selectNetflixWishCntByMemberId", memberId);
	}

	@Override
	public int selectTvingWishCntByMemberId(long memberId) {
		return sqlSession.selectOne("memberMapper.selectTvingWishCntByMemberId", memberId);
	}

	@Override
	public int selectWavveWishCntByMemberId(long memberId) {
		return sqlSession.selectOne("memberMapper.selectWavveWishCntByMemberId", memberId);
	}

	@Override
	public void deleteSubscriptionByMemberId(long memberId) {
		sqlSession.delete("memberMapper.deleteSubscriptionByMemberId", memberId);
	}

	@Override
	public void insertSubscription(FilterDTO filterDTO) {
		sqlSession.insert("memberMapper.insertSubscription", filterDTO);
	}

	@Override
	public List<Integer> selectListSubscription(long memberId) {
		return sqlSession.selectList("memberMapper.selectListSubscription", memberId);
	}
	
}
