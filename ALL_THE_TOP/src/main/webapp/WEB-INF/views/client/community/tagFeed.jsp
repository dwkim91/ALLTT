<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>tag</title>
<link rel="stylesheet" href="${contextPath}/resources/css/tagFeed.css" type="text/css">
<link rel="stylesheet" href="${contextPath}/resources/css/footerCustom.css" type="text/css">
<script src="${contextPath}/resources/jquery/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
$(function() {
	$(".back-btn").click(function() {
		history.go(-1);
	});
	
	$(".write-btn-text").click(function() {
		location.href="${contextPath}/community/write?contentId=${content.contentId}";
	});
});
</script>
<script>
	// 좋아요 표시
	function likePostBtn(postId){
		  	// 클릭된 버튼에만 클래스 변경을 적용하기 위해 id 값을 사용
		  	var btnId = "likeBtn" + postId;
		  	var targetBtn = $("#" + btnId);
			targetBtn.toggleClass("active");
			
			var param = {
				"memberId" : "${member.memberId}",
				"postId" : postId
			};
			
			$.ajax({
				 url : "${contextPath}/community/postRecmnd",
				 async : true,
				 type : "POST",
				 data : param,
				 success : function(result) {
					targetBtn.find("span").html(result);
				 }
			});
	}
</script>
<script>
	// 좋아요 표시
	function likePostBtn(postId){
		  	// 클릭된 버튼에만 클래스 변경을 적용하기 위해 id 값을 사용
		  	var btnId = "likeBtn" + postId;
		  	var targetBtn = $("#" + btnId);
			targetBtn.toggleClass("active");
			
			var param = {
				"memberId" : "${sessionScope.memberId}",
				"postId" : postId
			};
			
			$.ajax({
				 url : "${contextPath}/community/postRecmnd",
				 async : true,
				 type : "POST",
				 data : param,
				 success : function(result) {
					targetBtn.find("span").html(result);
				 }
			});
	}
</script>
</head>
<body>

