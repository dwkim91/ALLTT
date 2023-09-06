package com.app.alltt.support.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.alltt.support.dto.SupportDTO;

@Repository
public class SupportDAOImpl implements SupportDAO {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertInquiry(SupportDTO supportDTO) {
		sqlSession.insert("supportMapper.insertInquiry", supportDTO);
	}

	@Override
	public List<SupportDTO> selectInquiryList() {
		return sqlSession.selectList("supportMapper.selectInquiryList");
	}
	
}
