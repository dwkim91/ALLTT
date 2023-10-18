<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<script>
	var memberSession = '${sessionScope.memberId}';
</script>
    <!-- Css Styles -->
    <link rel="stylesheet" href="${contextPath}/resources/bootstrap/css/all-bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${contextPath}/resources/bootstrap/css/all-font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${contextPath}/resources/bootstrap/css/all-elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="${contextPath}/resources/bootstrap/css/all-plyr.css" type="text/css">
    <link rel="stylesheet" href="${contextPath}/resources/bootstrap/css/all-nice-select.css" type="text/css">
    <link rel="stylesheet" href="${contextPath}/resources/bootstrap/css/all-owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${contextPath}/resources/bootstrap/css/all-slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="${contextPath}/resources/bootstrap/css/all-style.css" type="text/css">
    <link rel="stylesheet" href="${contextPath}/resources/bootstrap/css/all-normalize.css" type="text/css">
    <link rel="stylesheet" href="${contextPath}/resources/bootstrap/css/all-swiper.min.css" type="text/css">
    <link rel="stylesheet" href="${contextPath}/resources/bootstrap/css/all-c958e41d94d69c7e.css" type="text/css">
    <link rel="stylesheet" href="${contextPath}/resources/bootstrap/css/all-custom.css" type="text/css">
    <link rel="stylesheet" href="${contextPath}/resources/bootstrap/css/header-custom.css" type="text/css">
</head>
<body>
	<div id="__next">
		<header class="wrap_padding css-vfh4pc e10hkk351">
			<a href="/main">
				<h1 class="css-116irpw e10hkk352">홈</h1>
			</a>
			<a href="/member/wish">
				<div class="live">
					<span>찜 컨텐츠</span>
				</div>
			</a>
			<a href="/series">
				<div class="series">TV프로그램</div>
			</a>
			<a href="/movie">
				<div class="movie">영화</div>
			</a>
			<a href="/community">
				<div class="paramount">커뮤니티</div>
			</a>
			<aside class="css-13co1xy e10hkk350">
				<button type="button" id="searchButton" onclick="searchBtn()" class="css-xyumn e10hkk356" style="background-image:url(${contextPath}/resources/bootstrap/img/icon_search.svg);">찾기</button>
				<div class="menu_my">
					<div class="profile_img css-8nwm4w e10hkk353">
						<picture class="loaded css-ovhph3 euf32k20">
							<c:choose>
								<c:when test='${sessionScope.memberId != null}'>
									<img class="loaded css-1doy9ip euf32k22" src="">
								</c:when>
								<c:otherwise>
									<a href="${contextPath}/login"><img class="loaded css-1doy9ip euf32k22" src="${contextPath}/resources/bootstrap/img/alltt_logo_white_background_100.png"></a>
								</c:otherwise>
							</c:choose>
						</picture>
					</div>
				</div>
				<c:if test='${sessionScope.memberId != null}'>
					<div class="menu_my_content wrap_margin" 
					style="background: #212121;">
						<div class="profile">
							<div class="profile_img css-vvktly e10hkk353">
								<picture class="loaded css-ovhph3 euf32k20">
									<img class="loaded css-1doy9ip euf32k22" src="">
								</picture>
							</div>
							<div class="profile_info">
								<c:if test="${sessionScope.managerYn == 'Y'}">
									<button class="manager_tag" id="myButton" disabled="true">manager</button>
								</c:if>
								<p class="profile_info_name">닉네임 입력</p>
							</div>
						</div>
						<hr>
						<ul class="menu_my_btn_wrap">
							<li><a class="btn_my" href="${contextPath}/member/mypage" style="color: #f0a9a9;">마이페이지</a></li>
							<c:if test="${sessionScope.managerYn == 'Y'}">
								<li><a href="/support/inquiryList/all" style="color: #f0a9a9;">고객문의관리</a></li>
							</c:if>
							<li><a href="/support/inquiry" style="color: #f0a9a9;">고객센터</a></li>
							<li><a class="btn_logout" href="/member/logout" style="color: #f0a9a9;">로그아웃</a></li>
						</ul>
					</div>
				</c:if>
			</aside>
		</header>
		<script src="${contextPath}/resources/bootstrap/js/header-profile.js"></script>
</body>
</html>