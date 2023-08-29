package com.app.alltt.community.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.alltt.community.dto.PostDTO;
import com.app.alltt.community.dto.RecmndDTO;
import com.app.alltt.community.dto.ReplyDTO;
import com.app.alltt.crawling.dto.ContentDTO;
import com.app.alltt.main.dto.FilteredDTO;
import com.app.alltt.member.dto.MemberDTO;

@Repository
public class CommunityDAOImpl implements CommunityDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<PostDTO> selectListAllPost(PostDTO post) {
		return sqlSession.selectList("communityMapper.selectListAllPost", post);
	}

	@Override
	public PostDTO selectOnePost(RecmndDTO recmndDTO) {
		return sqlSession.selectOne("communityMapper.selectPostDetail", recmndDTO);
	}

	@Override
	public void updateReadCnt(long postId) {
		sqlSession.update("communityMapper.updateReadCnt", postId);
	}

	@Override
	public void insertPost(PostDTO post) {
		sqlSession.insert("communityMapper.insertNewPost", post);
	}

	@Override
	public void updatePost(PostDTO post) {
		sqlSession.update("communityMapper.updatePost", post);
	}

	@Override
	public void deletePost(long postId) {
		sqlSession.delete("communityMapper.deletePost", postId);
	}

	@Override
	public List<ReplyDTO> selectListReply(long postId) {
		return sqlSession.selectList("communityMapper.selectListReply", postId);
	}

	@Override
	public void insertReply(ReplyDTO reply) {
		sqlSession.insert("communityMapper.insertReply", reply);
	}

	@Override
	public void updateReply(ReplyDTO reply) {
		sqlSession.update("communityMapper.updateReplyContent", reply);
	}

	@Override
	public void deleteReply(long replyId) {
		sqlSession.delete("communityMapper.deleteReply", replyId);
	}

	@Override
	public List<ContentDTO> selectListContent(String searchTitle) {
		return sqlSession.selectList("communityMapper.selectListContent", searchTitle);
	}

	@Override
	public MemberDTO selectMember(long memberId) {
		return sqlSession.selectOne("communityMapper.selectMemberId", memberId);
	}

	@Override
	public int selectPostCntByMemberId(long memberId) {
		return sqlSession.selectOne("communityMapper.selectPostCntByMemberId", memberId);
	}

	@Override
	public int selectReplyCntByMemberId(long memberId) {
		return sqlSession.selectOne("communityMapper.selectReplyCntByMemberId", memberId);
	}

	@Override
	public List<PostDTO> selectPostListByContentId(long contentId) {
		return sqlSession.selectList("communityMapper.selectPostListByContentId", contentId);
	}

	@Override
	public List<PostDTO> selectPostListByMemberId(long memberId) {
		return sqlSession.selectList("communityMapper.selectPostListByMemberId", memberId);
	}

	@Override
	public List<ReplyDTO> selectReplyListByMemberId(long memberId) {
		return sqlSession.selectList("communityMapper.selectReplyListByMemberId", memberId);
	}

	@Override
	public String selectPostPasswd(long postId) {
		return sqlSession.selectOne("communityMapper.selectPostPasswd", postId);
	}

	@Override
	public int selectPostLikeByMember(RecmndDTO recmndDTO) {
		return sqlSession.selectOne("communityMapper.selectPostLikeByMember", recmndDTO);
	}

	@Override
	public int selectLikeCntByPost(long postId) {
		return sqlSession.selectOne("communityMapper.selectLikeCntByPost", postId);
	}

	@Override
	public void insertPostLike(RecmndDTO recmndDTO) {
		sqlSession.insert("communityMapper.insertPostLike", recmndDTO);
	}

	@Override
	public void deletePostLike(RecmndDTO recmndDTO) {
		sqlSession.delete("communityMapper.deletePostLike", recmndDTO);
	}

	@Override
	public ReplyDTO selectOneReply(long replyId) {
		return sqlSession.selectOne("communityMapper.selectOneReply", replyId);
	}

	@Override
	public List<ContentDTO> selectMostTaggedContent() {
		return sqlSession.selectList("communityMapper.selectMostTaggedContent");
	}

	@Override
	public List<PostDTO> selectPostCountByTag(String title) {
		return sqlSession.selectList("communityMapper.selectPostCountByTag", title);
	}

	@Override
	public List<PostDTO> selectPostList(String title) {
		return sqlSession.selectList("communityMapper.selectPostList", title);
	}

	@Override
	public int selectWishContent(FilteredDTO wishDTO) {
		return sqlSession.selectOne("communityMapper.selectWishContent", wishDTO);
	}

	@Override
	public void insertWishContent(FilteredDTO wishDTO) {
		sqlSession.insert("communityMapper.insertWishContent", wishDTO);
	}

}