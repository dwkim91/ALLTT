package com.app.alltt.support.dao;

import java.util.List;

import com.app.alltt.main.dto.FilteredDTO;
import com.app.alltt.support.dto.SupportDTO;

public interface SupportDAO {

	void insertInquiry(SupportDTO supportDTO);

	List<SupportDTO> selectInquiryList();

	SupportDTO selectOneInquiry(long supportId);

	void updateAnswer(SupportDTO supportDTO);

	int selectDone();

	int selectNew();

	int selectInProgress();

	List<SupportDTO> selectInquiryListByStatus(String status);

	List<FilteredDTO> selectListImageRequiredToBeUploaded();

	void insertViewImage(FilteredDTO tempDTO);

}
