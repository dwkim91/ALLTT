package com.app.alltt.community.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.app.alltt.community.dao.CommunityDAO;
import com.app.alltt.community.dto.PostDTO;
import com.app.alltt.community.dto.ReplyDTO;
import com.app.alltt.crawling.dto.ContentDTO;
import com.app.alltt.crawling.dto.ContentLinkDTO;
import com.app.alltt.member.dto.MemberDTO;

@Service
public class CommunityServiceImpl implements CommunityService {
	
	@Autowired
	private CommunityDAO communityDAO;
	
	@Autowired
	private BCryptPasswordEncoder bCryptPasswordEncoder;

	@Override
	public void addPost(PostDTO post) {
		
		post.setPasswd(bCryptPasswordEncoder.encode(post.getPasswd()));
		
		communityDAO.insertPost(post);
	}

	@Override
	@Transactional
	public PostDTO getPostDetail(long postId, boolean read) {
		
		// 디테일 페이지를 들어가느거라면 조회수 늘리기
		if (read) {
			communityDAO.updateReadCnt(postId);
		}
		
		return communityDAO.selectOnePost(postId);
	}

	@Override
	@Transactional
	public boolean modifyPost(PostDTO post) {
		boolean isModified = false;
		// 설정해두었던 비밀번호 확인
		if (bCryptPasswordEncoder.matches(post.getPasswd(), communityDAO.selectPostPasswd(post.getPostId()))) {
			communityDAO.updatePost(post);
			isModified = true;
		}
		return isModified;
	}

	@Override
	@Transactional
	public boolean removePost(PostDTO post) {
		boolean isRemoved = false;
		// 비밀번호 확인
		if (bCryptPasswordEncoder.matches(post.getPasswd(), communityDAO.selectPostPasswd(post.getPostId()))) {
			communityDAO.deletePost(post.getPostId());
			isRemoved = true;
		}
		
		return isRemoved;
	}

	@Override
	public List<PostDTO> getAllPostList() {
		return communityDAO.selectListAllPost();
	}

	@Override
	public int getBoardCnt() {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<ReplyDTO> getReplyList(long postId) {
		return communityDAO.selectListReply(postId);
	}

	@Override
	public int getAllReplyCnt(long postId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public ReplyDTO getReplyDetail(long replyId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void addReply(ReplyDTO reply) {
		communityDAO.insertReply(reply);
	}

	@Override
	public boolean modifyReply(ReplyDTO reply) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public boolean removeReply(long replyId) {
		// TODO Auto-generated method stub
		return false;
	}

	@Override
	public List<ContentDTO> getContentList(String searchTitle) {
		return communityDAO.selectListContent(searchTitle);
	}

	@Override
	public MemberDTO getMemberId(long memberId) {
		return communityDAO.selectMember(memberId);
	}

	@Override
	public int getPostCntByMember(long memberId) {
		return communityDAO.selectPostCntByMemberId(memberId);
	}

	@Override
	public int getReplyCntByMemberId(long memberId) {
		return communityDAO.selectReplyCntByMemberId(memberId);
	}

	@Override
	public ContentDTO getContentDetail(long postId) {
		return communityDAO.selectOneContent(postId);
	}

	@Override
	public ContentLinkDTO getContentImg(long contentId) {
		return communityDAO.selectContentLink(contentId);
	}

	@Override
	public List<PostDTO> getPostListByContent(long contentId) {
		return communityDAO.selectPostListByContentId(contentId);
	}

	@Override
	public List<PostDTO> getPostListByMemberId(long memberId) {
		return communityDAO.selectPostListByMemberId(memberId);
	}

	@Override
	public List<ReplyDTO> getReplyListByMemberId(long memberId) {
		return communityDAO.selectReplyListByMemberId(memberId);
	}

}