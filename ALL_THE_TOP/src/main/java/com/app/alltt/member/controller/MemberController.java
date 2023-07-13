package com.app.alltt.member.controller;

import java.util.Enumeration;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.apache.commons.lang3.StringUtils;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpHeaders;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.app.alltt.community.service.CommunityService;
import com.app.alltt.main.dto.FilterDTO;
import com.app.alltt.main.service.MainService;
import com.app.alltt.member.dto.MemberDTO;
import com.app.alltt.member.service.MemberService;
import com.app.alltt.member.sns.AuthModule;
import com.app.alltt.member.sns.SnsValue;

@Controller
@RequestMapping("/member")
public class MemberController {

	@Autowired
	private MemberService memberService;
	
	@Autowired
	private CommunityService communityService;
	
	@Autowired
	private MainService mainService;
	
	// instance 명을 servlet-context.xml에 설정된 이름으로 진행함으로써
	// servlet-context.xml에 설정한 변수값들을 SnsValue에 바로 전달하면서 instance 생성
	@Autowired
	private SnsValue naverSns;
	@Autowired
	private SnsValue kakaoSns;
	
	// OAuth2.0을 활용한  토큰, 코드, 정보요청 서비스 module
	@Autowired
	private AuthModule authModule;
	
	// 회원 가입 및 탈퇴 메서드
	@GetMapping("/{service}/{source}")
	public ModelAndView srviceCallback(@PathVariable("service") String service, @PathVariable("source") String source, HttpSession session) throws Exception {
	// connectApi를 넣는 주소를 숨길수 없나? -> state 값으로 우리가 요청한 값인지 아닌지 확인 가능하긴 함
		
		ModelAndView mv = new ModelAndView();
		
		SnsValue sns = null;
		if (StringUtils.equals(service, "naver")) {
			sns = naverSns;
		}
		else  if (StringUtils.equals(service, "kakao")) {
			sns = kakaoSns;
		}
		
		// application을 구분하는 state 값을 초기화
		session.removeAttribute("state");
		// authModule에다가 naver client 정보들을 담은 SnsValue를 삽입해줌으로써 해당 method가 naver 인증을 위해 동작하도록 설정
		//authModule.setSns(naverSns, "login");
		authModule.setSns(sns, source);
		// 인증 code를 요청
		// 외부로 보이는 url이라 추후 확인 필요
		// naver login api를 사용하는 상용 서비스들도 이 url은 보이는 편이긴 함
		//mv.setViewName("redirect:" + authModule.connectNAVERAPI(session, "login"));
		mv.setViewName("redirect:" + authModule.getSnsAuthUrl(session));
		// 현재 browser에 저장된 session이 어떤 값들이 있나 검증용
		getSessionStatus(session);
		
		return mv;
	}
	
	@GetMapping("/logout")
	public ResponseEntity<Object> logOut(HttpServletRequest request, HttpSession session) {
		// 로그인을 하며 session에 등록된 모든 값들을 날려버림
		session.invalidate();
		String jsScript = "<script>";
		jsScript += "alert('로그아웃 되었습니다.');";
		jsScript += "location.href='" + request.getContextPath() + "/main';";
		jsScript += "</script>";
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		// session 검증용
		getSessionStatus(session);
		
		return new ResponseEntity<Object>(jsScript , responseHeaders , HttpStatus.OK);
	}
	
