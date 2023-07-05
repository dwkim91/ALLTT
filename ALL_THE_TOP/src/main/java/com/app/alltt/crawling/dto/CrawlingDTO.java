package com.app.alltt.crawling.dto;

import org.springframework.stereotype.Component;

@Component
public class CrawlingDTO {
	
	private long contentId;
	private String title;
	private String creator;
	private String actors;
	private String summary;
	private int enrollDt;
	private String contentType;
	
	private String imgUrl;
	private String url;				
	private int genreId;
	private int platformId;
	private String existYn; 
	
	public long getContentId() {
		return contentId;
	}
	public void setContentId(long contentId) {
		this.contentId = contentId;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
	}
	public String getCreator() {
		return creator;
	}
	public void setCreator(String creator) {
		this.creator = creator;
	}
	public String getActors() {
		return actors;
	}
	public void setActors(String actors) {
		this.actors = actors;
	}
	public String getSummary() {
		return summary;
	}
	public void setSummary(String summary) {
		this.summary = summary;
	}
	public int getEnrollDt() {
		return enrollDt;
	}
	public void setEnrollDt(int enrollDt) {
		this.enrollDt = enrollDt;
	}
	public String getContentType() {
		return contentType;
	}
	public void setContentType(String contentType) {
		this.contentType = contentType;
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
	public String getExistYn() {
		return existYn;
	}
	public void setExistYn(String existYn) {
		this.existYn = existYn;
	}
	@Override
	public String toString() {
		return "CrawlingDTO [contentId=" + contentId + ", title=" + title + ", creator=" + creator + ", actors="
				+ actors + ", summary=" + summary + ", enrollDt=" + enrollDt + ", contentType=" + contentType
				+ ", imgUrl=" + imgUrl + ", url=" + url + ", genreId=" + genreId + ", platformId=" + platformId
				+ ", existYn=" + existYn + "]";
	}
	
}
