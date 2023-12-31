<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>커뮤니티</title>
<link rel="stylesheet" href="${contextPath}/resources/bootstrap/css/community-bootstrap.css" type="text/css">
<link rel="stylesheet" href="${contextPath}/resources/bootstrap/css/footer-custom.css" type="text/css">
<script src="${contextPath}/resources/bootstrap/js/community-getTimeDiff.js"></script>
<script src="${contextPath}/resources/bootstrap/js/community-contentLikeBtn.js"></script>
<script>
$(function() {

	$("span.post-date").each(function() {
		var elapsedDate = elapsedTime($(this).attr("title"));
		$(this).text(elapsedDate);
	});
	
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
	
});
</script>
</head>
<body>

	<main data-v-f04faaa6="" data-v-75f0040c="" id="contents">
		<section data-v-f04faaa6="" class="fixed-area">
		<header data-v-36d2ff30="" data-v-f04faaa6="" class="header-wrap left-title header-main">
		<h1 data-v-36d2ff30="" class="header-title beta"> 커뮤니티 </h1>
		<!---->
		<a data-v-f04faaa6="" href="${contextPath}/community/search" class="header-right-button search" id="searchButton" data-v-36d2ff30=""><img data-v-f04faaa6="" src="https://static.kinolights.com/icon/ic-search.svg" alt="검색"></a>
		</header>
		</section>
		<div data-v-f04faaa6="" class="content-area">
			<div data-v-f04faaa6="" class="grid-container mainContent">
				<section data-v-f04faaa6="" class="list-item list-area list-area--home">
				<div data-v-f04faaa6="" class="list-inner-wrap">
					<ul data-v-f04faaa6="" id="postList">
					<c:forEach var="post" items="${postList}" varStatus="i">
						<li data-v-f04faaa6="" class="list-gap">
							<article data-v-b0785d82="" data-v-f04faaa6="" class="post-wrap">
								<a data-v-b0785d82="" href="${contextPath}/community/post?postId=${post.postId}" class="" id="postList-nIoYFokBkUHnIaLwUX4I">
						<header data-v-b0785d82="" class="post-info-wrap">
						<div data-v-b0785d82="" class="post-info-user-wrap">
							<c:choose>
							<c:when test="${post.nickName != null}">
								<span data-v-b0785d82="" class="user-nickname">${post.nickName}</span>
							</c:when>
							<c:otherwise>
								<span data-v-b0785d82="" class="user-nickname">탈퇴한 회원입니다</span>
							</c:otherwise>
							</c:choose>
						</div>
						<div data-v-b0785d82="" class="post-info-date-wrap">
							<span data-v-b0785d82="" title="${post.enrollDt}" class="post-date">${post.enrollDt}</span>
						</div>
						</header>
						<h2 data-v-b0785d82="" class="post-title">${post.postTitle}</h2>
						<p data-v-b0785d82="" class="post-body">${post.content}</p>
						<c:if test="${post.contentId != 0}">
							<div data-v-b0785d82="" class="content-list-wrap">
								<div data-v-b0785d82="" class="content-wrap">
									<svg data-v-b0785d82="" width="16" height="16" fill="none" xmlns="http://www.w3.org/2000/svg" class=""><path data-v-b0785d82="" d="M15.51 15.019h-3.675A8.006 8.006 0 0016 7.999C16 3.59 12.411 0 8 0S0 3.589 0 8c0 4.41 3.589 8 8 8h7.51a.49.49 0 100-.981zM.98 7.999A7.027 7.027 0 018 .982 7.027 7.027 0 0115.02 8 7.027 7.027 0 018 15.019a7.027 7.027 0 01-7.02-7.02z" fill="#6a5656"></path><path data-v-b0785d82="" fill-rule="evenodd" clip-rule="evenodd" d="M8 16A8 8 0 108 0a8 8 0 000 16zm2-12a2 2 0 11-4 0 2 2 0 014 0zm0 8a2 2 0 11-4 0 2 2 0 014 0zm-6-2a2 2 0 100-4 2 2 0 000 4zm10-2a2 2 0 11-4 0 2 2 0 014 0z" fill="#6a5656"></path></svg><span data-v-b0785d82="" class="content-title">&nbsp;${post.postTag}</span>
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
						<c:choose>
						<c:when test="${post.myRecmnd != 0}">
							<button data-v-de3ba2dc="" data-v-b0785d82="" id="likeBtn${post.postId}" onclick="likePostBtn('${member.memberId}', '${post.postId}')" class="badge-wrap reactionButton button textColorPrimary active">
								<div data-v-6a12716b="" data-v-b0785d82="" class="icon like" data-v-de3ba2dc=""></div>
								<span data-v-de3ba2dc="" id="likeCnt${post.postId}">${post.recmndCnt}</span>
							</button>
						</c:when>
						<c:otherwise>
							<button data-v-de3ba2dc="" data-v-b0785d82="" id="likeBtn${post.postId}" onclick="likePostBtn('${member.memberId}', '${post.postId}')" class="badge-wrap reactionButton button textColorPrimary">
								<div data-v-6a12716b="" data-v-b0785d82="" class="icon like" data-v-de3ba2dc=""></div>
								<span data-v-de3ba2dc="" id="likeCnt${post.postId}">${post.recmndCnt}</span>
							</button>
						</c:otherwise>
						</c:choose>
						</div>
						</footer></article></li>
					</c:forEach>
					</ul>
					<div data-v-07a4f3b7="" data-v-f04faaa6="" class="default-bottom-loader">
						<div data-v-07a4f3b7="" class="loader">
							<svg data-v-07a4f3b7="" viewbox="25 25 50 50" class="circular-loader"><circle data-v-07a4f3b7="" cx="50" cy="50" r="20" fill="none" stroke-width="6" class="loader-path"></circle></svg>
						</div>
					</div>
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
				</aside>
			</div>
		</div>
		<input data-v-f04faaa6="" type="text" class="copy-input">
	</main>

</body>
</html>