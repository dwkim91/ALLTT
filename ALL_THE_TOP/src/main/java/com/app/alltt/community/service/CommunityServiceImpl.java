package com.app.alltt.community.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.app.alltt.community.dao.CommunityDAO;
import com.app.alltt.community.dto.PostDTO;
import com.app.alltt.community.dto.RecmndDTO;
import com.app.alltt.community.dto.ReplyDTO;
import com.app.alltt.crawling.dto.ContentDTO;
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
	public PostDTO getPostDetail(long postId, long memberId, boolean read) {
		
		RecmndDTO recmndDTO = new RecmndDTO();
		recmndDTO.setMemberId(memberId);
		recmndDTO.setPostId(postId);
		
		// 디테일 페이지를 들어가느거라면 조회수 늘리기
		if (read) {
			communityDAO.updateReadCnt(postId);
		}
		
		return communityDAO.selectOnePost(recmndDTO);
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
	public List<PostDTO> getAllPostList(long memberId, long contentId) {
		
		PostDTO post = new PostDTO();
		post.setMemberId(memberId);
		post.setContentId(contentId);
		
		return communityDAO.selectListAllPost(post);
	}

	@Override
	public List<ReplyDTO> getReplyList(long postId) {
		return communityDAO.selectListReply(postId);
	}

	@Override
	public void addReply(ReplyDTO reply) {
		communityDAO.insertReply(reply);
	}

	@Override
	public boolean modifyReply(ReplyDTO reply) {
		boolean isModified = false;
		
		try {
			communityDAO.updateReply(reply);
			isModified = true;
		} catch (Exception e) {e.printStackTrace();}
		
		return isModified;
	}

	@Override
	public boolean removeReply(long replyId) {
		boolean isRemoved = false;
		
		try {
			communityDAO.deleteReply(replyId);
			isRemoved = true;
		} catch (Exception e) {e.printStackTrace();}
		
		return isRemoved;
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

	@Override
	@Transactional
	public int changeLikePost(RecmndDTO recmndDTO) {
		
		// 내가 좋아요 한거면 1, 아니면 0
		int myLike = communityDAO.selectPostLikeByMember(recmndDTO);
		
		if (myLike == 1) {
			// 좋아요를 삭제하고
			communityDAO.deletePostLike(recmndDTO);
		}
		// 내가 좋아요 한게 아니면
		// 좋아요를 추가하고
		else {
			communityDAO.insertPostLike(recmndDTO);
		}
		// 결과값으론 해당 작품의 like 수 return
		return communityDAO.selectLikeCntByPost(recmndDTO.getPostId());
	}

	@Override
	public ReplyDTO getReply(long replyId) {
		return communityDAO.selectOneReply(replyId);
	}

	@Override
	public List<ContentDTO> getMostTaggedContent() {
		return communityDAO.selectMostTaggedContent();
	}

	@Override
	public List<PostDTO> getPostCountByTag(String title) {
		return communityDAO.selectPostCountByTag(title);
	}

	@Override
	public List<PostDTO> getPostList(String title) {
		return communityDAO.selectPostList(title);
	}

}