package com.app.alltt.support.service;

import java.util.List;

import com.app.alltt.support.dto.SupportDTO;

public interface SupportService {

	void addInquiry(SupportDTO supportDTO);
	List<SupportDTO> getInquiryList();
	SupportDTO getInquiryDetail(long supportId);
	void registerAnswer(SupportDTO supportDTO);
	int getDoneCnt();
	int getNewCnt();
	int getInProgressCnt();
	List<SupportDTO> getInquiryListByStatus(String status);
	
}
