package com.app.alltt.support.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.alltt.main.dto.FilteredDTO;
import com.app.alltt.support.dto.PlatformDTO;
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
	public List<FilteredDTO> selectListImageRequiredToBeUploadedByPlatformId(int platformId) {
		return sqlSession.selectList("supportMapper.selectListImageRequiredToBeUploadedByPlatformId", platformId);
	}

	@Override
	public void insertViewImage(FilteredDTO tempDTO) {
		sqlSession.insert("supportMapper.insertViewImage",tempDTO);
	}

	@Override
	public void deleteViewImage(long contentId) {
		sqlSession.delete("supportMapper.deleteViewImage", contentId);
	}

	@Override
	public void updatePlatformCost(PlatformDTO platformDTO) {
		sqlSession.update("supportMapper.updatePlatformCost", platformDTO);
	}

	@Override
	public PlatformDTO selectOnePlatformCost(int platformId) {
		return sqlSession.selectOne("supportMapper.selectOnePlatformCost", platformId);
	}

	@Override
	public List<FilteredDTO> selectListMisContentList() {
		return sqlSession.selectList("supportMapper.selectListMisContentList");
	}

	@Override
	public FilteredDTO selectOneContentDetail(long contentId) {
		return sqlSession.selectOne("supportMapper.selectOneContentDetail", contentId);
	}

	@Override
	public void updateContentInfo(FilteredDTO filteredDTO) {
		System.out.println(filteredDTO);
		sqlSession.update("supportMapper.updateContentInfo", filteredDTO);
	}

	@Override
	public List<FilteredDTO> selectListContentByTitle(String title) {
		return sqlSession.selectList("supportMapper.selectListContentByTitle", title);
	}

}
