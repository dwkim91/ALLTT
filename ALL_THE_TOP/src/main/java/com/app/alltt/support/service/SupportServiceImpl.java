package com.app.alltt.support.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.alltt.support.dao.SupportDAO;
import com.app.alltt.support.dto.SupportDTO;

@Service
public class SupportServiceImpl implements SupportService {
	
	@Autowired
	SupportDAO supportDAO;
	
	@Override
	public void addInquiry(SupportDTO supportDTO) {
		supportDAO.insertInquiry(supportDTO);
	}

	@Override
	public List<SupportDTO> getInquiryList() {
		return supportDAO.selectInquiryList();
	}

}