<div id="__nuxt">
	<div id="__layout">
		<div id="root" data-v-00101c0c="">
			<main data-v-1d0e5362="" data-v-00101c0c="" id="contents">
			<section data-v-1d0e5362="" class="fixed-area">
			<header data-v-9938e184="" data-v-1d0e5362="" class="header-wrap has-tags">
			<h1 data-v-9938e184="" class="header-title"> #${tag} </h1>
			<div data-v-9938e184="" class="left-wrap">
				<button data-v-9938e184="" class="back-btn"><i data-v-9938e184="" class="kino-icon kino-icon--header-back"></i></button>
				<!---->
			</div>
			</header></section>
			<div data-v-1d0e5362="" class="content-area">
				<div data-v-1d0e5362="" class="grid-container mainContent">
					<section data-v-1d0e5362="" class="banner-area">
					<!---->
					</section>
					<section data-v-1d0e5362="" class="top-item top-area divider-line">
					<div data-v-1d0e5362="" class="tag-area">
						<p data-v-1d0e5362="" class="tag-subtitle"> 태그 모아보기 </p>
						<div data-v-1d0e5362="" class="tags-wrap">
							<div data-v-1d0e5362="" class="tag-wrap">
								<svg data-v-1d0e5362="" width="24" height="24" fill="none" xmlns="http://www.w3.org/2000/svg" class=""><path data-v-1d0e5362="" fill-rule="evenodd" clip-rule="evenodd" d="M9.705 3.02a1.286 1.286 0 00-1.49 1.043L7.745 6.74H5.572a1.286 1.286 0 000 2.571H7.29l-.907 5.143H4.286a1.286 1.286 0 100 2.571H5.93l-.393 2.231a1.286 1.286 0 102.532.447l.472-2.678h5.103l-.393 2.231a1.286 1.286 0 102.532.447l.472-2.678h2.173a1.286 1.286 0 000-2.571h-1.72l.907-5.143h2.1a1.286 1.286 0 100-2.571h-1.646l.393-2.23a1.286 1.286 0 10-2.532-.447l-.473 2.677h-5.102l.393-2.23a1.286 1.286 0 00-1.043-1.49zm4.392 11.434l.907-5.143H9.901l-.907 5.143h5.103z" fill="#637DEA"></path></svg><span data-v-1d0e5362="" class="tag">${content.title}</span>
							</div>
						</div>
					</div>
					<!---->
					</section>
					<section data-v-1d0e5362="" class="list-item list-area list-area--mapped-contents">
					<!---->
					<div data-v-1d0e5362="" class="list-inner-wrap">
						<p data-v-1d0e5362="" class="list-count"> 총 ${postList.size()}개 </p>
						<ul data-v-1d0e5362="">
						<c:forEach var="post" items="${postList}">
							<li data-v-1d0e5362="" class="list-gap">
							<article data-v-29756cf4="" data-v-1d0e5362="" class="post-wrap">
							<a data-v-29756cf4="" href="${contextPath}/community/post?postId=${post.postId}" class="" id="postList-IbAJQokB9cnBH0U-kIpa">
							<header data-v-29756cf4="" class="post-info-wrap">
							<div data-v-29756cf4="" class="post-info-user-wrap">
								<span data-v-29756cf4="" class="user-nickname">${post.nickName}</span>
								<!---->
							</div>
							<div data-v-29756cf4="" class="post-info-date-wrap">
								<span data-v-29756cf4="" title="2023-07-11 08:01:10" class="post-date">${post.enrollDt}</span>
							</div>
							</header>
							<h2 data-v-29756cf4="" class="post-title">${post.postTitle}</h2>
							<p data-v-29756cf4="" class="post-body">${post.content}</p>
							<div data-v-29756cf4="" class="content-list-wrap">
								<div data-v-29756cf4="" class="content-wrap">
									<svg data-v-29756cf4="" width="16" height="16" fill="none" xmlns="http://www.w3.org/2000/svg" class=""><path data-v-29756cf4="" d="M15.51 15.019h-3.675A8.006 8.006 0 0016 7.999C16 3.59 12.411 0 8 0S0 3.589 0 8c0 4.41 3.589 8 8 8h7.51a.49.49 0 100-.981zM.98 7.999A7.027 7.027 0 018 .982 7.027 7.027 0 0115.02 8 7.027 7.027 0 018 15.019a7.027 7.027 0 01-7.02-7.02z" fill="#3B4869"></path><path data-v-29756cf4="" fill-rule="evenodd" clip-rule="evenodd" d="M8 16A8 8 0 108 0a8 8 0 000 16zm2-12a2 2 0 11-4 0 2 2 0 014 0zm0 8a2 2 0 11-4 0 2 2 0 014 0zm-6-2a2 2 0 100-4 2 2 0 000 4zm10-2a2 2 0 11-4 0 2 2 0 014 0z" fill="#3B4869"></path></svg><span data-v-29756cf4="" class="content-title">${post.postTag}</span>
								</div>
								<!---->
							</div>
							</a>
							<footer data-v-29756cf4="" class="post-footer">
							<div data-v-29756cf4="" class="badge-wrap">
								<div data-v-de3ba2dc="" data-v-29756cf4="" class="badge-wrap textColorPrimary">
									<svg data-v-29756cf4="" data-v-de3ba2dc="" width="32" height="32" fill="none" xmlns="http://www.w3.org/2000/svg" viewbox="0 0 32 32" class="icon-color-navy06"><path data-v-29756cf4="" data-v-de3ba2dc="" fill-rule="evenodd" clip-rule="evenodd" d="M28.784 14.794c-4.01-5.263-8.372-7.93-12.97-7.789-3.711.103-6.82 1.995-9.019 3.884-2.2 1.89-3.507 3.793-3.615 3.952v.001c-.25.373-.238.855.028 1.214 4.06 5.47 8.388 8.277 12.88 8.277.159 0 .318-.006.473-.011h.001c3.682-.162 6.707-2.179 8.827-4.178 2.122-2 3.357-4 3.459-4.17.224-.372.2-.834-.064-1.18l-.133.093.133-.093zm-17.164.788c0-2.444 2.072-4.436 4.62-4.436 2.546 0 4.618 1.992 4.618 4.436 0 2.445-2.072 4.437-4.619 4.437-2.547 0-4.619-1.992-4.619-4.436z" fill="#98A4B7"></path></svg><span data-v-de3ba2dc="">${post.readCnt}</span>
								</div>
								<div data-v-de3ba2dc="" data-v-29756cf4="" class="badge-wrap textColorPrimary">
									<svg data-v-29756cf4="" data-v-de3ba2dc="" width="32" height="32" fill="none" xmlns="http://www.w3.org/2000/svg" viewbox="0 0 32 32" class="icon-color-navy06"><path data-v-29756cf4="" data-v-de3ba2dc="" fill-rule="evenodd" clip-rule="evenodd" d="M13 5a9 9 0 00-5.79 15.89c.342 2.296-.657 4.867-1.055 5.773a.207.207 0 00.22.286c3.867-.575 6.027-2.341 7.22-3.949H19a9 9 0 100-18h-6z" fill="#eee"></path></svg><span data-v-de3ba2dc="">${post.replyCnt}</span>
								</div>
							</div>
							<div data-v-29756cf4="" class="badge-wrap">
							<c:choose>
							<c:when test="${post.myRecmnd != 0}">
								<button data-v-de3ba2dc="" data-v-b0785d82="" id="likeBtn${post.postId}" onclick="likePostBtn('${post.postId}')" class="badge-wrap reactionButton button textColorPrimary active">
									<div data-v-6a12716b="" data-v-b0785d82="" class="icon like" data-v-de3ba2dc=""></div>
									<span data-v-de3ba2dc="" id="likeCnt${post.postId}">${post.recmndCnt}</span>
								</button>
							</c:when>
							<c:otherwise>
								<button data-v-de3ba2dc="" data-v-b0785d82="" id="likeBtn${post.postId}" onclick="likePostBtn('${post.postId}')" class="badge-wrap reactionButton button textColorPrimary">
									<div data-v-6a12716b="" data-v-b0785d82="" class="icon like" data-v-de3ba2dc=""></div>
									<span data-v-de3ba2dc="" id="likeCnt${post.postId}">${post.recmndCnt}</span>
								</button>
							</c:otherwise>
							</c:choose>
							</div>
							</footer></article></li>
						</c:forEach>
						</ul>
						<!---->
						<div data-v-1d0e5362="" class="has-not-more">
							<p data-v-1d0e5362="">
								마지막 게시글입니다.
							</p>
						</div>
					</div>
					</section><aside data-v-1d0e5362="" class="side-item side-area">
					<!---->
					<div data-v-1d0e5362="" class="write-wrap">
						<button data-v-1d0e5362="" class="write-btn"><span data-v-1d0e5362="" class="write-btn-text">글 작성하기</span><svg data-v-1d0e5362="" width="32" height="32" fill="none" xmlns="http://www.w3.org/2000/svg" viewbox="0 0 32 32" class=""><rect data-v-1d0e5362="" x="8" y="26" width="16" height="2" rx="1" fill="#EFEFEF"></rect><path data-v-1d0e5362="" fill-rule="evenodd" clip-rule="evenodd" d="M20.813 5.2a.677.677 0 00-.96-.001L18.362 6.69a1.003 1.003 0 00-.001 1.416l3.935 3.951a.997.997 0 001.413.002l1.491-1.492a.68.68 0 00.001-.962L20.812 5.2zm-3.525 3.976a.999.999 0 00-1.414-.002l-7.67 7.663a.68.68 0 00-.2.48L8 21.717c0 .375.303.68.678.68l4.263.003c.265 0 .52-.105.707-.292l7.577-7.569a1 1 0 00.001-1.415l-3.938-3.948z" fill="#EFEFEF"></path></svg>
						<!---->
						</button>
					</div>
					<div data-v-1d0e5362="" class="mapped-content-wrap">
						<div data-v-91ef3b1e="" data-v-1d0e5362="" class="swiper-wrap">
							<div data-v-91ef3b1e="" class="swiper-container swiper-container-multirow swiper-container-initialized swiper-container-horizontal">
								<div class="swiper-wrapper" style="width: 166px; transform: translate3d(0px, 0px, 0px);">
									<div data-v-91ef3b1e="" class="swiper-slide single-content swiper-slide-active" style="width: 500px;">
										<a data-v-5c10ad9e="" data-v-91ef3b1e="" href="${contextPath}/detail?contentId=${content.contentId}" class="" id="seasonList-116880">
										<div data-v-5c10ad9e="" class="movie_item">
											<div data-v-5c10ad9e="" class="movie_item__poster">
												<img data-v-7874c524="" data-v-3090f2a6="" data-v-5c10ad9e="" alt="${content.title}" class="poster__img" data-src="${content.imgUrl}" src="${content.imgUrl}" lazy="loaded">
											</div>
											<div data-v-5c10ad9e="" class="movie_item__description">
												<h5 data-v-5c10ad9e="" class="description__title">${content.title}</h5>
												<p data-v-5c10ad9e="" class="description__subtitle"> ${content.enrollDt} </p>
											</div>
											<button data-v-5761e1ae="" data-v-5c10ad9e="" type="button" title="보고 싶은 작품을 찜해 보세요" class="movie_more_button content_option_button"><svg data-v-5761e1ae="" width="100%" height="100%" fill="none" xmlns="http://www.w3.org/2000/svg" focusable="false" aria-label="option" viewbox="0 0 32 32" preserveaspectratio="none" class=""><path data-v-5761e1ae="" fill-rule="evenodd" clip-rule="evenodd" d="M16 5a2 2 0 00-2 2v7H7a2 2 0 100 4h7v7a2 2 0 104 0v-7h7a2 2 0 100-4h-7V7a2 2 0 00-2-2z" fill="#EFEFEF"></path></svg></button>
										</div>
										</a>
									</div>
								</div>
								<span class="swiper-notification" aria-live="assertive" aria-atomic="true"></span>
							</div>
							<!---->
							<!---->
						</div>
					</div>
					<!---->
					</aside>
				</div>
			</div>
			<input data-v-1d0e5362="" type="text" class="copy-input"></main>
		</div>
	</div>
</div>

</body>
</html>