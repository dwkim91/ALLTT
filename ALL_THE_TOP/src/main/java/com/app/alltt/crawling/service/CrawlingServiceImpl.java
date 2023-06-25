package com.app.alltt.crawling.service;

import java.time.Duration;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Set;
import java.util.regex.Pattern;

import org.openqa.selenium.By;
import org.openqa.selenium.Keys;
import org.openqa.selenium.NoSuchElementException;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.app.alltt.contentkey.dto.ContentKeyDTO;
import com.app.alltt.crawling.dao.CrawlingDAO;
import com.app.alltt.crawling.dto.CrawlingDTO;
import com.app.alltt.detaillink.dto.DetailLinkDTO;
import com.app.alltt.genrelink.dto.GenreLinkDTO;

@Service
public class CrawlingServiceImpl implements CrawlingService {
	
	@Autowired
	private CrawlingDAO crawlingDAO;
	
	private WebDriver driver;
	private static final String WEB_DRIVER_ID = "webdriver.chrome.driver";
	private static final String WEB_DRIVER_PATH = "C:\\chromedriver\\chromedriver.exe";
	
	// 크롬드라이버 초기화 
	@Override
	public void chromeDriverInit() {
		
		//        (크롬드라이버 명 , 크롬드라이버 경로)
		System.setProperty(WEB_DRIVER_ID, 	WEB_DRIVER_PATH);
		
		// 크롬드라이버 옵션
		ChromeOptions options = new ChromeOptions();
		
		// 크롬드라이버 시작시 window 창 최대화
		options.addArguments("--start-maximized");
		// 음소거
		options.addArguments("--mute-audio");
		// 이미지 로드 X
		options.addArguments("--blink-settings=imagesEnabled=false");
		//option.addArguments("--headless");
		//option.addArguments("--disable-gpu");
		
		// 크롬드라이버 초기화(옵션)
		driver = new ChromeDriver(options);
		
	}
	
	// URL 이동 
	@Override
	public boolean moveToTargetUrl(String url) {

		boolean isTargetUrl = false;
		
		while(!isTargetUrl) {
			// 크롬드라이버 URL이동
			driver.get(url);
			// 크롬드라이버 현재 URL
			String currentUrl = driver.getCurrentUrl();
			// url이동이 정상적으로 완료 되었는지 확인
			if (url.equals(currentUrl)) {
				isTargetUrl = true;
			}
		}
		
		return isTargetUrl;
		
	}
	
	// 페이지 아래 끝으로 이동 
	@Override
	public void moveToBottomPage(String className) { 
		
		boolean isBottom = false;
		int delay = 250;
		int count = 0;
		while(!isBottom) {
			
			// 작품명이 담겨져있는 요소의 부모 클래스 List에 담기
			List<WebElement> contens = driver.findElements(By.className(className));
			
			// END 키입력 (스크롤 최하단 이동을 위함)
			driver.findElement(By.xpath("/html")).sendKeys(Keys.END);
			
			// 명시적 딜레이
			try {Thread.sleep(delay);} catch (InterruptedException e) {e.printStackTrace();}
			
			// 작품명이 담겨져있는 요소의 부모 클래스 List에 담기 
			List<WebElement> contens2 = driver.findElements(By.className(className));
			// 사이즈 비교
			if (contens.size() == contens2.size()) count++;
			else count = 0;
			// 스크롤이동이 50번동안 없다면 isBottom = true
			if (count == 50) isBottom = true;
			
		}
		
	}
	
	// 티빙 로그인 
	public void tvingLogin(String tvingId, String passwd) {
		
		// 크롬드라이버 URL이동
		driver.get("https://user.tving.com/pc/user/login.tving?returnUrl=https%3A%2F%2Fwww.tving.com");
		//티빙 로그인 버튼 클릭   
		driver.findElement(By.xpath("//*[@id=\"locLogin\"]")).click();
		// xpath로 셀렉트 된 input type value 입력 (ID)
		driver.findElement(By.xpath("//*[@id=\"a\"]")).sendKeys(tvingId);
		// xpath로 셀렉트 된 input type value 입력 (PW)
		driver.findElement(By.xpath("//*[@id=\"b\"]")).sendKeys(passwd);
		// 페이지 로드될때까지 최대 5초 대기
		driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(5));
		// 로그인버튼 클릭
		driver.findElement(By.xpath("//*[@id=\"doLoginBtn\"]")).click();
		// 페이지 로드될때까지 최대 5초 대기
		driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(5));
		
	}
	// 작업중!!@@!@!@!@
