package com.app.alltt.crawling.dto;

import org.springframework.stereotype.Component;

@Component
public class ContentDTO {

	private long contentId;
	private String title;
	private String creator;
	private String actors;
	private String summary;
	private int enrollDt;
	private String contentType;
	
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
	
	@Override
	public String toString() {
		return "ContentDTO [contentId=" + contentId + ", title=" + title + ", creator=" + creator + ", actors=" + actors
				+ ", summary=" + summary + ", enrollDt=" + enrollDt + ", contentType=" + contentType + "]";
	}
	
}
