package com.app.alltt.community.dao;

import java.util.List;

import com.app.alltt.community.dto.PostDTO;
import com.app.alltt.community.dto.RecmndDTO;
import com.app.alltt.community.dto.ReplyDTO;
import com.app.alltt.crawling.dto.ContentDTO;
import com.app.alltt.main.dto.FilteredDTO;
import com.app.alltt.member.dto.MemberDTO;

public interface CommunityDAO {

	public List<PostDTO> selectListAllPost(PostDTO postDTO);
	// 게시글 검색에서, 인기 태그 보여주기 위해
	public List<ContentDTO> selectMostTaggedContent();
	
	public PostDTO selectOnePost(RecmndDTO recmndDTO);
	public void updateReadCnt(long postId);
	public List<PostDTO> selectPostListByContentId(long contentId);
	
	public List<PostDTO> selectPostListByMemberId(long memberId);
	public List<ReplyDTO> selectReplyListByMemberId(long memberId);
	
	public void insertPost(PostDTO post);
	
	public void updatePost(PostDTO post);
	public String selectPostPasswd(long postId);
	
	public void deletePost(long postId);
	
	// 게시글 좋아요 관련
	public int selectPostLikeByMember(RecmndDTO recmndDTO);
	public int selectLikeCntByPost(long postId);
	public void insertPostLike(RecmndDTO recmndDTO);
	public void deletePostLike(RecmndDTO recmndDTO);
	
	public MemberDTO selectMember(long memberId);
	public int selectPostCntByMemberId(long memberId);
	public int selectReplyCntByMemberId(long memberId);
	public List<ContentDTO> selectListContent(String searchTitle);
	
	public List<ReplyDTO> selectListReply(long postId);
	public ReplyDTO selectOneReply(long replyId);
	public void insertReply(ReplyDTO reply);
	public void updateReply(ReplyDTO reply);
	public void deleteReply(long replyId);
	
	public List<PostDTO> selectPostCountByTag(String title);
	public List<PostDTO> selectPostList(String title);

	public void deleteAllPost(long memberId);
	public void deleteAllReply(long memberId);

	
	public int selectWishContent(FilteredDTO wishDTO);
	public void insertWishContent(FilteredDTO wishDTO);
	public void deleteWishContent(FilteredDTO wishDTO);

}