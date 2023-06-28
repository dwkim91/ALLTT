package com.app.alltt.test;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.app.alltt.crawling.dto.CrawlingDTO;
import com.app.alltt.crawling.service.CrawlingService;

@Controller
public class TestController {
	
	@Autowired
	private CrawlingService crawlingService;
	
	@GetMapping("/main")
	public ModelAndView index(HttpServletRequest request) {
		
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("/alltt/main");
		
		mv.addObject("contentList",crawlingService.getMoreContents(0));
		
		return mv;
	}

	@GetMapping("/login")
	public String login() {
		return "/alltt/login";
	}

	@GetMapping("/categories")
	public String categories() {
		return "/alltt/categories";
	}

	@GetMapping("/load-more-items")
	@ResponseBody
	public ModelAndView loadMoreContents(@RequestParam("contentId") int contentId) {
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("/alltt/main");
		
		mv.addObject("contentList",crawlingService.getMoreContents(contentId));
		
		return mv;
	}

}
