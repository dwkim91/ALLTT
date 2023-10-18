package com.app.alltt.crawling.dao;

import java.util.List;

import com.app.alltt.crawling.dto.ContentDTO;
import com.app.alltt.crawling.dto.ContentKeyDTO;
import com.app.alltt.crawling.dto.ContentLinkDTO;
import com.app.alltt.crawling.dto.CrawlingDTO;
import com.app.alltt.crawling.dto.GenreLinkDTO;

public interface CrawlingDAO {
	
	// 컨텐츠 등록용
	public void insertContent(CrawlingDTO crawlingDTO);
	public void insertContentLink(CrawlingDTO crawlingDTO);
	public void insertGenre(CrawlingDTO crawlingDTO);
	public void insertContentKey(ContentKeyDTO contentKeyDTO);
	
	// 플랫폼별 장르링크
	public List<GenreLinkDTO> selectListGenreLink(int platformId);
	// 전체크롤링용 컨텐츠타입과 플랫폼 별로 링크 가져오기 
	public List<GenreLinkDTO> selectListGenreLinkByPlatformId(GenreLinkDTO genreLinkDTO);
	
	// 중복작품 확인용
	public List<Integer> selectListGenreId(long contentId);
	public ContentLinkDTO selectOneContentLink(String imgUrl);
	public List<Long> selectListContentId(String contentKey);
	public String selectOneContentType(long conteneId);
	public List<String> selectListContentKey(long conteneId);
	public List<Integer> selectListPlatformId(long contentId);
	public ContentDTO selectOneContent(long contentId);
	
	// 중복검사된 작품 정보 업데이트용 
	public void updateCreator(CrawlingDTO crawlingDTO);
	public void updateActors(CrawlingDTO crawlingDTO);
	public void updateSummary(CrawlingDTO crawlingDTO);
	public void updateEnrollDt(CrawlingDTO crawlingDTO);
	
	// 서비스종료 작품 확인용
	public void updateExistYnInitByGenre(GenreLinkDTO genreLinkDTO);
	public List<CrawlingDTO> selectListNonServiceContent();
	public void deleteContent(long contentId);
	public void deletePost(long contentId);
	
	// 컨텐츠 이미지 변경
	public Long selectLinkIdByPlatformIdAndContentId(CrawlingDTO crawlingDTO);
	public void updateImgUrl(CrawlingDTO crawlingDTO);
	public void updateExistYnByLinkId(long linkId);

}