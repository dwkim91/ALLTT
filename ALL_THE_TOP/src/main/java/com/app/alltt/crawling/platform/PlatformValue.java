package com.app.alltt.crawling.platform;

public class PlatformValue {

	private String id;
	private String pw;

	public PlatformValue() {}
	
	public PlatformValue(String id, String pw) {
		this.id = id;
		this.pw = pw;
	}
	
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPw() {
		return pw;
	}
	public void setPw(String pw) {
		this.pw = pw;
	}
	
}