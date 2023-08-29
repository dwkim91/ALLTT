package com.app.alltt.main.service;

import java.util.List;

import com.app.alltt.main.dto.FilterDTO;
import com.app.alltt.main.dto.FilteredDTO;

public interface MainService {
	
	// 필터링 조건 + platformId > 독점컨텐츠
	List<FilteredDTO> getMorePlatformContent(FilterDTO filterDTO);
	
	// 필터링 조건 > 필터링된 컨텐츠 정보
	List<FilteredDTO> getMoreFilteredContent(FilterDTO filterDTO);
	
	// 필터링 조건 > 포함된 컨텐츠 장르
	public List<FilterDTO> getMoreGenreList(FilterDTO filterDTO);

	FilteredDTO getContentDetail(long contentId);

	List<String> getGenreNmList(long contentId);

	List<FilteredDTO> getGenreLatestContent(FilteredDTO filteredDTO);

	List<FilteredDTO> getGenreSimilarContent(FilteredDTO filteredDTO);

	String getPlatformByDetailUrl(FilteredDTO filteredDTO);

	List<FilteredDTO> getMoreContentByKeyword(FilterDTO filterDTO);

	FilterDTO getFilterByMemberId(FilterDTO filter);

	boolean getWishByMemberId(FilteredDTO filteredDTO);

}
