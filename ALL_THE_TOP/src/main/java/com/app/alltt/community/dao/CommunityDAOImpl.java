package com.app.alltt.community.dao;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.app.alltt.community.dto.PostDTO;
import com.app.alltt.community.dto.ReplyDTO;
import com.app.alltt.crawling.dto.ContentDTO;
import com.app.alltt.crawling.dto.ContentLinkDTO;
import com.app.alltt.member.dto.MemberDTO;

@Repository
public class CommunityDAOImpl implements CommunityDAO {

	@Autowired
	private SqlSession sqlSession;

	@Override
	public List<PostDTO> selectListAllPost(long memberId) {
		return sqlSession.selectList("communityMapper.selectListAllPost", memberId);
	}

	@Override
	public PostDTO selectOnePost(long postId) {
		return sqlSession.selectOne("communityMapper.selectPostDetail", postId);
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
	public int selectOneAllReplyCnt(long postId) {
		// TODO Auto-generated method stub
		return 0;
	}

	@Override
	public List<ReplyDTO> selectListReply(long postId) {
		return sqlSession.selectList("communityMapper.selectListReply", postId);
	}

	@Override
	public ReplyDTO selectOneReply(long replyId) {
		// TODO Auto-generated method stub
		return null;
	}

	@Override
	public void insertReply(ReplyDTO reply) {
		sqlSession.insert("communityMapper.insertReply", reply);
	}

	@Override
	public void updateReply(ReplyDTO reply) {
		// TODO Auto-generated method stub
		
	}

	@Override
	public void deleteReply(long replyId) {
		// TODO Auto-generated method stub
		
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
	public ContentDTO selectOneContent(long postId) {
		return sqlSession.selectOne("communityMapper.selectOneContent", postId);
	}

	@Override
	public ContentLinkDTO selectContentLink(long contentId) {
		return sqlSession.selectOne("communityMapper.selectContentImg", contentId);
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
}