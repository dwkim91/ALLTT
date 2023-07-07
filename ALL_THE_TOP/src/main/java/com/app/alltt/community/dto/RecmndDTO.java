package com.app.alltt.community.dto;

import org.springframework.stereotype.Component;

@Component
public class RecmndDTO {

	private long recmndId;
	private long memberId;
	private long postId;
	private long postRecmndCnt;
	public long getRecmndId() {
		return recmndId;
	}
	public void setRecmndId(long recmndId) {
		this.recmndId = recmndId;
	}
	public long getMemberId() {
		return memberId;
	}
	public void setMemberId(long memberId) {
		this.memberId = memberId;
	}
	public long getPostId() {
		return postId;
	}
	public void setPostId(long postId) {
		this.postId = postId;
	}
	public long getPostRecmndCnt() {
		return postRecmndCnt;
	}
	public void setPostRecmndCnt(long postRecmndCnt) {
		this.postRecmndCnt = postRecmndCnt;
	}
	@Override
	public String toString() {
		return "RecmndDTO [recmndId=" + recmndId + ", memberId=" + memberId + ", postId=" + postId + ", postRecmndCnt="
				+ postRecmndCnt + "]";
	}
	
	
	
}