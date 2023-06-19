package com.app.alltt.crawling.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CrawlingDAOImpl implements CrawlingDAO {

	
	@Autowired
	private SqlSession sqlSession;

	@Override
	public boolean checkDupl() {
		return false;
	}

	@Override
	public void insertContents() {
		
	}

	@Override
	public void insertDetailLink() {
		
	}

	@Override
	public void insertGenre() {
		
	}
	
	
}
