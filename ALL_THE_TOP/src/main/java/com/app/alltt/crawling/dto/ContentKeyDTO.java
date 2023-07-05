package com.app.alltt.crawling.dto;

import org.springframework.stereotype.Component;

@Component
public class ContentKeyDTO {

	private long contentId;
	private String contentKey;
	
	public ContentKeyDTO() {}

	public ContentKeyDTO(long contentId, String contentKey) {
		this.contentId = contentId;
		this.contentKey = contentKey;
	}
	
	public long getContentId() {
		return contentId;
	}
	public void setContentId(long contentId) {
		this.contentId = contentId;
	}
	public String getContentKey() {
		return contentKey;
	}
	public void setContentKey(String contentKey) {
		this.contentKey = contentKey;
	}

	@Override
	public String toString() {
		return "ContentKeyDTO [contentId=" + contentId + ", contentKey=" + contentKey + "]";
	}
	
	
	
}
