package com.app.alltt.main.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.app.alltt.main.dto.FilterDTO;
import com.app.alltt.main.dto.FilteredDTO;
import com.app.alltt.main.service.MainService;

@Controller
public class MainController {
	
	@Autowired
	private MainService mainService;
	
	@GetMapping("/main")
	public ModelAndView main(HttpServletRequest request) {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/alltt/main");

		// 메인 페이지 로드시 필요한 기본 필터링값
		FilterDTO filterDTO = new FilterDTO();
		filterDTO.setSortType("latest");
		filterDTO.setContentType("series");
		filterDTO.setLastItemCnt(0);
		filterDTO.setWish(false);
		
		// 플랫폼별 독점작 7선
		filterDTO.setPlatformId(1);
		mv.addObject("netflixContentList", mainService.getMorePlatformContent(filterDTO));

		// 플랫폼별 독점작 7선
		filterDTO.setPlatformId(2);
		mv.addObject("tvingContentList", mainService.getMorePlatformContent(filterDTO));
		
		// 플랫폼별 독점작 7선
		filterDTO.setPlatformId(3);
		mv.addObject("wavveContentList", mainService.getMorePlatformContent(filterDTO));
		
		filterDTO.setGenreId(8);
		mv.addObject("actionContentList", mainService.getMorePlatformContent(filterDTO));
		
		filterDTO.setGenreId(7);
		mv.addObject("dramaContentList", mainService.getMorePlatformContent(filterDTO));
		return mv;
	}
	
	@PostMapping("/contentLoad")
	@ResponseBody
	public List<FilteredDTO> mainFilter(@ModelAttribute FilterDTO filterDTO) {
		
		// AJAX : 스크롤, 체크박스, 셀렉트
		List<FilteredDTO> responseData = mainService.getMoreFilteredContent(filterDTO);
		
		return responseData;
		
	}
	
	@PostMapping("/wavveTest")
	public void wavveTest(@ModelAttribute List<String> wavveTest) {
		
		System.out.println(wavveTest);
		
	}
	
	@GetMapping("/detail")
	public ModelAndView detilContent(@RequestParam("contentId") long contentId) {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/alltt/detail");
		
		// 컨텐츠의 모든정보 (1개씩)
		FilteredDTO filteredDTO = mainService.getContentDetail(contentId);
		mv.addObject("filteredDataDTO", filteredDTO);
		
		// 컨텐츠의 장르 (모두)
		List<String> genreNmList = mainService.getGenreNmList(contentId);
		String genreNm = "";
		for (int i = 0; i < genreNmList.size(); i++) {
			genreNm += genreNmList.get(i);
			if (genreNmList.size()-1 != i) genreNm += ",";
		}
		mv.addObject("genreNmList", genreNm);
		List<FilteredDTO> latestList = mainService.getGenreLatestContent(filteredDTO); 
		List<FilteredDTO> similarList = mainService.getGenreSimilarContent(filteredDTO); 
		mv.addObject("latestList", latestList);
		mv.addObject("similarList",similarList);
		filteredDTO.setPlatformId(1);
		mv.addObject("netflixUrl",mainService.getPlatformByDetailUrl(filteredDTO));
		filteredDTO.setPlatformId(2);
		mv.addObject("tvingUrl",mainService.getPlatformByDetailUrl(filteredDTO));
		filteredDTO.setPlatformId(3);
		mv.addObject("wavveUrl",mainService.getPlatformByDetailUrl(filteredDTO));
		return mv;
	}
	
	@GetMapping("/series")
	public ModelAndView series(HttpServletRequest request) {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/alltt/series");
		
		// 기본필터
		FilterDTO filterDTO = new FilterDTO();
		filterDTO.setNetflixId(1);
		filterDTO.setTvingId(2);
		filterDTO.setWavveId(3);
		filterDTO.setSortType("latest");
		filterDTO.setContentType("series");
		filterDTO.setLastItemCnt(0);
		filterDTO.setWish(true);
		
		mv.addObject("contentList", mainService.getMoreFilteredContent(filterDTO));
		mv.addObject("genreList"  , mainService.getMoreGenreList(filterDTO));
		
		return mv;
	}
	
	@GetMapping("/movie")
	public ModelAndView movie(HttpServletRequest request) {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/alltt/movie");
		
		// 기본필터
		FilterDTO filterDTO = new FilterDTO();
		filterDTO.setNetflixId(1);
		filterDTO.setTvingId(2);
		filterDTO.setWavveId(3);
		filterDTO.setSortType("latest");
		filterDTO.setContentType("movie");
		filterDTO.setLastItemCnt(0);
		filterDTO.setWish(true);
		
		mv.addObject("contentList", mainService.getMoreFilteredContent(filterDTO));
		mv.addObject("genreList"  , mainService.getMoreGenreList(filterDTO));
		
		return mv;
	}
	
	@GetMapping("/login")
	public String login() {
		return "/alltt/login";
	}
	
	@GetMapping("/wish")
	public String wish() {
		return "/alltt/wish";
	}
	
	@GetMapping("/community")
	public String community() {
		return "/alltt/community";
	}
	
	@GetMapping("/write")
	public String write() {
		return "/alltt/write";
	}
	
}
