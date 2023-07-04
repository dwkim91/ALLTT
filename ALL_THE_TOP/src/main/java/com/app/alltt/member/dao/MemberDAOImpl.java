package com.app.alltt.member.dao;

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
	
}
