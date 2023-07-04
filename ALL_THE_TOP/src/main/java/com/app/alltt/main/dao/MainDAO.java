package com.app.alltt.main.dao;

import java.util.List;

import com.app.alltt.main.dto.FilterDTO;
import com.app.alltt.main.dto.FilteredDTO;

public interface MainDAO {
	
	// 필터링 조건 + platformId > 독점컨텐츠
	List<FilteredDTO> selectListPlatformContent(FilterDTO filterDTO);

	// 필터링 조건 > 컨텐츠
	List<FilteredDTO> selectListFilteredContentList(FilterDTO filterDTO);

	List<FilterDTO> selectListGenreList(FilterDTO filterDTO);

	FilteredDTO selectOneContentDetail(long contentId);
	
	public List<String> selectListGenreNm(long contentId);

	List<FilteredDTO> selectListGenreLatestContent(FilteredDTO filteredDTO);

	List<FilteredDTO> selectListGenreSimilarContent(FilteredDTO filteredDTO);

	String selectOnePlatformByDetailUrl(FilteredDTO filteredDTO);
	
	
}
