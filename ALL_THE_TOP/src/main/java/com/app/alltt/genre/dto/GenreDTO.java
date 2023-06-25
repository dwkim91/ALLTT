package com.app.alltt.genre.dto;

import org.springframework.stereotype.Component;

@Component
public class GenreDTO {
	
	private long contentCd; 
	private int genreCd;
	
	public long getContentCd() {
		return contentCd;
	}
	public void setContentCd(long contentCd) {
		this.contentCd = contentCd;
	}
	public int getGenreCd() {
		return genreCd;
	}
	public void setGenreCd(int genreCd) {
		this.genreCd = genreCd;
	}
	
	@Override
	public String toString() {
		return "GenreDTO [contentCd=" + contentCd + ", genreCd=" + genreCd + "]";
	} 	
	
}
