package com.app.alltt.main.dto;

public class FilteredDTO {
	private long contentId;
	private String title;
	private String creator;
	private String actors;
	private String summary;
	private int enrollDt;
	private String contentType;
	private String imgUrl;
	private String url;
	private String genreNm;
	private int genreId;
	private int platformId;
	private boolean wishContent;
	private boolean isWish;
	private long memeberId;

	@Override
	public String toString() {
		return "FilteredDataDTO [contentId=" + contentId + ", title=" + title + ", creator=" + creator + ", actors="
				+ actors + ", summary=" + summary + ", enrollDt=" + enrollDt + ", contentType=" + contentType
				+ ", imgUrl=" + imgUrl + ", url=" + url + ", genreNm=" + genreNm + ", genreId=" + genreId
				+ ", platformId=" + platformId + ", wishContent=" + wishContent + ", isWish=" + isWish + ", memeberId="
				+ memeberId + "]";
	}
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
	public String getGenreNm() {
		return genreNm;
	}
	public void setGenreNm(String genreNm) {
		this.genreNm = genreNm;
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
	public boolean isWishContent() {
		return wishContent;
	}
	public void setWishContent(boolean wishContent) {
		this.wishContent = wishContent;
	}
	public boolean isWish() {
		return isWish;
	}
	public void setWish(boolean isWish) {
		this.isWish = isWish;
	}
	public long getMemeberId() {
		return memeberId;
	}
	public void setMemeberId(long memeberId) {
		this.memeberId = memeberId;
	}
}
