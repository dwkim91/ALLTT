<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티</title>
<link rel="stylesheet" href="${contextPath}/resources/css/community.css" type="text/css">
<script src="${contextPath}/resources/jquery/jquery-3.6.1.min.js"></script>
<script>
$(function() {
	// 로그인한 멤버의 정보와 게시글 및 댓글 수를 보여주기 위해
	$(".user-name").text("${member.nickName}");
	$("#myPostCnt").text("${postCnt}");
	$("#myReplyCnt").text("${replyCnt}");

	$(".write-btn").click(function() {
		location.href="${contextPath}/community/write";
	});
	
});
</script>
<script>
	function getTimeDiff(timestamp) {
		  var currentTime = new Date();
		  var targetTime = new Date(timestamp).toISOString();;

		  var timeDiff = Math.floor((currentTime - targetTime) / 1000); // 시간 차이를 초 단위로 계산

		  if (timeDiff < 60) {
		    return timeDiff + '초 전';
		  } else if (timeDiff < 3600) {
		    var minutes = Math.floor(timeDiff / 60);
		    return minutes + '분 전';
		  } else {
		    var hours = Math.floor(timeDiff / 3600);
		    return hours + '시간 전';
		  }
	}

	// 좋아요 표시
	function likePostBtn(postId){
		  // 클릭된 버튼에만 클래스 변경을 적용하기 위해 id 값을 사용
		  	var btnId = "likeBtn" + postId;
			$("#" + btnId).toggleClass("active");
	}

