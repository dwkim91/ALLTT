CREATE DATABASE ALLTT_MS_DB;
		
USE ALLTT_MS_DB;		

-- 어느 곳과도 연결되지 않은 테이블 부터 생성 
CREATE TABLE OTT_PLATFORM(					
	PLATFORM_ID		INT				PRIMARY KEY		AUTO_INCREMENT,
	PLATFORM_NM		VARCHAR	(50)	NOT NULL
);

CREATE TABLE GENRE_LIST(					
	GENRE_ID		INT				PRIMARY KEY		AUTO_INCREMENT,
	GENRE_NM		VARCHAR	(100)	NOT NULL	
);

CREATE TABLE GENRE_LINK (
	LINK_ID			INT				PRIMARY KEY		AUTO_INCREMENT,
    PLATFORM_ID		INT				NOT NULL,
    CONTENT_TYPE	VARCHAR (20)	NOT NULL,
    GENRE_ID		INT				NOT NULL,
    URL				VARCHAR (1000)	NOT	NULL,
    FOREIGN KEY		(PLATFORM_ID)	REFERENCES	OTT_PLATFORM (PLATFORM_ID) ON DELETE CASCADE,
    FOREIGN KEY		(GENRE_ID)	REFERENCES	GENRE_LIST (GENRE_ID) ON DELETE CASCADE
);

-- 요금제 테이블, 그럴일은 없겠지만, OTT 가 삭제된다면 연계되어서 삭제 
CREATE TABLE PAY_PLAN(					
	PLAN_ID			INT				PRIMARY KEY		AUTO_INCREMENT,
	PLATFORM_ID		INT				NOT NULL	,
	PLAN_NM			VARCHAR	(50)	NOT NULL	,
	PLAN_COST		INT				NOT NULL	,
	PLAN_DESC		VARCHAR	(500)				,
  FOREIGN KEY 	( PLATFORM_ID ) REFERENCES OTT_PLATFORM ( PLATFORM_ID ) ON DELETE CASCADE
);

-- 미리 가져와서 비교하려는 의미로, NOT NULL 을 주석 처리
CREATE TABLE CONTENT (					
	CONTENT_ID		BIGINT			PRIMARY KEY		AUTO_INCREMENT,
	TITLE			VARCHAR	(100)	NOT NULL	,
    CREATOR		VARCHAR (100)	,-- NOT NULL 1명만 가져오기 -- 
	ACTORS			VARCHAR	(200)	,-- NOT NULL 4명만 가져오기 --
	SUMMARY			VARCHAR	(3000)	,-- NOT NULL --
	ENROLL_DT		INT				,-- NOT NULL 등록 연도만 4자리 가져오기 --
    CONTENT_TYPE	VARCHAR (20)	NOT NULL	 -- series / movie --
);

CREATE TABLE CONTENT_KEY (
	KEY_ID			BIGINT			PRIMARY KEY		AUTO_INCREMENT,	
	CONTENT_ID		BIGINT,
    CONTENT_KEY		VARCHAR (100),
    FOREIGN KEY		(CONTENT_ID)	REFERENCES CONTENT (CONTENT_ID) ON DELETE CASCADE
);
					
-- 링크의 경우, 컨텐츠가 삭제되거나, 플랫폼이 없어지면 삭제되도록
CREATE TABLE CONTENT_LINK(
	LINK_ID			BIGINT			PRIMARY KEY		AUTO_INCREMENT,
    CONTENT_ID		BIGINT			NOT NULL,
    PLATFORM_ID		INT				NOT NULL,
    IMG_URL			VARCHAR	(1000)	NOT NULL	,
    URL				VARCHAR (1000)	NOT	NULL,
	EXIST_YN	CHAR(1),
    FOREIGN KEY		(CONTENT_ID)	REFERENCES	CONTENT (CONTENT_ID) ON DELETE CASCADE,
    FOREIGN KEY		(PLATFORM_ID)	REFERENCES	OTT_PLATFORM (PLATFORM_ID) ON DELETE CASCADE
);

CREATE TABLE CONTENT_GENRE (
	CONTENT_GENRE_ID	BIGINT		PRIMARY KEY		AUTO_INCREMENT,
	CONTENT_ID		BIGINT			NOT NULL,
    GENRE_ID		INT				NOT NULL,
    FOREIGN KEY		(CONTENT_ID)	REFERENCES	CONTENT (CONTENT_ID) ON DELETE CASCADE,
    FOREIGN KEY		(GENRE_ID)		REFERENCES	GENRE_LIST (GENRE_ID)
);

