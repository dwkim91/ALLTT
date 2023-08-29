package com.app.alltt.member.dto;

import org.springframework.stereotype.Component;

@Component
public class MemberDTO {

	private long memberId;
	private String userId;
	private String nickName;
	private String socialNm;
	private long points;
	private String thumbnailImg;
	private String dPostYn;
	private String dReplyYn;
	
	public long getMemberId() {
		return memberId;
	}
	public void setMemberId(long memberId) {
		this.memberId = memberId;
	}
	public String getUserId() {
		return userId;
	}
	public void setUserId(String userId) {
		this.userId = userId;
	}
	public String getNickName() {
		return nickName;
	}
	public void setNickName(String nickName) {
		this.nickName = nickName;
	}
	public String getSocialNm() {
		return socialNm;
	}
	public void setSocialNm(String socialNm) {
		this.socialNm = socialNm;
	}
	public long getPoints() {
		return points;
	}
	public void setPoints(long points) {
		this.points = points;
	}
	public String getThumbnailImg() {
		return thumbnailImg;
	}
	public void setThumbnailImg(String thumbnailImg) {
		this.thumbnailImg = thumbnailImg;
	}
	public String getdPostYn() {
		return dPostYn;
	}
	public void setdPostYn(String dPostYn) {
		this.dPostYn = dPostYn;
	}
	public String getdReplyYn() {
		return dReplyYn;
	}
	public void setdReplyYn(String dReplyYn) {
		this.dReplyYn = dReplyYn;
	}
	
	@Override
	public String toString() {
		return "MemberDTO [memberId=" + memberId + ", userId=" + userId + ", nickName=" + nickName + ", socialNm="
				+ socialNm + ", points=" + points + ", thumbnailImg=" + thumbnailImg + ", dPostYn=" + dPostYn
				+ ", dReplyYn=" + dReplyYn + "]";
	}
	
}