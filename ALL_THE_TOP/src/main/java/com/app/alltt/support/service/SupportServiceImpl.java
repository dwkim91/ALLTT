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

	@Override
	public SupportDTO getInquiryDetail(long supportId) {
		return supportDAO.selectOneInquiry(supportId);
	}

	@Override
	public void registerAnswer(SupportDTO supportDTO) {
		supportDAO.updateAnswer(supportDTO);
	}

	@Override
	public int getDoneCnt() {
		return supportDAO.selectDone();
	}

	@Override
	public int getNewCnt() {
		return supportDAO.selectNew();
	}

	@Override
	public int getInProgressCnt() {
		return supportDAO.selectInProgress();
	}

	@Override
	public List<SupportDTO> getInquiryListByStatus(String status) {
		return supportDAO.selectInquiryListByStatus(status);
	}

}
