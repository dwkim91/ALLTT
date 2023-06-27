package com.app.alltt.crawling.service;

import java.util.List;

import com.app.alltt.crawling.dto.CrawlingDTO;

public interface CrawlingService {
	
	// 티빙
	public void addTvingContent();
	// 넷플
	public void addNetflixContent();
	// 웨이브
	public void addWavveContent() throws InterruptedException;
	
	// scroll test
	public List<CrawlingDTO> getMoreContents(int contentId);
	
}
