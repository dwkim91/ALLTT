package com.app.alltt.community.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class PostDTO {
	
	private long postId;
	private String postTitle;
	private long memberId;
	private String nickName;
	private String passwd;
	private String content;
	private Date enrollDt;
	private Date modifyDt;
	private String postTag;
	private long contentId;
	private long readCnt;
	private long recmndCnt;
	private long replyCnt;
	private int myRecmnd;
	private long postCnt;
	
	public long getPostId() {
		return postId;
	}
	public void setPostId(long postId) {
		this.postId = postId;
	}
	public String getPostTitle() {
		return postTitle;
	}
	public void setPostTitle(String postTitle) {
		this.postTitle = postTitle;
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
	public String getPasswd() {
		return passwd;
	}
	public void setPasswd(String passwd) {
		this.passwd = passwd;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public Date getEnrollDt() {
		return enrollDt;
	}
	public void setEnrollDt(Date enrollDt) {
		this.enrollDt = enrollDt;
	}
	public Date getModifyDt() {
		return modifyDt;
	}
	public void setModifyDt(Date modifyDt) {
		this.modifyDt = modifyDt;
	}
	public String getPostTag() {
		return postTag;
	}
	public void setPostTag(String postTag) {
		this.postTag = postTag;
	}
	public long getContentId() {
		return contentId;
	}
	public void setContentId(long contentId) {
		this.contentId = contentId;
	}
	public long getReadCnt() {
		return readCnt;
	}
	public void setReadCnt(long readCnt) {
		this.readCnt = readCnt;
	}
	public long getRecmndCnt() {
		return recmndCnt;
	}
	public void setRecmndCnt(long recmndCnt) {
		this.recmndCnt = recmndCnt;
	}
	public long getReplyCnt() {
		return replyCnt;
	}
	public void setReplyCnt(long replyCnt) {
		this.replyCnt = replyCnt;
	}
	public int getMyRecmnd() {
		return myRecmnd;
	}
	public void setMyRecmnd(int myRecmnd) {
		this.myRecmnd = myRecmnd;
	}
	public long getPostCnt() {
		return postCnt;
	}
	public void setPostCnt(long postCnt) {
		this.postCnt = postCnt;
	}
	@Override
	public String toString() {
		return "PostDTO [postId=" + postId + ", postTitle=" + postTitle + ", memberId=" + memberId + ", nickName="
				+ nickName + ", passwd=" + passwd + ", content=" + content + ", enrollDt=" + enrollDt + ", modifyDt="
				+ modifyDt + ", postTag=" + postTag + ", contentId=" + contentId + ", readCnt=" + readCnt
				+ ", recmndCnt=" + recmndCnt + ", replyCnt=" + replyCnt + ", myRecmnd=" + myRecmnd + ", postCnt="
				+ postCnt + "]";
	}
	
}