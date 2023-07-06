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
<link rel="stylesheet" href="${contextPath}/resources/css/footerCustom.css" type="text/css">
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

	// 내가 쓴 글 보기
	$("#myPostButton").click(function() {
		location.href="${contextPath}/community/my?tab=post";
	});

	// 내가 쓴 댓글 보기
	$("#myCommentButton").click(function() {
		location.href="${contextPath}/community/my?tab=comment";
	});

	// 시간 계산값 넘기기
	$(".post-date").val(getTimeDiff("${post.enrollDt}"));
	
});
</script>
<script>

	var dateStr = "Tue Jul 04 17:28:34 KST 2023";
	var inputFormat = "ddd MMM DD HH:mm:ss zzz YYYY";
	var outputFormat = "YYYY-MM-DD HH:mm:ss";

	var date = new Date(dateStr);
	var formattedDate = date.toLocaleString("en-US", { timeZone: "Asia/Seoul", year: "numeric", month: "2-digit", day: "2-digit", hour: "2-digit", minute: "2-digit", second: "2-digit" });

	console.log(formattedDate);

	function getTimeDiff(timestamp) {

		var beforeDate = new Date(timestamp);
		var formattedDate = beforeDate.toLocaleString("en-US", { timeZone: "Asia/Seoul", year: "numeric", month: "2-digit", day: "2-digit", hour: "2-digit", minute: "2-digit", second: "2-digit" });

		var currentTime = new Date();
		var targetTime = new Date(formattedDate);

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
							<span data-v-b0785d82="" title="getTimeDiff(${post.enrollDt})" class="post-date"></span>
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