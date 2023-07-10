package com.app.alltt.main.dto;

public class FilterDTO {
	private int platformId;
	private int netflixId;				// 체크시 1 아닐시 0
	private int tvingId;				// 체크시 2 아닐시 0
	private int wavveId;				// 체크시 3 아닐시 0
	private boolean isWishInclude;		// 찜 포함여부
	private String contentType;
	private String searchKey; 			// 검색어
	private String sortType;			// 정렬
	private String genreNm;				// 장르명
	private int lastItemCnt;			// 현재페이지 로드된 item 개수
	private int genreId;
	private long memberId;				// 현재로그인된 계정아이디
	private String wishIncludeYn;
	
	public int getGenreId() {
		return genreId;
	}
	public void setGenreId(int genreId) {
		this.genreId = genreId;
	}
	public int getNetflixId() {
		return netflixId;
	}
	public void setNetflixId(int netflixId) {
		this.netflixId = netflixId;
	}
	public int getTvingId() {
		return tvingId;
	}
	public void setTvingId(int tvingId) {
		this.tvingId = tvingId;
	}
	public int getWavveId() {
		return wavveId;
	}
	public void setWavveId(int wavveId) {
		this.wavveId = wavveId;
	}
	public String getContentType() {
		return contentType;
	}
	public void setContentType(String contentType) {
		this.contentType = contentType;
	}
	public String getSearchKey() {
		return searchKey;
	}
	public void setSearchKey(String searchKey) {
		this.searchKey = searchKey;
	}
	public String getSortType() {
		return sortType;
	}
	public void setSortType(String sortType) {
		this.sortType = sortType;
	}
	public String getGenreNm() {
		return genreNm;
	}
	public void setGenreNm(String genreNm) {
		this.genreNm = genreNm;
	}
	public int getLastItemCnt() {
		return lastItemCnt;
	}
	public void setLastItemCnt(int lastItemCnt) {
		this.lastItemCnt = lastItemCnt;
	}
	public long getMemberId() {
		return memberId;
	}
	public void setMemberId(long memberId) {
		this.memberId = memberId;
	}
	public int getPlatformId() {
		return platformId;
	}
	public void setPlatformId(int platformId) {
		this.platformId = platformId;
	}
	public boolean getIsWishInclude() {
		return isWishInclude;
	}
	public void setIsWishInclude(boolean isWishInclude) {
		this.isWishInclude = isWishInclude;
	}
	public String getWishIncludeYn() {
		return wishIncludeYn;
	}
	public void setWishIncludeYn(String wishIncludeYn) {
		this.wishIncludeYn = wishIncludeYn;
	}
	
	@Override
	public String toString() {
		return "FilterDTO [platformId=" + platformId + ", netflixId=" + netflixId + ", tvingId=" + tvingId
				+ ", wavveId=" + wavveId + ", isWishInclude=" + isWishInclude + ", contentType=" + contentType
				+ ", searchKey=" + searchKey + ", sortType=" + sortType + ", genreNm=" + genreNm + ", lastItemCnt="
				+ lastItemCnt + ", genreId=" + genreId + ", memberId=" + memberId + ", wishIncludeYn=" + wishIncludeYn
				+ "]";
	}
	
}
