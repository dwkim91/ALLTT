package com.app.alltt.support.dao;

import java.util.List;

import com.app.alltt.main.dto.FilteredDTO;
import com.app.alltt.support.dto.PlatformDTO;
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

	List<FilteredDTO> selectListImageRequiredToBeUploadedByPlatformId(int platformId);

	void insertViewImage(FilteredDTO tempDTO);

	void deleteViewImage(long contentId);

	void updatePlatformCost(PlatformDTO platformDTO);

	PlatformDTO selectOnePlatformCost(int platformId);

	List<FilteredDTO> selectListMisContentList();

	FilteredDTO selectOneContentDetail(long contentId);

	void updateContentInfo(FilteredDTO filteredDTO);

	List<FilteredDTO> selectListContentByTitle(String title);

}
