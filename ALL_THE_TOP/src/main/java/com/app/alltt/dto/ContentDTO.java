package com.app.alltt.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class ContentDTO {

	private long contentCd;
	private String imgUrl;
	private String title;
	private String actors;
	private String summary;
	private Date enrollDt;
	private String contentType;
	private String contentKey;
	private String detailUrl;
	private int genreCd;

	@Override
	public String toString() {
		return "ContentDTO [contentCd=" + contentCd + ", imgUrl=" + imgUrl + ", title=" + title + ", actors=" + actors
				+ ", summary=" + summary + ", enrollDt=" + enrollDt + ", contentType=" + contentType + ", contentKey="
				+ contentKey + ", detailUrl=" + detailUrl + ", genreCd=" + genreCd + "]";
	}
	
	public long getContentCd() {
		return contentCd;
	}
	public void setContentCd(long contentCd) {
		this.contentCd = contentCd;
	}
	public String getImgUrl() {
		return imgUrl;
	}
	public void setImgUrl(String imgUrl) {
		this.imgUrl = imgUrl;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public Date getEnrollDt() {
		return enrollDt;
	}
	public void setEnrollDt(Date enrollDt) {
		this.enrollDt = enrollDt;
	}
	public String getContentType() {
		return contentType;
	}
	public void setContentType(String contentType) {
		this.contentType = contentType;
	}
	public String getContentKey() {
		return contentKey;
	}
	public void setContentKey(String contentKey) {
		this.contentKey = contentKey;
	}
	public String getDetailUrl() {
		return detailUrl;
	}
	public void setDetailUrl(String detailUrl) {
		this.detailUrl = detailUrl;
	}
	public int getGenreCd() {
		return genreCd;
	}
	public void setGenreCd(int genreCd) {
		this.genreCd = genreCd;
	}

}
