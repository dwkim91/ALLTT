package com.app.alltt.crawling.service;

public interface CrawlingService {
	
	// 티빙
	public void addTvingContent();
	// 넷플
	public void addNetflixContent();
	// 웨이브
	public void addWavveContent() throws InterruptedException;
	
}