	// 로그인 및 회원 가입 메서드
	// 추후 개발 방향에 따라서, callback을 받는 위치를 나눠서 개발 가능
	@RequestMapping(value = "/{service}/callback/login", method = {RequestMethod.GET, RequestMethod.POST})
	public ResponseEntity<Object> callBackSnsLogin(HttpSession session, HttpServletRequest request) throws Exception {
		
		// state 값 검증
		String stateSession = (String)session.getAttribute("state");
		String state = request.getParameter("state");
		
		// 사용자에게 보여주는 메세지
		String jsScript = "<script>";
		
		// SNS Login 후 보내주는 인가 code 값
		String code = request.getParameter("code");
		
		// 서버에서 요청한 request일때만 (session의 state와 동일할때만 처리)
		if (state.equals(stateSession)) {
			// 인증을 위한 state 다 썼으니까 날리고
			session.removeAttribute("state");
			// 새로 받은 member 정보 확인
			MemberDTO loginMember = authModule.getMemberProfile(authModule.getAccessToken(code));
			// 새로 받은 userId로 검색한 member
			MemberDTO dbMember = memberService.getMemberByUserId(loginMember.getUserId());
			 
			// DB에서 확인되는, 가입된 member라면
			if (dbMember != null) {
				// 로그인 처리, session 등록
				session.setAttribute("memberId", dbMember.getMemberId());
				
				jsScript += "alert('로그인 되었습니다.');";
			}
			// DB에서 확인되지 않는 member라면
			else {
				// 닉네임 처리 방향 논의 필요, 자동 생성할건지, 아니면 회원이 만들도록 할건지
				loginMember.setNickName(memberService.genNickName());
				// 새 회원 추가하고
				memberService.addNewMember(loginMember);
				// 로그인을 위해서 다시 가져와서 memberId 확인
				MemberDTO newMember = memberService.getMemberByUserId(loginMember.getUserId());
				long newMemberId = newMember.getMemberId();
				// 기본 검색 필터 입력 
				memberService.setMemberFilter(newMemberId);
				// 로그인 처리, session에 값 부여
				session.setAttribute("memberId", newMemberId);
				
				jsScript += "alert('환영합니다!');";
			}
		}
		// 가지고 있는 세션의 state 값과 다를 경우, 내가 직접 로그인 처리를 한것이 아니므로 예외처리
		else {
			jsScript += "alert('잘못된 접근입니다.');";
		}
		
		jsScript += "location.href='" + request.getContextPath() +  "/main';";
		jsScript += "</script>";
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");

		// session 검증용
		getSessionStatus(session);
		
		return new ResponseEntity<Object>(jsScript , responseHeaders , HttpStatus.OK);
	}
	
	// 회원 탈퇴 메서드
	@RequestMapping(value = "/{service}/callback/withdraw", method = {RequestMethod.GET, RequestMethod.POST})
	public ResponseEntity<Object> callbackWithdraw(@PathVariable("service") String service, HttpServletRequest request, HttpSession session) throws Exception {
		
		// state 값 검증
		String stateSession = (String)session.getAttribute("state");
		String state = request.getParameter("state");
		
		// 사용자에게 보여주는 메세지
		String jsScript = "<script>";
		
		// naver에서 보내주는 code 값
		String code = request.getParameter("code");
		
		// 서버에서 요청한 request일때만 (session의 state와 동일할때만 처리)
		if (state.equals(stateSession)) {
			// 인증을 위한 state 날리고
			session.removeAttribute("state");
			// 지금 로그인 중이라면, session의 memberId 값이 있다면
			if (session.getAttribute("memberId") != null) {
				// NAVER 에서 profile 정보를 지우고
				if (authModule.withdraw(authModule.getAccessToken(code))) {
					// 세션과 DB에서 모두 날린다
					memberService.removeMember(((Long) session.getAttribute("memberId")).longValue());
					session.invalidate();
					
					jsScript += "alert('탈퇴되었습니다.');";
				}
				// NAVER 에서 연동을 해제하는 요청은 boolean 형태로 result를 확인하도록 했는데, 혹시나 안됐을 경우?
				// 예외처리 방향 확인
				else {
					jsScript += "alert('관리자에게 문의하세요.');";
				}
			}
			// session에 memberId가 확인되지 않는다면
			else {
				jsScript += "alert('로그인 후 탈퇴 가능합니다.');";
			}
		}
		// 가지고 있는 세션의 state 값과 다를 경우, 내가 직접 로그인 처리를 한것이 아니므로 예외처리
		else {
			jsScript += "alert('잘못된 접근입니다.');";
		}
		
		jsScript += "location.href='" + request.getContextPath() + "/main';";
		jsScript += "</script>";
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");

		// session 검증용
		getSessionStatus(session);
		
		return new ResponseEntity<Object>(jsScript , responseHeaders , HttpStatus.OK);
	}
	
