package com.app.alltt.community.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.security.config.annotation.method.configuration.EnableGlobalMethodSecurity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.app.alltt.community.dto.PostDTO;
import com.app.alltt.community.dto.RecmndDTO;
import com.app.alltt.community.dto.ReplyDTO;
import com.app.alltt.community.service.CommunityService;
import com.app.alltt.crawling.dto.ContentDTO;
import com.app.alltt.main.dto.FilteredDTO;
import com.app.alltt.main.service.MainService;

@Controller
@EnableGlobalMethodSecurity(securedEnabled = true, prePostEnabled = true)
@RequestMapping("/community")
public class CommunityController {
	
	@Autowired
	private CommunityService communityService;
	
	@Autowired
	private MainService mainService;
	
	// 리다이렉트
	@RequestMapping(value = {"/", ""}, method = {RequestMethod.GET, RequestMethod.POST})
	public void goFeed(HttpServletResponse response, HttpServletRequest request) throws IOException {
		response.sendRedirect(request.getContextPath() + "/community/feed");
	}

	// 전체 게시글 보기
	@GetMapping("/feed")
	public String community(Model model, HttpSession session, HttpServletRequest request) {
		
		// 원래는 로그인 된 상태에서만 들어오도록...?
		long memberId = 0;
		if (session.getAttribute("memberId") != null) {
			memberId = (Long) session.getAttribute("memberId");

			String searchTag = request.getParameter("tag");
			
			// 태그 검색도 여기서 받아서 처리
			// tag가 있다면 로드되는 페이지가 달라져야 함
			if (searchTag == null) {
				// 로그인한 멤버 정보를 보여주기 위해
				model.addAttribute("member", communityService.getMemberId(memberId));
				// 로그인한 멤버가 쓴 글 개수를 보여주기 위해
				model.addAttribute("postCnt", communityService.getPostCntByMember(memberId));
				// 로그인한 멤버가 쓴 댓글 수를 보여주기 위해
				model.addAttribute("replyCnt", communityService.getReplyCntByMemberId(memberId));
				// 모든 게시글 리스트
				model.addAttribute("postList", communityService.getAllPostList(memberId, 0));
				
				return "/alltt/community";
			}
			else {
				long tag_contentId = Long.parseLong(searchTag);
				FilteredDTO content = mainService.getContentDetail(tag_contentId);
				model.addAttribute("tag", searchTag);
				// tag 와 연관된 게시글 리스트
				model.addAttribute("postList", communityService.getAllPostList(memberId, tag_contentId));
				// tag content 이미지 링크 등
				model.addAttribute("content", content);
				
				return "/alltt/tag";
			}
		}
		else {
			return "/alltt/login";
		}
	}
	
	// 새 게시글 작성
	@GetMapping("/write")
	public String write(Model model, @RequestParam(required = false) String contentId) {
		
		if (contentId != null) {
			long contentId_long = Long.parseLong(contentId);
			model.addAttribute("content", mainService.getContentDetail(contentId_long));
		}
		
		return "/alltt/write";
	}
	
	// 새 게시글 DB로 넘기기
	@PostMapping("/addPost")
	public @ResponseBody String addPost(@ModelAttribute PostDTO post) {
		
		communityService.addPost(post);
		
		return "inserted";
	}
	
	// 새 게시글 작성 중 tag 추가를 위해
	@PostMapping("/getContent")
	public @ResponseBody List<ContentDTO> searchContent(@RequestParam String searchTitle){
		
		if (searchTitle.length() > 0) {
			return communityService.getContentList(searchTitle);
		}
		else {
			return null;
		}
	}
	
	// 태그를 누르면, 해당 content의 정보를 가져와야 함 (이름, contenttype, 연도, imgurl)
	@GetMapping("getContentInfo")
	public @ResponseBody FilteredDTO getContentInfo(@RequestParam long contentId) {
		return mainService.getContentDetail(contentId);
	}
	
	// 게시글 디테일 페이지
	@GetMapping("/post")
	public String postDetail(@RequestParam long postId, Model model, HttpSession session) {
		
		// 원래는 로그인 된 상태에서만 들어오도록...?
		long memberId = 0;
		if (session.getAttribute("memberId") != null) {
			memberId = (Long) session.getAttribute("memberId");
		}
		
		PostDTO post = communityService.getPostDetail(postId, memberId, true);
		// 같은 contentId를 태그한 게시글들 모두 가져오기
		List<PostDTO> relatedPostList = communityService.getPostListByContent(post.getContentId());
		
		// 현재 게시글 제외하고
		for (PostDTO postDTO : relatedPostList) {
			if (postDTO.getPostId() == post.getPostId()) {
				relatedPostList.remove(postDTO);
				break;
			}
		}
		
		FilteredDTO content = mainService.getContentDetail(post.getContentId());
		
		model.addAttribute("post", post);
		model.addAttribute("content", content);
		model.addAttribute("relatedPostList", relatedPostList);
		model.addAttribute("replyList", communityService.getReplyList(postId));
		model.addAttribute("checkContentMyWish", communityService.checkWishContent(memberId, post.getContentId()));
		
		return "/alltt/post";
	}
	
