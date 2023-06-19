package com.app.alltt.crawling.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.alltt.crawling.dao.CrawlingDAO;

@Service
public class CrawlingServiceImpl implements CrawlingService {
	
	@Autowired
	private CrawlingDAO crawlingDAO;

	@Override
	public void addNetflixContents() {
		
	}

	@Override
	public void addTvingContents() {
		
	}

	@Override
	public void addWavveContents() {
		
	}
	
	
}
