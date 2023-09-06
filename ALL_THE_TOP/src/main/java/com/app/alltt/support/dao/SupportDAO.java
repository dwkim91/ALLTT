package com.app.alltt.support.dao;

import java.util.List;

import com.app.alltt.support.dto.SupportDTO;

public interface SupportDAO {

	void insertInquiry(SupportDTO supportDTO);

	List<SupportDTO> selectInquiryList();

}
