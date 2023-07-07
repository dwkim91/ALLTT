package com.app.alltt.community.service;

import java.util.List;

import com.app.alltt.community.dto.PostDTO;
import com.app.alltt.community.dto.RecmndDTO;
import com.app.alltt.community.dto.ReplyDTO;
import com.app.alltt.crawling.dto.ContentDTO;
import com.app.alltt.member.dto.MemberDTO;

public interface CommunityService {

	public void addPost(PostDTO post);
	// 게시글 상세 페이지 볼 때, content 정보도 필요함
	public PostDTO getPostDetail(long postId, long memberId, boolean read);
	// content 정보 가져오기
	public List<PostDTO> getPostListByContent(long contentId);
	
	// 멤버 마이페이지를 위한 전달
	public List<PostDTO> getPostListByMemberId(long memberId);
	public List<ReplyDTO> getReplyListByMemberId(long memberId);
	
	// 게시글 수정
	public boolean modifyPost(PostDTO post);
	// 게시글 삭제
	public boolean removePost(PostDTO post);
	// 전체 게시글 리스트 가져오기
	public List<PostDTO> getAllPostList(long memberId);
	
	// 로그인한 멤버의 정보를 넘겨주기 위해
	public MemberDTO getMemberId(long memberId);
	// 로그인한 멤버가 쓴 게시글과 댓글
	public int getPostCntByMember(long memberId);
	public int getReplyCntByMemberId(long memberId);
	
	// 게시글 좋아요 toggle
	public int changeLikePost(RecmndDTO recmndDTO);
	
	public List<ContentDTO> getContentList(String searchTitle);
	
	public List<ReplyDTO> getReplyList(long postId);
	public ReplyDTO getReply(long replyId);
	public void addReply(ReplyDTO reply);
	public boolean modifyReply(ReplyDTO reply);
	public boolean removeReply(long replyId);
	
}