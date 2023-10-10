package com.app.alltt.support.controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.io.FilenameUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import com.app.alltt.support.dto.SupportDTO;
import com.app.alltt.support.service.SupportService;

@Controller
@RequestMapping("/support")
public class SupportController {
	
	@Autowired
	SupportService supportService;
	
	// 고객센터 페이지
	@GetMapping("/inquiry")
	@ResponseBody
	public ModelAndView mypage(HttpServletRequest request, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
		if (session.getAttribute("memberId") == null) {
			mv.setViewName("/alltt/login");
			return mv;
		}
		
		mv.setViewName("/alltt/support");
		return mv;
	}
	
	// 이메일 유효성 검사
	@RequestMapping(value="/validateEmail", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String validateEmail(@RequestParam("email") String email, HttpSession session) {
		// 정규식을 사용한 이메일 유효성을 검사
		String emailRegex = "^[a-zA-Z0-9+-\\_.]+@[a-zA-Z0-9-]+\\.[a-zA-Z0-9-.]+$";
		String result = "";
		if (email.matches(emailRegex)) {
			result = "vaildated";
        } else {
        	result = "unvaildated";
        }
		return result;
	}
	
	// 문의 등록 
	@RequestMapping(value="/inquiryRegistration", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String inquiryRegistration(@RequestBody SupportDTO supportDTO, HttpSession session) {
	    long memberId = ((Long) session.getAttribute("memberId")).longValue();
	    supportDTO.setMemberId(memberId);
	    supportDTO.setEnrollDt(new Date());
	    supportService.addInquiry(supportDTO);
	    return "문의 내용이 등록되었습니다.";
	}
	
	@GetMapping("/inquiryList/{status}")
	@ResponseBody
	public ModelAndView inquiryList(@PathVariable("status") String status, HttpServletRequest request, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		
		if (session.getAttribute("memberId") == null) {
			mv.setViewName("/alltt/login");
			return mv;
		}
		
		long memberId = ((Long) session.getAttribute("memberId")).longValue();
		mv.setViewName("/alltt/inquiryList");
		List<SupportDTO> inquiryList = null;
		if(status.equals("all")) {
			inquiryList = supportService.getInquiryList();
		}
		else {
			inquiryList = supportService.getInquiryListByStatus(status);
		}
		mv.addObject("inquiryList", inquiryList);
		mv.addObject("totalCnt", supportService.getInquiryList().size());
		mv.addObject("newCnt", supportService.getNewCnt());
		mv.addObject("inProgressCnt", supportService.getInProgressCnt());
		mv.addObject("doneCnt", supportService.getDoneCnt());
		mv.addObject("damagedImageList",supportService.getImageRequiredToBeUploaded());
		mv.addObject("damagedImageCnt",supportService.getImageRequiredToBeUploaded().size());
		mv.addObject("status",status);
		return mv;
	}
	
	@GetMapping("/inquiryDetail")
	public ModelAndView inquiryDetail(@RequestParam("supportId") long supportId) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("/alltt/inquiryDetail");
		mv.addObject("supportDTO", supportService.getInquiryDetail(supportId));
		return mv;
	}
	
	// 문의 관리
	@RequestMapping(value="/registerAnswer", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String registerAnswer(@RequestBody SupportDTO supportDTO, HttpSession session) {
	    long memberId = ((Long) session.getAttribute("memberId")).longValue();
	    System.out.println(supportDTO);
	    supportService.registerAnswer(supportDTO);
	    return "답변이 등록 되었습니다.";
	}
	
	@RequestMapping(value="/changeImg", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String changeThumbnailImg(@RequestParam("uploadFile") MultipartFile uploadFile, @RequestParam("contentId") int contentId) throws Exception, IOException {

	    String result = "";
	    
	    // 파일 업로드 처리
	    if (!uploadFile.isEmpty()) {
	    	
	    	// 파일 확장자 추출 
	    	String fileExtension = FilenameUtils.getExtension(uploadFile.getOriginalFilename());
	    	// 허용된 이미지 확장자
	    	List<String> allowedExtensions = Arrays.asList("jpg", "jpeg", "png", "webp");
	    	
	    	if (allowedExtensions.contains(fileExtension.toLowerCase())) {
	    		
	    		long maxFileSizeInBytes = 5 * 1024 * 1024; // 5MB 이하 허용
	    		long fileSize = uploadFile.getSize();
	    		// 파일 크기 제한 
	    		if (fileSize < maxFileSizeInBytes) {
	    			
	    			supportService.resizeAndUploadDamagedImage(uploadFile, contentId);
	    			
	    		}
	    		else {
	    			// 파일 크기가 허용 범위를 초과하는 경우 처리
	    			result = "Error : 파일 크기가 너무 큽니다. 5MB 이하의 파일을 선택해 주세요.";
	    		}
				
	    	}
	    	else {
	    		// 허용되지 않는 확장자인 경우 처리
	    		result = "Error : 허용되지 않는 파일 형식입니다. (jpg, jpeg , png, webp)";
	    	}
            
        } else {
            // 업로드된 파일이 비어 있을 경우 처리
        	result = "Error : 파일이 비어 있습니다.";
        }
	    
	    return result;
	}
	
	@GetMapping("/imageTest")
	public String imageTest() {
		
		supportService.resizeAndUploadImage();
		
		return "";
	}
	
}
