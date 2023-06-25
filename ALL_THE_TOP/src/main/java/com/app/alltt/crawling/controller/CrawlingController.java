package com.app.alltt.crawling.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import com.app.alltt.crawling.service.CrawlingService;

@Controller
@RequestMapping("/crawling")
public class CrawlingController {
	
	@Autowired
	private CrawlingService crawlingService;
	
	//private ChromeCrawling crawling = new ChromeCrawling();
	
	@GetMapping("/addNetflixContents")
	@ResponseBody
	public String addNetflixContents() {
		
		//crawlingService.addNetflixContents();
		
		return "<h1>Success</h1>";
	}
	
	@GetMapping("/addTvingContents")
	@ResponseBody
	public String addTvingContents() {

		crawlingService.chromeDriverInit();
		
		crawlingService.tvingLogin("alltttv", "!allott1234");
		
		//crawlingService.addContents(crawlingService);
		
		crawlingService.quit();
		
		return "<h1>Success</h1>";
	}
	
}

