package com.app.alltt.crawling.service;

import java.time.Duration;
import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;
import java.util.Scanner;
import java.util.Set;
import java.util.regex.Matcher;
import java.util.regex.Pattern;

import org.apache.commons.text.StringEscapeUtils;
import org.openqa.selenium.By;
import org.openqa.selenium.Cookie;
import org.openqa.selenium.Keys;
import org.openqa.selenium.NoSuchElementException;
import org.openqa.selenium.NoSuchWindowException;
import org.openqa.selenium.WebDriver;
import org.openqa.selenium.WebElement;
import org.openqa.selenium.WindowType;
import org.openqa.selenium.chrome.ChromeDriver;
import org.openqa.selenium.chrome.ChromeOptions;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.PropertySource;
import org.springframework.stereotype.Service;

import com.app.alltt.crawling.dao.CrawlingDAO;
import com.app.alltt.crawling.dto.ContentDTO;
import com.app.alltt.crawling.dto.ContentKeyDTO;
import com.app.alltt.crawling.dto.ContentLinkDTO;
import com.app.alltt.crawling.dto.CrawlingDTO;
import com.app.alltt.crawling.dto.GenreLinkDTO;

import io.github.bonigarcia.wdm.WebDriverManager;

@Service
@PropertySource("classpath:properties/platform.properties")
public class CrawlingServiceImpl implements CrawlingService {
	
	@Autowired
	private CrawlingDAO crawlingDAO;

	@Value("${wavve.key}")
	private String[] WAVVE_LOGIN_KEY;
	@Value("${netflix.key}")
	private String[] NETFLIX_LOGIN_KEY;
	@Value("${tving.key}")
	private String[] TVING_LOGIN_KEY;
	
	private WebDriver driver;
	private static final String WEB_DRIVER_ID = "webdriver.chrome.driver";
	private static final String WEB_DRIVER_PATH = "C:\\chromedriver\\chromedriver.exe";
	
	// ==================================== 
	// ===== 크롤링 공통 메서드 Start ===== 
	// ==================================== 
	
	// 크롬드라이버 초기화 
	private void chromeDriverInit() {
		
		WebDriverManager.chromedriver().setup();
		
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
		
		// HTTP 헤더추가
		options.addArguments("--user-agent=Mozilla/5.0 (Windows NT 10.0; Win64; x64) AppleWebKit/537.36 (KHTML, like Gecko) Chrome/114.0.0.0 Safari/537.36");
		
		// 크롬드라이버 초기화(옵션)
		driver = new ChromeDriver(options);
		
	}
	