-- 멤버 이후는, 로그인 API 에서 받아오는 데이터가 어떤지 정확하게 파악 후 생성하기
CREATE TABLE MEMBER(					
	MEMBER_ID		BIGINT			PRIMARY KEY		AUTO_INCREMENT,
	USER_ID			VARCHAR	(250)	NOT NULL	, -- API 에서 가져오는 고유값 --
	NICK_NAME		VARCHAR	(100)	NOT NULL	, -- 회원이 직접 입력하는 값 --
	SOCIAL_NM		VARCHAR	(100)	NOT NULL	, -- naver, kakao 구분 --
    THUMBNAIL_IMG	VARCHAR	(300)				, -- naver, kakao의 프로필 이미지 --
	POINTS			BIGINT			DEFAULT 0
);

-- 일단 남기고, 사용자가 탈퇴할때 삭제 여부를 정하는걸로 (익명의 작성자)
CREATE TABLE POST(					
	POST_ID			BIGINT			PRIMARY KEY		AUTO_INCREMENT,
	POST_TITLE			VARCHAR	(200)	NOT NULL	,
	MEMBER_ID		BIGINT				 		,
	PASSWD			VARCHAR	(200)	NOT NULL	,
	CONTENT			VARCHAR	(1000)	NOT NULL	,
	READ_CNT		BIGINT			DEFAULT 0	,
	ENROLL_DT		TIMESTAMP		DEFAULT NOW(),
	MODIFY_DT		TIMESTAMP		DEFAULT NOW(),
	CONTENT_ID		BIGINT		DEFAULT 0	,  	
    FOREIGN KEY 	(MEMBER_ID) 	REFERENCES MEMBER (MEMBER_ID) ON DELETE SET NULL
);

CREATE TABLE POST_RECMND(
	RECMND_ID 		BIGINT			PRIMARY KEY		AUTO_INCREMENT,
	MEMBER_ID		BIGINT						,
	POST_ID			BIGINT			NOT NULL,
	FOREIGN KEY		(MEMBER_ID)		REFERENCES MEMBER (MEMBER_ID) ON DELETE SET NULL,
	FOREIGN KEY		(POST_ID)		REFERENCES POST (POST_ID) ON DELETE CASCADE
);

-- 댓글은
CREATE TABLE REPLY(					
	REPLY_ID		BIGINT			PRIMARY KEY		AUTO_INCREMENT,
	POST_ID			BIGINT			NOT NULL	,
	MEMBER_ID		BIGINT						,
	CONTENT			VARCHAR	(1000)	NOT NULL	,
    ENROLL_DT		TIMESTAMP		DEFAULT NOW(),
	FOREIGN KEY 	( MEMBER_ID ) 	REFERENCES MEMBER ( MEMBER_ID ) ON DELETE SET NULL,
    FOREIGN KEY 	( POST_ID ) 	REFERENCES POST (POST_ID ) ON DELETE CASCADE
);

-- 구독 여부는 멤버가 탈퇴하면 삭제되도록
CREATE TABLE SUBSCRIPTION(	
	SUBS_ID 		BIGINT 			PRIMARY KEY		AUTO_INCREMENT,
	MEMBER_ID		BIGINT			NOT NULL	,
	PLATFORM_ID		INT				NOT NULL	,	
    FOREIGN KEY ( MEMBER_ID ) 		REFERENCES MEMBER ( MEMBER_ID ) ON DELETE CASCADE,
	FOREIGN KEY ( PLATFORM_ID )		REFERENCES OTT_PLATFORM ( PLATFORM_ID )
);				

-- 추천수 테이블, 컨텐츠가 없어지면 삭제되도록
CREATE TABLE RECMND(					
	RECMND_ID		BIGINT			PRIMARY KEY		AUTO_INCREMENT,
	MEMBER_ID		BIGINT						,
	CONTENT_ID		BIGINT			NOT NULL	,
	GOOD			BOOL			DEFAULT 0	,
	BAD				BOOL			DEFAULT 0	,
    FOREIGN KEY ( MEMBER_ID )		REFERENCES MEMBER ( MEMBER_ID) ON DELETE SET NULL,
    FOREIGN KEY ( CONTENT_ID )		REFERENCES CONTENT ( CONTENT_ID) ON DELETE CASCADE
);	

-- 장바구니, 멤버가 탈퇴하면 삭제 & 컨텐츠가 없어지면 삭제
CREATE TABLE WISH_LIST(					
	WISH_ID 		BIGINT			PRIMARY KEY		AUTO_INCREMENT,
	MEMBER_ID		BIGINT			NOT NULL	,
	CONTENT_ID		BIGINT			NOT NULL	,
    FOREIGN KEY ( CONTENT_ID )		REFERENCES CONTENT ( CONTENT_ID) ON DELETE CASCADE,
    FOREIGN KEY ( MEMBER_ID ) 		REFERENCES MEMBER ( MEMBER_ID) ON DELETE CASCADE
);