	// 게시글 댓글 추가
	@PostMapping("/addReply")
	public @ResponseBody String addReply(@ModelAttribute ReplyDTO reply) {
		
		communityService.addReply(reply);
		
		return "inserted";
	}
	
	// 내가 작성한 글, 댓글 보여주는 페이지
	@GetMapping("/my")
	public String myPage(@RequestParam String tab, Model model, HttpSession session, HttpServletResponse response, HttpServletRequest request) throws IOException {
		
		// 로그인한 멤버만 들어올 수 있음
		long memberId = -1;
		memberId = (Long) session.getAttribute("memberId");
		
		if (memberId != -1) {
			// 내가 작성한 게시글 리스트 넘기기
			if (tab.equals("post")) {
				model.addAttribute("tab", tab);
				model.addAttribute("myList", communityService.getPostListByMemberId(memberId));
			}
			// 내가 작성한 댓글 리스트 넘기기
			else {
				model.addAttribute("tab", tab);
				model.addAttribute("myList", communityService.getReplyListByMemberId(memberId));
			}
		}
		// 로그인 안한 멤버가 넘어오면 돌려보내기
		else {
			response.sendRedirect(request.getContextPath() + "/main");
		}
		
		return "/alltt/my";
	}
	
	// 게시글 수정
	@GetMapping("/modify")
	public String modify(@RequestParam long postId, Model model, HttpSession session) {
		
		// 원래는 로그인 된 상태에서만 들어오도록...?
		long memberId = 0;
		if (session.getAttribute("memberId") != null) {
			memberId = (Long) session.getAttribute("memberId");
		}
		
		// 수정 대상 게시글
		PostDTO post = communityService.getPostDetail(postId, memberId, false);
		FilteredDTO content = null;
		if (post.getContentId() > 0) {
			content = mainService.getContentDetail(post.getContentId());
		}
		
		model.addAttribute("post", post);
		model.addAttribute("content", content);
		
		return "/alltt/modify";
	}
	
	@PostMapping("/modifyPost")
	public @ResponseBody String modifyPost(@ModelAttribute PostDTO post) {
		
		if (communityService.modifyPost(post)) {
			return "modified";
		}
		else {
			return "false";
		}
	}
	
	@GetMapping("/delete")
	public String delete(@RequestParam long postId, Model model, HttpSession session) {
		
		// 원래는 로그인 된 상태에서만 들어오도록...?
		long memberId = 0;
		if (session.getAttribute("memberId") != null) {
			memberId = (Long) session.getAttribute("memberId");
		}

		PostDTO post = communityService.getPostDetail(postId, memberId, false);
		FilteredDTO content = null;
		if (post.getContentId() > 0) {
			content = mainService.getContentDetail(post.getContentId());
		}
		model.addAttribute("post", post);
		model.addAttribute("content", content);
		
		return "/alltt/delete";
	}
	
	@PostMapping("/deletePost")
	public @ResponseBody String deletePost(@ModelAttribute PostDTO post) {
		
		if (communityService.removePost(post)) {
			return "deleted";
		}
		else {
			return "false";
		}
	}
	
	@PostMapping("/deleteReply")
	public @ResponseBody String deleteReply(@RequestParam long replyId) {
		if (communityService.removeReply(replyId) ) {
			return "deleted";
		}
		else {
			return "false";
		}
	}
	
	@GetMapping("/getReply")
	public @ResponseBody ReplyDTO getReplyContent(@RequestParam long replyId) {
		return communityService.getReply(replyId);
	}
	
	@PostMapping("/modifyReply")
	public @ResponseBody String modifyReply(@ModelAttribute ReplyDTO reply) {
		
		if (communityService.modifyReply(reply)) {
			return "modified";
		}
		else {
			return "false";
		}
	}
	
	@PostMapping("/postRecmnd")
	public @ResponseBody int changeRecmnd(@ModelAttribute RecmndDTO recmnd) {
		return communityService.changeLikePost(recmnd);
	}
	
	@GetMapping("/search")
	public String searchPage(Model model) {
		model.addAttribute("tagContent", communityService.getMostTaggedContent());
		return "/alltt/search";
	}
	
	// post에 태그된 작품 이름 검색
	@PostMapping("/searchPostByTag")
	public @ResponseBody List<PostDTO> searchPostByTag(@RequestParam String title){
		return communityService.getPostCountByTag(title);
	}
	
	// post title or content로 post 검색
	@PostMapping("/searchPost")
	public @ResponseBody List<PostDTO> searchPost(@RequestParam String title){
		return communityService.getPostList(title);
	}
	
	// 검색 내역 확장
	@GetMapping("/keyword")
	public String searchKeyword(Model model, @RequestParam(required = false) String tag, @RequestParam(required = false) String keyword) {
		
		if (tag != null) {
			model.addAttribute("tag", tag);
			model.addAttribute("tagList", communityService.getPostCountByTag(tag));
		}
		if (keyword != null) {
			model.addAttribute("keyword", keyword);
			model.addAttribute("postList", communityService.getPostList(keyword));
		}
		
		return "/alltt/keyword";
	}
	
	@PostMapping("/addMyContent")
	public @ResponseBody boolean addMyContent(@RequestParam long memberId, @RequestParam long contentId) {
		
		return communityService.modifyWishContent(memberId, contentId);
	}
}