package com.app.alltt.contentlink.dto;

import org.springframework.stereotype.Component;

@Component
public class ContentLinkDTO {
	
	private long linkId;	
	private long contentId;
	private int platformId;	
	private String imgUrl;
	private String url;
	private boolean contentStatus;
	
	public long getLinkId() {
		return linkId;
	}
	public void setLinkId(long linkId) {
		this.linkId = linkId;
	}
	public long getContentId() {
		return contentId;
	}
	public void setContentId(long contentId) {
		this.contentId = contentId;
	}
	public int getPlatformId() {
		return platformId;
	}
	public void setPlatformId(int platformId) {
		this.platformId = platformId;
	}
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	public boolean isContentStatus() {
		return contentStatus;
	}
	public void setContentStatus(boolean contentStatus) {
		this.contentStatus = contentStatus;
	}
	
	@Override
	public String toString() {
		return "ContentLinkDTO [linkId=" + linkId + ", contentId=" + contentId + ", platformId=" + platformId
				+ ", imgUrl=" + imgUrl + ", url=" + url + ", contentStatus=" + contentStatus + "]";
	}
	
}