INSERT INTO OTT_PLATFORM(PLATFORM_NM) VALUES ('netflix'),('tving'),('wavve');

INSERT INTO GENRE_LIST(GENRE_NM) VALUES('미국'),('영국'),('아시아'),('예능'),('코미디'),('로맨스'),('드라마'),('액션'),('스릴러'),('SF&판타지'),
('호러'),('키즈'),('다큐멘터리'),('한국'),('해외'),('가족'),('애니메이션'),('범죄'),('음악'),('고전'),('단편'),('미스터리'),('모험'),('무협'),('공포'),
('교양'),('스포츠'),('공연'),('사극'),('디지털오리지널'),('시트콤'),('복수'),('수사'),('청춘'),('의학'),('법정'),('시사교양'),('해외시리즈');

INSERT INTO GENRE_LINK (CONTENT_TYPE,GENRE_ID,PLATFORM_ID,URL) VALUES
('series',14,1,'https://www.netflix.com/browse/genre/2638104?bc=83&so=yr'),('series',1,1,'https://www.netflix.com/browse/genre/2640196?bc=83&so=yr'),
('series',2,1,'https://www.netflix.com/browse/genre/2640197?bc=83&so=yr'),('series',3,1,'https://www.netflix.com/browse/genre/2690727?bc=83&so=yr'),
('series',4,1,'https://www.netflix.com/browse/genre/2070675?bc=83&so=yr'),('series',17,1,'https://www.netflix.com/browse/genre/6721?bc=83&so=yr'),
('series',5,1,'https://www.netflix.com/browse/genre/10375?bc=83&so=yr'),('series',6,1,'https://www.netflix.com/browse/genre/26156?bc=83&so=yr'),
('series',7,1,'https://www.netflix.com/browse/genre/11714?bc=83&so=yr'),('series',8,1,'https://www.netflix.com/browse/genre/10673?bc=83&so=yr'),
('series',9,1,'https://www.netflix.com/browse/genre/89811?bc=83&so=yr'),('series',10,1,'https://www.netflix.com/browse/genre/1372?bc=83&so=yr'),
('series',11,1,'https://www.netflix.com/browse/genre/83059?bc=83&so=yr'),('series',12,1,'https://www.netflix.com/browse/genre/27346?bc=83&so=yr'),
('series',34,1,'https://www.netflix.com/browse/genre/60951?bc=83&so=yr'),('series',13,1,'https://www.netflix.com/browse/genre/10105?bc=83&so=yr'),
('movie',14,1,'https://www.netflix.com/browse/genre/5685?bc=34399&so=yr'),('movie',1,1,'https://www.netflix.com/browse/genre/1159493?bc=34399&so=yr'),
('movie',15,1,'https://www.netflix.com/browse/genre/78367?bc=34399&so=yr'),('movie',16,1,'https://www.netflix.com/browse/genre/783?bc=34399&so=yr'),
('movie',17,1,'https://www.netflix.com/browse/genre/3063?bc=34399&so=yr'),('movie',8,1,'https://www.netflix.com/browse/genre/1365?bc=34399&so=yr'),
('movie',5,1,'https://www.netflix.com/browse/genre/6548?bc=34399&so=yr'),('movie',6,1,'https://www.netflix.com/browse/genre/8883?bc=34399&so=yr'),
('movie',9,1,'https://www.netflix.com/browse/genre/8933?bc=34399&so=yr'),('movie',11,1,'https://www.netflix.com/browse/genre/8711?bc=34399&so=yr'),
('movie',10,1,'https://www.netflix.com/browse/genre/3276033?bc=34399&so=yr'),('movie',10,1,'https://www.netflix.com/browse/genre/9744?bc=34399&so=yr'),
('movie',7,1,'https://www.netflix.com/browse/genre/5763?bc=34399&so=yr'),('movie',18,1,'https://www.netflix.com/browse/genre/5824?bc=34399&so=yr'),
('movie',13,1,'https://www.netflix.com/browse/genre/2243108?bc=34399&so=yr'),('movie',19,1,'https://www.netflix.com/browse/genre/52852?bc=34399&so=yr'),
('movie',20,1,'https://www.netflix.com/browse/genre/31574?bc=34399&so=yr'),('movie',21,1,'https://www.netflix.com/browse/genre/3345391?bc=34399&so=yr');

