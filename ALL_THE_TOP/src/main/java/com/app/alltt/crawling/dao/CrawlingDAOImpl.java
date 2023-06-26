package com.app.alltt.crawling.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.alltt.content.dto.ContentDTO;
import com.app.alltt.contentkey.dto.ContentKeyDTO;
import com.app.alltt.contentlink.dto.ContentLinkDTO;
import com.app.alltt.crawling.dto.CrawlingDTO;
import com.app.alltt.genrelink.dto.GenreLinkDTO;

@Repository
public class CrawlingDAOImpl implements CrawlingDAO {
	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public void insertContent(CrawlingDTO crawlingDTO) {
		sqlSession.insert("crawlingMapper.insertContent", crawlingDTO);
	}

	@Override
	public void insertContentLink(CrawlingDTO crawlingDTO) {
		sqlSession.insert("crawlingMapper.insertContentLink", crawlingDTO);
	}

	@Override
	public void insertGenre(CrawlingDTO crawlingDTO) {
		sqlSession.insert("crawlingMapper.insertGenre", crawlingDTO);
	}

	@Override
	public List<Integer> selectListGenreId(long contentId) {
		return sqlSession.selectList("crawlingMapper.selectListGenreId", contentId);
	}

	@Override
	public List<GenreLinkDTO> selectListGenreLink(int platformId) {
		return sqlSession.selectList("crawlingMapper.selectListGenreLink", platformId);
	}

	@Override
	public ContentLinkDTO selectOneContentLink(String imgUrl) {
		return sqlSession.selectOne("crawlingMapper.selectOneContentLink", imgUrl); 
	}

	@Override
	public List<Long> selectListContentId(String contentKey) {
		return sqlSession.selectList("crawlingMapper.selectListContentId", contentKey);
	}

	@Override
	public String selectOneContentType(long conteneId) {
		return sqlSession.selectOne("crawlingMapper.selectOneContentType", conteneId);
	}

	@Override
	public List<String> selectListContentKey(long conteneId) {
		return sqlSession.selectList("crawlingMapper.selectListContentKey", conteneId);
	}

	@Override
	public List<Integer> selectListPlatformId(long contentId) {
		return sqlSession.selectList("crawlingMapper.selectListPlatformId", contentId);
	}

	@Override
	public void insertContentKey(ContentKeyDTO contentKeyDTO) {
		sqlSession.insert("crawlingMapper.insertContentKey", contentKeyDTO);
	}

	@Override
	public ContentDTO selectOneContent(long contentId) {
		return sqlSession.selectOne("crawlingMapper.selectOneContent", contentId);
	}

	@Override
	public void updateContentStatus() {
		sqlSession.update("crawlingMapper.updateContentStatus");
	}
	
}