//	private List<CrawlingDTO> getTvingCrawlingDTOList (List<Genre_LinkDTO> genre_LinkDTOList) {
//		//for (Genre_LinkDTO genre_LinkDTO : getGenreLinkList(2)) {
//		for (GenreLinkDTO genre_LinkDTO : getTvingTestLink()) {// test 링크
//			return getContents(genre_LinkDTO);
//		}
//	}
	
	//alltt platform 별 크롤링 후 DB로넘기기
	@Override
	public void addContents(List<CrawlingDTO> crawlingDTOList) {
		
		//for (Genre_LinkDTO genre_LinkDTO : getGenreLinkList(2)) {
//		for (GenreLinkDTO genre_LinkDTO : getTvingTestLink()) {// test 링크
//			
			for(CrawlingDTO crawlingDTO : crawlingDTOList) {
				System.out.println(crawlingDTO.toString());
				
//				중복검사 플로우 start (C = content, G = genre , D= Detail, K=contentKey)

				boolean isInsertContent = false;
				boolean isInsertGenre = false;
				boolean isInsertDetail = false;
				boolean isInsertContentKey = false;
				Set<String> contentKeyList = null;
				Set<String> updateKeyList = null;
				// img_url로 T:detail_link 검색
				DetailLinkDTO detailLinkDTO = crawlingDAO.selectOneDetailLink(crawlingDTO.getImgUrl());
				if (detailLinkDTO != null) { // if (같다) 내 ott와 일치하는 작품이 있다!
					System.out.println("장르비교");
					crawlingDTO.setContentId(detailLinkDTO.getContentId());
					isInsertGenre = true; // G만 비교 후 G => UPDATE
				}
				else { //imgUrl 다르다 => 나머지 2개의 ott를 검사해야함 => 식별자가 필요!
					contentKeyList = genContentKeyList(crawlingDTO);
					System.out.println("contentKeyList : " + contentKeyList);
					// title -> title_key -> T:content_key 검색 -> contentId 확인
					List<Long> contentIdList = crawlingDAO.selectListContentId(genKorAlphaNumStr(crawlingDTO.getTitle()));
					if (contentIdList.size() != 0) {
						for ( long contentId : contentIdList) { // contentId가 있다 contentId로 T:content -> contentType 비교
							String contentType = crawlingDAO.selectOneContentType(contentId);
							if (contentType.equals(crawlingDTO.getContentType())) { // 제목과 타입이 같다
								List<String> keyList_DB = crawlingDAO.selectListContentKey(contentId);
								updateKeyList = contentKeyChecker(keyList_DB, contentKeyList); // 식별자 비교
								if(updateKeyList != null) { // 식별자 n개 이상 중복 -> 동일 작품 => G, D, K => UPDATE
									crawlingDTO.setContentId(contentId);
									isInsertGenre = true;
									isInsertDetail = true;
									isInsertContentKey = true;
								}
								else { // 다른 작품 => C, G, D, K => INSERT
									isInsertContent = true;
									isInsertGenre = true;
									isInsertDetail = true;
									isInsertContentKey = true;
								}
							}
						}
					}	
					else { // contentId가 없다 -> 다른 작품 => C, G, D, K => INSERT
						isInsertContent = true;
						isInsertGenre = true;
						isInsertDetail = true;
						isInsertContentKey = true;
					}
				}
				
				System.out.println("isInsertContent    : " + isInsertContent);
				System.out.println("isInsertGenre      : " + isInsertGenre);
				System.out.println("isInsertDetail     : " + isInsertDetail);
				System.out.println("isInsertContentKey : " + isInsertContentKey);
				// 데이터 입력단
				if (isInsertContent) {
					crawlingDAO.insertContent(crawlingDTO);
				}
				if (isInsertGenre) {
					boolean isExist = false;
					for (int genreCd : crawlingDAO.selectListGenreId(crawlingDTO.getContentId())){
						if (genreCd == crawlingDTO.getGenreId()) isExist = true;
					}
					if (!isExist) {
						crawlingDAO.insertGenre(crawlingDTO);
					}
				}
				if (isInsertDetail) {
					boolean isExist = false;
					for (int platformCd : crawlingDAO.selectListPlatformId(crawlingDTO.getContentId())) {
						if (platformCd == crawlingDTO.getPlatformId()) isExist = true; 
					}
					if (!isExist) {
						crawlingDAO.insertDetailLink(crawlingDTO);
					}
				}
				if (isInsertContentKey) {
					if (updateKeyList != null) {
						for (String key : updateKeyList) {
							crawlingDAO.insertContentKey(new ContentKeyDTO(crawlingDTO.getContentId(),key));
						}
					}
					else {
						for (String key : contentKeyList) {
							crawlingDAO.insertContentKey(new ContentKeyDTO(crawlingDTO.getContentId(),key));
						}
					}
				}
				
			}
//			
//		}
		
	}
	
	

	// 링크리스트 가져오기 
	@Override
	public List<GenreLinkDTO> getGenreLinkList(int platformId) {
		return crawlingDAO.selectListGenreLink(platformId);
	}
	
	// 창닫기, WebDriver 종료
	@Override
	public void quit() {
		// WebDriver 종료
        driver.quit();
	}
	
	public List<CrawlingDTO> getContents(GenreLinkDTO genre_LinkDTO) {
		// CrawlingDTO 리스트 생성
		List<CrawlingDTO> crawlingDTOList = new ArrayList<CrawlingDTO>();

		moveToTargetUrl(genre_LinkDTO.getUrl());
		moveToBottomPage("item__info");

		// 작품이 전부 로딩된 상태의 데이터 ( 저장 시작부분 )	
		List<WebElement> webElementList = driver.findElements(By.className("item"));
//		int testCnt = 0;
		for (WebElement webElement : webElementList) {
		    // 가져온 엘리먼트 하위 요소 다시 선택
			String imgTag = "img";
			String titleClass = "item__title";
			String detailTag = "a";
			
			WebElement imgElement = webElement.findElement(By.tagName(imgTag));
			WebElement titleElement = webElement.findElement(By.className(titleClass));
			WebElement urlElement = webElement.findElement(By.tagName(detailTag));
			
			// 크롤링 데이터 저장 crawlingDTO 생성
			CrawlingDTO crawlingDTO = new CrawlingDTO();
			
			String img = imgElement.getAttribute("src");
			String title = titleElement.getText();
			String url = urlElement.getAttribute("href");
			
			crawlingDTO.setImgUrl(img);
			crawlingDTO.setTitle(title);
			crawlingDTO.setUrl(url);
			crawlingDTO.setContentType(genre_LinkDTO.getContentType());
			crawlingDTO.setGenreId(genre_LinkDTO.getGenreId());
			crawlingDTO.setPlatformId(genre_LinkDTO.getPlatformId());
			crawlingDTOList.add(crawlingDTO);
//			testCnt++;
//			if(testCnt>30) {
//				testCnt = 0;
//				break;
//			}
		}
		// 디테일정보가져오기!!
		for (CrawlingDTO crawlingDTO : crawlingDTOList) {
			CrawlingDTO detailTemp = getDetailInfo(crawlingDTO.getUrl(), genre_LinkDTO.getContentType());
			crawlingDTO.setCreator(detailTemp.getCreator());
			crawlingDTO.setActors(detailTemp.getActors());
			crawlingDTO.setSummary(detailTemp.getSummary());
			crawlingDTO.setEnrollDt(detailTemp.getEnrollDt());
			System.out.println("CrawlingDTO [contentId=" + crawlingDTO.getContentId() + 
					", title=" + crawlingDTO.getTitle() + ", creator=" + crawlingDTO.getCreator() + 
					", actors=" + crawlingDTO.getActors() + ", enrollDt=" + crawlingDTO.getEnrollDt() + 
					", contentType=" + crawlingDTO.getContentType() + ", genreId=" + crawlingDTO.getGenreId() + 
					", platformId=" + crawlingDTO.getPlatformId() + "]");
//			testCnt++;
//			if(testCnt>30) {
//				testCnt = 0;
//				break;
//			}
		}
			
		return crawlingDTOList;
		
	}
	
	public CrawlingDTO getDetailInfo(String url, String contentType) {
		
		CrawlingDTO crawlingDTO = new CrawlingDTO();

		moveToTargetUrl(url); //url 이동
		// Movie Type : 태그가 담긴 tagWrapElement 나이, 년도, 시간 등...  
		if (contentType.equals("movie")) {
			WebElement tagWrapElement = driver.findElement(By.className("tag_wrap"));
			//년도 찾기
			List<WebElement> webElementList = tagWrapElement.findElements(By.className("tag"));
			String year = null;
			boolean isYear = false;
			
			for (WebElement tagElement : webElementList) {
				year = tagElement.getText();
				if (Pattern.matches("^\\d{4}$", year)) { // 태그중 4자리 숫자로 이루어진 값 찾기
					isYear = true;
					break;
				}
			}
			
			if (!isYear) year = "9999"; //년도 정보가 없는경우 0000으로 임시분류
			crawlingDTO.setEnrollDt(Integer.parseInt(year));
		}
		// Series Type 첫방영일 기준 enrollDt 저장
		else if (contentType.equals("series")) {
			List<WebElement> airDateElements = driver.findElements(By.className("item__subinfo"));
			String year = airDateElements.get(0).getText().substring(0, 4); // ex) "2023.05.12 | 98분" -> "2023" 
			crawlingDTO.setEnrollDt(Integer.parseInt(year));
		}
		// 감독, 출연, 내용
		WebElement creatorsElement = null;
		WebElement actorsElement = null;
		WebElement summaryElement = null;
		
		String creators;
		String actors;
		String summary;

		try {
			creators = driver.findElement(By.xpath("//*[@id=\"__next\"]/main/section/article/article/div[2]/div[2]/div[3]/dl[1]/dd")).getText();
		} catch (NoSuchElementException e) {
			creators = "";
		    System.out.println(e.getMessage()+"creators 요소를 찾을 수 없습니다.");
		}
		try {
			actors = driver.findElement(By.xpath("//*[@id=\"__next\"]/main/section/article/article/div[2]/div[2]/div[3]/dl[2]/dd")).getText();
		} catch (NoSuchElementException e) {
			actors = "";
			System.out.println(e.getMessage()+" actors 요소를 찾을 수 없습니다.");
		}
		try {
			summary = driver.findElement(By.xpath("//*[@id=\"__next\"]/main/section/article/article/div[2]/div[2]/p")).getText();
		} catch (NoSuchElementException e) {
			summary = "";
			System.out.println(e.getMessage()+"summary 요소를 찾을 수 없습니다.");
		}
		List<String> genCreator = genDataKeyList(creators.replaceAll("\\(.*?\\)", "").replaceAll("\\s*,\\s*", ","), 1);
		if (genCreator.size() == 0) genCreator.add("");
		List<String> genActors = genDataKeyList(actors.replaceAll("\\(.*?\\)", "").replaceAll("\\s*,\\s*", ","), 4);
		//if (genActors.size() == 0) genActors.add("");
		StringBuilder sbActors = new StringBuilder();
		sbActors.append("");
		for (int i = 0; i < genActors.size();) {
			sbActors.append(genActors.get(i++));
			if (i < genActors.size()) {
				sbActors.append(", ");
			}
		}
		
		crawlingDTO.setCreator(genCreator.get(0));
		crawlingDTO.setActors(sbActors.toString());
		crawlingDTO.setSummary(summary);
		System.out.println("creator : " + genCreator.get(0) + "actors : " + sbActors.toString());
		System.out.println();
		return crawlingDTO;
		
	}
	
	
	
	// 한글/영어/숫자로만 구성된 식별자 생성
	private String genKorAlphaNumStr(String str) {
		return str.replaceAll("[^가-힣a-zA-Z0-9]", "");
	}
	
	// Creator,Actors KeyList 생성
	// ","로 구분된 감독, 출연 List<String>으로 반환 
	private List<String> genDataKeyList(String strData, int length) {
		// strData 공백인 경우는 List<String> 사이즈 0
		// strData에 creators, actors 입력
		// length에는 원하는 데이터 수 입력 ex) dataKeyList(actors, 4);
		List<String> dataKeyList = new ArrayList<>();
		
		if (!strData.isEmpty()) {
			String[] strArr = strData.split(",");
			int cnt = 0;
			for(String str : strArr) {
				dataKeyList.add(genKorAlphaNumStr(str));
				if (strArr.length >= length) {
					cnt++;
					if(cnt == length) break;
				}
			}
		}
		
		return dataKeyList;
		
	}
	
	// CrawlingDTO로 만든 ContentKeyList, actors, creators, title, enrollDt 로 구성
	private Set<String> genContentKeyList (CrawlingDTO crawlingDTO) {
		// 중복요소를 포함하지않는 contentKeyList생성
		Set<String> contentKeyList = new HashSet<>();
		List<String> creatorKeyList = genDataKeyList(crawlingDTO.getCreator(),1);
		List<String> actorKeyList = genDataKeyList(crawlingDTO.getActors(),4);
		String title = genKorAlphaNumStr(crawlingDTO.getTitle());
		String enrollDt = null;
		
		if (crawlingDTO.getEnrollDt() != 9999) {
			enrollDt = "" + crawlingDTO.getEnrollDt();
			contentKeyList.add(enrollDt);
		}
		
		contentKeyList.addAll(creatorKeyList);
		contentKeyList.addAll(actorKeyList);
		contentKeyList.add(title);
		
		return contentKeyList;
		
	}
	
	// 식별자 key 확인 중복 checkDupl개 이상이면 중복된 작품으로 처리