	// URL 이동 
	private boolean moveToTargetUrl(String url) {

		boolean isTargetUrl = false;
		int delay = 250;
		while(!isTargetUrl) {
			// 크롬드라이버 URL이동
			driver.get(url);
			// 명시적 딜레이
			try {Thread.sleep(delay);} catch (InterruptedException e) {e.printStackTrace();}
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
	private void moveToBottomPage(String className) { 
		
		boolean isBottom = false;
		int delay = 250;
		int count = 0;
		int testCnt = 0;
		while(!isBottom) {
			
			// 작품명이 담겨져있는 요소의 부모 클래스 List에 담기
			List<WebElement> previous = driver.findElements(By.className(className));
			
			// END 키입력 (스크롤 최하단 이동을 위함)
			driver.findElement(By.xpath("/html")).sendKeys(Keys.END);
			
			// 명시적 딜레이
			try {Thread.sleep(delay);} catch (InterruptedException e) {e.printStackTrace();}
			
			// 작품명이 담겨져있는 요소의 부모 클래스 List에 담기 
			List<WebElement> current = driver.findElements(By.className(className));
//			testCnt++;
			// 사이즈 비교
			if (previous.size() == current.size()) count++;
			else count = 0;
			// 스크롤이동이 50번동안 없다면 isBottom = true
			if (count == 50) isBottom = true;
//			if (testCnt == 5) isBottom = true;
			
		}
		
	}
	
	// 창닫기, WebDriver 종료
	private void quit() {
		// WebDriver 종료
        driver.quit();
	}
	
	// ==================================== 
	// ====== 크롤링 공통 메서드 End ====== 
	// ==================================== 
	
	// ==================================== 
	// ====== 기타 공통 메서드 Start ====== 
	// ====================================
	
	// 삭제된 작품확인용 Status 초기화 메서드
	private void initExistYn() {
		crawlingDAO.updateExistYn();
	}
	
	// 서비스종료된 작품 DB에서 삭제 메서드
	public void deleteContent() {
		//종료된 작품 contentId List 가져오기
		for (CrawlingDTO nonService : crawlingDAO.selectListNonServiceContent()) {
			System.out.println(nonService.getContentId());
			//post 삭제
			crawlingDAO.deletePost(nonService.getContentId());
			//content 테이블에서 삭제
			crawlingDAO.deleteContent(nonService.getContentId());
			break;
		}
	}
	
	// DB에서 OTT플랫 폼별 GenreLinkList 가져오기
	private List<GenreLinkDTO> getGenreLinkList(int platformId) {
		return crawlingDAO.selectListGenreLink(platformId);
	}
	
	// 크롤링 테스트 확인용
	private void showCrawlingDTO (CrawlingDTO crawlingDTO){
		System.out.println("CrawlingDTO " + " [contentId=" + crawlingDTO.getContentId() + 
				", title=" + crawlingDTO.getTitle() + ", creator=" + crawlingDTO.getCreator() + 
				", actors=" + crawlingDTO.getActors() + ", enrollDt=" + crawlingDTO.getEnrollDt() + 
				", contentType=" + crawlingDTO.getContentType() + ", genreId=" + crawlingDTO.getGenreId() + 
				", platformId=" + crawlingDTO.getPlatformId() + ", getExistYn=" + crawlingDTO.getExistYn() + "]");
	}
	
	// 크롤링 테스트 확인용
	private void showGenreLinkDTO (List<WebElement> webElementTemp, GenreLinkDTO genreLinkDTO) {
		System.out.println("Genre CNT=" + webElementTemp.size() + " [contentType=" + genreLinkDTO.getContentType() + ", genreId=" + genreLinkDTO.getGenreId()
		+ ", platformId=" + genreLinkDTO.getPlatformId() + ", url=" + genreLinkDTO.getUrl() + "]");
	}
	
	
	// test 메서드 
	private void readDBcontentTest() {
		List<ContentDTO> dbContentList = new ArrayList<ContentDTO>();
		dbContentList = crawlingDAO.selectListContent();
		for (ContentDTO contentDTO : dbContentList) {
			System.out.println(contentDTO.getContentId() + ", " + contentDTO.getTitle());
		}
	}
	
	// ==================================== 
	// ======= 기타 공통 메서드 End ======= 
	// ==================================== 
	
	// ==================================== 
	// ===== 전체 크롤링 메서드 Start ===== 
	// ====================================
	
	public List<GenreLinkDTO> getGenreLink(String contentType, int genreId) {
		GenreLinkDTO temp = new GenreLinkDTO();
		temp.setContentType(contentType);
		temp.setGenreId(genreId);
		return crawlingDAO.selectListGenreLinkByGenreId(temp);
	}
	
	@Override
	public void addAllttContent() throws InterruptedException {
		String contentType = "series";
		StringBuilder sb = new StringBuilder();
		for (int i = 1; i <= 38 ; i++) {
			for(GenreLinkDTO genreLinkDTO : getGenreLink(contentType, i)) {
				int platformId = genreLinkDTO.getPlatformId();
				if (platformId == 1) {
					try {
						addNetflix(genreLinkDTO);
					} catch (Exception e) {
						sb.append(genreLinkDTO.toString() + e.toString());
						System.out.println(genreLinkDTO.toString() + e.toString());
					}
				}
				if (platformId == 2) {
					try {
						addTving(genreLinkDTO);
					} catch (Exception e) {
						sb.append(genreLinkDTO.toString() + e.toString());
						System.out.println(genreLinkDTO.toString() + e.toString());
					}
				}
				if (platformId == 3) {
					try {
						addWavve(genreLinkDTO);
					} catch (Exception e) {
						sb.append(genreLinkDTO.toString() + e.toString());
						System.out.println(genreLinkDTO.toString() + e.toString());
					}
				}
			}
		}
		System.out.println(sb.toString());
	}
	
	public void addTving(GenreLinkDTO genreLinkDTO) {
		
		chromeDriverInit();

		tvingLogin(TVING_LOGIN_KEY[0], TVING_LOGIN_KEY[1]);
		initExistYn();

		addContents(crawlTvingContents(genreLinkDTO));
		quit();
		
	}
	
	public void addNetflix(GenreLinkDTO genreLinkDTO) {
		
		chromeDriverInit();
		netflixLogin(NETFLIX_LOGIN_KEY[0],NETFLIX_LOGIN_KEY[1]);
//		addContents(getNetflixDetailInfo(crawlNetflixdContents(genreLinkDTO)));
		quit();
		
	}
	
	public void addWavve(GenreLinkDTO genreLinkDTO) throws InterruptedException {
		chromeDriverInit();
		Set<Cookie> loginCookies = loginWavve(WAVVE_LOGIN_KEY[0], WAVVE_LOGIN_KEY[1]);
//		addContents(ctrlWavveContentsPage(genreLinkDTO, loginCookies));
		quit();
	}
	
	// ==================================== 
	// ====== 전체 크롤링 메서드 End ====== 
	// ====================================
	
	
	// ==================================== 
	// ===== 티빙 크롤링 메서드 Start ===== 
	// ====================================
	
	// 티빙 로그인 
	private void tvingLogin(String tvingId, String passwd) {
		
		// 티빙 로그인 페이지 UR L이동
		driver.get("https://user.tving.com/pc/user/login.tving?returnUrl=https%3A%2F%2Fwww.tving.com");
		
		//티빙 로그인 버튼 클릭   
		driver.findElement(By.xpath("//*[@id=\"locLogin\"]")).click();
		
		// 로그인 아이디 입력
		driver.findElement(By.xpath("//*[@id=\"a\"]")).sendKeys(tvingId);
		
		// 로그인 패스워드 입력
		driver.findElement(By.xpath("//*[@id=\"b\"]")).sendKeys(passwd);

		// 페이지가 로드될때까지 최대 5초 대기
		driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(5));
		
		// 로그인버튼 클릭
		driver.findElement(By.xpath("//*[@id=\"doLoginBtn\"]")).click();
		
		// 페이지 로드될때까지 최대 5초 대기
		driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(5));
		
	}
	
