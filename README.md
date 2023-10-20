# ALLOTT 프로젝트

## 요약

### 개요
* ALLOTT 프로젝트는 OTT(over-the-top)이용에 필요한 다양한 기능의 솔루션 제공함.
### 프로젝트 인원
* 백엔드 3명
### 사용 대상
* 여러 OTT 서비스를 이용하고 최소한의 구독으로 구독료를 줄이고 싶은 사용자
### 문제 의식
* 2020년 이후 OTT 서비스 이용률이 크게 증가하였으며, 다양한 플랫폼 사용으로 번거로움이 생기자, OTT 서비스 통합검색 시스템을 개발하여 사용자들이 한 곳에서 원하는 컨텐츠를 찾고 관리하며 최소한의 플랫폼으로 이용할 수 있는 솔루션을 제공하고자 했습니다.


## 배포환경
* AWS EC2 Linux
* AWS RDS
* AWS S3
* AWS Route 53

## 사용 기술
* Java 11.0.15
* HTML5
* CSS
* JavaScript
* jQuery 3.3.1
* MySQL 8.0.32
* Spring Framework 5.0.2
* Spring Security 5.2.0
* MyBatis 2.0.3
* Apache Tomcat 9.0.31
* GitHub & SourceTree

## ERD

## 주요기능
* Crawling 
  - Netflix, Tving, Wavve crawling 
  - batch를 통한 자동화 crawling 구현 
  - 작품의 image를 AWS S3로 저장

* Main page 
  - 컨텐츠 검색 
  - 컨텐츠별 디테일 페이지 
  - 원하는 작품에 찜 기능 
  - movie, series 별 구분 
  - platform, 장르별 비동기 조회

* Member 
  - NAVER, KAKAO OAuth를 사용한 가입, 탈퇴, 로그인 
  - myPage에서 닉네임 및 프로필 사진 변경 기능 
  - platform 구독 정보 등록 
  - 찜한 작품 확인 및 조회 
  - 작성한 게시글 & 댓글 조회

* Community 
  - 게시글의 Create, Read, Update, Delete 
  - 게시글과 작품 간의 연동 
  - 게시글 전체 검색 및 추천 기능

* WishList 
  - 구독 정보 or 플랫폼별 or 구독비를 바탕으로 가장 효율적인 구독 정보 추천

* Support 
  - user : 사용자 문의사항 작성 및 전송 
  - admin
    + 사용자 문의사항 처리 게시판
    + crawling 중 발생되는 누락 이미지 확인 및 업데이트 기능





