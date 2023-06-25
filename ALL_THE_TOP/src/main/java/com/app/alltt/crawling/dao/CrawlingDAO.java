package com.app.alltt.crawling.dao;

import java.util.List;

import com.app.alltt.contentkey.dto.ContentKeyDTO;
import com.app.alltt.crawling.dto.CrawlingDTO;
import com.app.alltt.detaillink.dto.DetailLinkDTO;
import com.app.alltt.genrelink.dto.GenreLinkDTO;

public interface CrawlingDAO {
	
	public void insertContent(CrawlingDTO crawlingDTO);
	public void insertDetailLink(CrawlingDTO crawlingDTO);
	public void insertGenre(CrawlingDTO crawlingDTO);
	public void insertContentKey(ContentKeyDTO contentKeyDTO);
	public List<Integer> selectListGenreId(long contentId);
	public long selectOneContentId(String title);
	public List<GenreLinkDTO> selectListGenreLink(int platformId);
	public DetailLinkDTO selectOneDetailLink(String imgUrl);
	public List<Long> selectListContentId(String contentKey);
	public String selectOneContentType(long conteneId);
	public List<String> selectListContentKey(long conteneId);
	public List<Integer> selectListPlatformId(long contentId);

}