INSERT INTO GENRE_LINK (CONTENT_TYPE,GENRE_ID,PLATFORM_ID,URL) VALUES
('series',1,2,'https://www.tving.com/list/program?genre=PCPOS&slug=program&genreDetail=POS007'),('series',2,2,'https://www.tving.com/list/program?genre=PCPOS&slug=program&genreDetail=POS008'),
('series',3,2,'https://www.tving.com/list/program?genre=PCPOS&slug=program&genreDetail=POS005'),('series',3,2,'https://www.tving.com/list/program?genre=PCPOS&slug=program&genreDetail=POS006'),
('series',4,2,'https://www.tving.com/list/program?genre=PCU&slug=program'),('series',4,2,'https://www.tving.com/list/program?genre=PCV&slug=program'),
('series',4,2,'https://www.tving.com/list/program?genre=PCD&slug=program'),('series',5,2,'https://www.tving.com/list/program?genre=PCP&slug=program'),
('series',6,2,'https://www.tving.com/list/program?genre=PCO&slug=program'),('series',7,2,'https://www.tving.com/list/program?genre=PCA'),
('series',8,2,'https://www.tving.com/list/program?genre=PCY&slug=program'),('series',9,2,'https://www.tving.com/list/program?genre=PCQ&slug=program'),
('series',10,2,'https://www.tving.com/list/program?genre=PCR&slug=program'),('series',12,2,'https://www.tving.com/list/program?genre=PCC&slug=program'),
('series',13,2,'https://www.tving.com/list/program?genre=PCT&slug=program'),('series',15,2,'https://www.tving.com/list/program?genre=PCPOS&slug=program'),
('series',17,2,'https://www.tving.com/list/program?genre=PCAN&slug=program'),('series',19,2,'https://www.tving.com/list/program?genre=PCAC&slug=program'),
('series',22,2,'https://www.tving.com/list/program?genre=PCAA&slug=program'),('series',23,2,'https://www.tving.com/list/program?genre=PCX&slug=program'),
('series',24,2,'https://www.tving.com/list/program?genre=PCAB&slug=program'),('series',25,2,'https://www.tving.com/list/program?genre=PCAD&slug=program'),
('series',26,2,'https://www.tving.com/list/program?genre=PCK&slug=program'),('series',27,2,'https://www.tving.com/list/program?genre=PCF&slug=program'),
('series',28,2,'https://www.tving.com/list/program?genre=PCW&slug=program'),('series',29,2,'https://www.tving.com/list/program?genre=PCS&slug=program'),
('series',30,2,'https://www.tving.com/list/program?genre=PCWD&slug=program'),('movie',5,2,'https://www.tving.com/list/movie?slug=movie&genre=MG110'),
('movie',6,2,'https://www.tving.com/list/movie?slug=movie&genre=MG130'),('movie',7,2,'https://www.tving.com/list/movie?genre=MG100,MG230'),
('movie',8,2,'https://www.tving.com/list/movie?slug=movie&genre=MG120'),('movie',9,2,'https://www.tving.com/list/movie?slug=movie&genre=MG140'),
('movie',10,2,'https://www.tving.com/list/movie?slug=movie&genre=MG200'),('movie',10,2,'https://www.tving.com/list/movie?slug=movie&genre=MG210'),
('movie',13,2,'https://www.tving.com/list/movie?slug=movie&genre=MG250'),('movie',17,2,'https://www.tving.com/list/movie?slug=movie&genre=MG240'),
('movie',22,2,'https://www.tving.com/list/movie?slug=movie&genre=MG150'),('movie',23,2,'https://www.tving.com/list/movie?slug=movie&genre=MG170'),
('movie',25,2,'https://www.tving.com/list/movie?slug=movie&genre=MG160');

