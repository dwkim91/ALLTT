package com.app.alltt.contentgenre.dto;

import org.springframework.stereotype.Component;

@Component
public class ContentGenreDTO {
	
	private long contentGenreId; 
	private long contentId; 
	private int genreId;
	
	public long getContentGenreId() {
		return contentGenreId;
	}
	public void setContentGenreId(long contentGenreId) {
		this.contentGenreId = contentGenreId;
	}
	public long getContentId() {
		return contentId;
	}
	public void setContentId(long contentId) {
		this.contentId = contentId;
	}
	public int getGenreId() {
		return genreId;
	}
	public void setGenreId(int genreId) {
		this.genreId = genreId;
	}
	
	@Override
	public String toString() {
		return "ContentGenreDTO [contentGenreId=" + contentGenreId + ", contentId=" + contentId + ", genreId=" + genreId
				+ "]";
	}
	
}