	private List<CrawlingDTO> crawlTvingContents(GenreLinkDTO genreLinkDTO) {
		// CrawlingDTO 리스트 생성
		List<CrawlingDTO> crawlingDTOList = new ArrayList<CrawlingDTO>();

		moveToTargetUrl(genreLinkDTO.getUrl());
		moveToBottomPage("item__info");

		// 장르별 페이지에 작품이 전부 로딩된 상태의 데이터 ( 저장 시작부분 )	
		List<WebElement> webElementList = driver.findElements(By.className("item"));
//		List<WebElement> webElementTemp = new ArrayList<WebElement>();
		int count = 1;
//		for (WebElement webElement : webElementList) {
//			webElementTemp.add(webElement);
//			count++;
//			if(count >= 350) break;
//		} 
		showGenreLinkDTO(webElementList, genreLinkDTO);
		// 가져온 엘리먼트 하위 요소 다시 선택
		for (WebElement webElement : webElementList) {
	         
	        String tagClass = "item__tags"; // 개별 구매 태그 작품은 제외
	        WebElement tagElement = webElement.findElement(By.className(tagClass));
	        if (tagElement.getText().contains("구매")) continue;
			
			String titleClass = "item__title";
			String detailTag = "a";
			String imgTag = "img";
			
			WebElement titleElement = webElement.findElement(By.className(titleClass));
			WebElement urlElement = webElement.findElement(By.tagName(detailTag));
			WebElement imgElement = webElement.findElement(By.tagName(imgTag));
			
			
			// 크롤링 데이터 저장 crawlingDTO 생성
			CrawlingDTO crawlingDTO = new CrawlingDTO();
			
			String title = titleElement.getText();
			String url = urlElement.getAttribute("href");
			String rawImgUrl = imgElement.getAttribute("src");
			String imgUrl = rawImgUrl.replace("/dims/resize/400", ""); // jpg 뒷부분 제거
			crawlingDTO.setImgUrl(imgUrl);
			crawlingDTO.setTitle(title);
			crawlingDTO.setUrl(url);
			crawlingDTO.setContentType(genreLinkDTO.getContentType());
			crawlingDTO.setGenreId(genreLinkDTO.getGenreId());
			crawlingDTO.setPlatformId(genreLinkDTO.getPlatformId());
			crawlingDTOList.add(crawlingDTO);

		}
		// 디테일정보가져오기
		int contentCnt = 1;
		for (CrawlingDTO crawlingDTO : crawlingDTOList) {
			
			// 조건문 detail 링크 안들어가기 imgUrl로 사전 확인 -> 있으면 아래코드 안들어가고 패스
			ContentLinkDTO contentLinkDTO = crawlingDAO.selectOneContentLink(crawlingDTO.getImgUrl());
			if (contentLinkDTO != null) { // if (같다) 내 ott와 일치하는 작품이 있다!
//				String titleDB = crawlingDAO.selectOneTitle(contentLinkDTO.getContentId());
//				if (titleDB.equals(crawlingDTO.getTitle())) { // 제목 비교
				System.out.println("DB에 있는작품 : " + crawlingDAO.selectOneTitle(contentLinkDTO.getContentId()));
					continue; // 같은 작품으로 분류 하고 디테일 정보입력은 패스
//				}
			}
			CrawlingDTO detailTemp = getTvingContentDetailInfo(crawlingDTO.getUrl(), genreLinkDTO.getContentType());
			crawlingDTO.setCreator(detailTemp.getCreator());
			crawlingDTO.setActors(detailTemp.getActors());
			crawlingDTO.setSummary(detailTemp.getSummary());
			crawlingDTO.setEnrollDt(detailTemp.getEnrollDt());
			System.out.print(contentCnt++ +" ");
			showCrawlingDTO(crawlingDTO);

		}
			
		return crawlingDTOList;
		
	}
	
	private CrawlingDTO getTvingContentDetailInfo(String url, String contentType) {
		
		CrawlingDTO crawlingDTO = new CrawlingDTO();

		moveToTargetUrl(url); //url 이동
		
		while (driver.getTitle().equals("TVING")) {
			quit();
			chromeDriverInit();
			tvingLogin("alltttv", "!allott1234");
			moveToTargetUrl(url);
		}
		
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
			
			if (!isYear) year = "9999"; //년도 정보가 없는경우 9999으로 임시분류
			crawlingDTO.setEnrollDt(Integer.parseInt(year));
		}
		// Series Type 첫방영일 기준 enrollDt 저장
		else if (contentType.equals("series")) {
			List<WebElement> airDateElements = driver.findElements(By.className("item__subinfo"));
			String year = airDateElements.get(0).getText().substring(0, 4); // ex) "2023.05.12 | 98분" -> "2023" 
			crawlingDTO.setEnrollDt(Integer.parseInt(year));
		}
		
		// 감독, 출연, 내용
		WebElement detailInfoWebElement = driver.findElement(By.className("css-nyzrx4"));
		List<WebElement> detailInfoWebElementList = detailInfoWebElement.findElements(By.className("css-1ukskfr"));
		String creator = "";
		String actors = "";
		String summary = "";
		
		for (WebElement webElement : detailInfoWebElementList) {
			String checkWebElement = null;
			try {
				checkWebElement = webElement.findElement(By.tagName("dt")).getText();
			} catch (NoSuchElementException e) {
			    System.out.println(e.getMessage()+"작품 감독, 출연 관련 webElement 요소를 찾을 수 없습니다.");
			}
			
			if (checkWebElement.equals("크리에이터")) {
				try {
					creator = webElement.findElement(By.tagName("dd")).getText();
				} catch (NoSuchElementException e) {
				    System.out.println(e.getMessage()+"creator 요소를 찾을 수 없습니다.");
				}
			}
			
			else if (checkWebElement.equals("출연")) {
				try {
					actors = webElement.findElement(By.tagName("dd")).getText();
				} catch (NoSuchElementException e) {
				    System.out.println(e.getMessage()+"actors 요소를 찾을 수 없습니다.");
				}
			}
			
		}
		
		try {
			summary = driver.findElement(By.xpath("//*[@id=\"__next\"]/main/section/article/article/div[2]/div[2]/p")).getText();
		} catch (NoSuchElementException e) {
			System.out.println(e.getMessage()+"summary 요소를 찾을 수 없습니다.");
		}
		
		creator = genCreatorActorString(creator, 1);
		actors = genCreatorActorString(actors, 4);
		
