package com.app.alltt.main.controller;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.app.alltt.community.service.CommunityService;
import com.app.alltt.main.dto.FilterDTO;
import com.app.alltt.main.dto.FilteredDTO;
import com.app.alltt.main.service.MainService;

@Controller
public class MainController {
	
	@Autowired
	private MainService mainService;
	
	@Autowired
	private CommunityService communityService;
	
	@GetMapping("/main2")
	public ModelAndView main2(HttpServletRequest request) {
		
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/alltt/main2");

		// 메인 페이지 로드시 필요한 기본 필터링값
		FilterDTO filterDTO = new FilterDTO();
		filterDTO.setSortType("latest");
		filterDTO.setContentType("series");
		filterDTO.setLastItemCnt(0);
		filterDTO.setIsWishInclude(false);
		
		// 플랫폼별 독점작 7선
		filterDTO.setPlatformId(1);
		mv.addObject("netflixContentList", mainService.getMorePlatformContent(filterDTO));

		// 플랫폼별 독점작 7선
		filterDTO.setPlatformId(2);
		mv.addObject("tvingContentList", mainService.getMorePlatformContent(filterDTO));
		
		// 플랫폼별 독점작 7선
		filterDTO.setPlatformId(3);
		mv.addObject("wavveContentList", mainService.getMorePlatformContent(filterDTO));

		// 액션 7선
		filterDTO.setGenreId(8);
		mv.addObject("actionContentList", mainService.getMorePlatformContent(filterDTO));
		
		// 드라마장르 7선
		filterDTO.setGenreId(7);
		mv.addObject("dramaContentList", mainService.getMorePlatformContent(filterDTO));
		return mv;
	}
	
	@GetMapping("/main")
	public ModelAndView main() {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/alltt/main");
		
		return mv;
	}
	
	@PostMapping("/searchContent")
	public @ResponseBody List<FilteredDTO> searchContent(@RequestParam String contentTitle){
		
		FilterDTO searchDTO = new FilterDTO();
		searchDTO.setSearchKey(contentTitle);
		return mainService.getMoreContentByKeyword(searchDTO);
	}
	
	@PostMapping("/contentLoad")
	@ResponseBody
	public List<FilteredDTO> mainFilter(@ModelAttribute FilterDTO filterDTO, HttpSession session) {
		if (session.getAttribute("memberId") != null) filterDTO.setMemberId((long)session.getAttribute("memberId"));
		
		return mainService.getMoreFilteredContent(filterDTO);
		
	}
	
	@GetMapping("/detail")
	public ModelAndView detilContent(@RequestParam("contentId") long contentId, HttpSession session) {
		
		ModelAndView mv = new ModelAndView();
		
		mv.setViewName("/alltt/detail");
		
		// 컨텐츠의 모든정보 (1개씩)
		FilteredDTO filteredDTO = mainService.getContentDetail(contentId);
		
		if (session.getAttribute("memberId") != null) {
			filteredDTO.setMemberId((long)session.getAttribute("memberId"));
		}
		
		if (!mainService.getWishByMemberId(filteredDTO)) filteredDTO.setMemberId(0);
		mv.addObject("filteredDTO", filteredDTO);
		
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
		
		mv.addObject("postList", communityService.getPostListByContent(contentId));
		
		return mv;
	}
	
	@GetMapping("/series")
	public ModelAndView series(HttpServletRequest request, HttpSession session) {
		
		ModelAndView mv = new ModelAndView();
		
		if (session.getAttribute("memberId") == null) {
			mv.setViewName("/alltt/login");
			return mv;
		}
		
		mv.setViewName("/alltt/series");

		// 회원필터
		FilterDTO filter = new FilterDTO();
		filter.setMemberId((long) session.getAttribute("memberId"));
		filter.setContentType("series");
		FilterDTO filterDTO = mainService.getFilterByMemberId(filter);
		if (filterDTO.getWishIncludeYn().equals("Y")) filterDTO.setIsWishInclude(true);
		else filterDTO.setIsWishInclude(false);
		
		mv.addObject("contentList", mainService.getMoreFilteredContent(filterDTO));
		mv.addObject("genreList"  , mainService.getMoreGenreList(filterDTO));
		mv.addObject("filterDTO", filterDTO);
		
		return mv;
	}
	
	@GetMapping("/movie")
	public ModelAndView movie(HttpServletRequest request, HttpSession session) {
		
		ModelAndView mv = new ModelAndView();
		
		if (session.getAttribute("memberId") == null) {
			mv.setViewName("/alltt/login");
			return mv;
		}
		
		mv.setViewName("/alltt/movie");
		
		// 회원필터
		FilterDTO filter = new FilterDTO();
		filter.setMemberId((long) session.getAttribute("memberId"));
		filter.setContentType("movie");
		FilterDTO filterDTO = mainService.getFilterByMemberId(filter);
		if (filterDTO.getWishIncludeYn().equals("Y")) filterDTO.setIsWishInclude(true);
		else filterDTO.setIsWishInclude(false);
		
		mv.addObject("contentList", mainService.getMoreFilteredContent(filterDTO));
		mv.addObject("genreList"  , mainService.getMoreGenreList(filterDTO));
		mv.addObject("filterDTO", filterDTO);
		
		return mv;
	}
	
	@GetMapping("/login")
	public String login() {
		return "/alltt/login";
	}
	
	@PostMapping("/contentSearch")
	@ResponseBody
	public List<FilteredDTO> search(@ModelAttribute FilterDTO filterDTO, HttpSession session) {
		
		filterDTO.setMemberId((long)session.getAttribute("memberId"));
		
		return mainService.getMoreContentByKeyword(filterDTO);
	}
	
	@GetMapping("/error404")
	public String error404() {
		return "/alltt/404";
	}
	
	@GetMapping("/error500")
	public String error500() {
		return "/alltt/500";
	}
	
}
