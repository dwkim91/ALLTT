package com.app.alltt.member.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

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
	public boolean selectOneIsWishContent(Map<String, Long> wishMap) {
		boolean isWishContent;
		
		if (sqlSession.selectOne("memberMapper.selectOneIsWishContent", wishMap) != null) {
			isWishContent = false;
		}
		else {
			isWishContent = true;
		}
		
		return isWishContent;
	}
	
}
