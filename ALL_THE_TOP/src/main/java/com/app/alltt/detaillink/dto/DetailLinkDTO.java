package com.app.alltt.detaillink.dto;

import org.springframework.stereotype.Component;

@Component
public class DetailLinkDTO {
	
	private long linkId;	
	private long contentId;	
	private String contentType;	
	private int platformId;	
	private String imgUrl;
	private String url;
	
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
	public String getContentType() {
		return contentType;
	}
	public void setContentType(String contentType) {
		this.contentType = contentType;
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
	
	@Override
	public String toString() {
		return "DetailLinkDTO [linkId=" + linkId + ", contentId=" + contentId + ", contentType=" + contentType
				+ ", platformId=" + platformId + ", imgUrl=" + imgUrl + ", url=" + url + "]";
	}
	
}
