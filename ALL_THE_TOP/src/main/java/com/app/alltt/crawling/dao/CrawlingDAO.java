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

}