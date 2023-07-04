package com.app.alltt.community.dao;

import java.util.List;

import com.app.alltt.community.dto.PostDTO;
import com.app.alltt.community.dto.ReplyDTO;
import com.app.alltt.crawling.dto.ContentDTO;
import com.app.alltt.crawling.dto.ContentLinkDTO;
import com.app.alltt.member.dto.MemberDTO;

public interface CommunityDAO {

	public int selectOneAllBoardCnt();
	public List<PostDTO> selectListAllPost();
	
	public PostDTO selectOnePost(long postId);
	public void updateReadCnt(long postId);
	public ContentDTO selectOneContent(long postId);
	public ContentLinkDTO selectContentLink(long postId);
	public List<PostDTO> selectPostListByContentId(long contentId);
	
	public List<PostDTO> selectPostListByMemberId(long memberId);
	public List<ReplyDTO> selectReplyListByMemberId(long memberId);
	
	public void insertPost(PostDTO post);
	public void updatePost(PostDTO post);
	public void deletePost(long postId);
	
	public MemberDTO selectMember(long memberId);
	public int selectPostCntByMemberId(long memberId);
	public int selectReplyCntByMemberId(long memberId);
	public List<ContentDTO> selectListContent(String searchTitle);
	
	public int selectOneAllReplyCnt(long postId);
	public List<ReplyDTO> selectListReply(long postId);
	public ReplyDTO selectOneReply(long replyId);
	public void insertReply(ReplyDTO reply);
	public void updateReply(ReplyDTO reply);
	public void deleteReply(long replyId);
	
}