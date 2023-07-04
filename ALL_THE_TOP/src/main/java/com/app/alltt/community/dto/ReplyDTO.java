package com.app.alltt.community.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class ReplyDTO {

	private long replyId;
	private long postId;
	private long memberId;
	private String nickName;
	private String content;
	private long recmndCnt;
	private Date enrollDt;
	public long getReplyId() {
		return replyId;
	}
	public void setReplyId(long replyId) {
		this.replyId = replyId;
	}
	public long getMemberId() {
		return memberId;
	}
	public void setMemberId(long memberId) {
		this.memberId = memberId;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public long getRecmndCnt() {
		return recmndCnt;
	}
	public void setRecmndCnt(long recmndCnt) {
		this.recmndCnt = recmndCnt;
	}
	public Date getEnrollDt() {
		return enrollDt;
	}
	public void setEnrollDt(Date enrollDt) {
		this.enrollDt = enrollDt;
	}
	public long getPostId() {
		return postId;
	}
	public void setPostId(long postId) {
		this.postId = postId;
	}
	@Override
	public String toString() {
		return "ReplyDTO [replyId=" + replyId + ", postId=" + postId + ", memberId=" + memberId + ", nickName="
				+ nickName + ", content=" + content + ", recmndCnt=" + recmndCnt + ", enrollDt=" + enrollDt + "]";
	}
	
	
	
}