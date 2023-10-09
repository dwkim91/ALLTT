package com.app.alltt.support.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.alltt.main.dto.FilteredDTO;
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

	@Override
	public SupportDTO selectOneInquiry(long supportId) {
		return sqlSession.selectOne("supportMapper.selectOneInquiry", supportId);
	}

	@Override
	public void updateAnswer(SupportDTO supportDTO) {
		sqlSession.update("supportMapper.updateAnswer", supportDTO);
	}

	@Override
	public int selectDone() {
		return sqlSession.selectOne("supportMapper.selectDone");
	}

	@Override
	public int selectNew() {
		return sqlSession.selectOne("supportMapper.selectNew");
	}

	@Override
	public int selectInProgress() {
		return sqlSession.selectOne("supportMapper.selectInProgress");
	}

	@Override
	public List<SupportDTO> selectInquiryListByStatus(String status) {
		return sqlSession.selectList("supportMapper.selectInquiryListByStatus", status);
	}

	@Override
	public List<FilteredDTO> selectListImageRequiredToBeUploaded() {
		return sqlSession.selectList("supportMapper.selectListImageRequiredToBeUploaded");
	}

	@Override
	public void insertViewImage(FilteredDTO tempDTO) {
		sqlSession.insert("supportMapper.insertViewImage",tempDTO);
	}

}
