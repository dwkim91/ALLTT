<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<script src="${contextPath}/resources/bootstrap/js/main-search.js" type="module"></script>
<link rel="stylesheet" href="${contextPath}/resources/bootstrap/css/main-custom.css" type="text/css">
</head>
<body>

	<main class="mainPage">
		<div class="preBlock">
		</div>
		<div class="mainBlock">
			<div class="mp1">
				<p class="title1">ALL about OTT</p>
			</div>
			<div class="mp2">
				<h1 class="title2">작품을 검색해보세요</h1>
			</div>
		</div>
		<div class="preBlock">
		</div>
		<div class="searchContentBlock">
			<div class="searchBlock">
				<div class="searchSpace">
					<div class="searchIcon"><svg width="20" height="22" fill="none" xmlns="http://www.w3.org/2000/svg"><circle cx="8.433" cy="8.433" r="7.433" stroke="#AEB4BF" stroke-width="2"></circle><path stroke="#AEB4BF" stroke-width="2.5" stroke-linecap="round" d="m13.226 14.667 5.565 5.565"></path></svg>
						<div>
							<div width="12" class="kkk"></div>
						</div>
					</div>
					<input type="text" placeholder="작품명으로 검색해보세요." class="searchInput" value="">
					<div class="searchCancel">
						<svg viewBox="0 0 22 22" fill="none" xmlns="http://www.w3.org/2000/svg" width="24" height="24"><path d="M11 .275C5.096.275.297 5.063.297 10.978A10.699 10.699 0 0 0 11 21.682a10.699 10.699 0 0 0 10.703-10.704C21.703 5.063 16.904.275 11 .275ZM15.4 14.228a.817.817 0 0 1 0 1.149.803.803 0 0 1-.575.238.803.803 0 0 1-.574-.238L11 12.127l-3.25 3.25a.804.804 0 0 1-.574.238.803.803 0 0 1-.574-.238.817.817 0 0 1 0-1.149l3.25-3.25-3.25-3.25a.817.817 0 0 1 0-1.148.817.817 0 0 1 1.148-.01L11 9.82l3.25-3.25a.817.817 0 0 1 1.149 0 .817.817 0 0 1 0 1.147l-3.25 3.25 3.25 3.261Z" fill="#AEB4BF"></path></svg>
					</div>
				</div>
			</div>
			<div class="preBlock">
			</div>
			<div class="introBlock" style="display: block;">
				<div class="preBlock">
				</div>
				<div class="imgBlock">
					<div class="logBox">
						<img class="ottImage" alt="넷플릭스 로고" src="${contextPath}/resources/bootstrap/img/icon_netflix.png">
					</div>
					<div class="logBox">
						<img class="ottImage" alt="티빙 로고" src="${contextPath}/resources/bootstrap/img/icon_tving.png">
					</div>
					<div class="logBox">
						<img class="ottImage" alt="웨이브 로고" src="${contextPath}/resources/bootstrap/img/icon_wavve.png">
					</div>
				</div>
				<div class="preBlock">
				</div>
				<div class="introMsg">
					넷플릭스, 티빙, 웨이브 등…<br>
					매달 나가는 구독료 부담스럽다면?<br>
					ALLTT의 <strong class="key">최적 구독료 제안 서비스</strong>를 확인해보세요!
				</div>
			</div>
			<ul class="searchResult">
			</ul>
		</div>
	</main>
	
</body>
</html>