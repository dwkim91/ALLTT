package com.app.alltt.crawling.service;

import java.util.List;
import com.app.alltt.crawling.dto.CrawlingDTO;
import com.app.alltt.genrelink.dto.GenreLinkDTO;

public interface CrawlingService {
	
	// 크롤링 관련 공통 메서드
	public void chromeDriverInit(); 
	public boolean moveToTargetUrl(String url);
	public void moveToBottomPage(String className);
	public void quit();
	public List<GenreLinkDTO> getGenreLinkList(int platformId);
	// tving 로그인 메서드
	public void tvingLogin(String tvingId, String passwd);
	// 컨텐츠 테이블 에 컨텐츠 추가 메서드
	public void addContents(List<CrawlingDTO> crawlingDTOList);
	
	public void crawlingTest_230625();
	// 넷플
	public void contentsCrawling();
	public void addWavveContent() throws InterruptedException;
	
}
