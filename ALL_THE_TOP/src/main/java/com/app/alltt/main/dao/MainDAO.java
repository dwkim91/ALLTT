package com.app.alltt.main.dao;

import java.util.List;

import com.app.alltt.main.dto.FilterDTO;
import com.app.alltt.main.dto.FilteredDTO;

public interface MainDAO {
	
	// 필터링 조건 + platformId > 독점컨텐츠
	public List<FilteredDTO> selectListPlatformContent(FilterDTO filterDTO);

	// 필터링 조건 > 컨텐츠
	public List<FilteredDTO> selectListFilteredContentList(FilterDTO filterDTO);

	public List<FilterDTO> selectListGenreList(FilterDTO filterDTO);

	public FilteredDTO selectOneContentDetail(long contentId);
	
	public List<String> selectListGenreNm(long contentId);

	public List<FilteredDTO> selectListGenreLatestContent(FilteredDTO filteredDTO);

	public List<FilteredDTO> selectListGenreSimilarContent(FilteredDTO filteredDTO);

	public String selectOnePlatformByDetailUrl(FilteredDTO filteredDTO);

	public List<FilteredDTO> selectListContentByKeyword(FilterDTO filterDTO);

	public FilterDTO selectOneFilterByMemberId(FilterDTO filter);

	public long selectOneWishByMemberId(FilteredDTO filteredDTO);
	
}
