package com.app.alltt.main.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.alltt.main.dto.FilterDTO;
import com.app.alltt.main.dto.FilteredDTO;

@Repository
public class MainDAOImpl implements MainDAO {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<FilteredDTO> selectListPlatformContent(FilterDTO filterDTO) {
		return sqlSession.selectList("mainMapper.selectListPlatformContent",filterDTO);
	}

	@Override
	public List<FilteredDTO> selectListFilteredContentList(FilterDTO filterDTO) {
		return sqlSession.selectList("mainMapper.selectListFilteredContent", filterDTO);
	}

	@Override
	public List<FilterDTO> selectListGenreList(FilterDTO filterDTO) {
		return sqlSession.selectList("mainMapper.selectListGenreList",filterDTO);
	}

	@Override
	public FilteredDTO selectOneContentDetail(long contentId) {
		return sqlSession.selectOne("mainMapper.selectOneContentDetail",contentId);
	}

	@Override
	public List<String> selectListGenreNm(long contentId) {
		return sqlSession.selectList("mainMapper.selectListGenreNm",contentId);
	}

	@Override
	public List<FilteredDTO> selectListGenreLatestContent(FilteredDTO filteredDTO) {
		return sqlSession.selectList("mainMapper.selectListGenreLatestContent", filteredDTO);
	}

	@Override
	public List<FilteredDTO> selectListGenreSimilarContent(FilteredDTO filteredDTO) {
		return sqlSession.selectList("mainMapper.selectListGenreSimilarContent", filteredDTO);
	}

	@Override
	public String selectOnePlatformByDetailUrl(FilteredDTO filteredDTO) {
		return sqlSession.selectOne("mainMapper.selectOnePlatformByDetailUrl", filteredDTO);
	}

	@Override
	public List<FilteredDTO> selectListContentByKeyword(FilterDTO filterDTO) {
		return sqlSession.selectList("mainMapper.selectListContentByKeyword", filterDTO);
	}
	
}
