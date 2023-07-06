<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<script>
	function getMember() {
		// AJAX 요청을 통해 member 정보를 가져오는 코드
		$.ajax({
			url: '${contextPath}/member/memberInfo', 
			method: 'GET',
			success: function(data) {
				var member = data; // 받아온 data 정보를 member 변수에 할당
				setMemberInfo(member); // member의 값을 설정하는 함수 호출
			},
			error: function() {
				console.log('Failed to fetch member information.');
			}
		});
	}
	
	function setMemberInfo(member) {
		// 닉네임 요소 선택
		var nicknameElement = document.querySelector('.profile_info_name');
		// text 값 입력
		nicknameElement.innerText = member.nickName;
		// 이미지 요소 선택
		var firstImgElement = document.querySelector('.menu_my .loaded.css-1doy9ip.euf32k22');
		// src 값 변경
		firstImgElement.setAttribute('src', member.thumbnailImg);
		// 이미지 요소 선택
		var secondImgElement = document.querySelector('.menu_my_content.wrap_margin .loaded.css-1doy9ip.euf32k22');
		// src 값 변경
		secondImgElement.setAttribute('src', member.thumbnailImg);
	}
</script>
    <!-- Css Styles -->
    <link rel="stylesheet" href="${contextPath}/resources/bootstrap/css/bootstrap.min.css" type="text/css">
    <link rel="stylesheet" href="${contextPath}/resources/bootstrap/css/font-awesome.min.css" type="text/css">
    <link rel="stylesheet" href="${contextPath}/resources/bootstrap/css/elegant-icons.css" type="text/css">
    <link rel="stylesheet" href="${contextPath}/resources/bootstrap/css/plyr.css" type="text/css">
    <link rel="stylesheet" href="${contextPath}/resources/bootstrap/css/nice-select.css" type="text/css">
    <link rel="stylesheet" href="${contextPath}/resources/bootstrap/css/owl.carousel.min.css" type="text/css">
    <link rel="stylesheet" href="${contextPath}/resources/bootstrap/css/slicknav.min.css" type="text/css">
    <link rel="stylesheet" href="${contextPath}/resources/bootstrap/css/style.css" type="text/css">
    <link rel="stylesheet" href="${contextPath}/resources/bootstrap/css/scss/_app.scss" type="text/css">
    <link rel="stylesheet" href="${contextPath}/resources/bootstrap/css/scss/app.scss" type="text/css">
    <link rel="stylesheet" href="${contextPath}/resources/bootstrap/css/scss/common.scss" type="text/css">
    <link rel="stylesheet" href="${contextPath}/resources/bootstrap/css/scss/mixin.scss" type="text/css">
    <link rel="stylesheet" href="${contextPath}/resources/bootstrap/css/scss/normalize.css" type="text/css">
    <link rel="stylesheet" href="${contextPath}/resources/bootstrap/css/scss/player.scss" type="text/css">
    <link rel="stylesheet" href="${contextPath}/resources/bootstrap/css/scss/reset.scss" type="text/css">
    <link rel="stylesheet" href="${contextPath}/resources/bootstrap/css/scss/style.scss" type="text/css">
    <link rel="stylesheet" href="${contextPath}/resources/bootstrap/css/scss/swiper.min.css" type="text/css">
    <link rel="stylesheet" href="${contextPath}/resources/bootstrap/css/scss/c958e41d94d69c7e.css" type="text/css">
    <link rel="stylesheet" href="${contextPath}/resources/bootstrap/css/scss/custom.css" type="text/css">

</head>
<body>
	<c:if test='${sessionScope.memberId != null}'>
		<script>
			$(document).ready(function() {
                 getMember();
            });
		</script>
	</c:if>
	<div id="__next">
		<header class="wrap_padding css-vfh4pc e10hkk351">
			<a href="/main">
				<h1 class="css-116irpw e10hkk352">홈</h1>
			</a>
			<a href="/wish">
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
				<button type="button" class="css-xyumn e10hkk356" style="background-image:url(${contextPath}/resources/bootstrap/img/icon_search.svg);">찾기</button>
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
					<div class="menu_my_content wrap_margin">
						<div class="profile">
							<div class="profile_img css-vvktly e10hkk353">
								<picture class="loaded css-ovhph3 euf32k20">
									<img class="loaded css-1doy9ip euf32k22" src="">
								</picture>
							</div>
							<div class="profile_info">
								<p class="profile_info_name">닉네임 입력</p>
								<button type="button" class="profile_info_change">
									<span>프로필 변경</span>
								</button>
							</div>
						</div>
						<hr>
						<ul class="menu_my_btn_wrap">
							<li><a class="btn_my" href="${contextPath}/member/mypage">마이페이지</a></li>
							<li><a href="/help">고객센터</a></li>
							<li><a class="btn_logout" href="/member/logout">로그아웃</a></li>
						</ul>
					</div>
				</c:if>
			</aside>
		</header>

</body>
</html>