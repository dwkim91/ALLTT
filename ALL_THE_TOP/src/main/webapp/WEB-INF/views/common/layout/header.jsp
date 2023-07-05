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
				<button type="button" class="css-xyumn e10hkk356">찾기</button>
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