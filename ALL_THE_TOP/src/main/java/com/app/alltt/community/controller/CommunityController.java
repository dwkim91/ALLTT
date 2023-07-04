package com.app.alltt.community.controller;

import java.io.IOException;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
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
import com.app.alltt.community.dto.ReplyDTO;
import com.app.alltt.community.service.CommunityService;
import com.app.alltt.crawling.dto.ContentDTO;
import com.app.alltt.crawling.dto.ContentLinkDTO;
import com.app.alltt.member.service.MemberService;

@Controller
@RequestMapping("/community")
public class CommunityController {
	
	@Autowired
	private CommunityService communityService;
	
	// 리다이렉트
	@RequestMapping(value = {"/", ""}, method = {RequestMethod.GET, RequestMethod.POST})
	public void goFeed(HttpServletResponse response, HttpServletRequest request) throws IOException {
		response.sendRedirect(request.getContextPath() + "/community/feed");
	}

	// 전체 게시글 보기
	@GetMapping("/feed")
	public String community(Model model, HttpSession session) {
		
		// 원래는 로그인 된 상태에서만 들어오도록...? 이거는 방향에 따라 다름
		long memberId = -1;
		if (session.getAttribute("memberId") != null) {
			memberId = (Long) session.getAttribute("memberId");
		}
		
		// 로그인한 멤버 정보를 보여주기 위해
		model.addAttribute("member", communityService.getMemberId(memberId));
		// 로그인한 멤버가 쓴 글 개수를 보여주기 위해
		model.addAttribute("postCnt", communityService.getPostCntByMember(memberId));
		// 로그인한 멤버가 쓴 댓글 수를 보여주기 위해
		model.addAttribute("replyCnt", communityService.getReplyCntByMemberId(memberId));
		// 모든 게시글 리스트
		model.addAttribute("postList", communityService.getAllPostList());
		
		return "/alltt/community";
	}
	
	// 새 게시글 작성
	@GetMapping("/write")
	public String write() {
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
	
	// 게시글 디테일 페이지
	@GetMapping("/post")
	public String postDetail(@RequestParam long postId, Model model) {
		
		PostDTO post = communityService.getPostDetail(postId, true);
		
		// 같은 contentId를 태그한 게시글들 모두 가져오기
		List<PostDTO> relatedPostList = communityService.getPostListByContent(post.getContentId());
		
		// 현재 게시글 제외하고
		for (PostDTO postDTO : relatedPostList) {
			if (postDTO.getPostId() == post.getPostId()) {
				relatedPostList.remove(postDTO);
				break;
			}
		}
		
		ContentDTO content = communityService.getContentDetail(postId);
		ContentLinkDTO contentLink = null; 
		
		if (content != null) {
			contentLink = communityService.getContentImg(content.getContentId());
		}
		
		model.addAttribute("post", post);
		model.addAttribute("content", content);
		model.addAttribute("contentLink", contentLink);
		model.addAttribute("relatedPostList", relatedPostList);
		model.addAttribute("replyList", communityService.getReplyList(postId));
		
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
				
				model.addAttribute("myList", communityService.getPostListByMemberId(memberId));
			}
			// 내가 작성한 댓글 리스트 넘기기
			else {
				model.addAttribute("myList", communityService.getReplyListByMemberId(memberId));
			}
		}
		// 로그인 안한 멤버가 넘어오면 돌려보내기
		else {
			response.sendRedirect(request.getContextPath() + "/main");
		}
		
		return "/alltt/my";
	}
	
}