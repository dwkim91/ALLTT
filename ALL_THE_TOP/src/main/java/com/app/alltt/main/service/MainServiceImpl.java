package com.app.alltt.main.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.alltt.main.dao.MainDAO;
import com.app.alltt.main.dto.FilterDTO;
import com.app.alltt.main.dto.FilteredDTO;

@Service
public class MainServiceImpl implements MainService {
	
	@Autowired
	private MainDAO mainDAO;

	@Override
	public List<FilteredDTO> getMorePlatformContent(FilterDTO filterDTO) {
		return mainDAO.selectListPlatformContent(filterDTO);
	}
	
	@Override
	public List<FilteredDTO> getMoreFilteredContent(FilterDTO filterDTO) {
		return mainDAO.selectListFilteredContentList(filterDTO);
	}

	@Override
	public List<FilterDTO> getMoreGenreList(FilterDTO filterDTO) {
		return mainDAO.selectListGenreList(filterDTO);
	}

	@Override
	public FilteredDTO getContentDetail(long contentId) {
		return mainDAO.selectOneContentDetail(contentId);
	}
	
	@Override
	public List<String> getGenreNmList(long contentId) {
		return mainDAO.selectListGenreNm(contentId);
	}

	@Override
	public List<FilteredDTO> getGenreLatestContent(FilteredDTO filteredDTO) {
		return mainDAO.selectListGenreLatestContent(filteredDTO);
	}
	
	@Override
	public List<FilteredDTO> getGenreSimilarContent(FilteredDTO filteredDTO) {
		return mainDAO.selectListGenreSimilarContent(filteredDTO);
	}

	@Override
	public String getPlatformByDetailUrl(FilteredDTO filteredDTO) {
		return mainDAO.selectOnePlatformByDetailUrl(filteredDTO);
	}

	@Override
	public List<FilteredDTO> getMoreContentByKeyword(FilterDTO filterDTO) {
		return mainDAO.selectListContentByKeyword(filterDTO);
	}
	
}
