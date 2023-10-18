package com.app.alltt.crawling.service;

public interface CrawlingService {
	
	// 티빙
	public void addTvingContent();
	// 넷플
	public void addNetflixContent();
	// 웨이브
	public void addWavveContent() throws InterruptedException;
	// 시리즈 통합 크롤링
	public void addSeriesContents() throws InterruptedException;
	// 무비 통합 크롤링
	public void addMovieContents() throws InterruptedException;
	
}
