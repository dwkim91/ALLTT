package com.app.alltt.support.service;

import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import com.app.alltt.main.dto.FilteredDTO;
import com.app.alltt.support.dto.PlatformDTO;
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
	List<FilteredDTO> getImageRequiredToBeUploaded();
	void resizeAndUploadDamagedImage(MultipartFile uploadFile, int contentId);
	void resizeAndUploadImage();
	void deleteViewImage(long contentId);
	void platformCostModify(List<String> dataArray);
	PlatformDTO getCostByPlatformId(int platformId);
	
}