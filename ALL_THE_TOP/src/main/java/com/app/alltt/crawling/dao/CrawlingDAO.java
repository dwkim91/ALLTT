package com.app.alltt.crawling.dao;

import java.util.List;

import com.app.alltt.content.dto.ContentDTO;
import com.app.alltt.contentkey.dto.ContentKeyDTO;
import com.app.alltt.contentlink.dto.ContentLinkDTO;
import com.app.alltt.crawling.dto.CrawlingDTO;
import com.app.alltt.genrelink.dto.GenreLinkDTO;

public interface CrawlingDAO {
	
	public void insertContent(CrawlingDTO crawlingDTO);
	public void insertContentLink(CrawlingDTO crawlingDTO);
	public void insertGenre(CrawlingDTO crawlingDTO);
	public void insertContentKey(ContentKeyDTO contentKeyDTO);
	public List<Integer> selectListGenreId(long contentId);
	//public long selectOneContentId(String title);
	public List<GenreLinkDTO> selectListGenreLink(int platformId);
	public ContentLinkDTO selectOneContentLink(String imgUrl);
	public List<Long> selectListContentId(String contentKey);
	public String selectOneContentType(long conteneId);
	public List<String> selectListContentKey(long conteneId);
	public List<Integer> selectListPlatformId(long contentId);
	public ContentDTO selectOneContent(long contentId);
	public void updateContentStatus();
	
	public String selectOneTitle(long contentId);
	public void updateCreator(CrawlingDTO crawlingDTO);
	public void updateActors(CrawlingDTO crawlingDTO);
	public void updateSummary(CrawlingDTO crawlingDTO);
	public void updateEnrollDt(CrawlingDTO crawlingDTO);
	
	//test가져오기
	public List<ContentDTO> selectListContent();
	
	// scroll test
	public List<CrawlingDTO> selectListScrollContent(int contentId);
	
	//전체크롤링용 장르ID 별 플랫폼 별로 링크 가져오기 
	public List<GenreLinkDTO> selectListGenreLinkByGenreId(GenreLinkDTO genreLinkDTO);

}