INSERT INTO GENRE_LINK (PLATFORM_ID, CONTENT_TYPE, GENRE_ID, URL)
	VALUES
	(3,'series',1,'https://www.wavve.com/list/VN92?adult=n&api=apis.wavve.com%252Fcf%252Fvod%252Fallprograms%253FWeekDay%253Dall%2526broadcastid%253D1852908%2526contenttype%253Dprogram%2526genre%253D09%2526limit%253D20%2526offset%253D0%2526orderby%253Dnew%2526subgenre%253Dvsgm09001%2526uicode%253DVN92%2526uiparent%253DFN0%2526uirank%253D0%2526uitype%253DVN92&orderby=new&page=1'),
	(3,'series',2,'https://www.wavve.com/list/VN94?adult=n&api=apis.wavve.com%252Fcf%252Fvod%252Fallprograms%253FWeekDay%253Dall%2526broadcastid%253D1854618%2526contenttype%253Dprogram%2526genre%253D09%2526limit%253D20%2526offset%253D0%2526orderby%253Dnew%2526subgenre%253Dvsgm09003%2526uicode%253DVN94%2526uiparent%253DFN0%2526uirank%253D0%2526uitype%253DVN94&orderby=new&page=1'),
	(3,'series',4,'https://www.wavve.com/list/VN3?adult=n&api=apis.wavve.com%252Fcf%252Fvod%252Fpopularcontents%253FWeekDay%253Dall%2526broadcastid%253DVN3%2526contenttype%253Dvod%2526genre%253D02%2526limit%253D20%2526offset%253D0%2526orderby%253Dnew%2526uicode%253DVN3%2526uiparent%253DGN57-VN3%2526uirank%253D4%2526uitype%253DVN3&came=BandViewGnbCode&orderby=new&page=1'),
	(3,'series',5,'https://www.wavve.com/list/VN4?adult=n&api=apis.wavve.com%252Fcf%252Fvod%252Fpopularcontents%253FWeekDay%253Dall%2526broadcastid%253DVN4%2526contenttype%253Dvod%2526genre%253D01%2526limit%253D20%2526offset%253D0%2526orderby%253Dnew%2526subgenre%253Dvsgm01003%2526uicode%253DVN4%2526uiparent%253DGN56-VN4%2526uirank%253D5%2526uitype%253DVN4&came=BandViewGnbCode&orderby=new&page=1&subgenre=vsgm01003'),
	(3,'series',6,'https://www.wavve.com/list/VN4?adult=n&api=apis.wavve.com%252Fcf%252Fvod%252Fpopularcontents%253FWeekDay%253Dall%2526broadcastid%253DVN4%2526contenttype%253Dvod%2526genre%253D01%2526limit%253D20%2526offset%253D0%2526orderby%253Dnew%2526subgenre%253Dvsgm01002%2526uicode%253DVN4%2526uiparent%253DGN56-VN4%2526uirank%253D5%2526uitype%253DVN4&came=BandViewGnbCode&orderby=new&page=1&subgenre=vsgm01002'),
	(3,'series',7,'https://www.wavve.com/list/VN4?adult=n&api=apis.wavve.com%252Fcf%252Fvod%252Fpopularcontents%253FWeekDay%253Dall%2526broadcastid%253D1739817%2526contenttype%253Dvod%2526genre%253D01%2526limit%253D20%2526offset%253D0%2526orderby%253Dnew%2526subgenre%253Dvsgm01015%2526uicode%253DVN4%2526uiparent%253DFN0%2526uirank%253D0%2526uitype%253DVN4&orderby=new&page=1&subgenre=vsgm01015'),
	(3,'series',9,'https://www.wavve.com/list/VN4?adult=n&api=apis.wavve.com%252Fcf%252Fvod%252Fpopularcontents%253FWeekDay%253Dall%2526broadcastid%253DVN4%2526contenttype%253Dvod%2526genre%253D01%2526limit%253D20%2526offset%253D0%2526orderby%253Dnew%2526subgenre%253Dvsgm01017%2526uicode%253DVN4%2526uiparent%253DGN56-VN4%2526uirank%253D5%2526uitype%253DVN4&came=BandViewGnbCode&orderby=new&page=1&subgenre=vsgm01017'),
	(3,'series',10,'https://www.wavve.com/list/VN4?adult=n&api=apis.wavve.com%252Fcf%252Fvod%252Fpopularcontents%253FWeekDay%253Dall%2526broadcastid%253DVN4%2526contenttype%253Dvod%2526genre%253D01%2526limit%253D20%2526offset%253D0%2526orderby%253Dnew%2526subgenre%253Dvsgm01008%2526uicode%253DVN4%2526uiparent%253DGN56-VN4%2526uirank%253D5%2526uitype%253DVN4&came=BandViewGnbCode&orderby=new&page=1&subgenre=vsgm01008'),
	(3,'series',12,'https://www.wavve.com/list/VN8?adult=n&api=apis.wavve.com%252Fcf%252Fvod%252Fpopularcontents%253FWeekDay%253Dall%2526broadcastid%253DVN8%2526contenttype%253Dvod%2526genre%253D06%2526limit%253D20%2526offset%253D0%2526orderby%253Dnew%2526uicode%253DVN8%2526uiparent%253DGN19-VN8%2526uirank%253D11%2526uitype%253DVN8&came=BandViewGnbCode&orderby=new&page=1'),
	(3,'series',13,'https://www.wavve.com/list/VN5?adult=n&api=apis.wavve.com%252Fcf%252Fvod%252Fpopularcontents%253FWeekDay%253Dall%2526broadcastid%253DVN5%2526contenttype%253Dvod%2526genre%253D03%2526limit%253D20%2526offset%253D0%2526orderby%253Dnew%2526subgenre%253Dvsgm03003%2526uicode%253DVN5%2526uiparent%253DGN20-VN5%2526uirank%253D1%2526uitype%253DVN5&came=BandViewGnbCode&orderby=new&page=1&subgenre=vsgm03003'),
	(3,'series',16,'https://www.wavve.com/list/VN4?adult=n&api=apis.wavve.com%252Fcf%252Fvod%252Fpopularcontents%253FWeekDay%253Dall%2526broadcastid%253DVN4%2526contenttype%253Dvod%2526genre%253D01%2526limit%253D20%2526offset%253D0%2526orderby%253Dnew%2526subgenre%253Dvsgm01005%2526uicode%253DVN4%2526uiparent%253DGN56-VN4%2526uirank%253D5%2526uitype%253DVN4&came=BandViewGnbCode&orderby=new&page=1&subgenre=vsgm01005'),
	(3,'series',17,'https://www.wavve.com/list/VN6?adult=n&api=apis.wavve.com%252Fcf%252Fvod%252Fpopularcontents%253FWeekDay%253Dall%2526broadcastid%253DVN6%2526contenttype%253Dvod%2526genre%253D08%2526limit%253D20%2526offset%253D0%2526orderby%253Dnew%2526uicode%253DVN6%2526uiparent%253DGN21-VN6%2526uirank%253D11%2526uitype%253DVN6&came=BandViewGnbCode&orderby=new&page=1'),
	(3,'series',18,'https://www.wavve.com/list/VN4?adult=n&api=apis.wavve.com%252Fcf%252Fvod%252Fpopularcontents%253FWeekDay%253Dall%2526broadcastid%253DVN4%2526contenttype%253Dvod%2526genre%253D01%2526limit%253D20%2526offset%253D0%2526orderby%253Dnew%2526subgenre%253Dvsgm01006%2526uicode%253DVN4%2526uiparent%253DGN56-VN4%2526uirank%253D5%2526uitype%253DVN4&came=BandViewGnbCode&orderby=new&page=1&subgenre=vsgm01006'),
	(3,'series',22,'https://www.wavve.com/list/VN4?adult=n&api=apis.wavve.com%252Fcf%252Fvod%252Fpopularcontents%253FWeekDay%253Dall%2526broadcastid%253DVN4%2526contenttype%253Dvod%2526genre%253D01%2526limit%253D20%2526offset%253D0%2526orderby%253Dnew%2526subgenre%253Dvsgm01017%2526uicode%253DVN4%2526uiparent%253DGN56-VN4%2526uirank%253D5%2526uitype%253DVN4&came=BandViewGnbCode&orderby=new&page=1&subgenre=vsgm01017'),
	(3,'series',26,'https://www.wavve.com/list/VN5?adult=n&api=apis.wavve.com%252Fcf%252Fvod%252Fpopularcontents%253FWeekDay%253Dall%2526broadcastid%253DVN5%2526contenttype%253Dvod%2526genre%253D03%2526limit%253D20%2526offset%253D0%2526orderby%253Dnew%2526subgenre%253Dall%2526uicode%253DVN5%2526uiparent%253DGN20-VN5%2526uirank%253D1%2526uitype%253DVN5&came=BandViewGnbCode&orderby=new&page=1&subgenre=all'),
	(3,'series',27,'https://www.wavve.com/list/VN17?api=apis.wavve.com%252Fcf%252Fvod%252Fnewcontents%253Forderby%253Dnew%2526contenttype%253Dprogram%2526genre%253D05%2526WeekDay%253Dall%2526uitype%253DVN17%2526uiparent%253DFN0%2526uirank%253D0%2526broadcastid%253D1638667%2526offset%253D0%2526limit%253D20%2526uicode%253DVN17'),
	(3,'series',29,'https://www.wavve.com/list/VN4?adult=n&api=apis.wavve.com%252Fcf%252Fvod%252Fpopularcontents%253FWeekDay%253Dall%2526broadcastid%253DVN4%2526contenttype%253Dvod%2526genre%253D01%2526limit%253D20%2526offset%253D0%2526orderby%253Dnew%2526subgenre%253Dvsgm01001%2526uicode%253DVN4%2526uiparent%253DGN56-VN4%2526uirank%253D5%2526uitype%253DVN4&came=BandViewGnbCode&orderby=new&page=1&subgenre=vsgm01001'),
	(3,'series',31,'https://www.wavve.com/list/VN4?adult=n&api=apis.wavve.com%252Fcf%252Fvod%252Fpopularcontents%253FWeekDay%253Dall%2526broadcastid%253DVN4%2526contenttype%253Dvod%2526genre%253D01%2526limit%253D20%2526offset%253D0%2526orderby%253Dnew%2526subgenre%253Dvsgm01003%2526uicode%253DVN4%2526uiparent%253DGN56-VN4%2526uirank%253D5%2526uitype%253DVN4&came=BandViewGnbCode&orderby=new&page=1&subgenre=vsgm01003'),
	(3,'series',33,'https://www.wavve.com/list/VN4?adult=n&api=apis.wavve.com%252Fcf%252Fvod%252Fpopularcontents%253FWeekDay%253Dall%2526broadcastid%253DVN4%2526contenttype%253Dvod%2526genre%253D01%2526limit%253D20%2526offset%253D0%2526orderby%253Dnew%2526subgenre%253Dvsgm01006%2526uicode%253DVN4%2526uiparent%253DGN56-VN4%2526uirank%253D5%2526uitype%253DVN4&came=BandViewGnbCode&orderby=new&page=1&subgenre=vsgm01006'),
	(3,'series',34,'https://www.wavve.com/list/VN4?adult=n&api=apis.wavve.com%252Fcf%252Fvod%252Fpopularcontents%253FWeekDay%253Dall%2526broadcastid%253DVN4%2526contenttype%253Dvod%2526genre%253D01%2526limit%253D20%2526offset%253D0%2526orderby%253Dnew%2526subgenre%253Dvsgm01007%2526uicode%253DVN4%2526uiparent%253DGN56-VN4%2526uirank%253D5%2526uitype%253DVN4&came=BandViewGnbCode&orderby=new&page=1&subgenre=vsgm01007'),
	(3,'movie',5,'https://www.wavve.com/list/MN159?adult=n&api=apis.wavve.com%252Fcf%252Fmovie%252Fcontents%253FWeekDay%253Dall%2526broadcastid%253DFN0_MN159_pc_none%2526contenttype%253Dmovie%2526genre%253Dmgm03%2526limit%253D20%2526mtype%253Dsvod%2526offset%253D0%2526orderby%253Drelease%2526price%253Dall%2526uicode%253DMN159%2526uiparent%253DFN0%2526uirank%253D0%2526uitype%253DMN159&orderby=release&page=1'),
	(3,'movie',6,'https://www.wavve.com/list/MN158?adult=n&api=apis.wavve.com%252Fcf%252Fmovie%252Fcontents%253FWeekDay%253Dall%2526broadcastid%253DFN0_MN158_pc_none%2526contenttype%253Dmovie%2526genre%253Dmgm02%2526limit%253D20%2526mtype%253Dsvod%2526offset%253D0%2526orderby%253Drelease%2526price%253Dall%2526uicode%253DMN158%2526uiparent%253DFN0%2526uirank%253D0%2526uitype%253DMN158&orderby=release&page=1'),
	(3,'movie',7,'https://www.wavve.com/list/MN157?adult=n&api=apis.wavve.com%252Fcf%252Fmovie%252Fcontents%253FWeekDay%253Dall%2526broadcastid%253DFN0_MN157_pc_none%2526contenttype%253Dmovie%2526genre%253Dmgm01%2526limit%253D20%2526mtype%253Dsvod%2526offset%253D0%2526orderby%253Drelease%2526price%253Dall%2526uicode%253DMN157%2526uiparent%253DFN0%2526uirank%253D0%2526uitype%253DMN157&orderby=release&page=1'),
	(3,'movie',8,'https://www.wavve.com/list/MN160?adult=n&api=apis.wavve.com%252Fcf%252Fmovie%252Fcontents%253FWeekDay%253Dall%2526broadcastid%253DFN0_MN160_pc_none%2526contenttype%253Dmovie%2526genre%253Dmgm04%2526limit%253D20%2526mtype%253Dsvod%2526offset%253D0%2526orderby%253Drelease%2526price%253Dall%2526uicode%253DMN160%2526uiparent%253DFN0%2526uirank%253D0%2526uitype%253DMN160&orderby=release&page=1'),
	(3,'movie',10,'https://www.wavve.com/list/MN161?adult=n&api=apis.wavve.com%252Fcf%252Fmovie%252Fcontents%253FWeekDay%253Dall%2526broadcastid%253DFN0_MN161_pc_none%2526contenttype%253Dmovie%2526genre%253Dmgm05%2526limit%253D20%2526mtype%253Dsvod%2526offset%253D0%2526orderby%253Drelease%2526price%253Dall%2526uicode%253DMN161%2526uiparent%253DFN0%2526uirank%253D0%2526uitype%253DMN161&orderby=release&page=1'),
	(3,'movie',13,'https://www.wavve.com/list/MN167?adult=n&api=apis.wavve.com%252Fcf%252Fmovie%252Fcontents%253FWeekDay%253Dall%2526broadcastid%253DFN0_MN167_pc_none%2526contenttype%253Dmovie%2526genre%253Dmgm11%2526limit%253D20%2526mtype%253Dsvod%2526offset%253D0%2526orderby%253Drelease%2526price%253Dall%2526uicode%253DMN167%2526uiparent%253DFN0%2526uirank%253D0%2526uitype%253DMN167&orderby=release&page=1'),
	(3,'movie',16,'https://www.wavve.com/list/MN173?adult=n&api=apis.wavve.com%252Fcf%252Fmovie%252Fcontents%253FWeekDay%253Dall%2526broadcastid%253DFN0_MN173_pc_none%2526contenttype%253Dmovie%2526genre%253Dmgm15%2526limit%253D20%2526mtype%253Dsvod%2526offset%253D0%2526orderby%253Drelease%2526price%253Dall%2526uicode%253DMN173%2526uiparent%253DFN0%2526uirank%253D0%2526uitype%253DMN173&orderby=release&page=1'),
	(3,'movie',17,'https://www.wavve.com/list/MN166?adult=n&api=apis.wavve.com%252Fcf%252Fmovie%252Fcontents%253FWeekDay%253Dall%2526broadcastid%253DFN0_MN166_pc_none%2526contenttype%253Dmovie%2526genre%253Dmgm10%2526limit%253D20%2526mtype%253Dsvod%2526offset%253D0%2526orderby%253Drelease%2526price%253Dall%2526uicode%253DMN166%2526uiparent%253DFN0%2526uirank%253D0%2526uitype%253DMN166&orderby=release&page=1'),
	(3,'movie',18,'https://www.wavve.com/list/MN163?adult=n&api=apis.wavve.com%252Fcf%252Fmovie%252Fcontents%253FWeekDay%253Dall%2526broadcastid%253DFN0_MN163_pc_none%2526contenttype%253Dmovie%2526genre%253Dmgm07%2526limit%253D20%2526mtype%253Dsvod%2526offset%253D0%2526orderby%253Drelease%2526price%253Dall%2526uicode%253DMN163%2526uiparent%253DFN0%2526uirank%253D0%2526uitype%253DMN163&orderby=release&page=1'),
	(3,'movie',19,'https://www.wavve.com/list/MN165?adult=n&api=apis.wavve.com%252Fcf%252Fmovie%252Fcontents%253FWeekDay%253Dall%2526broadcastid%253DFN0_MN165_pc_none%2526contenttype%253Dmovie%2526genre%253Dmgm09%2526limit%253D20%2526mtype%253Dsvod%2526offset%253D0%2526orderby%253Drelease%2526price%253Dall%2526uicode%253DMN165%2526uiparent%253DFN0%2526uirank%253D0%2526uitype%253DMN165&orderby=release&page=1'),
	(3,'movie',23,'https://www.wavve.com/list/MN162?adult=n&api=apis.wavve.com%252Fcf%252Fmovie%252Fcontents%253FWeekDay%253Dall%2526broadcastid%253DFN0_MN162_pc_none%2526contenttype%253Dmovie%2526genre%253Dmgm06%2526limit%253D20%2526mtype%253Dsvod%2526offset%253D0%2526orderby%253Drelease%2526price%253Dall%2526uicode%253DMN162%2526uiparent%253DFN0%2526uirank%253D0%2526uitype%253DMN162&orderby=release&page=1'),
	(3,'movie',25,'https://www.wavve.com/list/MN164?adult=n&api=apis.wavve.com%252Fcf%252Fmovie%252Fcontents%253FWeekDay%253Dall%2526broadcastid%253DFN0_MN164_pc_none%2526contenttype%253Dmovie%2526genre%253Dmgm08%2526limit%253D20%2526mtype%253Dsvod%2526offset%253D0%2526orderby%253Drelease%2526price%253Dall%2526uicode%253DMN164%2526uiparent%253DFN0%2526uirank%253D0%2526uitype%253DMN164&orderby=release&page=1');