	// 멤버정보  가져오기
	@PostMapping("/memberInfo")
	@ResponseBody
	public MemberDTO myPage(HttpServletRequest request, HttpSession session) {
		long memberId = ((Long) session.getAttribute("memberId")).longValue();
		return memberService.getMemberByMemberId(memberId);
	} 
	
	@GetMapping("/mypage")
	@ResponseBody
	public ModelAndView mypage(HttpServletRequest request, HttpSession session) {
		ModelAndView mv = new ModelAndView();
		long memberId = ((Long) session.getAttribute("memberId")).longValue();
		mv.setViewName("/alltt/mypage");
		// 로그인한 멤버DTO
		mv.addObject("member", memberService.getMemberByMemberId(memberId));
		// 로그인한 멤버의 찜 작품 수
		mv.addObject("wishCnt", memberService.getWishCntByMember(memberId));
		// 로그인한 멤버가 쓴 글 개수
		mv.addObject("postCnt", communityService.getPostCntByMember(memberId));
		// 로그인한 멤버가 쓴 댓글 수
		mv.addObject("replyCnt", communityService.getReplyCntByMemberId(memberId));
		// 로그인한 멤버가 선택한 넷플릭스 찜 작품 수
		mv.addObject("netflixWishCnt", memberService.getNetflixWishCntByMemberId(memberId));
		// 로그인한 멤버가 선택한 티빙 찜 작품 수
		mv.addObject("tvingWishCnt", memberService.getTvingWishCntByMemberId(memberId));
		// 로그인한 멤버가 선택한 웨이브 찜 작품 수
		mv.addObject("wavveWishCnt", memberService.getWavveWishCntByMemberId(memberId));
		// 로그인한 멤버가 선택한 구독 정보
		mv.addObject("subscription", memberService.getSubscriptionByMemberId(memberId));
		// 로그인한 멤버가 선택한 시리즈 검색 필터
		mv.addObject("seriesFilter", memberService.getContentFilter(memberId, "series"));
		// 로그인한 멤버가 선택한 영화 검색 필터
		mv.addObject("movieFilter", memberService.getContentFilter(memberId, "movie"));
		// 시리즈 장르 리스트
		FilterDTO filterDTO = new FilterDTO();
		filterDTO.setNetflixId(1);
		filterDTO.setTvingId(2);
		filterDTO.setWavveId(3);
		filterDTO.setSortType("latest");
		filterDTO.setContentType("series");
		filterDTO.setLastItemCnt(0);
		filterDTO.setIsWishInclude(true);
		filterDTO.setMemberId((long)session.getAttribute("memberId"));
		mv.addObject("seriesList", mainService.getMoreGenreList(filterDTO));
		// 영화 장르 리스트
		filterDTO.setContentType("movie");
		mv.addObject("movieList", mainService.getMoreGenreList(filterDTO));
		return mv;
	}
	
