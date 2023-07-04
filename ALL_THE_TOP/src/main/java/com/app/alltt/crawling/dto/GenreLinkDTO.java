package com.app.alltt.crawling.dto;

import org.springframework.stereotype.Component;

@Component
public class GenreLinkDTO {
	
	private int linkId;
	private int platformId;
	private String contentType;	
	private int genreId;
	private String url;
	
	public int getLinkId() {
		return linkId;
	}
	public void setLinkId(int linkId) {
		this.linkId = linkId;
	}
	public String getContentType() {
		return contentType;
	}
	public void setContentType(String contentType) {
		this.contentType = contentType;
	}
	public int getGenreId() {
		return genreId;
	}
	public void setGenreId(int genreId) {
		this.genreId = genreId;
	}
	public int getPlatformId() {
		return platformId;
	}
	public void setPlatformId(int platformId) {
		this.platformId = platformId;
	}
	public String getUrl() {
		return url;
	}
	public void setUrl(String url) {
		this.url = url;
	}
	
	@Override
	public String toString() {
		return "GenreLinkDTO [linkId=" + linkId + ", contentType=" + contentType + ", genreId=" + genreId
				+ ", platformId=" + platformId + ", url=" + url + "]";
	}
	
}