</script>
</head>
<body>

	<main data-v-f04faaa6="" data-v-75f0040c="" id="contents"><section data-v-f04faaa6="" class="fixed-area"><header data-v-36d2ff30="" data-v-f04faaa6="" class="header-wrap left-title header-main">
		<h1 data-v-36d2ff30="" class="header-title beta"> 커뮤니티 </h1>
		<!---->
		<a data-v-f04faaa6="" href="/search" class="header-right-button search" id="searchButton" data-v-36d2ff30=""><img data-v-f04faaa6="" src="https://static.kinolights.com/icon/ic-search.svg" alt="검색"></a><button data-v-f04faaa6="" data-v-36d2ff30="" id="myCommunityButton" class="header-right-button my">
		내 활동 </button></header></section>
		<div data-v-f04faaa6="" class="content-area">
			<div data-v-f04faaa6="" class="grid-container mainContent">
				</section><section data-v-f04faaa6="" class="list-item list-area list-area--home">
				<div data-v-f04faaa6="" class="list-inner-wrap">
					<ul data-v-f04faaa6="" id="postList">
					<c:forEach var="post" items="${postList}">
						<li data-v-f04faaa6="" class="list-gap">
							<article data-v-b0785d82="" data-v-f04faaa6="" class="post-wrap">
								<a data-v-b0785d82="" href="${contextPath}/community/post?postId=${post.postId}" class="" id="postList-nIoYFokBkUHnIaLwUX4I">
						<header data-v-b0785d82="" class="post-info-wrap">
						<div data-v-b0785d82="" class="post-info-user-wrap">
							<span data-v-b0785d82="" class="user-nickname">${post.nickName}</span>
						</div>
						<div data-v-b0785d82="" class="post-info-date-wrap">
						<!-- 몇분 전, 몇 시간 전에 썼는지 표기하는거 -->
							<span data-v-b0785d82="" title="2023-07-02 19:13:59" class="post-date">${post.enrollDt}</span>
						</div>
						</header>
						<h2 data-v-b0785d82="" class="post-title">${post.postTitle}</h2>
						<p data-v-b0785d82="" class="post-body">${post.content}</p>
						<c:if test="${post.contentId != 0}">
							<div data-v-b0785d82="" class="content-list-wrap">
								<div data-v-b0785d82="" class="content-wrap">
									<svg data-v-b0785d82="" width="16" height="16" fill="none" xmlns="http://www.w3.org/2000/svg" class=""><path data-v-b0785d82="" d="M15.51 15.019h-3.675A8.006 8.006 0 0016 7.999C16 3.59 12.411 0 8 0S0 3.589 0 8c0 4.41 3.589 8 8 8h7.51a.49.49 0 100-.981zM.98 7.999A7.027 7.027 0 018 .982 7.027 7.027 0 0115.02 8 7.027 7.027 0 018 15.019a7.027 7.027 0 01-7.02-7.02z" fill="#3B4869"></path><path data-v-b0785d82="" fill-rule="evenodd" clip-rule="evenodd" d="M8 16A8 8 0 108 0a8 8 0 000 16zm2-12a2 2 0 11-4 0 2 2 0 014 0zm0 8a2 2 0 11-4 0 2 2 0 014 0zm-6-2a2 2 0 100-4 2 2 0 000 4zm10-2a2 2 0 11-4 0 2 2 0 014 0z" fill="#3B4869"></path></svg><span data-v-b0785d82="" class="content-title">${post.postTag}</span>
								</div>
							</div>
						</c:if>
						</a><footer data-v-b0785d82="" class="post-footer">
						<div data-v-b0785d82="" class="badge-wrap">
							<div data-v-de3ba2dc="" data-v-b0785d82="" class="badge-wrap textColorPrimary">
								<svg data-v-b0785d82="" data-v-de3ba2dc="" width="32" height="32" fill="none" xmlns="http://www.w3.org/2000/svg" viewbox="0 0 32 32" class="icon-color-navy06"><path data-v-b0785d82="" data-v-de3ba2dc="" fill-rule="evenodd" clip-rule="evenodd" d="M28.784 14.794c-4.01-5.263-8.372-7.93-12.97-7.789-3.711.103-6.82 1.995-9.019 3.884-2.2 1.89-3.507 3.793-3.615 3.952v.001c-.25.373-.238.855.028 1.214 4.06 5.47 8.388 8.277 12.88 8.277.159 0 .318-.006.473-.011h.001c3.682-.162 6.707-2.179 8.827-4.178 2.122-2 3.357-4 3.459-4.17.224-.372.2-.834-.064-1.18l-.133.093.133-.093zm-17.164.788c0-2.444 2.072-4.436 4.62-4.436 2.546 0 4.618 1.992 4.618 4.436 0 2.445-2.072 4.437-4.619 4.437-2.547 0-4.619-1.992-4.619-4.436z" fill="#98A4B7"></path></svg><span data-v-de3ba2dc="">${post.readCnt}</span>
							</div>
							<div data-v-de3ba2dc="" data-v-b0785d82="" class="badge-wrap textColorPrimary">
								<svg data-v-b0785d82="" data-v-de3ba2dc="" width="32" height="32" fill="none" xmlns="http://www.w3.org/2000/svg" viewbox="0 0 32 32" class="icon-color-navy06"><path data-v-b0785d82="" data-v-de3ba2dc="" fill-rule="evenodd" clip-rule="evenodd" d="M13 5a9 9 0 00-5.79 15.89c.342 2.296-.657 4.867-1.055 5.773a.207.207 0 00.22.286c3.867-.575 6.027-2.341 7.22-3.949H19a9 9 0 100-18h-6z" fill="#eee"></path></svg><span data-v-de3ba2dc="">${post.replyCnt}</span>
							</div>
						</div>
						<div data-v-b0785d82="" class="badge-wrap">
							<button data-v-de3ba2dc="" data-v-b0785d82="" id="likeBtn${post.postId}" onclick="likePostBtn('${post.postId}')" class="badge-wrap reactionButton button textColorPrimary">
								<div data-v-6a12716b="" data-v-b0785d82="" class="icon like" data-v-de3ba2dc="">
								</div>
								<span data-v-de3ba2dc="">${post.recmndCnt}</span></button>
						</div>
						</footer></article></li>
					</c:forEach>
						<li data-v-f04faaa6="" class="list-gap"><article data-v-b0785d82="" data-v-f04faaa6="" class="post-wrap"><a data-v-b0785d82="" href="#" class="" id="postList-nIoYFokBkUHnIaLwUX4I">
						<header data-v-b0785d82="" class="post-info-wrap">
						<div data-v-b0785d82="" class="post-info-user-wrap">
							<span data-v-b0785d82="" class="user-nickname">화가난_팀버튼_607135 - 아이디</span>
							<!---->
							<!---->
						</div>
						<div data-v-b0785d82="" class="post-info-date-wrap">
							<span data-v-b0785d82="" title="2023-07-02 19:13:59" class="post-date">4분 전 - 지금시간 - 게시글 등록시간</span>
						</div>
						</header>
						<h2 data-v-b0785d82="" class="post-title">영등포 타임스퀘어 바비 행사 - 게시글 제목</h2>
						<p data-v-b0785d82="" class="post-body">
							#영화 #바비 오늘 영화보러 영등포 cgv왔는데 타임스퀘어 1층에서 바비행사하네요 뭔가 싶어 알아보니 레드카펫 행사한다고 하네요 어마어마하네요 ㅂㄱㄹ님이 행사 사회자인데 핑크옷 입... - 게시글 내용 요약
						</p>
						<c:if test="${post.contentId != 0}">
							<div data-v-b0785d82="" class="content-list-wrap">
								<div data-v-b0785d82="" class="content-wrap">
									<svg data-v-b0785d82="" width="16" height="16" fill="none" xmlns="http://www.w3.org/2000/svg" class=""><path data-v-b0785d82="" d="M15.51 15.019h-3.675A8.006 8.006 0 0016 7.999C16 3.59 12.411 0 8 0S0 3.589 0 8c0 4.41 3.589 8 8 8h7.51a.49.49 0 100-.981zM.98 7.999A7.027 7.027 0 018 .982 7.027 7.027 0 0115.02 8 7.027 7.027 0 018 15.019a7.027 7.027 0 01-7.02-7.02z" fill="#3B4869"></path><path data-v-b0785d82="" fill-rule="evenodd" clip-rule="evenodd" d="M8 16A8 8 0 108 0a8 8 0 000 16zm2-12a2 2 0 11-4 0 2 2 0 014 0zm0 8a2 2 0 11-4 0 2 2 0 014 0zm-6-2a2 2 0 100-4 2 2 0 000 4zm10-2a2 2 0 11-4 0 2 2 0 014 0z" fill="#3B4869"></path></svg><span data-v-b0785d82="" class="content-title">바비 - 태그이름</span>
								</div>
							</div>
						</c:if>
						</a><footer data-v-b0785d82="" class="post-footer">
						<div data-v-b0785d82="" class="badge-wrap">
							<div data-v-de3ba2dc="" data-v-b0785d82="" class="badge-wrap textColorPrimary">
								<svg data-v-b0785d82="" data-v-de3ba2dc="" width="32" height="32" fill="none" xmlns="http://www.w3.org/2000/svg" viewbox="0 0 32 32" class="icon-color-navy06"><path data-v-b0785d82="" data-v-de3ba2dc="" fill-rule="evenodd" clip-rule="evenodd" d="M28.784 14.794c-4.01-5.263-8.372-7.93-12.97-7.789-3.711.103-6.82 1.995-9.019 3.884-2.2 1.89-3.507 3.793-3.615 3.952v.001c-.25.373-.238.855.028 1.214 4.06 5.47 8.388 8.277 12.88 8.277.159 0 .318-.006.473-.011h.001c3.682-.162 6.707-2.179 8.827-4.178 2.122-2 3.357-4 3.459-4.17.224-.372.2-.834-.064-1.18l-.133.093.133-.093zm-17.164.788c0-2.444 2.072-4.436 4.62-4.436 2.546 0 4.618 1.992 4.618 4.436 0 2.445-2.072 4.437-4.619 4.437-2.547 0-4.619-1.992-4.619-4.436z" fill="#98A4B7"></path></svg><span data-v-de3ba2dc="">6 - 조회수</span>
							</div>
							<div data-v-de3ba2dc="" data-v-b0785d82="" class="badge-wrap textColorPrimary">
								<svg data-v-b0785d82="" data-v-de3ba2dc="" width="32" height="32" fill="none" xmlns="http://www.w3.org/2000/svg" viewbox="0 0 32 32" class="icon-color-navy06"><path data-v-b0785d82="" data-v-de3ba2dc="" fill-rule="evenodd" clip-rule="evenodd" d="M13 5a9 9 0 00-5.79 15.89c.342 2.296-.657 4.867-1.055 5.773a.207.207 0 00.22.286c3.867-.575 6.027-2.341 7.22-3.949H19a9 9 0 100-18h-6z" fill="#eee"></path></svg><span data-v-de3ba2dc="">0 - 댓글수</span>
							</div>
						</div>
						<div data-v-b0785d82="" class="badge-wrap">
							<button data-v-de3ba2dc="" data-v-b0785d82="" class="badge-wrap reactionButton button textColorPrimary">
							<div data-v-6a12716b="" data-v-b0785d82="" class="icon like" data-v-de3ba2dc="">
							</div>
							<span data-v-de3ba2dc="">1 - 추천수</span></button>
						</div>
						</footer></article></li>
						<li data-v-f04faaa6="" class="list-gap"><article data-v-b0785d82="" data-v-f04faaa6="" class="post-wrap"><a data-v-b0785d82="" href="/community/post/m4oWFokBkUHnIaLw637v" class="" id="postList-m4oWFokBkUHnIaLw637v"><header data-v-b0785d82="" class="post-info-wrap">
						<div data-v-b0785d82="" class="post-info-user-wrap">
							<span data-v-b0785d82="" class="user-nickname">톰홀랜드</span>
							<!---->
							<!---->
						</div>
						<div data-v-b0785d82="" class="post-info-date-wrap">
							<span data-v-b0785d82="" title="2023-07-02 19:12:28" class="post-date">6분 전</span>
						</div>
						</header>
						<h2 data-v-b0785d82="" class="post-title">네이버나우에서 바비레카 생중계중 ㅠ</h2>
						<p data-v-b0785d82="" class="post-body">
							보는중인데부럽네요 ㅠㅠㅠㅠ하팬서비스너무조하요 ㅠㅜㅠㅠ #바비
						</p>
						<div data-v-b0785d82="" class="content-list-wrap">
							<div data-v-b0785d82="" class="content-wrap">
								<svg data-v-b0785d82="" width="16" height="16" fill="none" xmlns="http://www.w3.org/2000/svg" class=""><path data-v-b0785d82="" d="M15.51 15.019h-3.675A8.006 8.006 0 0016 7.999C16 3.59 12.411 0 8 0S0 3.589 0 8c0 4.41 3.589 8 8 8h7.51a.49.49 0 100-.981zM.98 7.999A7.027 7.027 0 018 .982 7.027 7.027 0 0115.02 8 7.027 7.027 0 018 15.019a7.027 7.027 0 01-7.02-7.02z" fill="#3B4869"></path><path data-v-b0785d82="" fill-rule="evenodd" clip-rule="evenodd" d="M8 16A8 8 0 108 0a8 8 0 000 16zm2-12a2 2 0 11-4 0 2 2 0 014 0zm0 8a2 2 0 11-4 0 2 2 0 014 0zm-6-2a2 2 0 100-4 2 2 0 000 4zm10-2a2 2 0 11-4 0 2 2 0 014 0z" fill="#3B4869"></path></svg><span data-v-b0785d82="" class="content-title">바비</span>
							</div>
							<!---->
						</div>
						</a><footer data-v-b0785d82="" class="post-footer">
						<div data-v-b0785d82="" class="badge-wrap">
							<div data-v-de3ba2dc="" data-v-b0785d82="" class="badge-wrap textColorPrimary">
								<svg data-v-b0785d82="" data-v-de3ba2dc="" width="32" height="32" fill="none" xmlns="http://www.w3.org/2000/svg" viewbox="0 0 32 32" class="icon-color-navy06"><path data-v-b0785d82="" data-v-de3ba2dc="" fill-rule="evenodd" clip-rule="evenodd" d="M28.784 14.794c-4.01-5.263-8.372-7.93-12.97-7.789-3.711.103-6.82 1.995-9.019 3.884-2.2 1.89-3.507 3.793-3.615 3.952v.001c-.25.373-.238.855.028 1.214 4.06 5.47 8.388 8.277 12.88 8.277.159 0 .318-.006.473-.011h.001c3.682-.162 6.707-2.179 8.827-4.178 2.122-2 3.357-4 3.459-4.17.224-.372.2-.834-.064-1.18l-.133.093.133-.093zm-17.164.788c0-2.444 2.072-4.436 4.62-4.436 2.546 0 4.618 1.992 4.618 4.436 0 2.445-2.072 4.437-4.619 4.437-2.547 0-4.619-1.992-4.619-4.436z" fill="#98A4B7"></path></svg><span data-v-de3ba2dc="">12</span>
							</div>
							<div data-v-de3ba2dc="" data-v-b0785d82="" class="badge-wrap textColorPrimary">
								<svg data-v-b0785d82="" data-v-de3ba2dc="" width="32" height="32" fill="none" xmlns="http://www.w3.org/2000/svg" viewbox="0 0 32 32" class="icon-color-navy06"><path data-v-b0785d82="" data-v-de3ba2dc="" fill-rule="evenodd" clip-rule="evenodd" d="M13 5a9 9 0 00-5.79 15.89c.342 2.296-.657 4.867-1.055 5.773a.207.207 0 00.22.286c3.867-.575 6.027-2.341 7.22-3.949H19a9 9 0 100-18h-6z" fill="#eee"></path></svg><span data-v-de3ba2dc="">2</span>
							</div>
						</div>
						<div data-v-b0785d82="" class="badge-wrap">
							<button data-v-de3ba2dc="" data-v-b0785d82="" class="badge-wrap reactionButton button textColorPrimary">
							<div data-v-6a12716b="" data-v-b0785d82="" class="icon like" data-v-de3ba2dc="">
							</div>
							<span data-v-de3ba2dc="">1</span></button>
						</div>
						</footer></article></li>
						<li data-v-f04faaa6="" class="list-gap"><article data-v-b0785d82="" data-v-f04faaa6="" class="post-wrap"><a data-v-b0785d82="" href="/community/post/lYoQFokBkUHnIaLwcH6v" class="" id="postList-lYoQFokBkUHnIaLwcH6v"><header data-v-b0785d82="" class="post-info-wrap">
						<div data-v-b0785d82="" class="post-info-user-wrap">
							<span data-v-b0785d82="" class="user-nickname">보문동꿀주먹</span>
							<!---->
							<!---->
						</div>
						<div data-v-b0785d82="" class="post-info-date-wrap">
							<span data-v-b0785d82="" title="2023-07-02 19:05:23" class="post-date">13분 전</span>
						</div>
						</header>
						<h2 data-v-b0785d82="" class="post-title">마지막 킷발 꼽기- 더 스파이 후기</h2>
						<p data-v-b0785d82="" class="post-body">
							베네딕트 컴버배치가 주연을 맡은 실화 첩보 영화, "더 스파이"입니다. 원제는 "The Courier"인데 저는 이 제목을 더 좋아합니다. 작중 시대 배경은 1960년 냉전시대입...
						</p>
						<div data-v-b0785d82="" class="content-list-wrap">
							<div data-v-b0785d82="" class="content-wrap">
								<svg data-v-b0785d82="" width="16" height="16" fill="none" xmlns="http://www.w3.org/2000/svg" class=""><path data-v-b0785d82="" d="M15.51 15.019h-3.675A8.006 8.006 0 0016 7.999C16 3.59 12.411 0 8 0S0 3.589 0 8c0 4.41 3.589 8 8 8h7.51a.49.49 0 100-.981zM.98 7.999A7.027 7.027 0 018 .982 7.027 7.027 0 0115.02 8 7.027 7.027 0 018 15.019a7.027 7.027 0 01-7.02-7.02z" fill="#3B4869"></path><path data-v-b0785d82="" fill-rule="evenodd" clip-rule="evenodd" d="M8 16A8 8 0 108 0a8 8 0 000 16zm2-12a2 2 0 11-4 0 2 2 0 014 0zm0 8a2 2 0 11-4 0 2 2 0 014 0zm-6-2a2 2 0 100-4 2 2 0 000 4zm10-2a2 2 0 11-4 0 2 2 0 014 0z" fill="#3B4869"></path></svg><span data-v-b0785d82="" class="content-title">더 스파이</span>
							</div>
							<div data-v-b0785d82="" class="content-wrap">
								<svg data-v-b0785d82="" width="16" height="16" fill="none" xmlns="http://www.w3.org/2000/svg" class=""><path data-v-b0785d82="" d="M15.51 15.019h-3.675A8.006 8.006 0 0016 7.999C16 3.59 12.411 0 8 0S0 3.589 0 8c0 4.41 3.589 8 8 8h7.51a.49.49 0 100-.981zM.98 7.999A7.027 7.027 0 018 .982 7.027 7.027 0 0115.02 8 7.027 7.027 0 018 15.019a7.027 7.027 0 01-7.02-7.02z" fill="#3B4869"></path><path data-v-b0785d82="" fill-rule="evenodd" clip-rule="evenodd" d="M8 16A8 8 0 108 0a8 8 0 000 16zm2-12a2 2 0 11-4 0 2 2 0 014 0zm0 8a2 2 0 11-4 0 2 2 0 014 0zm-6-2a2 2 0 100-4 2 2 0 000 4zm10-2a2 2 0 11-4 0 2 2 0 014 0z" fill="#3B4869"></path></svg><span data-v-b0785d82="" class="content-title">더 스파이</span>
							</div>
							<!---->
						</div>
						</a><footer data-v-b0785d82="" class="post-footer">
						<div data-v-b0785d82="" class="badge-wrap">
							<div data-v-de3ba2dc="" data-v-b0785d82="" class="badge-wrap textColorPrimary">
								<svg data-v-b0785d82="" data-v-de3ba2dc="" width="32" height="32" fill="none" xmlns="http://www.w3.org/2000/svg" viewbox="0 0 32 32" class="icon-color-navy06"><path data-v-b0785d82="" data-v-de3ba2dc="" fill-rule="evenodd" clip-rule="evenodd" d="M28.784 14.794c-4.01-5.263-8.372-7.93-12.97-7.789-3.711.103-6.82 1.995-9.019 3.884-2.2 1.89-3.507 3.793-3.615 3.952v.001c-.25.373-.238.855.028 1.214 4.06 5.47 8.388 8.277 12.88 8.277.159 0 .318-.006.473-.011h.001c3.682-.162 6.707-2.179 8.827-4.178 2.122-2 3.357-4 3.459-4.17.224-.372.2-.834-.064-1.18l-.133.093.133-.093zm-17.164.788c0-2.444 2.072-4.436 4.62-4.436 2.546 0 4.618 1.992 4.618 4.436 0 2.445-2.072 4.437-4.619 4.437-2.547 0-4.619-1.992-4.619-4.436z" fill="#98A4B7"></path></svg><span data-v-de3ba2dc="">7</span>
							</div>
							<div data-v-de3ba2dc="" data-v-b0785d82="" class="badge-wrap textColorPrimary">
								<svg data-v-b0785d82="" data-v-de3ba2dc="" width="32" height="32" fill="none" xmlns="http://www.w3.org/2000/svg" viewbox="0 0 32 32" class="icon-color-navy06"><path data-v-b0785d82="" data-v-de3ba2dc="" fill-rule="evenodd" clip-rule="evenodd" d="M13 5a9 9 0 00-5.79 15.89c.342 2.296-.657 4.867-1.055 5.773a.207.207 0 00.22.286c3.867-.575 6.027-2.341 7.22-3.949H19a9 9 0 100-18h-6z" fill="#eee"></path></svg><span data-v-de3ba2dc="">0</span>
							</div>
						</div>
						<div data-v-b0785d82="" class="badge-wrap">
							<button data-v-de3ba2dc="" data-v-b0785d82="" class="badge-wrap reactionButton button textColorPrimary">
							<div data-v-6a12716b="" data-v-b0785d82="" class="icon default" data-v-de3ba2dc="">
							</div>
							<span data-v-de3ba2dc="">0</span></button>
						</div>
						</footer></article></li>
						<li data-v-f04faaa6="" class="list-gap"><article data-v-b0785d82="" data-v-f04faaa6="" class="post-wrap"><a data-v-b0785d82="" href="/community/post/j4oEFokBkUHnIaLwK34W" class="" id="postList-j4oEFokBkUHnIaLwK34W"><header data-v-b0785d82="" class="post-info-wrap">
						<div data-v-b0785d82="" class="post-info-user-wrap">
							<span data-v-b0785d82="" class="user-nickname">movielover</span>
							<!---->
							<!---->
						</div>
						<div data-v-b0785d82="" class="post-info-date-wrap">
							<span data-v-b0785d82="" title="2023-07-02 18:51:59" class="post-date">26분 전</span>
						</div>
						</header>
						<h2 data-v-b0785d82="" class="post-title">‘전원 일기’ ‘소수 의견’ 박규채 배우 별세</h2>
						<p data-v-b0785d82="" class="post-body">
							원로배우 박규채씨가 1일 별세했다. 85세. 영화계에 따르면 고인은 이날 오후 1시 5분께 숨을 거뒀다. 그는 최근 폐렴 치료를 받아온 것으로 알려졌다. 1938년 강원...
						</p>
						<div data-v-b0785d82="" class="content-list-wrap">
							<div data-v-b0785d82="" class="content-wrap">
								<svg data-v-b0785d82="" width="16" height="16" fill="none" xmlns="http://www.w3.org/2000/svg" class=""><path data-v-b0785d82="" d="M15.51 15.019h-3.675A8.006 8.006 0 0016 7.999C16 3.59 12.411 0 8 0S0 3.589 0 8c0 4.41 3.589 8 8 8h7.51a.49.49 0 100-.981zM.98 7.999A7.027 7.027 0 018 .982 7.027 7.027 0 0115.02 8 7.027 7.027 0 018 15.019a7.027 7.027 0 01-7.02-7.02z" fill="#3B4869"></path><path data-v-b0785d82="" fill-rule="evenodd" clip-rule="evenodd" d="M8 16A8 8 0 108 0a8 8 0 000 16zm2-12a2 2 0 11-4 0 2 2 0 014 0zm0 8a2 2 0 11-4 0 2 2 0 014 0zm-6-2a2 2 0 100-4 2 2 0 000 4zm10-2a2 2 0 11-4 0 2 2 0 014 0z" fill="#3B4869"></path></svg><span data-v-b0785d82="" class="content-title">죽여주는 여자</span>
							</div>
							<div data-v-b0785d82="" class="content-wrap">
								<svg data-v-b0785d82="" width="16" height="16" fill="none" xmlns="http://www.w3.org/2000/svg" class=""><path data-v-b0785d82="" d="M15.51 15.019h-3.675A8.006 8.006 0 0016 7.999C16 3.59 12.411 0 8 0S0 3.589 0 8c0 4.41 3.589 8 8 8h7.51a.49.49 0 100-.981zM.98 7.999A7.027 7.027 0 018 .982 7.027 7.027 0 0115.02 8 7.027 7.027 0 018 15.019a7.027 7.027 0 01-7.02-7.02z" fill="#3B4869"></path><path data-v-b0785d82="" fill-rule="evenodd" clip-rule="evenodd" d="M8 16A8 8 0 108 0a8 8 0 000 16zm2-12a2 2 0 11-4 0 2 2 0 014 0zm0 8a2 2 0 11-4 0 2 2 0 014 0zm-6-2a2 2 0 100-4 2 2 0 000 4zm10-2a2 2 0 11-4 0 2 2 0 014 0z" fill="#3B4869"></path></svg><span data-v-b0785d82="" class="content-title">소수의견</span>
							</div>
							<!---->
						</div>
						</a><footer data-v-b0785d82="" class="post-footer">
						<div data-v-b0785d82="" class="badge-wrap">
							<div data-v-de3ba2dc="" data-v-b0785d82="" class="badge-wrap textColorPrimary">
								<svg data-v-b0785d82="" data-v-de3ba2dc="" width="32" height="32" fill="none" xmlns="http://www.w3.org/2000/svg" viewbox="0 0 32 32" class="icon-color-navy06"><path data-v-b0785d82="" data-v-de3ba2dc="" fill-rule="evenodd" clip-rule="evenodd" d="M28.784 14.794c-4.01-5.263-8.372-7.93-12.97-7.789-3.711.103-6.82 1.995-9.019 3.884-2.2 1.89-3.507 3.793-3.615 3.952v.001c-.25.373-.238.855.028 1.214 4.06 5.47 8.388 8.277 12.88 8.277.159 0 .318-.006.473-.011h.001c3.682-.162 6.707-2.179 8.827-4.178 2.122-2 3.357-4 3.459-4.17.224-.372.2-.834-.064-1.18l-.133.093.133-.093zm-17.164.788c0-2.444 2.072-4.436 4.62-4.436 2.546 0 4.618 1.992 4.618 4.436 0 2.445-2.072 4.437-4.619 4.437-2.547 0-4.619-1.992-4.619-4.436z" fill="#98A4B7"></path></svg><span data-v-de3ba2dc="">20</span>
							</div>
							<div data-v-de3ba2dc="" data-v-b0785d82="" class="badge-wrap textColorPrimary">
								<svg data-v-b0785d82="" data-v-de3ba2dc="" width="32" height="32" fill="none" xmlns="http://www.w3.org/2000/svg" viewbox="0 0 32 32" class="icon-color-navy06"><path data-v-b0785d82="" data-v-de3ba2dc="" fill-rule="evenodd" clip-rule="evenodd" d="M13 5a9 9 0 00-5.79 15.89c.342 2.296-.657 4.867-1.055 5.773a.207.207 0 00.22.286c3.867-.575 6.027-2.341 7.22-3.949H19a9 9 0 100-18h-6z" fill="#eee"></path></svg><span data-v-de3ba2dc="">0</span>
							</div>
						</div>
						<div data-v-b0785d82="" class="badge-wrap">
							<button data-v-de3ba2dc="" data-v-b0785d82="" class="badge-wrap reactionButton button textColorPrimary">
							<div data-v-6a12716b="" data-v-b0785d82="" class="icon like" data-v-de3ba2dc="">
							</div>
							<span data-v-de3ba2dc="">1</span></button>
						</div>
						</footer></article></li>
						<li data-v-f04faaa6="" class="list-gap"><article data-v-b0785d82="" data-v-f04faaa6="" class="post-wrap"><a data-v-b0785d82="" href="/community/post/d4rrFYkBkUHnIaLw-X5o" class="" id="postList-d4rrFYkBkUHnIaLw-X5o"><header data-v-b0785d82="" class="post-info-wrap">
						<div data-v-b0785d82="" class="post-info-user-wrap">
							<span data-v-b0785d82="" class="user-nickname">무비JMm</span>
							<!---->
							<!---->
						</div>
						<div data-v-b0785d82="" class="post-info-date-wrap">
							<span data-v-b0785d82="" title="2023-07-02 18:25:33" class="post-date">52분 전</span>
						</div>
						</header>
						<h2 data-v-b0785d82="" class="post-title">영화 “여름날 우리” 리뷰</h2>
						<p data-v-b0785d82="" class="post-body">
							✍️_마음 속에 간직한 그 여름날 우리의 첫사랑 ⭐️(9.0/10.0) 17살 부터 32살까지 어색함 없는 배우들의 미친 외모 허광한, 장약남 이 두 배우의 뛰어난 연기 그냥 풋...
						</p>
						<div data-v-b0785d82="" class="content-list-wrap">
							<div data-v-b0785d82="" class="content-wrap">
								<svg data-v-b0785d82="" width="16" height="16" fill="none" xmlns="http://www.w3.org/2000/svg" class=""><path data-v-b0785d82="" d="M15.51 15.019h-3.675A8.006 8.006 0 0016 7.999C16 3.59 12.411 0 8 0S0 3.589 0 8c0 4.41 3.589 8 8 8h7.51a.49.49 0 100-.981zM.98 7.999A7.027 7.027 0 018 .982 7.027 7.027 0 0115.02 8 7.027 7.027 0 018 15.019a7.027 7.027 0 01-7.02-7.02z" fill="#3B4869"></path><path data-v-b0785d82="" fill-rule="evenodd" clip-rule="evenodd" d="M8 16A8 8 0 108 0a8 8 0 000 16zm2-12a2 2 0 11-4 0 2 2 0 014 0zm0 8a2 2 0 11-4 0 2 2 0 014 0zm-6-2a2 2 0 100-4 2 2 0 000 4zm10-2a2 2 0 11-4 0 2 2 0 014 0z" fill="#3B4869"></path></svg><span data-v-b0785d82="" class="content-title">여름날 우리</span>
							</div>
							<!---->
						</div>
						</a><footer data-v-b0785d82="" class="post-footer">
						<div data-v-b0785d82="" class="badge-wrap">
							<div data-v-de3ba2dc="" data-v-b0785d82="" class="badge-wrap textColorPrimary">
								<svg data-v-b0785d82="" data-v-de3ba2dc="" width="32" height="32" fill="none" xmlns="http://www.w3.org/2000/svg" viewbox="0 0 32 32" class="icon-color-navy06"><path data-v-b0785d82="" data-v-de3ba2dc="" fill-rule="evenodd" clip-rule="evenodd" d="M28.784 14.794c-4.01-5.263-8.372-7.93-12.97-7.789-3.711.103-6.82 1.995-9.019 3.884-2.2 1.89-3.507 3.793-3.615 3.952v.001c-.25.373-.238.855.028 1.214 4.06 5.47 8.388 8.277 12.88 8.277.159 0 .318-.006.473-.011h.001c3.682-.162 6.707-2.179 8.827-4.178 2.122-2 3.357-4 3.459-4.17.224-.372.2-.834-.064-1.18l-.133.093.133-.093zm-17.164.788c0-2.444 2.072-4.436 4.62-4.436 2.546 0 4.618 1.992 4.618 4.436 0 2.445-2.072 4.437-4.619 4.437-2.547 0-4.619-1.992-4.619-4.436z" fill="#98A4B7"></path></svg><span data-v-de3ba2dc="">31</span>
							</div>
							<div data-v-de3ba2dc="" data-v-b0785d82="" class="badge-wrap textColorPrimary">
								<svg data-v-b0785d82="" data-v-de3ba2dc="" width="32" height="32" fill="none" xmlns="http://www.w3.org/2000/svg" viewbox="0 0 32 32" class="icon-color-navy06"><path data-v-b0785d82="" data-v-de3ba2dc="" fill-rule="evenodd" clip-rule="evenodd" d="M13 5a9 9 0 00-5.79 15.89c.342 2.296-.657 4.867-1.055 5.773a.207.207 0 00.22.286c3.867-.575 6.027-2.341 7.22-3.949H19a9 9 0 100-18h-6z" fill="#eee"></path></svg><span data-v-de3ba2dc="">0</span>
							</div>
						</div>
						<div data-v-b0785d82="" class="badge-wrap">
							<button data-v-de3ba2dc="" data-v-b0785d82="" class="badge-wrap reactionButton button textColorPrimary">
							<div data-v-6a12716b="" data-v-b0785d82="" class="icon like" data-v-de3ba2dc="">
							</div>
							<span data-v-de3ba2dc="">1</span></button>
						</div>
						</footer></article></li>
						<li data-v-f04faaa6="" class="list-gap"><article data-v-b0785d82="" data-v-f04faaa6="" class="post-wrap"><a data-v-b0785d82="" href="/community/post/doroFYkBkUHnIaLw1n41" class="" id="postList-doroFYkBkUHnIaLw1n41"><header data-v-b0785d82="" class="post-info-wrap">
						<div data-v-b0785d82="" class="post-info-user-wrap">
							<span data-v-b0785d82="" class="user-nickname">나</span>
							<!---->
							<!---->
						</div>
						<div data-v-b0785d82="" class="post-info-date-wrap">
							<span data-v-b0785d82="" title="2023-07-02 18:22:08" class="post-date">56분 전</span>
						</div>
						</header>
						<h2 data-v-b0785d82="" class="post-title">스즈메의 문단속 팝업 스토어 갔다왔습니다</h2>
						<p data-v-b0785d82="" class="post-body">
							작품 좋아하시면 좋아하실 다양한 굿즈가 많더군요 다만 전 전통적인 제품을 좋아하는 편이라 포스터나 영화엽서를 주로 찾는데 이번엔 포스터가 종이가 아닌 천이더군요 엽화엽서는 ...
						</p>
						<div data-v-b0785d82="" class="content-list-wrap">
							<div data-v-b0785d82="" class="content-wrap">
								<svg data-v-b0785d82="" width="16" height="16" fill="none" xmlns="http://www.w3.org/2000/svg" class=""><path data-v-b0785d82="" d="M15.51 15.019h-3.675A8.006 8.006 0 0016 7.999C16 3.59 12.411 0 8 0S0 3.589 0 8c0 4.41 3.589 8 8 8h7.51a.49.49 0 100-.981zM.98 7.999A7.027 7.027 0 018 .982 7.027 7.027 0 0115.02 8 7.027 7.027 0 018 15.019a7.027 7.027 0 01-7.02-7.02z" fill="#3B4869"></path><path data-v-b0785d82="" fill-rule="evenodd" clip-rule="evenodd" d="M8 16A8 8 0 108 0a8 8 0 000 16zm2-12a2 2 0 11-4 0 2 2 0 014 0zm0 8a2 2 0 11-4 0 2 2 0 014 0zm-6-2a2 2 0 100-4 2 2 0 000 4zm10-2a2 2 0 11-4 0 2 2 0 014 0z" fill="#3B4869"></path></svg><span data-v-b0785d82="" class="content-title">스즈메의 문단속</span>
							</div>
							<!---->
						</div>
						</a><footer data-v-b0785d82="" class="post-footer">
						<div data-v-b0785d82="" class="badge-wrap">
							<div data-v-de3ba2dc="" data-v-b0785d82="" class="badge-wrap textColorPrimary">
								<svg data-v-b0785d82="" data-v-de3ba2dc="" width="32" height="32" fill="none" xmlns="http://www.w3.org/2000/svg" viewbox="0 0 32 32" class="icon-color-navy06"><path data-v-b0785d82="" data-v-de3ba2dc="" fill-rule="evenodd" clip-rule="evenodd" d="M28.784 14.794c-4.01-5.263-8.372-7.93-12.97-7.789-3.711.103-6.82 1.995-9.019 3.884-2.2 1.89-3.507 3.793-3.615 3.952v.001c-.25.373-.238.855.028 1.214 4.06 5.47 8.388 8.277 12.88 8.277.159 0 .318-.006.473-.011h.001c3.682-.162 6.707-2.179 8.827-4.178 2.122-2 3.357-4 3.459-4.17.224-.372.2-.834-.064-1.18l-.133.093.133-.093zm-17.164.788c0-2.444 2.072-4.436 4.62-4.436 2.546 0 4.618 1.992 4.618 4.436 0 2.445-2.072 4.437-4.619 4.437-2.547 0-4.619-1.992-4.619-4.436z" fill="#98A4B7"></path></svg><span data-v-de3ba2dc="">49</span>
							</div>
							<div data-v-de3ba2dc="" data-v-b0785d82="" class="badge-wrap textColorPrimary">
								<svg data-v-b0785d82="" data-v-de3ba2dc="" width="32" height="32" fill="none" xmlns="http://www.w3.org/2000/svg" viewbox="0 0 32 32" class="icon-color-navy06"><path data-v-b0785d82="" data-v-de3ba2dc="" fill-rule="evenodd" clip-rule="evenodd" d="M13 5a9 9 0 00-5.79 15.89c.342 2.296-.657 4.867-1.055 5.773a.207.207 0 00.22.286c3.867-.575 6.027-2.341 7.22-3.949H19a9 9 0 100-18h-6z" fill="#eee"></path></svg><span data-v-de3ba2dc="">10</span>
							</div>
						</div>
						<div data-v-b0785d82="" class="badge-wrap">
							<button data-v-de3ba2dc="" data-v-b0785d82="" class="badge-wrap reactionButton button textColorPrimary">
							<div data-v-6a12716b="" data-v-b0785d82="" class="icon like" data-v-de3ba2dc="">
							</div>
							<span data-v-de3ba2dc="">1</span></button>
						</div>
						</footer></article></li>
						<li data-v-f04faaa6="" class="list-gap"><article data-v-b0785d82="" data-v-f04faaa6="" class="post-wrap"><a data-v-b0785d82="" href="/community/post/Ma7oFYkB9cnBH0U-lc1m" class="" id="postList-Ma7oFYkB9cnBH0U-lc1m"><header data-v-b0785d82="" class="post-info-wrap">
						<div data-v-b0785d82="" class="post-info-user-wrap">
							<span data-v-b0785d82="" class="user-nickname">꺼윽</span>
							<!---->
							<!---->
						</div>
						<div data-v-b0785d82="" class="post-info-date-wrap">
							<span data-v-b0785d82="" title="2023-07-02 18:21:51" class="post-date">56분 전</span>
						</div>
						</header>
						<h2 data-v-b0785d82="" class="post-title">프랭그 다라본트의 또다른 수작</h2>
						<p data-v-b0785d82="" class="post-body">
							#그린마일 #킷발챌린지 쇼생크 탈출, 미스트와 함께 프랭크 다라본트가 연출한 스티븐 킹의 작품을 영화한 작품입니다. 판타지한 전개와 배우들의 호연이 뛰어난 드라마입니다. 언젠가...
						</p>
						<!---->
						<div data-v-b0785d82="" class="content-list-wrap">
							<div data-v-b0785d82="" class="content-wrap">
								<svg data-v-b0785d82="" width="16" height="16" fill="none" xmlns="http://www.w3.org/2000/svg" class=""><path data-v-b0785d82="" d="M15.51 15.019h-3.675A8.006 8.006 0 0016 7.999C16 3.59 12.411 0 8 0S0 3.589 0 8c0 4.41 3.589 8 8 8h7.51a.49.49 0 100-.981zM.98 7.999A7.027 7.027 0 018 .982 7.027 7.027 0 0115.02 8 7.027 7.027 0 018 15.019a7.027 7.027 0 01-7.02-7.02z" fill="#3B4869"></path><path data-v-b0785d82="" fill-rule="evenodd" clip-rule="evenodd" d="M8 16A8 8 0 108 0a8 8 0 000 16zm2-12a2 2 0 11-4 0 2 2 0 014 0zm0 8a2 2 0 11-4 0 2 2 0 014 0zm-6-2a2 2 0 100-4 2 2 0 000 4zm10-2a2 2 0 11-4 0 2 2 0 014 0z" fill="#3B4869"></path></svg><span data-v-b0785d82="" class="content-title">그린 마일</span>
							</div>
							<!---->
						</div>
						</a><footer data-v-b0785d82="" class="post-footer">
						<div data-v-b0785d82="" class="badge-wrap">
							<div data-v-de3ba2dc="" data-v-b0785d82="" class="badge-wrap textColorPrimary">
								<svg data-v-b0785d82="" data-v-de3ba2dc="" width="32" height="32" fill="none" xmlns="http://www.w3.org/2000/svg" viewbox="0 0 32 32" class="icon-color-navy06"><path data-v-b0785d82="" data-v-de3ba2dc="" fill-rule="evenodd" clip-rule="evenodd" d="M28.784 14.794c-4.01-5.263-8.372-7.93-12.97-7.789-3.711.103-6.82 1.995-9.019 3.884-2.2 1.89-3.507 3.793-3.615 3.952v.001c-.25.373-.238.855.028 1.214 4.06 5.47 8.388 8.277 12.88 8.277.159 0 .318-.006.473-.011h.001c3.682-.162 6.707-2.179 8.827-4.178 2.122-2 3.357-4 3.459-4.17.224-.372.2-.834-.064-1.18l-.133.093.133-.093zm-17.164.788c0-2.444 2.072-4.436 4.62-4.436 2.546 0 4.618 1.992 4.618 4.436 0 2.445-2.072 4.437-4.619 4.437-2.547 0-4.619-1.992-4.619-4.436z" fill="#98A4B7"></path></svg><span data-v-de3ba2dc="">17</span>
							</div>
							<div data-v-de3ba2dc="" data-v-b0785d82="" class="badge-wrap textColorPrimary">
								<svg data-v-b0785d82="" data-v-de3ba2dc="" width="32" height="32" fill="none" xmlns="http://www.w3.org/2000/svg" viewbox="0 0 32 32" class="icon-color-navy06"><path data-v-b0785d82="" data-v-de3ba2dc="" fill-rule="evenodd" clip-rule="evenodd" d="M13 5a9 9 0 00-5.79 15.89c.342 2.296-.657 4.867-1.055 5.773a.207.207 0 00.22.286c3.867-.575 6.027-2.341 7.22-3.949H19a9 9 0 100-18h-6z" fill="#eee"></path></svg><span data-v-de3ba2dc="">1</span>
							</div>
						</div>
						<div data-v-b0785d82="" class="badge-wrap">
							<button data-v-de3ba2dc="" data-v-b0785d82="" class="badge-wrap reactionButton button textColorPrimary">
							<div data-v-6a12716b="" data-v-b0785d82="" class="icon like" data-v-de3ba2dc="">
							</div>
							<span data-v-de3ba2dc="">1</span></button>
						</div>
						</footer></article></li>
						<li data-v-f04faaa6="" class="list-gap"><article data-v-b0785d82="" data-v-f04faaa6="" class="post-wrap"><a data-v-b0785d82="" href="/community/post/K67VFYkB9cnBH0U-Js2O" class="" id="postList-K67VFYkB9cnBH0U-Js2O"><header data-v-b0785d82="" class="post-info-wrap">
						<div data-v-b0785d82="" class="post-info-user-wrap">
							<span data-v-b0785d82="" class="user-nickname">Carol</span>
							<!---->
							<!---->
						</div>
						<div data-v-b0785d82="" class="post-info-date-wrap">
							<span data-v-b0785d82="" title="2023-07-02 18:00:37" class="post-date">1시간 전</span>
						</div>
						</header>
						<h2 data-v-b0785d82="" class="post-title">톰크루즈 기획전 "바닐라 스카이"원작, 오픈 유어 아이즈.</h2>
						<p data-v-b0785d82="" class="post-body">
							바닐라 스카이 를 보고 나서 알게 된 영화인데, 아예 이 오픈 유어 아이즈 리메이크라고 하더라구요. 페넬로페 크루즈가 나오는 것도 동일합니다 ㅎㅎ 혹시 보신 분 계신가요? 이쪽은 ...
						</p>
						<!---->
						<div data-v-b0785d82="" class="content-list-wrap">
							<div data-v-b0785d82="" class="content-wrap">
								<svg data-v-b0785d82="" width="16" height="16" fill="none" xmlns="http://www.w3.org/2000/svg" class=""><path data-v-b0785d82="" d="M15.51 15.019h-3.675A8.006 8.006 0 0016 7.999C16 3.59 12.411 0 8 0S0 3.589 0 8c0 4.41 3.589 8 8 8h7.51a.49.49 0 100-.981zM.98 7.999A7.027 7.027 0 018 .982 7.027 7.027 0 0115.02 8 7.027 7.027 0 018 15.019a7.027 7.027 0 01-7.02-7.02z" fill="#3B4869"></path><path data-v-b0785d82="" fill-rule="evenodd" clip-rule="evenodd" d="M8 16A8 8 0 108 0a8 8 0 000 16zm2-12a2 2 0 11-4 0 2 2 0 014 0zm0 8a2 2 0 11-4 0 2 2 0 014 0zm-6-2a2 2 0 100-4 2 2 0 000 4zm10-2a2 2 0 11-4 0 2 2 0 014 0z" fill="#3B4869"></path></svg><span data-v-b0785d82="" class="content-title">오픈 유어 아이즈</span>
							</div>
							<div data-v-b0785d82="" class="content-wrap">
								<svg data-v-b0785d82="" width="16" height="16" fill="none" xmlns="http://www.w3.org/2000/svg" class=""><path data-v-b0785d82="" d="M15.51 15.019h-3.675A8.006 8.006 0 0016 7.999C16 3.59 12.411 0 8 0S0 3.589 0 8c0 4.41 3.589 8 8 8h7.51a.49.49 0 100-.981zM.98 7.999A7.027 7.027 0 018 .982 7.027 7.027 0 0115.02 8 7.027 7.027 0 018 15.019a7.027 7.027 0 01-7.02-7.02z" fill="#3B4869"></path><path data-v-b0785d82="" fill-rule="evenodd" clip-rule="evenodd" d="M8 16A8 8 0 108 0a8 8 0 000 16zm2-12a2 2 0 11-4 0 2 2 0 014 0zm0 8a2 2 0 11-4 0 2 2 0 014 0zm-6-2a2 2 0 100-4 2 2 0 000 4zm10-2a2 2 0 11-4 0 2 2 0 014 0z" fill="#3B4869"></path></svg><span data-v-b0785d82="" class="content-title">오픈 유어 아이즈</span>
							</div>
							<!---->
						</div>
						</a><footer data-v-b0785d82="" class="post-footer">
						<div data-v-b0785d82="" class="badge-wrap">
							<div data-v-de3ba2dc="" data-v-b0785d82="" class="badge-wrap textColorPrimary">
								<svg data-v-b0785d82="" data-v-de3ba2dc="" width="32" height="32" fill="none" xmlns="http://www.w3.org/2000/svg" viewbox="0 0 32 32" class="icon-color-navy06"><path data-v-b0785d82="" data-v-de3ba2dc="" fill-rule="evenodd" clip-rule="evenodd" d="M28.784 14.794c-4.01-5.263-8.372-7.93-12.97-7.789-3.711.103-6.82 1.995-9.019 3.884-2.2 1.89-3.507 3.793-3.615 3.952v.001c-.25.373-.238.855.028 1.214 4.06 5.47 8.388 8.277 12.88 8.277.159 0 .318-.006.473-.011h.001c3.682-.162 6.707-2.179 8.827-4.178 2.122-2 3.357-4 3.459-4.17.224-.372.2-.834-.064-1.18l-.133.093.133-.093zm-17.164.788c0-2.444 2.072-4.436 4.62-4.436 2.546 0 4.618 1.992 4.618 4.436 0 2.445-2.072 4.437-4.619 4.437-2.547 0-4.619-1.992-4.619-4.436z" fill="#98A4B7"></path></svg><span data-v-de3ba2dc="">39</span>
							</div>
							<div data-v-de3ba2dc="" data-v-b0785d82="" class="badge-wrap textColorPrimary">
								<svg data-v-b0785d82="" data-v-de3ba2dc="" width="32" height="32" fill="none" xmlns="http://www.w3.org/2000/svg" viewbox="0 0 32 32" class="icon-color-navy06"><path data-v-b0785d82="" data-v-de3ba2dc="" fill-rule="evenodd" clip-rule="evenodd" d="M13 5a9 9 0 00-5.79 15.89c.342 2.296-.657 4.867-1.055 5.773a.207.207 0 00.22.286c3.867-.575 6.027-2.341 7.22-3.949H19a9 9 0 100-18h-6z" fill="#eee"></path></svg><span data-v-de3ba2dc="">0</span>
							</div>
						</div>
						<div data-v-b0785d82="" class="badge-wrap">
							<button data-v-de3ba2dc="" data-v-b0785d82="" class="badge-wrap reactionButton button textColorPrimary">
							<div data-v-6a12716b="" data-v-b0785d82="" class="icon default" data-v-de3ba2dc="">
							</div>
							<span data-v-de3ba2dc="">0</span></button>
						</div>
						</footer></article></li>
						<li data-v-f04faaa6="" class="list-gap"><article data-v-b0785d82="" data-v-f04faaa6="" class="post-wrap"><a data-v-b0785d82="" href="/community/post/KK7TFYkB9cnBH0U-0c28" class="" id="postList-KK7TFYkB9cnBH0U-0c28"><header data-v-b0785d82="" class="post-info-wrap">
						<div data-v-b0785d82="" class="post-info-user-wrap">
							<span data-v-b0785d82="" class="user-nickname">CreepRocket</span>
							<!---->
							<!---->
						</div>
						<div data-v-b0785d82="" class="post-info-date-wrap">
							<span data-v-b0785d82="" title="2023-07-02 17:59:10" class="post-date">1시간 전</span>
						</div>
						</header>
						<h2 data-v-b0785d82="" class="post-title">킷발챌린지 No.10: 갱스 오브 뉴욕</h2>
						<p data-v-b0785d82="" class="post-body">
							#영화 #갱스오브뉴욕 #킷발챌린지 드디어 10번째까지 와버렸네요. 이거도 없어서 놀랬습니다. 그래서 제가 먼저 다뤄보네요. 2002년에 개봉한 갱스 오브 뉴욕입니다. ...
						</p>
						<div data-v-b0785d82="" class="content-list-wrap">
							<div data-v-b0785d82="" class="content-wrap">
								<svg data-v-b0785d82="" width="16" height="16" fill="none" xmlns="http://www.w3.org/2000/svg" class=""><path data-v-b0785d82="" d="M15.51 15.019h-3.675A8.006 8.006 0 0016 7.999C16 3.59 12.411 0 8 0S0 3.589 0 8c0 4.41 3.589 8 8 8h7.51a.49.49 0 100-.981zM.98 7.999A7.027 7.027 0 018 .982 7.027 7.027 0 0115.02 8 7.027 7.027 0 018 15.019a7.027 7.027 0 01-7.02-7.02z" fill="#3B4869"></path><path data-v-b0785d82="" fill-rule="evenodd" clip-rule="evenodd" d="M8 16A8 8 0 108 0a8 8 0 000 16zm2-12a2 2 0 11-4 0 2 2 0 014 0zm0 8a2 2 0 11-4 0 2 2 0 014 0zm-6-2a2 2 0 100-4 2 2 0 000 4zm10-2a2 2 0 11-4 0 2 2 0 014 0z" fill="#3B4869"></path></svg><span data-v-b0785d82="" class="content-title">갱스 오브 뉴욕</span>
							</div>
							<!---->
						</div>
						</a><footer data-v-b0785d82="" class="post-footer">
						<div data-v-b0785d82="" class="badge-wrap">
							<div data-v-de3ba2dc="" data-v-b0785d82="" class="badge-wrap textColorPrimary">
								<svg data-v-b0785d82="" data-v-de3ba2dc="" width="32" height="32" fill="none" xmlns="http://www.w3.org/2000/svg" viewbox="0 0 32 32" class="icon-color-navy06"><path data-v-b0785d82="" data-v-de3ba2dc="" fill-rule="evenodd" clip-rule="evenodd" d="M28.784 14.794c-4.01-5.263-8.372-7.93-12.97-7.789-3.711.103-6.82 1.995-9.019 3.884-2.2 1.89-3.507 3.793-3.615 3.952v.001c-.25.373-.238.855.028 1.214 4.06 5.47 8.388 8.277 12.88 8.277.159 0 .318-.006.473-.011h.001c3.682-.162 6.707-2.179 8.827-4.178 2.122-2 3.357-4 3.459-4.17.224-.372.2-.834-.064-1.18l-.133.093.133-.093zm-17.164.788c0-2.444 2.072-4.436 4.62-4.436 2.546 0 4.618 1.992 4.618 4.436 0 2.445-2.072 4.437-4.619 4.437-2.547 0-4.619-1.992-4.619-4.436z" fill="#98A4B7"></path></svg><span data-v-de3ba2dc="">43</span>
							</div>
							<div data-v-de3ba2dc="" data-v-b0785d82="" class="badge-wrap textColorPrimary">
								<svg data-v-b0785d82="" data-v-de3ba2dc="" width="32" height="32" fill="none" xmlns="http://www.w3.org/2000/svg" viewbox="0 0 32 32" class="icon-color-navy06"><path data-v-b0785d82="" data-v-de3ba2dc="" fill-rule="evenodd" clip-rule="evenodd" d="M13 5a9 9 0 00-5.79 15.89c.342 2.296-.657 4.867-1.055 5.773a.207.207 0 00.22.286c3.867-.575 6.027-2.341 7.22-3.949H19a9 9 0 100-18h-6z" fill="#eee"></path></svg><span data-v-de3ba2dc="">2</span>
							</div>
						</div>
						<div data-v-b0785d82="" class="badge-wrap">
							<button data-v-de3ba2dc="" data-v-b0785d82="" class="badge-wrap reactionButton button textColorPrimary">
							<div data-v-6a12716b="" data-v-b0785d82="" class="icon default" data-v-de3ba2dc="">
							</div>
							<span data-v-de3ba2dc="">0</span></button>
						</div>
						</footer></article></li>
						<li data-v-f04faaa6="" class="list-gap"><article data-v-b0785d82="" data-v-f04faaa6="" class="post-wrap"><a data-v-b0785d82="" href="/community/post/Iq7QFYkB9cnBH0U-E808" class="" id="postList-Iq7QFYkB9cnBH0U-E808"><header data-v-b0785d82="" class="post-info-wrap">
						<div data-v-b0785d82="" class="post-info-user-wrap">
							<span data-v-b0785d82="" class="user-nickname">화가난_브래드피트_682114</span>
							<!---->
							<!---->
						</div>
						<div data-v-b0785d82="" class="post-info-date-wrap">
							<span data-v-b0785d82="" title="2023-07-02 17:55:05" class="post-date">1시간 전</span>
						</div>
						</header>
						<h2 data-v-b0785d82="" class="post-title">넷플릭스 사냥개들에 나온 제육볶음 맛집 ㄷㄷ.jpg</h2>
						<p data-v-b0785d82="" class="post-body">
							진짜 있었던 곳이었고 더 놀라운건 "할머니집" 사장님이 직접 출연하신거라 함 할머니집의 제육볶음이 이 세상 제일 맛있다고 사냥개들의 주인공들이 대사하는데, 을지로입구역이나 명동 ...
						</p>
						<div data-v-b0785d82="" class="content-list-wrap">
							<div data-v-b0785d82="" class="content-wrap">
								<svg data-v-b0785d82="" width="16" height="16" fill="none" xmlns="http://www.w3.org/2000/svg" class=""><path data-v-b0785d82="" d="M15.51 15.019h-3.675A8.006 8.006 0 0016 7.999C16 3.59 12.411 0 8 0S0 3.589 0 8c0 4.41 3.589 8 8 8h7.51a.49.49 0 100-.981zM.98 7.999A7.027 7.027 0 018 .982 7.027 7.027 0 0115.02 8 7.027 7.027 0 018 15.019a7.027 7.027 0 01-7.02-7.02z" fill="#3B4869"></path><path data-v-b0785d82="" fill-rule="evenodd" clip-rule="evenodd" d="M8 16A8 8 0 108 0a8 8 0 000 16zm2-12a2 2 0 11-4 0 2 2 0 014 0zm0 8a2 2 0 11-4 0 2 2 0 014 0zm-6-2a2 2 0 100-4 2 2 0 000 4zm10-2a2 2 0 11-4 0 2 2 0 014 0z" fill="#3B4869"></path></svg><span data-v-b0785d82="" class="content-title">사냥개들</span>
							</div>
							<!---->
						</div>
						</a><footer data-v-b0785d82="" class="post-footer">
						<div data-v-b0785d82="" class="badge-wrap">
							<div data-v-de3ba2dc="" data-v-b0785d82="" class="badge-wrap textColorPrimary">
								<svg data-v-b0785d82="" data-v-de3ba2dc="" width="32" height="32" fill="none" xmlns="http://www.w3.org/2000/svg" viewbox="0 0 32 32" class="icon-color-navy06"><path data-v-b0785d82="" data-v-de3ba2dc="" fill-rule="evenodd" clip-rule="evenodd" d="M28.784 14.794c-4.01-5.263-8.372-7.93-12.97-7.789-3.711.103-6.82 1.995-9.019 3.884-2.2 1.89-3.507 3.793-3.615 3.952v.001c-.25.373-.238.855.028 1.214 4.06 5.47 8.388 8.277 12.88 8.277.159 0 .318-.006.473-.011h.001c3.682-.162 6.707-2.179 8.827-4.178 2.122-2 3.357-4 3.459-4.17.224-.372.2-.834-.064-1.18l-.133.093.133-.093zm-17.164.788c0-2.444 2.072-4.436 4.62-4.436 2.546 0 4.618 1.992 4.618 4.436 0 2.445-2.072 4.437-4.619 4.437-2.547 0-4.619-1.992-4.619-4.436z" fill="#98A4B7"></path></svg><span data-v-de3ba2dc="">43</span>
							</div>
							<div data-v-de3ba2dc="" data-v-b0785d82="" class="badge-wrap textColorPrimary">
								<svg data-v-b0785d82="" data-v-de3ba2dc="" width="32" height="32" fill="none" xmlns="http://www.w3.org/2000/svg" viewbox="0 0 32 32" class="icon-color-navy06"><path data-v-b0785d82="" data-v-de3ba2dc="" fill-rule="evenodd" clip-rule="evenodd" d="M13 5a9 9 0 00-5.79 15.89c.342 2.296-.657 4.867-1.055 5.773a.207.207 0 00.22.286c3.867-.575 6.027-2.341 7.22-3.949H19a9 9 0 100-18h-6z" fill="#eee"></path></svg><span data-v-de3ba2dc="">0</span>
							</div>
						</div>
						<div data-v-b0785d82="" class="badge-wrap">
							<button data-v-de3ba2dc="" data-v-b0785d82="" class="badge-wrap reactionButton button textColorPrimary">
							<div data-v-6a12716b="" data-v-b0785d82="" class="icon default" data-v-de3ba2dc="">
							</div>
							<span data-v-de3ba2dc="">0</span></button>
						</div>
						</footer></article></li>
						<li data-v-f04faaa6="" class="list-gap"><article data-v-b0785d82="" data-v-f04faaa6="" class="post-wrap"><a data-v-b0785d82="" href="/community/post/Ia7JFYkB9cnBH0U-TM0B" class="" id="postList-Ia7JFYkB9cnBH0U-TM0B"><header data-v-b0785d82="" class="post-info-wrap">
						<div data-v-b0785d82="" class="post-info-user-wrap">
							<span data-v-b0785d82="" class="user-nickname">화가난_브래드피트_682114</span>
							<!---->
							<!---->
						</div>
						<div data-v-b0785d82="" class="post-info-date-wrap">
							<span data-v-b0785d82="" title="2023-07-02 17:47:41" class="post-date">1시간 전</span>
						</div>
						</header>
						<h2 data-v-b0785d82="" class="post-title">마고로비 프로 정신 ㄷㄷ.jpg</h2>
						<p data-v-b0785d82="" class="post-body">
							가방 색깔까지 깔맞춤 ㄷㄷ #영화 #바비
						</p>
						<div data-v-b0785d82="" class="content-list-wrap">
							<div data-v-b0785d82="" class="content-wrap">
								<svg data-v-b0785d82="" width="16" height="16" fill="none" xmlns="http://www.w3.org/2000/svg" class=""><path data-v-b0785d82="" d="M15.51 15.019h-3.675A8.006 8.006 0 0016 7.999C16 3.59 12.411 0 8 0S0 3.589 0 8c0 4.41 3.589 8 8 8h7.51a.49.49 0 100-.981zM.98 7.999A7.027 7.027 0 018 .982 7.027 7.027 0 0115.02 8 7.027 7.027 0 018 15.019a7.027 7.027 0 01-7.02-7.02z" fill="#3B4869"></path><path data-v-b0785d82="" fill-rule="evenodd" clip-rule="evenodd" d="M8 16A8 8 0 108 0a8 8 0 000 16zm2-12a2 2 0 11-4 0 2 2 0 014 0zm0 8a2 2 0 11-4 0 2 2 0 014 0zm-6-2a2 2 0 100-4 2 2 0 000 4zm10-2a2 2 0 11-4 0 2 2 0 014 0z" fill="#3B4869"></path></svg><span data-v-b0785d82="" class="content-title">바비</span>
							</div>
							<!---->
						</div>
						</a><footer data-v-b0785d82="" class="post-footer">
						<div data-v-b0785d82="" class="badge-wrap">
							<div data-v-de3ba2dc="" data-v-b0785d82="" class="badge-wrap textColorPrimary">
								<svg data-v-b0785d82="" data-v-de3ba2dc="" width="32" height="32" fill="none" xmlns="http://www.w3.org/2000/svg" viewbox="0 0 32 32" class="icon-color-navy06"><path data-v-b0785d82="" data-v-de3ba2dc="" fill-rule="evenodd" clip-rule="evenodd" d="M28.784 14.794c-4.01-5.263-8.372-7.93-12.97-7.789-3.711.103-6.82 1.995-9.019 3.884-2.2 1.89-3.507 3.793-3.615 3.952v.001c-.25.373-.238.855.028 1.214 4.06 5.47 8.388 8.277 12.88 8.277.159 0 .318-.006.473-.011h.001c3.682-.162 6.707-2.179 8.827-4.178 2.122-2 3.357-4 3.459-4.17.224-.372.2-.834-.064-1.18l-.133.093.133-.093zm-17.164.788c0-2.444 2.072-4.436 4.62-4.436 2.546 0 4.618 1.992 4.618 4.436 0 2.445-2.072 4.437-4.619 4.437-2.547 0-4.619-1.992-4.619-4.436z" fill="#98A4B7"></path></svg><span data-v-de3ba2dc="">77</span>
							</div>
							<div data-v-de3ba2dc="" data-v-b0785d82="" class="badge-wrap textColorPrimary">
								<svg data-v-b0785d82="" data-v-de3ba2dc="" width="32" height="32" fill="none" xmlns="http://www.w3.org/2000/svg" viewbox="0 0 32 32" class="icon-color-navy06"><path data-v-b0785d82="" data-v-de3ba2dc="" fill-rule="evenodd" clip-rule="evenodd" d="M13 5a9 9 0 00-5.79 15.89c.342 2.296-.657 4.867-1.055 5.773a.207.207 0 00.22.286c3.867-.575 6.027-2.341 7.22-3.949H19a9 9 0 100-18h-6z" fill="#eee"></path></svg><span data-v-de3ba2dc="">4</span>
							</div>
						</div>
						<div data-v-b0785d82="" class="badge-wrap">
							<button data-v-de3ba2dc="" data-v-b0785d82="" class="badge-wrap reactionButton button textColorPrimary">
							<div data-v-6a12716b="" data-v-b0785d82="" class="icon like" data-v-de3ba2dc="">
							</div>
							<span data-v-de3ba2dc="">2</span></button>
						</div>
						</footer></article></li>
						<li data-v-f04faaa6="" class="list-gap"><article data-v-b0785d82="" data-v-f04faaa6="" class="post-wrap"><a data-v-b0785d82="" href="/community/post/IK7FFYkB9cnBH0U-os00" class="" id="postList-IK7FFYkB9cnBH0U-os00"><header data-v-b0785d82="" class="post-info-wrap">
						<div data-v-b0785d82="" class="post-info-user-wrap">
							<span data-v-b0785d82="" class="user-nickname">Movie55</span>
							<!---->
							<!---->
						</div>
						<div data-v-b0785d82="" class="post-info-date-wrap">
							<span data-v-b0785d82="" title="2023-07-02 17:43:40" class="post-date">1시간 전</span>
						</div>
						</header>
						<h2 data-v-b0785d82="" class="post-title">🚩 🏯더 저지 the judge 👨&zwj;⚖️</h2>
						<p data-v-b0785d82="" class="post-body">
							더 저지는 2014년에 개봉한 데이빗 톱킨의 작품입니다 한국에서도 아이언맨으로 많은 팬들을 보유하고 있는 로버트 다우니 주니어가 주연을 맡았는데요 작품으로 87회 아카데미 시상식...
						</p>
						<div data-v-b0785d82="" class="content-list-wrap">
							<div data-v-b0785d82="" class="content-wrap">
								<svg data-v-b0785d82="" width="16" height="16" fill="none" xmlns="http://www.w3.org/2000/svg" class=""><path data-v-b0785d82="" d="M15.51 15.019h-3.675A8.006 8.006 0 0016 7.999C16 3.59 12.411 0 8 0S0 3.589 0 8c0 4.41 3.589 8 8 8h7.51a.49.49 0 100-.981zM.98 7.999A7.027 7.027 0 018 .982 7.027 7.027 0 0115.02 8 7.027 7.027 0 018 15.019a7.027 7.027 0 01-7.02-7.02z" fill="#3B4869"></path><path data-v-b0785d82="" fill-rule="evenodd" clip-rule="evenodd" d="M8 16A8 8 0 108 0a8 8 0 000 16zm2-12a2 2 0 11-4 0 2 2 0 014 0zm0 8a2 2 0 11-4 0 2 2 0 014 0zm-6-2a2 2 0 100-4 2 2 0 000 4zm10-2a2 2 0 11-4 0 2 2 0 014 0z" fill="#3B4869"></path></svg><span data-v-b0785d82="" class="content-title">더 저지</span>
							</div>
							<!---->
						</div>
						</a><footer data-v-b0785d82="" class="post-footer">
						<div data-v-b0785d82="" class="badge-wrap">
							<div data-v-de3ba2dc="" data-v-b0785d82="" class="badge-wrap textColorPrimary">
								<svg data-v-b0785d82="" data-v-de3ba2dc="" width="32" height="32" fill="none" xmlns="http://www.w3.org/2000/svg" viewbox="0 0 32 32" class="icon-color-navy06"><path data-v-b0785d82="" data-v-de3ba2dc="" fill-rule="evenodd" clip-rule="evenodd" d="M28.784 14.794c-4.01-5.263-8.372-7.93-12.97-7.789-3.711.103-6.82 1.995-9.019 3.884-2.2 1.89-3.507 3.793-3.615 3.952v.001c-.25.373-.238.855.028 1.214 4.06 5.47 8.388 8.277 12.88 8.277.159 0 .318-.006.473-.011h.001c3.682-.162 6.707-2.179 8.827-4.178 2.122-2 3.357-4 3.459-4.17.224-.372.2-.834-.064-1.18l-.133.093.133-.093zm-17.164.788c0-2.444 2.072-4.436 4.62-4.436 2.546 0 4.618 1.992 4.618 4.436 0 2.445-2.072 4.437-4.619 4.437-2.547 0-4.619-1.992-4.619-4.436z" fill="#98A4B7"></path></svg><span data-v-de3ba2dc="">49</span>
							</div>
							<div data-v-de3ba2dc="" data-v-b0785d82="" class="badge-wrap textColorPrimary">
								<svg data-v-b0785d82="" data-v-de3ba2dc="" width="32" height="32" fill="none" xmlns="http://www.w3.org/2000/svg" viewbox="0 0 32 32" class="icon-color-navy06"><path data-v-b0785d82="" data-v-de3ba2dc="" fill-rule="evenodd" clip-rule="evenodd" d="M13 5a9 9 0 00-5.79 15.89c.342 2.296-.657 4.867-1.055 5.773a.207.207 0 00.22.286c3.867-.575 6.027-2.341 7.22-3.949H19a9 9 0 100-18h-6z" fill="#eee"></path></svg><span data-v-de3ba2dc="">1</span>
							</div>
						</div>
						<div data-v-b0785d82="" class="badge-wrap">
							<button data-v-de3ba2dc="" data-v-b0785d82="" class="badge-wrap reactionButton button textColorPrimary">
							<div data-v-6a12716b="" data-v-b0785d82="" class="icon like" data-v-de3ba2dc="">
							</div>
							<span data-v-de3ba2dc="">2</span></button>
						</div>
						</footer></article></li>
						<li data-v-f04faaa6="" class="list-gap"><article data-v-b0785d82="" data-v-f04faaa6="" class="post-wrap"><a data-v-b0785d82="" href="/community/post/ZIq-FYkBkUHnIaLwkn4G" class="" id="postList-ZIq-FYkBkUHnIaLwkn4G"><header data-v-b0785d82="" class="post-info-wrap">
						<div data-v-b0785d82="" class="post-info-user-wrap">
							<span data-v-b0785d82="" class="user-nickname">빈칸</span>
							<!---->
							<!---->
						</div>
						<div data-v-b0785d82="" class="post-info-date-wrap">
							<span data-v-b0785d82="" title="2023-07-02 17:35:58" class="post-date">1시간 전</span>
						</div>
						</header>
						<h2 data-v-b0785d82="" class="post-title">사랑은 비가 갠 뒤처럼</h2>
						<p data-v-b0785d82="" class="post-body">
							언뜻보면 나이 많은 점장과 어린 여자의 사랑이야기..로 보일 수 있으나 영화를 보면 이들의 로맨스가 아닌 넘어져도 다시 일어나 꿈을 향해 달리라는 교훈을 담은 영화 고마츠나나 작품...
						</p>
						<div data-v-b0785d82="" class="content-list-wrap">
							<div data-v-b0785d82="" class="content-wrap">
								<svg data-v-b0785d82="" width="16" height="16" fill="none" xmlns="http://www.w3.org/2000/svg" class=""><path data-v-b0785d82="" d="M15.51 15.019h-3.675A8.006 8.006 0 0016 7.999C16 3.59 12.411 0 8 0S0 3.589 0 8c0 4.41 3.589 8 8 8h7.51a.49.49 0 100-.981zM.98 7.999A7.027 7.027 0 018 .982 7.027 7.027 0 0115.02 8 7.027 7.027 0 018 15.019a7.027 7.027 0 01-7.02-7.02z" fill="#3B4869"></path><path data-v-b0785d82="" fill-rule="evenodd" clip-rule="evenodd" d="M8 16A8 8 0 108 0a8 8 0 000 16zm2-12a2 2 0 11-4 0 2 2 0 014 0zm0 8a2 2 0 11-4 0 2 2 0 014 0zm-6-2a2 2 0 100-4 2 2 0 000 4zm10-2a2 2 0 11-4 0 2 2 0 014 0z" fill="#3B4869"></path></svg><span data-v-b0785d82="" class="content-title">사랑은 비가 갠 뒤처럼</span>
							</div>
							<div data-v-b0785d82="" class="content-wrap">
								<svg data-v-b0785d82="" width="16" height="16" fill="none" xmlns="http://www.w3.org/2000/svg" class=""><path data-v-b0785d82="" d="M15.51 15.019h-3.675A8.006 8.006 0 0016 7.999C16 3.59 12.411 0 8 0S0 3.589 0 8c0 4.41 3.589 8 8 8h7.51a.49.49 0 100-.981zM.98 7.999A7.027 7.027 0 018 .982 7.027 7.027 0 0115.02 8 7.027 7.027 0 018 15.019a7.027 7.027 0 01-7.02-7.02z" fill="#3B4869"></path><path data-v-b0785d82="" fill-rule="evenodd" clip-rule="evenodd" d="M8 16A8 8 0 108 0a8 8 0 000 16zm2-12a2 2 0 11-4 0 2 2 0 014 0zm0 8a2 2 0 11-4 0 2 2 0 014 0zm-6-2a2 2 0 100-4 2 2 0 000 4zm10-2a2 2 0 11-4 0 2 2 0 014 0z" fill="#3B4869"></path></svg><span data-v-b0785d82="" class="content-title">사랑은 비가 갠 뒤처럼</span>
							</div>
							<!---->
						</div>
						</a><footer data-v-b0785d82="" class="post-footer">
						<div data-v-b0785d82="" class="badge-wrap">
							<div data-v-de3ba2dc="" data-v-b0785d82="" class="badge-wrap textColorPrimary">
								<svg data-v-b0785d82="" data-v-de3ba2dc="" width="32" height="32" fill="none" xmlns="http://www.w3.org/2000/svg" viewbox="0 0 32 32" class="icon-color-navy06"><path data-v-b0785d82="" data-v-de3ba2dc="" fill-rule="evenodd" clip-rule="evenodd" d="M28.784 14.794c-4.01-5.263-8.372-7.93-12.97-7.789-3.711.103-6.82 1.995-9.019 3.884-2.2 1.89-3.507 3.793-3.615 3.952v.001c-.25.373-.238.855.028 1.214 4.06 5.47 8.388 8.277 12.88 8.277.159 0 .318-.006.473-.011h.001c3.682-.162 6.707-2.179 8.827-4.178 2.122-2 3.357-4 3.459-4.17.224-.372.2-.834-.064-1.18l-.133.093.133-.093zm-17.164.788c0-2.444 2.072-4.436 4.62-4.436 2.546 0 4.618 1.992 4.618 4.436 0 2.445-2.072 4.437-4.619 4.437-2.547 0-4.619-1.992-4.619-4.436z" fill="#98A4B7"></path></svg><span data-v-de3ba2dc="">62</span>
							</div>
							<div data-v-de3ba2dc="" data-v-b0785d82="" class="badge-wrap textColorPrimary">
								<svg data-v-b0785d82="" data-v-de3ba2dc="" width="32" height="32" fill="none" xmlns="http://www.w3.org/2000/svg" viewbox="0 0 32 32" class="icon-color-navy06"><path data-v-b0785d82="" data-v-de3ba2dc="" fill-rule="evenodd" clip-rule="evenodd" d="M13 5a9 9 0 00-5.79 15.89c.342 2.296-.657 4.867-1.055 5.773a.207.207 0 00.22.286c3.867-.575 6.027-2.341 7.22-3.949H19a9 9 0 100-18h-6z" fill="#eee"></path></svg><span data-v-de3ba2dc="">2</span>
							</div>
						</div>
						<div data-v-b0785d82="" class="badge-wrap">
							<button data-v-de3ba2dc="" data-v-b0785d82="" class="badge-wrap reactionButton button textColorPrimary">
							<div data-v-6a12716b="" data-v-b0785d82="" class="icon default" data-v-de3ba2dc="">
							</div>
							<span data-v-de3ba2dc="">0</span></button>
						</div>
						</footer></article></li>
						<li data-v-f04faaa6="" class="list-gap"><article data-v-b0785d82="" data-v-f04faaa6="" class="post-wrap"><a data-v-b0785d82="" href="/community/post/Ga67FYkB9cnBH0U-t802" class="" id="postList-Ga67FYkB9cnBH0U-t802"><header data-v-b0785d82="" class="post-info-wrap">
						<div data-v-b0785d82="" class="post-info-user-wrap">
							<span data-v-b0785d82="" class="user-nickname">화가난_엠마스톤_113845</span>
							<!---->
							<!---->
						</div>
						<div data-v-b0785d82="" class="post-info-date-wrap">
							<span data-v-b0785d82="" title="2023-07-02 17:32:50" class="post-date">1시간 전</span>
						</div>
						</header>
						<h2 data-v-b0785d82="" class="post-title">타이타닉 많이 감동적인가요</h2>
						<p data-v-b0785d82="" class="post-body">
							궁금합니다#타이타닉
						</p>
						<!---->
						<div data-v-b0785d82="" class="content-list-wrap">
							<div data-v-b0785d82="" class="content-wrap">
								<svg data-v-b0785d82="" width="16" height="16" fill="none" xmlns="http://www.w3.org/2000/svg" class=""><path data-v-b0785d82="" d="M15.51 15.019h-3.675A8.006 8.006 0 0016 7.999C16 3.59 12.411 0 8 0S0 3.589 0 8c0 4.41 3.589 8 8 8h7.51a.49.49 0 100-.981zM.98 7.999A7.027 7.027 0 018 .982 7.027 7.027 0 0115.02 8 7.027 7.027 0 018 15.019a7.027 7.027 0 01-7.02-7.02z" fill="#3B4869"></path><path data-v-b0785d82="" fill-rule="evenodd" clip-rule="evenodd" d="M8 16A8 8 0 108 0a8 8 0 000 16zm2-12a2 2 0 11-4 0 2 2 0 014 0zm0 8a2 2 0 11-4 0 2 2 0 014 0zm-6-2a2 2 0 100-4 2 2 0 000 4zm10-2a2 2 0 11-4 0 2 2 0 014 0z" fill="#3B4869"></path></svg><span data-v-b0785d82="" class="content-title">타이타닉</span>
							</div>
							<!---->
						</div>
						</a><footer data-v-b0785d82="" class="post-footer">
						<div data-v-b0785d82="" class="badge-wrap">
							<div data-v-de3ba2dc="" data-v-b0785d82="" class="badge-wrap textColorPrimary">
								<svg data-v-b0785d82="" data-v-de3ba2dc="" width="32" height="32" fill="none" xmlns="http://www.w3.org/2000/svg" viewbox="0 0 32 32" class="icon-color-navy06"><path data-v-b0785d82="" data-v-de3ba2dc="" fill-rule="evenodd" clip-rule="evenodd" d="M28.784 14.794c-4.01-5.263-8.372-7.93-12.97-7.789-3.711.103-6.82 1.995-9.019 3.884-2.2 1.89-3.507 3.793-3.615 3.952v.001c-.25.373-.238.855.028 1.214 4.06 5.47 8.388 8.277 12.88 8.277.159 0 .318-.006.473-.011h.001c3.682-.162 6.707-2.179 8.827-4.178 2.122-2 3.357-4 3.459-4.17.224-.372.2-.834-.064-1.18l-.133.093.133-.093zm-17.164.788c0-2.444 2.072-4.436 4.62-4.436 2.546 0 4.618 1.992 4.618 4.436 0 2.445-2.072 4.437-4.619 4.437-2.547 0-4.619-1.992-4.619-4.436z" fill="#98A4B7"></path></svg><span data-v-de3ba2dc="">53</span>
							</div>
							<div data-v-de3ba2dc="" data-v-b0785d82="" class="badge-wrap textColorPrimary">
								<svg data-v-b0785d82="" data-v-de3ba2dc="" width="32" height="32" fill="none" xmlns="http://www.w3.org/2000/svg" viewbox="0 0 32 32" class="icon-color-navy06"><path data-v-b0785d82="" data-v-de3ba2dc="" fill-rule="evenodd" clip-rule="evenodd" d="M13 5a9 9 0 00-5.79 15.89c.342 2.296-.657 4.867-1.055 5.773a.207.207 0 00.22.286c3.867-.575 6.027-2.341 7.22-3.949H19a9 9 0 100-18h-6z" fill="#eee"></path></svg><span data-v-de3ba2dc="">3</span>
							</div>
						</div>
						<div data-v-b0785d82="" class="badge-wrap">
							<button data-v-de3ba2dc="" data-v-b0785d82="" class="badge-wrap reactionButton button textColorPrimary">
							<div data-v-6a12716b="" data-v-b0785d82="" class="icon like" data-v-de3ba2dc="">
							</div>
							<span data-v-de3ba2dc="">1</span></button>
						</div>
						</footer></article></li>
					</ul>
					<div data-v-07a4f3b7="" data-v-f04faaa6="" class="default-bottom-loader">
						<div data-v-07a4f3b7="" class="loader">
							<svg data-v-07a4f3b7="" viewbox="25 25 50 50" class="circular-loader"><circle data-v-07a4f3b7="" cx="50" cy="50" r="20" fill="none" stroke-width="6" class="loader-path"></circle></svg>
						</div>
					</div>
					<!---->
				</div>
				</section><aside data-v-f04faaa6="" class="side-item side-area side-area--home">
				<div data-v-f04faaa6="" class="user-info-wrap">
					<p data-v-f04faaa6="" class="user-name"></p>
					<div data-v-f04faaa6="" class="my-link-wrap">
						<a data-v-f04faaa6="" href="/community/my?tab=post" class="">
						<div data-v-f04faaa6="" id="myPostButton" class="my-link">
							<span data-v-f04faaa6="" class="my-link-label">내가 쓴 글</span><span data-v-f04faaa6="" class="my-count" id="myPostCnt"></span>
						</div>
						</a><a data-v-f04faaa6="" href="/community/my?tab=comment" class="">
						<div data-v-f04faaa6="" id="myCommentButton" class="my-link">
							<span data-v-f04faaa6="" class="my-link-label">내가 쓴 댓글</span><span data-v-f04faaa6="" class="my-count" id="myReplyCnt"></span>
						</div>
						</a>
					</div>
				</div>
				<div data-v-f04faaa6="" class="write-wrap">
					<button data-v-f04faaa6="" class="write-btn"><span data-v-f04faaa6="" class="write-btn-text">글 작성하기</span><svg data-v-f04faaa6="" width="32" height="32" fill="none" xmlns="http://www.w3.org/2000/svg" viewbox="0 0 32 32" class=""><rect data-v-f04faaa6="" x="8" y="26" width="16" height="2" rx="1" fill="#EFEFEF"></rect><path data-v-f04faaa6="" fill-rule="evenodd" clip-rule="evenodd" d="M20.813 5.2a.677.677 0 00-.96-.001L18.362 6.69a1.003 1.003 0 00-.001 1.416l3.935 3.951a.997.997 0 001.413.002l1.491-1.492a.68.68 0 00.001-.962L20.812 5.2zm-3.525 3.976a.999.999 0 00-1.414-.002l-7.67 7.663a.68.68 0 00-.2.48L8 21.717c0 .375.303.68.678.68l4.263.003c.265 0 .52-.105.707-.292l7.577-7.569a1 1 0 00.001-1.415l-3.938-3.948z" fill="#EFEFEF"></path></svg>
					</button>
				</div>
				<!---->
				<!---->
				</aside>
			</div>
		</div>
		<input data-v-f04faaa6="" type="text" class="copy-input">
	</main>

</body>
</html>