//	@Override
//	public List<String> contentKeyChecker(List<String> keyList_DB, Set<String> contentKeyList) {
//		
//		int checkDupl = 2; // 중복 개수 확인 변수  
//		List<String> duplKeyList = new ArrayList<>();//test 확인용 
//        List<String> newKeyList = new ArrayList<>();
//        int cntDupl = 0;
//        for (String key : contentKeyList) {
//            if (keyList_DB.contains(key)) {
//            	cntDupl++;
//            	duplKeyList.add(key);//test 확인용 
//            } else {
//                newKeyList.add(key);
//            }
//        }
//        System.out.println(duplKeyList);
//        System.out.println(newKeyList);
//		
//		return cntDupl >= checkDupl ? newKeyList : null;
//		
//	}
	//////////////////////haseSet 사용//////////////////////////
	public Set<String> contentKeyChecker(List<String> keyList_DB, Set<String> contentKeyList) {
	    int checkDupl = 2; // 중복 개수 확인 변수  
	    int cntDupl = 0;
	    
	    // 중복된 요소를 찾기 retainAll
	    Set<String> duplSet = new HashSet<>(contentKeyList);
	    duplSet.retainAll(keyList_DB);
	    cntDupl = duplSet.size();
	    
	    // 중복되지 않은 요소 찾기 removeAll
	    Set<String> newKeySet = new HashSet<>(contentKeyList);
	    newKeySet.removeAll(keyList_DB);
	    
	    return cntDupl >= checkDupl ? newKeySet : null;
	}
	
	//테스트 링크 ovX
	public List<GenreLinkDTO> getTvingTestLink(){
		// 장르별 크롤링 9:series 로맨스, 10:series 판타지 // test중
		List<GenreLinkDTO> genreLinkList = new ArrayList<GenreLinkDTO>();
		
		GenreLinkDTO testTempDTO = null;
		
		testTempDTO = new GenreLinkDTO();
		testTempDTO.setContentType("series");
		testTempDTO.setPlatformId(2);
		testTempDTO.setGenreId(10);
		testTempDTO.setUrl("https://www.tving.com/list/program?genre=PCR&slug=program");
		genreLinkList.add(testTempDTO);
		
		testTempDTO = new GenreLinkDTO();
		testTempDTO.setContentType("series");
		testTempDTO.setPlatformId(2);
		testTempDTO.setGenreId(9);
		testTempDTO.setUrl("https://www.tving.com/list/program?genre=PCO&slug=program");
		genreLinkList.add(testTempDTO);
		
		return genreLinkList;
		
	}

}