		crawlingDTO.setCreator(creator);
		crawlingDTO.setActors(actors);
		crawlingDTO.setSummary(summary);
//		System.out.println("creator : " + creator + ", actors : " + actors);
		return crawlingDTO;
		
	}
	
	// 티빙 감독, 출연정보에 ")"이 누락된경우 사용 "(괄호사이의 내용)" -> "," 변경 메서드  
	private String genCreatorActorString (String data, int length) {
		//String result;
		if (data.contains("(") && !data.endsWith(")")) {
			data = data + ")";
		}
		data = data.replaceAll("\\(.*?\\)", ",");
		data = data.replaceAll(",,", ",");
		List<String> strList = genDataKeyList(data, length);
		
		StringBuilder sb = new StringBuilder();
		
		for (int i = 0; i < strList.size();) {
			sb.append(strList.get(i++));
			if (i < strList.size()) {
				sb.append(", ");
			}
		}
		
		return sb.toString();
	}
	
	
	@Override
	public void addTvingContent() {
		
//		readDBcontentTest();
		
		chromeDriverInit();
		tvingLogin(TVING_LOGIN_KEY[0], TVING_LOGIN_KEY[1]);
		//addContents(getTvingCrawlingDTOList(0));
		initExistYn();
		//getTvingContentDetailInfo("https://www.tving.com/contents/P001635813", "series");
		
		//String contentType = "movie";
		String contentType = "series";
		int str = 6;
		int end = 6;
		
		for (GenreLinkDTO genreLinkDTO : getGenreLinkList(2)) {
			if (genreLinkDTO.getContentType().equals(contentType)) {
				if (genreLinkDTO.getGenreId()>=str && genreLinkDTO.getGenreId()<=end) {
					System.out.println("CRAWLING START ContentType : " + genreLinkDTO.getContentType() + ", GenreId : " + genreLinkDTO.getGenreId());
					addContents(crawlTvingContents(genreLinkDTO));
					System.out.println("CRAWLING DONE ContentType : " + genreLinkDTO.getContentType() + ", GenreId : " + genreLinkDTO.getGenreId());
				}
			}
		}
		
		quit();
	}
	
	
	// ==================================== 
	// ====== 티빙 크롤링 메서드 End ====== 
	// ====================================
	
	// ==================================== 
	// === 넷플릭스 크롤링 메서드 Start === 
	// ====================================
	
	// 넷플릭스 로그인
	private void netflixLogin(String netflixId, String netflixPw) {
		
		// 넷플릭스 로그인 페이지 이동
		driver.get("https://www.netflix.com/kr/login");
		
		// 페이지 로드까지 최대 10초 대기
		driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(10));

		// 넷플릭스 아이디 입력
		driver.findElement(By.xpath("//*[@id=\"id_userLoginId\"]")).sendKeys(netflixId);
		
		// 넷플릭스 패스워드 입력
		driver.findElement(By.xpath("//*[@id=\"id_password\"]")).sendKeys(netflixPw);
		
		// 로그인
		driver.findElement(By.xpath("//*[@id=\"appMountPoint\"]/div/div[3]/div/div/div[1]/form/button")).click();
		
		// 페이지 로드까지 최대 10초 대기
		driver.manage().timeouts().implicitlyWait(Duration.ofSeconds(10));
		
		// 4번째 프로필 클릭 li[4]
		driver.findElement(By.xpath("//*[@id=\"appMountPoint\"]/div/div/div[1]/div[1]/div[2]/div/div/ul/li[1]/div/a/div/div")).click();
		
	}

	private ArrayList<CrawlingDTO> crawlNetflixdContents(GenreLinkDTO genreLinkDTO) {
		
		ArrayList<CrawlingDTO> contentList = new ArrayList<CrawlingDTO>();
		
			// 장르 URL
			String url = genreLinkDTO.getUrl();
			// 장르 코드
			int genreId = genreLinkDTO.getGenreId();
			
			// 장르 URL로 이동
			moveToTargetUrl(url);
			
			// 스크롤 작업
			moveToBottomPage("fallback-text");
			
			// 원하는 정보가 모두 포함된 요소
			List<WebElement> content = driver.findElements(By.className("slider-refocus"));
			showGenreLinkDTO(content, genreLinkDTO);
			
			// title, imgUrl, detailLink, genreId, contentType
			for (WebElement webElement : content) {

				// 가져온 엘리먼트 하위 요소 선택
				WebElement imgLink = webElement.findElement(By.tagName("img"));

				// 해당 문자열의 첫번째 ?의 인덱스
				int urlIdxOf = webElement.getAttribute("href").indexOf("?");
				
				CrawlingDTO crawlingDTO = new CrawlingDTO();
				// title
				crawlingDTO.setTitle(webElement.getAttribute("aria-label"));
				// imgUrl
				crawlingDTO.setImgUrl(imgLink.getAttribute("src"));
				// genreId
				crawlingDTO.setGenreId(genreId);
				// contentType
				crawlingDTO.setContentType(genreLinkDTO.getContentType());
				// platformId
				crawlingDTO.setPlatformId(genreLinkDTO.getPlatformId());
				
				String detailUrl = webElement.getAttribute("href").substring(0,urlIdxOf).replace("/watch/", "/title/");
				
				// detail 중복검사 후 없을경우에만 detailUrl 추가 
				if (crawlingDAO.selectOneContentLink(crawlingDTO.getImgUrl()) == null) {
					// detailUrl
					crawlingDTO.setUrl(detailUrl);
				}
				else { // 있을경우 contentId DTO에 추가
					crawlingDTO.setContentId(crawlingDAO.selectOneContentLink(crawlingDTO.getImgUrl()).getContentId());
					System.out.println("img : " + crawlingDTO.getImgUrl());
					System.out.println("contentId : " + crawlingDTO.getContentId());
				}
				
				contentList.add(crawlingDTO);
// 1개만 가져옴 test				
			//	break;
			}	
			
		return contentList;

	}
	
	private ArrayList<CrawlingDTO> getNetflixDetailInfo(ArrayList<CrawlingDTO> crawlingList) {
		int contentCnt = 1;
		// enrollDt, creator , actors, summary, contentKey
		for (CrawlingDTO crawlingDTO : crawlingList) {
				
				if (crawlingDTO.getUrl() != null) {

					// 디테일 페이지 이동
					moveToTargetUrl(crawlingDTO.getUrl());
					
					if(driver.getTitle().equals("www.netflix.com")) {
						while(!driver.getTitle().equals("홈 - 넷플릭스")) {
						// 드라이버 종료
						quit();
						
						// 드라이버 재시작
						chromeDriverInit();
						
						netflixLogin(NETFLIX_LOGIN_KEY[0], NETFLIX_LOGIN_KEY[1]);

						}
						// 디테일 페이지 이동
						moveToTargetUrl(crawlingDTO.getUrl());
					}
					
					String year = null; 
					String creator = "";
					String actors = "";
					StringBuilder result = new StringBuilder();
					
					// 등록일자
					year = driver.findElements(By.className("year")).get(0).getText();
					while (year == null) {
						
						while(!driver.getTitle().equals("홈 - 넷플릭스")) {
						// 드라이버 종료
						quit();
						
						// 드라이버 재시작
						chromeDriverInit();
						
						netflixLogin(NETFLIX_LOGIN_KEY[0], NETFLIX_LOGIN_KEY[1]);

						}
						
						// 디테일 페이지 이동
						moveToTargetUrl(crawlingDTO.getUrl());
						
						year = driver.findElement(By.xpath("//*[@id=\"appMountPoint\"]/div/div/div[1]/div[2]/div/div[3]/div/div[1]/div/div/div[1]/div[1]/div/div[1]/div/div[2]/div")).getText();
						
						if (year == null) year = driver.findElements(By.className("year")).get(0).getText();
					}
						
					// 디테일 페이지내 상세정보가 담긴 요소
					List<WebElement> aboutContainer = driver.findElement(By.className("about-container")).findElements(By.className("previewModal--tags"));
	
					for (WebElement webElement : aboutContainer) {
	
						// tagName (감독, 크리에이터, 출연)
						String tagName = webElement.findElement(By.className("previewModal--tags-label")).getText();
						
						// tagItem
						List<WebElement> tagList = webElement.findElements(By.className("tag-item"));
						
						if (tagName.equals("감독:") || tagName.equals("크리에이터:")) {
							
							// 한명만
							creator = tagList.get(0).getText().replace(",", "");

						}
						else if (tagName.equals("출연:")) {
								
							for (WebElement webElement2 : tagList) actors += webElement2.getText();
							
							String[] nameArray = actors.split(",");
							result = new StringBuilder();
						       
						    // 4명 까지
						    for (int i = 0; i < Math.min(4, nameArray.length); i++) {
						        result.append(nameArray[i]);
						        if (i < Math.min(4, nameArray.length) - 1) {
						            result.append(",");
						        }

						    }

						}
						
						crawlingDTO.setEnrollDt(Integer.parseInt(year));
						
						//summary
						crawlingDTO.setSummary(driver.findElement(By.xpath("//*[@id=\"appMountPoint\"]/div/div/div[1]/div[2]/div/div[3]/div/div[1]/div/div/div[1]/p/div")).getText());

						// creator
						crawlingDTO.setCreator(creator);
					    
						// actors
						crawlingDTO.setActors(result.toString());
					    
					}
				}
			System.out.print(contentCnt++ +" ");
			showCrawlingDTO(crawlingDTO);
//				System.out.println(crawlingDTO);
					
		}
		return crawlingList;
	}

	@Override
	public void addNetflixContent() {
		
//		Netflix 단일장르 Test Start

//		List<GenreLinkDTO> genreLinkList = new ArrayList<GenreLinkDTO>();
//		GenreLinkDTO testTempDTO = null;
//		testTempDTO = new GenreLinkDTO();
//		testTempDTO.setContentType("series");
//		testTempDTO.setPlatformId(1);
//		testTempDTO.setGenreId(5); //코미디
//		testTempDTO.setUrl("https://www.netflix.com/browse/genre/10375?bc=83&so=yr");
//		genreLinkList.add(testTempDTO);

//		Netflix 단일장르 Test End
		
		Scanner scan = new Scanner(System.in);
		
		List<GenreLinkDTO> genreLinkList = getGenreLinkList(1);

		// 크롬드라이버 초기화
		chromeDriverInit();

		// netflix 로그인
		netflixLogin(NETFLIX_LOGIN_KEY[0],NETFLIX_LOGIN_KEY[1]);
		ArrayList<CrawlingDTO> netflixContentList = new ArrayList<>();
		
		for (GenreLinkDTO genreLinkDTO : genreLinkList) {
			netflixContentList = crawlNetflixdContents(genreLinkDTO);
		}
		
		netflixContentList = getNetflixDetailInfo(netflixContentList);
		
		scan.nextInt();
		
		scan.close();
		
		addContents(netflixContentList);
		// 드라이버 종료
		quit();
		
	}
	
	
	// ==================================== 
	// ==== 넷플릭스 크롤링 메서드 End ==== 
	// ====================================
	
	// ==================================== 
	// ==== 웨이브 크롤링 메서드 Start ==== 
	// ====================================

	@Override
	public void addWavveContent() throws InterruptedException {
		chromeDriverInit();
		Set<Cookie> loginCookies = loginWavve(WAVVE_LOGIN_KEY[0], WAVVE_LOGIN_KEY[1]);
//		for (GenreLinkDTO genre : this.getGenreLinkList(3)) {
//			this.addContents(this.crawlWavve(genre, loginCookies));
//		}
		// test genre
		for (GenreLinkDTO genre : getGenreLinkTestWavve(3)) {
			addContents(ctrlWavveContentsPage(genre, loginCookies));
		}
		quit();
	}
	 
	// login wavve
	private Set<Cookie> loginWavve(String wavveId, String wavvePw) {
		// enter wavve login page
		driver.get("https://www.wavve.com/member/login?referer=%2Findex.html");
		List<WebElement> loginInput = driver.findElements(By.className("input-style01"));
		loginInput.get(0).sendKeys(wavveId);
		loginInput.get(0).sendKeys(wavvePw);
		// click login
		driver.findElement(By.className("btn-purple-dark")).click();
		// save login cookies
		return driver.manage().getCookies();
	}
	
	// 웨이브 테스트 링크 메서드 DB에 저장된 장르별 링크 리스트를 가져옴
	private List<GenreLinkDTO> getGenreLinkTestWavve(int platformId){
		
//		 test genres
		List<GenreLinkDTO> testGenreLink = new ArrayList<GenreLinkDTO>();
		for (GenreLinkDTO genre : crawlingDAO.selectListGenreLink(platformId)) {
			// 장르가 바뀌면 숫자만 바뀌는걸로
			if (genre.getGenreId() == 6) {
				testGenreLink.add(genre);
				break;
			}
		}
		return testGenreLink;
//		전체 장르
//		return crawlingDAO.selectListGenreLink(platformId);
	}

	// 해당 url로 이동
	private void moveToUrl(String url, Set<Cookie> loginCookies) {
		// 크롤링을 위한 장르 페이지로 이동
		driver.get(url);
		// 로그인 정보를 담은 쿠키 설정, 19세 컨텐츠 등 확인에 필요
		for (Cookie cookie : loginCookies) driver.manage().addCookie(cookie);
	}
	
	// wavve 해당 장르로 들어가서, 장르 및 페이지 컨트롤
	private List<CrawlingDTO> ctrlWavveContentsPage(GenreLinkDTO genre, Set<Cookie> loginCookies) throws InterruptedException{
		// 모든 정보를 담는 list
		List<CrawlingDTO> wavveContentList = new ArrayList<CrawlingDTO>();
		
		this.moveToUrl(genre.getUrl(), loginCookies);
		// 차단 방지
		while (driver.getTitle().equals("웨이브 로그인")) {
			this.moveToUrl(genre.getUrl(), loginCookies);
		}
		// page 돌아가면서 진행
		boolean pageCycle = true;
		// 최초 페이지 index
		int pageNum = 1;
		while (pageCycle) {
			System.out.println(driver.getCurrentUrl());
			// 페이지 로딩 대기
			Thread.sleep(1200);
			// 크롤링 작업 진행
			wavveContentList.addAll(this.crawlWavveCurrentPageContentList(genre, loginCookies));
			// 페이지 리스트에서 다음 페이지가 있는지 확인
			List<WebElement> pageList = driver.findElement(By.className("paging-type01")).findElements(By.tagName("a"));
			boolean nextPageFound = false;
			for (WebElement page : pageList) {
				// 만약 다음 페이지가 있다면
				if (page.getText().equals((pageNum+1) + "")) {
					// 현재 page 보다 하나 늘린 page로 url 변경하고, pageIdx 증가시킴
					String nextPage = driver.getCurrentUrl().replaceAll("&page=" + pageNum, "&page=" + (++pageNum));
					// 다음 페이지로 이동
					driver.get(nextPage);
					// 차단 방지
					while (driver.getTitle().equals("웨이브 로그인")) {
						moveToUrl(nextPage, loginCookies);
					}
				    nextPageFound = true;
					break;
				}
			}
			// 다음 페이지가 없는 경우, pageCycle을 false로 설정하여 while 루프 종료
		    if (!nextPageFound) pageCycle = false;
			// 10의 배수라면
		    if (pageNum % 10 == 0) {
		    	WebElement nextPageList = null;
		    	try {
		    		// 다음 페이지 리스틑로 가는 링크가 있는지 확인하고
		    		nextPageList = driver.findElement(By.id("next-page"));
		    	} catch (Exception e) {System.out.println("This genre has under 10 pages");}
		    	// 다음 페이지 리스트로 가는 링크가 있다면 클릭
		    	if (nextPageList != null) nextPageList.click();
		    }
		}
		return wavveContentList;
	}
	
	// wavve 해당 페이지의 content 정보 긁기
	private List<CrawlingDTO> crawlWavveCurrentPageContentList(GenreLinkDTO genre, Set<Cookie> loginCookies) {
		List<CrawlingDTO> wavveContentList = new ArrayList<CrawlingDTO>();
		// 현재 페이지에서 가져올 수 있는 모든 content list
		List<WebElement> pageTotalContent = driver.findElements(By.className("inner-box"));
		// 새로운 창에서 열 현재 페이지 url 저장
		String currentUrl = driver.getCurrentUrl();
		// 각 컨텐츠의 정보 가져오기
		for (int i = 0; i < pageTotalContent.size(); i++) {
			// 영화 개별구매 거르기
			try {
				if (pageTotalContent.get(i).findElement(By.className("left-top-area")).findElement(By.tagName("span")) != null) {
					System.out.println("개별구매 content 입니다");
					continue;
				}
			} catch (Exception e) {
				System.out.println("개별구매가 아닙니다");
			}
			// title, contentType, platformId, imgUrl 가져옴
			CrawlingDTO content = new CrawlingDTO();
			// 제목 특수문자 관련 가공해서 넣고
			String title = pageTotalContent.get(i).findElement(By.className("alt-text")).getAttribute("innerHTML");
			title = StringEscapeUtils.unescapeHtml4(title);
			content.setTitle(title);
			// 컨텐츠 타입 넣고
			content.setContentType(genre.getContentType());
			// 플랫폼 정보 넣고
			content.setPlatformId(genre.getPlatformId());
			// 장르 정보 넣고
			content.setGenreId(genre.getGenreId());
			// 이미지 정보 가공해서 넣고
			String imgTag = pageTotalContent.get(i).findElement(By.tagName("source")).getAttribute("srcset");
			content.setImgUrl(getImageUrlByDensity(imgTag));
			// imgUrl 으로 있는지 없는지 검색
			long tempContentId = -1;
			if (crawlingDAO.selectOneContentLink(content.getImgUrl()) != null) {
				tempContentId = crawlingDAO.selectOneContentLink(content.getImgUrl()).getContentId();
			}
			content.setContentId(tempContentId);
			// -1이면 지금 현재 DB에 아예 없음
			if (content.getContentId() == -1) {
				CrawlingDTO newContent = null;
				try {
					// 디테일 페이지로 들어가서 정보 긁어오기
					newContent = getWavveDetailInfo(currentUrl, loginCookies, i, content);
				} catch (InterruptedException e) {System.out.println("FAIL TO CRAWL CONTENT DETAIL");}
				// 컨텐츠를 못 가져왔거나, 페이지 리로드되며 디테일 정보를 못 가져오는 경우가 아니면 리스트에 넣기
				if (newContent != null && newContent.getCreator() != null) wavveContentList.add(newContent);
			}
		}
		return wavveContentList;
	}
	
	// 작품 상세정보 가져오기
	private CrawlingDTO getWavveDetailInfo(String url, Set<Cookie> loginCookies, int idx, CrawlingDTO crawlingDTO) throws InterruptedException {
		// 현재창의 핸들을 String으로 저장
		String mainHandle = driver.getWindowHandle();
		// 새창 열기
		driver.switchTo().newWindow(WindowType.WINDOW);
		// 새창 핸들
		String newWindowHandle = driver.getWindowHandles().stream()
				.filter(handle -> !handle.equals(mainHandle))
				.findFirst()
				.orElseThrow(() -> new NoSuchWindowException("새 창이 열리지 않았습니다."));
		driver.switchTo().window(newWindowHandle);
		// 페이지 이동 및 쿠키 설정
		moveToUrl(url, loginCookies);
		// 차단 방지
		while (driver.getTitle().equals("웨이브 로그인")) {
			moveToUrl(url, loginCookies);
		}
		// get web page content list
		List<WebElement> newContentList = driver.findElements(By.className("thumb-image"));
		
		// 전체 페이지에서 확인한 컨텐츠의 수 만큼 반복해야함, 근데 페이지 로딩하면서 달라진다면?
		try {
			newContentList.get(idx).click();
			// 로딩 대기
			Thread.sleep(1000);
			// 현재 detail URL 확인
			crawlingDTO.setUrl(driver.getCurrentUrl());
			// 상세정보 탭으로 들어가기
			List<WebElement> buttonList = driver.findElements(By.className("button"));
			for (WebElement button : buttonList) {
				if (button.getAttribute("innerHTML").equals("상세정보")) button.click();
			}
			// 요약
			crawlingDTO.setSummary(driver.findElement(By.className("detail-dsc")).getAttribute("innerHTML").trim());
			// 상세정보 탭에서 table 을 훑으며 정보 가져오기
			WebElement detailTable = driver.findElement(By.className("detail-info-table"));
			// 헤더를 돌면서 정보가 있는 탭 확인
			List<WebElement> detailTableRow = detailTable.findElements(By.tagName("tr"));
			String actors = "";
			String creator = "";
			for (WebElement tableRow : detailTableRow) {
				if (tableRow.findElement(By.tagName("th")).getAttribute("innerHTML").equals("개요")) {
					// 개요에 있는 년도 가져오기
					crawlingDTO.setEnrollDt(Integer.parseInt(getEnrolledYear(tableRow.findElement(By.tagName("td")).getAttribute("innerHTML"))));
				}
				else if (tableRow.findElement(By.tagName("th")).getAttribute("innerHTML").equals("출연")) {
					List<WebElement> actorList = tableRow.findElements(By.className("genre"));
					for (int j = 0; j < actorList.size(); j++) {
						if (j > 3) break;
						actors += actorList.get(j).getAttribute("innerHTML").replaceAll("\\s+", "").trim() + ",";
					}
				}
				else if (tableRow.findElement(By.tagName("th")).getAttribute("innerHTML").equals("감독")) {
					creator += tableRow.findElement(By.className("genre")).getAttribute("innerHTML").replaceAll("\\s+", " ").trim();
				}
			}
			// actor가 있다면, 맨 뒤에 , 빼고 다시 저장
			if (actors.length() > 0) {
				actors = actors.substring(0, actors.length()-1);
			}
			crawlingDTO.setActors(actors);
			crawlingDTO.setCreator(creator);
			System.out.println(crawlingDTO);
		} catch (Exception e) {
			System.out.println("content list 페이지가 달라졌습니다. 다시 crawling이 필요합니다.");
		}
		// 새창 닫기
		driver.close();
		// 메인창 핸들로 전환
		driver.switchTo().window(mainHandle);
		return crawlingDTO;
	}
	
	// source tag 에서 img의 url을 가져오는 method
    private String getImageUrlByDensity(String srcset) {
        String[] images = srcset.split(",");
        for (String image : images) {
            if (image.contains("1.7x")) {
                String targetSource = image.trim();
                int start = targetSource.indexOf("https://");
                int end = targetSource.indexOf(".webp") + 5;
                return targetSource.substring(start, end);
            }
        }
        return null;
    }
    //@@@@@@@@@@@ 통합가능 !! @@@@@@@@@@@@@@
    // 개요 탭에서 연도 단위가 있으면 가져오고, 없으면 9999 반환
    private String getEnrolledYear(String text) {
        String regex = "\\b\\d{4}\\b";
        Pattern pattern = Pattern.compile(regex);
        Matcher matcher = pattern.matcher(text);

        if (matcher.find()) return matcher.group();
        else return "9999";
    }		
	
	// ==================================== 
	// ===== 웨이브 크롤링 메서드 End ===== 
	// ====================================
    
    // ==================================== 
  	// ===== 식별자 관련 메서드 Start ===== 
  	// ====================================
    
    // 한글/영어/숫자로만 구성된 식별자 생성 (필요한 문자 발생시 추가가능)
 	private String genKorAlphaNumStr(String str) {
 		
 		String remainElement = "^가-힣a-zA-Z0-9";
    	remainElement += "Ω";
        return str.replaceAll("["+ remainElement +"]", "");
        
 	}
    
 	// 로마숫자를 일반숫자로 변경하는 메서드
    private String convertRomanToNumber(String input) {
    	
    	String[] romanList = {"Ⅰ", "Ⅱ" ,"Ⅲ" , "Ⅳ", "Ⅴ", "Ⅵ", "Ⅶ", "Ⅷ", "Ⅸ", "Ⅹ"};
    	
    	for (int i = 0; i < romanList.length; i++) {
    		input = input.replaceAll(romanList[i], "" + (i + 1));
        }
    	
    	return input;
    	
    }

    // Creator,Actors KeyList 생성 메서드, ","로 구분된 감독, 출연 List<String>으로 반환 
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
 		String title = genKorAlphaNumStr(convertRomanToNumber(crawlingDTO.getTitle()));
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
    
    // ==================================== 
 	// ====== 식별자 관련 메서드 End ====== 
 	// ====================================
 	
 	// ==================================== 
   	// ==== 중복검사 관련 메서드 Start ==== 
   	// ====================================
 	
 	// 크롤링한 데이터리스트 List<CrawlingDTO>의 작품 중복검사 후 DB로 넘기기
	public void addContents(List<CrawlingDTO> crawlingDTOList) {
		int contentCnt = 0;
		int insertCnt = 0;
		int duplCnt = 0;
		
		for(CrawlingDTO crawlingDTO : crawlingDTOList) {
			contentCnt++;
//			System.out.println(contentCnt++ + " " + crawlingDTO.toString());
			
// 			중복검사 플로우 start (C = content, G = genre , D= Detail, K=contentKey)
			boolean isInsertContent = false;
			boolean isInsertGenre = false;
			boolean isInsertDetail = false;
			boolean isInsertContentKey = false;
			boolean isUpdateInfo = false;
			boolean isUpdateImgUrl = false;
			
			Set<String> contentKeyList = null;
			Set<String> updateKeyList = null;
			// img_url로 T:detail_link 검색
			ContentLinkDTO contentLinkDTO = crawlingDAO.selectOneContentLink(crawlingDTO.getImgUrl());
			if (contentLinkDTO != null) { // if (같다) 내 ott와 일치하는 작품이 있다!
//				String titleDB = crawlingDAO.selectOneTitle(contentLinkDTO.getContentId());
//				System.out.println("장르비교");
				crawlingDTO.setContentId(contentLinkDTO.getContentId());
				isInsertGenre = true; // G만 비교 후 G => UPDATE
//				if (titleDB.equals(crawlingDTO.getTitle())) { // 제목 비교, 같은 작품
//					System.out.println("장르비교");
//					crawlingDTO.setContentId(contentLinkDTO.getContentId());
//					isInsertGenre = true; // G만 비교 후 G => UPDATE
//				}
//				else { // 다른 작품
//					isInsertContent = true;
//					isInsertGenre = true;
//					isInsertDetail = true;
//					isInsertContentKey = true;
//				}
			}
			else { //imgUrl 다르다 => 나머지 2개의 ott를 검사해야함 => 식별자가 필요!
				contentKeyList = genContentKeyList(crawlingDTO);
//				System.out.println("contentKeyList : " + contentKeyList);
				// title -> title_key -> T:content_key 검색 -> contentId 확인
				String title_key = genKorAlphaNumStr(convertRomanToNumber(crawlingDTO.getTitle()));
				List<Long> contentIdList = crawlingDAO.selectListContentId(title_key);
				if (contentIdList.size() != 0) {
					for ( long contentId : contentIdList) { // contentId가 있다 contentId로 T:content -> contentType 비교
						String contentType = crawlingDAO.selectOneContentType(contentId);
						if (contentType.equals(crawlingDTO.getContentType())) { // 제목과 타입이 같다
							List<String> keyList_DB = crawlingDAO.selectListContentKey(contentId);
							updateKeyList = contentKeyChecker(keyList_DB, contentKeyList); // 식별자 비교
							if(updateKeyList != null) { // 식별자 n개 이상 중복 -> 동일 작품 => G, D, K => UPDATE
								crawlingDTO.setContentId(contentId);
								isInsertContent = true;// DB의 content에 누락 정보가 있고 업데이트 할 정보가 있다면 업데이트 진행
								isUpdateInfo = true;
								isInsertGenre = true;
								isInsertDetail = true;
								isInsertContentKey = true;
								// 같은 플랫폼의 같은 작품의 imgUrl 이 변경된경우
								Long linkId = crawlingDAO.selectLinkId(crawlingDTO);
								if(linkId != null) {
									crawlingDTO.setLinkId(linkId);
									isUpdateImgUrl = true;
								}
							}
							else { // 다른 작품 => C, G, D, K => INSERT
								isInsertContent = true;
								isInsertGenre = true;
								isInsertDetail = true;
								isInsertContentKey = true;
							}
						}
						else { // 제목만 같고 타입이 다르다 => 다른 작품 => C, G, D, K => INSERT
							isInsertContent = true;
							isInsertGenre = true;
							isInsertDetail = true;
							isInsertContentKey = true;
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
			
//			System.out.println("isInsertContent    : " + isInsertContent);
//			System.out.println("isInsertGenre      : " + isInsertGenre);
//			System.out.println("isInsertDetail     : " + isInsertDetail);
//			System.out.println("isInsertContentKey : " + isInsertContentKey);
			// 데이터 입력단
			if (isInsertContent) {
				insertCnt++;// insert 개수 확인용
//				System.out.println(contentCnt + " " + crawlingDTO.toString());
				if (isUpdateInfo) { // 누락 정보업데이트
					long contentId = crawlingDTO.getContentId();
					ContentDTO contentDTO = crawlingDAO.selectOneContent(crawlingDTO.getContentId());
					if (contentDTO.getCreator().isEmpty() && !crawlingDTO.getCreator().isEmpty()) {
						crawlingDAO.updateCreator(crawlingDTO);
					}
					if (contentDTO.getActors().isEmpty() && !crawlingDTO.getActors().isEmpty()) {
						crawlingDAO.updateActors(crawlingDTO);
					}
					if (contentDTO.getSummary().isEmpty() && !crawlingDTO.getSummary().isEmpty()) {
						crawlingDAO.updateSummary(crawlingDTO);
					}
					if (contentDTO.getEnrollDt() == 9999 && crawlingDTO.getEnrollDt() != 9999) {
						crawlingDAO.updateEnrollDt(crawlingDTO);
					}
				}
				else crawlingDAO.insertContent(crawlingDTO);
				
			}
			else {
				//test확인용 
				duplCnt++;
//				System.out.println("중복컨텐츠 : " + duplCnt);
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
					crawlingDTO.setExistYn("Y");
					crawlingDAO.insertContentLink(crawlingDTO);
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
			if (isUpdateImgUrl) {
				System.out.println("이미지 URL 업데이트");
				crawlingDAO.updateImgUrl(crawlingDTO);
			}
			
		}
		System.out.println("INSERT CONTENTS COUNT     = " + insertCnt);	
		System.out.println("DUPLICATED CONTENTS COUNT = " + duplCnt);	
	}
	
	// 식별자 key 확인 중복 checkDupl N개 이상이면 중복된 작품으로 처리
	private Set<String> contentKeyChecker(List<String> keyList_DB, Set<String> contentKeyList) {
	    
		int checkDupl = 3; // 중복 개수 확인 변수  
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
 	
 	// ==================================== 
  	// ===== 중복검사 관련 메서드 End ===== 
  	// ====================================
	
 	// ==================================== 
  	// ===== 스크롤 관련 메서드 Start ===== 
  	// ====================================
	
	@Override
	public List<CrawlingDTO> getMoreContents(int contentId) {
		
		return crawlingDAO.selectListScrollContent(contentId);
	}
	
 	// ==================================== 
  	// ====== 스크롤 관련 메서드 End ====== 
  	// ====================================

}
