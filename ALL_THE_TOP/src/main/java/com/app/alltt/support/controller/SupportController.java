package com.app.alltt.support.controller;

import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.app.alltt.main.dto.FilterDTO;
import com.app.alltt.member.dto.MemberDTO;
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
		long memberId = ((Long) session.getAttribute("memberId")).longValue();
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
	    System.out.println(supportDTO);
	    supportService.addInquiry(supportDTO);
	    return "문의 내용이 등록되었습니다.";
	}
	
	@GetMapping("/inquiryList")
	@ResponseBody
	public ModelAndView inquiryList(HttpServletRequest request, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		long memberId = ((Long) session.getAttribute("memberId")).longValue();
		mv.setViewName("/alltt/inquiryList");
		mv.addObject("inquiryList", supportService.getInquiryList());
		return mv;
	}
}
