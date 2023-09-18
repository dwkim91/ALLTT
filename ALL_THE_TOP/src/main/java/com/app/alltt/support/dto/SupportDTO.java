package com.app.alltt.support.dto;

import java.util.Date;

import org.springframework.stereotype.Component;

@Component
public class SupportDTO {
	
	private long supportId;
	private long memberId;
	private String questionType;
	private String suggestion;
	private String email;
	private String supportStatus;
	private String answer;
	private Date enrollDt;
	
	public long getSupportId() {
		return supportId;
	}
	public void setSupportId(long supportId) {
		this.supportId = supportId;
	}
	public long getMemberId() {
		return memberId;
	}
	public void setMemberId(long memberId) {
		this.memberId = memberId;
	}
	public String getQuestionType() {
		return questionType;
	}
	public void setQuestionType(String questionType) {
		this.questionType = questionType;
	}
	public String getSuggestion() {
		return suggestion;
	}
	public void setSuggestion(String suggestion) {
		this.suggestion = suggestion;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getSupportStatus() {
		return supportStatus;
	}
	public void setSupportStatus(String supportStatus) {
		this.supportStatus = supportStatus;
	}
	public String getAnswer() {
		return answer;
	}
	public void setAnswer(String answer) {
		this.answer = answer;
	}
	public Date getEnrollDt() {
		return enrollDt;
	}
	public void setEnrollDt(Date enrollDt) {
		this.enrollDt = enrollDt;
	}
	
	@Override
	public String toString() {
		return "SupportDTO [supportId=" + supportId + ", memberId=" + memberId + ", questionType=" + questionType
				+ ", suggestion=" + suggestion + ", email=" + email + ", supportStatus=" + supportStatus + ", answer="
				+ answer + ", enrollDt=" + enrollDt + "]";
	}
	
}