	// 랜덤닉네임
	@RequestMapping(value="/randomNickname", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String genNickName(HttpServletRequest request, HttpSession session) {
		return memberService.genNickName();
	}

	// 닉네임 저장
	@RequestMapping(value="/saveNickname", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String saveNickname(@RequestParam("nickname") String nickname, HttpSession session) {
		String result = "";
		if (nickname.length() > 5) {
			boolean isDupl = memberService.nickNameDuplChecker(nickname);

			if (!isDupl) {
				MemberDTO memberDTO = new MemberDTO();
				long memberId = ((Long) session.getAttribute("memberId")).longValue();
				memberDTO.setNickName(nickname);
				memberDTO.setMemberId(memberId);
				memberService.changeNickname(memberDTO);
				result = "닉네임이 변경되었습니다.";
			}
			else {
				result = "닉네임이 중복되었습니다.";
			}
		}
		else {
			result = "6자 이상 입력해 주세요.";
		}
				
		return result;
	}
	
	// 구독정보 수정
	@RequestMapping(value="/setSubscription", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String savePlatforms(@RequestBody FilterDTO filterDTO, HttpSession session) {
	    long memberId = ((Long) session.getAttribute("memberId")).longValue();
	    filterDTO.setMemberId(memberId);
	    System.out.println(filterDTO);
	    memberService.setSubscriptionByMemberId(filterDTO);
	    return "구독 정보가 수정되었습니다.";
	}
	
	// 필터 정보 수정
	@RequestMapping(value="/setSearchFilter", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	@ResponseBody
	public String saveSearchFilter(@RequestBody FilterDTO filterDTO, HttpSession session) {
	    long memberId = ((Long) session.getAttribute("memberId")).longValue();
	    filterDTO.setMemberId(memberId);
	    System.out.println(filterDTO);
	    memberService.changeContentFilterByMemberId(filterDTO);
	    return "필터 정보가 수정되었습니다.";
	}
	
	// 장르리스트 업데이트용 필터 수정
	@RequestMapping(value="/filterUpdate", method=RequestMethod.GET)
	@ResponseBody
	public List<FilterDTO> updateSearchFilter(@ModelAttribute FilterDTO filterDTO, HttpSession session) {
	    
		long memberId = ((Long) session.getAttribute("memberId")).longValue();
	    filterDTO.setMemberId(memberId);
	    System.out.println(filterDTO);
	    List<FilterDTO> filterList = mainService.getMoreGenreList(filterDTO);
	    checkSessionTime(session);
	    return filterList;
	    
	}
	
	@PostMapping("/sessionRemainingTime")
	@ResponseBody
	public int checkSessionTime(HttpSession session) {
		
		boolean isExist = false;
		int remainingTime = 0;
		Enumeration<String> attributeNames = session.getAttributeNames();
		
		while (attributeNames.hasMoreElements()) {
			String attributeName = attributeNames.nextElement();
	        if (attributeName.equals("memberId")) {
	            int maxInactiveInterval = session.getMaxInactiveInterval();
//	        	int maxInactiveInterval = 180;
	            int elapsedTimeInSeconds = (int) ((System.currentTimeMillis() - session.getLastAccessedTime()) / 1000);
	            isExist = true;
	            remainingTime = maxInactiveInterval - elapsedTimeInSeconds;
//	            System.out.print("maxInactiveInterval = " + maxInactiveInterval);
//	            System.out.println("elapsedTimeInSeconds = " + elapsedTimeInSeconds);
//	            session.invalidate();
	        }
		}
		if (!isExist) {
			System.out.println("세션이 만료되었습니다.");
		}
		else {
			System.out.println(remainingTime);
		}
		return 0;
	}
	
	
	// session 검증용 method
	public void getSessionStatus(HttpSession session) {
		try {
			Enumeration<String> sessionData = session.getAttributeNames();
			
			while (sessionData.hasMoreElements()) {
				String attName = sessionData.nextElement();
				System.out.println(attName + " = " + session.getAttribute(attName));
			}
		} catch (Exception e) {
			System.out.println("세션이 이미 털렸습니다");
		}
	}
	
	@RequestMapping(value="/wishStateChange", method=RequestMethod.POST, produces = "application/text; charset=utf8")
	public ResponseEntity<String> wishStateChange(@RequestParam("contentId") long contentId, HttpSession session) {
		long memberId = (long)session.getAttribute("memberId");
		
		Map<String, Long> wishMap = new HashMap<>();
		
		wishMap.put("contentId", contentId);
		wishMap.put("memberId", memberId);
		
		boolean wishCheck = memberService.isWishContent(wishMap);
		
		HttpHeaders responseHeaders = new HttpHeaders();
		responseHeaders.add("Content-Type", "text/html; charset=utf-8");
		
		if (wishCheck) {
			memberService.addWishContentByMemberId(wishMap);
			return ResponseEntity.ok("찜 컨텐츠가 추가되었습니다.");
		}
		else {
			
			memberService.deleteWishContentByMemberId(wishMap);
			return ResponseEntity.ok("찜 컨텐츠가 삭제되었습니다.");
		}

	} 
	
	@PostMapping("/checkSession")
	@ResponseBody
	public Boolean checkSession(HttpSession session) {
		
		boolean isLogin = false;
		
		if (session.getAttribute("memberId") != null) {
			isLogin = true;
		}
		
		System.out.println(isLogin);
		return isLogin;
	}
}