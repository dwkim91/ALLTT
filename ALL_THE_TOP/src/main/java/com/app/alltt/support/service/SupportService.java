package com.app.alltt.support.service;

import java.util.List;

import com.app.alltt.support.dto.SupportDTO;

public interface SupportService {

	void addInquiry(SupportDTO supportDTO);

	List<SupportDTO> getInquiryList();


	
	
}
