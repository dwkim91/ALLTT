package com.app.alltt.crawling.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.app.alltt.crawling.service.CrawlingService;

@Controller
@RequestMapping("/crawling")
public class CrawlingController {
	
	@Autowired
	private CrawlingService crawlingService;
	
	@GetMapping("/controller")
	@ResponseBody
	public ModelAndView CrawlingControl() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/alltt/crawling");
		return mv;
	}
	
	@GetMapping("/test")
	@ResponseBody
	public String test() {
		
		System.out.println("test");
		crawlingService.deleteContent();
		
		return "<h1>Success</h1>";
	}
	
	@GetMapping("/addNetflixContents")
	@ResponseBody
	public String addNetflixContents() {
		
		crawlingService.addNetflixContent();
		
		return "<h1>Success</h1>";
	}
	
	@GetMapping("/addTvingContents")
	@ResponseBody
	public String addTvingContents() {
		crawlingService.addTvingContent();
		//crawlingService.addTestTvingContent();
		
		return "<h1>Success</h1>";
	}
	
	@GetMapping("/addWavveContents")
	@ResponseBody
	public String addWavveContents() throws InterruptedException {
		
		crawlingService.addWavveContent();
		
		return "<h1>Success</h1>";
	}
	
	@GetMapping("/addAllttContent")
	@ResponseBody
	public String addAllttContent() throws InterruptedException {
		
		crawlingService.addAllttContent();
		
		return "<h1>Success</h1>";
	}
	
}

