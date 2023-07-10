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
		location.href="${contextPath}/community/feed";
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
</head>
<body>

<div id="__nuxt">
	<div id="__layout">
		<div id="root" data-v-00101c0c="">
			<main id="contents" data-v-1d0e5362="" data-v-00101c0c="">
			<section class="fixed-area" data-v-1d0e5362="">
			<header class="header-wrap has-tags" data-v-9938e184="" data-v-1d0e5362="">
			<h1 class="header-title" data-v-9938e184=""> #비공식작전 </h1>
			<div class="left-wrap" data-v-9938e184="">
				<button class="back-btn" data-v-9938e184=""><i class="kino-icon kino-icon--header-back" data-v-9938e184=""></i></button>
				<!---->
			</div>
			</header>
			</section>
			<div class="content-area" data-v-1d0e5362="">
				<div class="grid-container mainContent" data-v-1d0e5362="">
					<section class="banner-area" data-v-1d0e5362="">
					<!---->
					</section>
					<section class="top-item top-area divider-line" data-v-1d0e5362="">
					<div data-v-1d0e5362="" class="tag-area">
						<p data-v-1d0e5362="" class="tag-subtitle">태그 모아보기</p>
						<div data-v-1d0e5362="" class="tags-wrap">
							<div data-v-1d0e5362="" class="tag-wrap">
								<svg data-v-1d0e5362="" width="24" height="24" fill="none" xmlns="http://www.w3.org/2000/svg" class="">
								<path data-v-1d0e5362="" fill-rule="evenodd" clip-rule="evenodd" d="M9.705 3.02a1.286 1.286 0 00-1.49 1.043L7.745 6.74H5.572a1.286 1.286 0 000 2.571H7.29l-.907 5.143H4.286a1.286 1.286 0 100 2.571H5.93l-.393 2.231a1.286 1.286 0 102.532.447l.472-2.678h5.103l-.393 2.231a1.286 1.286 0 102.532.447l.472-2.678h2.173a1.286 1.286 0 000-2.571h-1.72l.907-5.143h2.1a1.286 1.286 0 100-2.571h-1.646l.393-2.23a1.286 1.286 0 10-2.532-.447l-.473 2.677h-5.102l.393-2.23a1.286 1.286 0 00-1.043-1.49zm4.392 11.434l.907-5.143H9.901l-.907 5.143h5.103z" fill="#637DEA"/></svg><span data-v-1d0e5362="" class="tag">비공식작전</span>
							</div>
						</div>
					</div>
					<!---->
					</section>
					<section class="list-item list-area list-area--mapped-contents" data-v-1d0e5362="">
					<!---->
					<div data-v-1d0e5362="" class="list-inner-wrap">
						<p data-v-1d0e5362="" class="list-count">총 62개</p>
						<ul data-v-1d0e5362="">
							<li data-v-1d0e5362="" class="list-gap">
							<article data-v-29756cf4="" data-v-1d0e5362="" class="post-wrap">
							<a data-v-29756cf4="" href="/community/post/IMArO4kB3Eglhu7NqWFJ?tag=%EB%B9%84%EA%B3%B5%EC%8B%9D%EC%9E%91%EC%A0%84" class="" id="postList-IMArO4kB3Eglhu7NqWFJ">
							<header data-v-29756cf4="" class="post-info-wrap">
							<div data-v-29756cf4="" class="post-info-user-wrap">
								<span data-v-29756cf4="" class="user-nickname">CreepRocket</span>
								<!---->
							</div>
							<div data-v-29756cf4="" class="post-info-date-wrap">
								<span data-v-29756cf4="" title="2023-07-10 00:01:04" class="post-date">13시간 전</span>
							</div>
							</header>
							<h2 data-v-29756cf4="" class="post-title">비공식작전 응모 마무으리</h2>
							<p data-v-29756cf4="" class="post-body">
								#영화 #비공식작전 이만큰 넣은만큼 영화도 참 재밌었으면 하네요. 김성훈 감독님....믿습니다 ㅠㅠ
							</p>
							</div>
							<div data-v-29756cf4="" class="content-list-wrap">
								<div data-v-29756cf4="" class="content-wrap">
									<svg data-v-29756cf4="" width="16" height="16" fill="none" xmlns="http://www.w3.org/2000/svg" class=""><path data-v-29756cf4="" d="M15.51 15.019h-3.675A8.006 8.006 0 0016 7.999C16 3.59 12.411 0 8 0S0 3.589 0 8c0 4.41 3.589 8 8 8h7.51a.49.49 0 100-.981zM.98 7.999A7.027 7.027 0 018 .982 7.027 7.027 0 0115.02 8 7.027 7.027 0 018 15.019a7.027 7.027 0 01-7.02-7.02z" fill="#3B4869"></path><path data-v-29756cf4="" fill-rule="evenodd" clip-rule="evenodd" d="M8 16A8 8 0 108 0a8 8 0 000 16zm2-12a2 2 0 11-4 0 2 2 0 014 0zm0 8a2 2 0 11-4 0 2 2 0 014 0zm-6-2a2 2 0 100-4 2 2 0 000 4zm10-2a2 2 0 11-4 0 2 2 0 014 0z" fill="#3B4869"></path></svg><span data-v-29756cf4="" class="content-title">비공식작전</span>
								</div>
								<!---->
							</div>
							</a>
							<footer data-v-29756cf4="" class="post-footer">
							<div data-v-29756cf4="" class="badge-wrap">
								<div data-v-de3ba2dc="" data-v-29756cf4="" class="badge-wrap textColorPrimary">
									<svg data-v-29756cf4="" data-v-de3ba2dc="" width="32" height="32" fill="none" xmlns="http://www.w3.org/2000/svg" viewbox="0 0 32 32" class="icon-color-navy06"><path data-v-29756cf4="" data-v-de3ba2dc="" fill-rule="evenodd" clip-rule="evenodd" d="M28.784 14.794c-4.01-5.263-8.372-7.93-12.97-7.789-3.711.103-6.82 1.995-9.019 3.884-2.2 1.89-3.507 3.793-3.615 3.952v.001c-.25.373-.238.855.028 1.214 4.06 5.47 8.388 8.277 12.88 8.277.159 0 .318-.006.473-.011h.001c3.682-.162 6.707-2.179 8.827-4.178 2.122-2 3.357-4 3.459-4.17.224-.372.2-.834-.064-1.18l-.133.093.133-.093zm-17.164.788c0-2.444 2.072-4.436 4.62-4.436 2.546 0 4.618 1.992 4.618 4.436 0 2.445-2.072 4.437-4.619 4.437-2.547 0-4.619-1.992-4.619-4.436z" fill="#98A4B7"></path></svg><span data-v-de3ba2dc="">256</span>
								</div>
								<div data-v-de3ba2dc="" data-v-29756cf4="" class="badge-wrap textColorPrimary">
									<svg data-v-29756cf4="" data-v-de3ba2dc="" width="32" height="32" fill="none" xmlns="http://www.w3.org/2000/svg" viewbox="0 0 32 32" class="icon-color-navy06"><path data-v-29756cf4="" data-v-de3ba2dc="" fill-rule="evenodd" clip-rule="evenodd" d="M13 5a9 9 0 00-5.79 15.89c.342 2.296-.657 4.867-1.055 5.773a.207.207 0 00.22.286c3.867-.575 6.027-2.341 7.22-3.949H19a9 9 0 100-18h-6z" fill="#eee"></path></svg><span data-v-de3ba2dc="">72</span>
								</div>
							</div>
							<div data-v-29756cf4="" class="badge-wrap">
								<button data-v-de3ba2dc="" data-v-29756cf4="" class="badge-wrap reactionButton button textColorPrimary">
								<div data-v-6a12716b="" data-v-29756cf4="" class="icon like" data-v-de3ba2dc="">
								</div>
								<span data-v-de3ba2dc="">6</span></button>
							</div>
							</footer>
							</article>
							</li>
							<li data-v-1d0e5362="" class="list-gap"><article data-v-29756cf4="" data-v-1d0e5362="" class="post-wrap"><a data-v-29756cf4="" href="/community/post/68AjO4kB3Eglhu7NoWDi?tag=%EB%B9%84%EA%B3%B5%EC%8B%9D%EC%9E%91%EC%A0%84" class="" id="postList-68AjO4kB3Eglhu7NoWDi"><header data-v-29756cf4="" class="post-info-wrap">
							<div data-v-29756cf4="" class="post-info-user-wrap">
								<span data-v-29756cf4="" class="user-nickname">고고한_김혜수_787626</span>
								<!---->
								<!---->
							</div>
							<div data-v-29756cf4="" class="post-info-date-wrap">
								<span data-v-29756cf4="" title="2023-07-09 23:52:18" class="post-date">13시간 전</span>
							</div>
							</header>
							<h2 data-v-29756cf4="" class="post-title">곧 비공식작전 팝콘이 끝나네요</h2>
							<p data-v-29756cf4="" class="post-body">
								#비공식작전 팝콘 튀기느라 처음으로 여기 가입해서 며칠동안 마니 튀겻어요. 댓글 위주로 쓰고 도배하는거 같아서 글은 딱 두개 정도 쓴거같은데 당첨되면 진짜 하늘을 날거같아요!! 워...
							</p>
							<!---->
							<div data-v-29756cf4="" class="content-list-wrap">
								<div data-v-29756cf4="" class="content-wrap">
									<svg data-v-29756cf4="" width="16" height="16" fill="none" xmlns="http://www.w3.org/2000/svg" class=""><path data-v-29756cf4="" d="M15.51 15.019h-3.675A8.006 8.006 0 0016 7.999C16 3.59 12.411 0 8 0S0 3.589 0 8c0 4.41 3.589 8 8 8h7.51a.49.49 0 100-.981zM.98 7.999A7.027 7.027 0 018 .982 7.027 7.027 0 0115.02 8 7.027 7.027 0 018 15.019a7.027 7.027 0 01-7.02-7.02z" fill="#3B4869"></path><path data-v-29756cf4="" fill-rule="evenodd" clip-rule="evenodd" d="M8 16A8 8 0 108 0a8 8 0 000 16zm2-12a2 2 0 11-4 0 2 2 0 014 0zm0 8a2 2 0 11-4 0 2 2 0 014 0zm-6-2a2 2 0 100-4 2 2 0 000 4zm10-2a2 2 0 11-4 0 2 2 0 014 0z" fill="#3B4869"></path></svg><span data-v-29756cf4="" class="content-title">비공식작전</span>
								</div>
								<!---->
							</div>
							</a><footer data-v-29756cf4="" class="post-footer">
							<div data-v-29756cf4="" class="badge-wrap">
								<div data-v-de3ba2dc="" data-v-29756cf4="" class="badge-wrap textColorPrimary">
									<svg data-v-29756cf4="" data-v-de3ba2dc="" width="32" height="32" fill="none" xmlns="http://www.w3.org/2000/svg" viewbox="0 0 32 32" class="icon-color-navy06"><path data-v-29756cf4="" data-v-de3ba2dc="" fill-rule="evenodd" clip-rule="evenodd" d="M28.784 14.794c-4.01-5.263-8.372-7.93-12.97-7.789-3.711.103-6.82 1.995-9.019 3.884-2.2 1.89-3.507 3.793-3.615 3.952v.001c-.25.373-.238.855.028 1.214 4.06 5.47 8.388 8.277 12.88 8.277.159 0 .318-.006.473-.011h.001c3.682-.162 6.707-2.179 8.827-4.178 2.122-2 3.357-4 3.459-4.17.224-.372.2-.834-.064-1.18l-.133.093.133-.093zm-17.164.788c0-2.444 2.072-4.436 4.62-4.436 2.546 0 4.618 1.992 4.618 4.436 0 2.445-2.072 4.437-4.619 4.437-2.547 0-4.619-1.992-4.619-4.436z" fill="#98A4B7"></path></svg><span data-v-de3ba2dc="">127</span>
								</div>
								<div data-v-de3ba2dc="" data-v-29756cf4="" class="badge-wrap textColorPrimary">
									<svg data-v-29756cf4="" data-v-de3ba2dc="" width="32" height="32" fill="none" xmlns="http://www.w3.org/2000/svg" viewbox="0 0 32 32" class="icon-color-navy06"><path data-v-29756cf4="" data-v-de3ba2dc="" fill-rule="evenodd" clip-rule="evenodd" d="M13 5a9 9 0 00-5.79 15.89c.342 2.296-.657 4.867-1.055 5.773a.207.207 0 00.22.286c3.867-.575 6.027-2.341 7.22-3.949H19a9 9 0 100-18h-6z" fill="#eee"></path></svg><span data-v-de3ba2dc="">48</span>
								</div>
							</div>
							<div data-v-29756cf4="" class="badge-wrap">
								<button data-v-de3ba2dc="" data-v-29756cf4="" class="badge-wrap reactionButton button textColorPrimary">
								<div data-v-6a12716b="" data-v-29756cf4="" class="icon like" data-v-de3ba2dc="">
								</div>
								<span data-v-de3ba2dc="">3</span></button>
							</div>
							</footer></article></li>
							<li data-v-1d0e5362="" class="list-gap"><article data-v-29756cf4="" data-v-1d0e5362="" class="post-wrap"><a data-v-29756cf4="" href="/community/post/PcCJOokB3Eglhu7NJF5H?tag=%EB%B9%84%EA%B3%B5%EC%8B%9D%EC%9E%91%EC%A0%84" class="" id="postList-PcCJOokB3Eglhu7NJF5H"><header data-v-29756cf4="" class="post-info-wrap">
							<div data-v-29756cf4="" class="post-info-user-wrap">
								<span data-v-29756cf4="" class="user-nickname">신이난_엠마스톤_275342</span>
								<!---->
								<!---->
							</div>
							<div data-v-29756cf4="" class="post-info-date-wrap">
								<span data-v-29756cf4="" title="2023-07-09 21:03:33" class="post-date">16시간 전</span>
							</div>
							</header>
							<h2 data-v-29756cf4="" class="post-title">저는 8월 2일만 보고</h2>
							<p data-v-29756cf4="" class="post-body">
								살고 있어요..... 그게 아니였음 진작에 주거따 #더문 #비공식작전
							</p>
							<!---->
							<div data-v-29756cf4="" class="content-list-wrap">
								<div data-v-29756cf4="" class="content-wrap">
									<svg data-v-29756cf4="" width="16" height="16" fill="none" xmlns="http://www.w3.org/2000/svg" class=""><path data-v-29756cf4="" d="M15.51 15.019h-3.675A8.006 8.006 0 0016 7.999C16 3.59 12.411 0 8 0S0 3.589 0 8c0 4.41 3.589 8 8 8h7.51a.49.49 0 100-.981zM.98 7.999A7.027 7.027 0 018 .982 7.027 7.027 0 0115.02 8 7.027 7.027 0 018 15.019a7.027 7.027 0 01-7.02-7.02z" fill="#3B4869"></path><path data-v-29756cf4="" fill-rule="evenodd" clip-rule="evenodd" d="M8 16A8 8 0 108 0a8 8 0 000 16zm2-12a2 2 0 11-4 0 2 2 0 014 0zm0 8a2 2 0 11-4 0 2 2 0 014 0zm-6-2a2 2 0 100-4 2 2 0 000 4zm10-2a2 2 0 11-4 0 2 2 0 014 0z" fill="#3B4869"></path></svg><span data-v-29756cf4="" class="content-title">더 문</span>
								</div>
								<div data-v-29756cf4="" class="content-wrap">
									<svg data-v-29756cf4="" width="16" height="16" fill="none" xmlns="http://www.w3.org/2000/svg" class=""><path data-v-29756cf4="" d="M15.51 15.019h-3.675A8.006 8.006 0 0016 7.999C16 3.59 12.411 0 8 0S0 3.589 0 8c0 4.41 3.589 8 8 8h7.51a.49.49 0 100-.981zM.98 7.999A7.027 7.027 0 018 .982 7.027 7.027 0 0115.02 8 7.027 7.027 0 018 15.019a7.027 7.027 0 01-7.02-7.02z" fill="#3B4869"></path><path data-v-29756cf4="" fill-rule="evenodd" clip-rule="evenodd" d="M8 16A8 8 0 108 0a8 8 0 000 16zm2-12a2 2 0 11-4 0 2 2 0 014 0zm0 8a2 2 0 11-4 0 2 2 0 014 0zm-6-2a2 2 0 100-4 2 2 0 000 4zm10-2a2 2 0 11-4 0 2 2 0 014 0z" fill="#3B4869"></path></svg><span data-v-29756cf4="" class="content-title">비공식작전</span>
								</div>
								<!---->
							</div>
							</a><footer data-v-29756cf4="" class="post-footer">
							<div data-v-29756cf4="" class="badge-wrap">
								<div data-v-de3ba2dc="" data-v-29756cf4="" class="badge-wrap textColorPrimary">
									<svg data-v-29756cf4="" data-v-de3ba2dc="" width="32" height="32" fill="none" xmlns="http://www.w3.org/2000/svg" viewbox="0 0 32 32" class="icon-color-navy06"><path data-v-29756cf4="" data-v-de3ba2dc="" fill-rule="evenodd" clip-rule="evenodd" d="M28.784 14.794c-4.01-5.263-8.372-7.93-12.97-7.789-3.711.103-6.82 1.995-9.019 3.884-2.2 1.89-3.507 3.793-3.615 3.952v.001c-.25.373-.238.855.028 1.214 4.06 5.47 8.388 8.277 12.88 8.277.159 0 .318-.006.473-.011h.001c3.682-.162 6.707-2.179 8.827-4.178 2.122-2 3.357-4 3.459-4.17.224-.372.2-.834-.064-1.18l-.133.093.133-.093zm-17.164.788c0-2.444 2.072-4.436 4.62-4.436 2.546 0 4.618 1.992 4.618 4.436 0 2.445-2.072 4.437-4.619 4.437-2.547 0-4.619-1.992-4.619-4.436z" fill="#98A4B7"></path></svg><span data-v-de3ba2dc="">86</span>
								</div>
								<div data-v-de3ba2dc="" data-v-29756cf4="" class="badge-wrap textColorPrimary">
									<svg data-v-29756cf4="" data-v-de3ba2dc="" width="32" height="32" fill="none" xmlns="http://www.w3.org/2000/svg" viewbox="0 0 32 32" class="icon-color-navy06"><path data-v-29756cf4="" data-v-de3ba2dc="" fill-rule="evenodd" clip-rule="evenodd" d="M13 5a9 9 0 00-5.79 15.89c.342 2.296-.657 4.867-1.055 5.773a.207.207 0 00.22.286c3.867-.575 6.027-2.341 7.22-3.949H19a9 9 0 100-18h-6z" fill="#eee"></path></svg><span data-v-de3ba2dc="">27</span>
								</div>
							</div>
							<div data-v-29756cf4="" class="badge-wrap">
								<button data-v-de3ba2dc="" data-v-29756cf4="" class="badge-wrap reactionButton button textColorPrimary">
								<div data-v-6a12716b="" data-v-29756cf4="" class="icon like" data-v-de3ba2dc="">
								</div>
								<span data-v-de3ba2dc="">2</span></button>
							</div>
							</footer></article></li>
							<li data-v-1d0e5362="" class="list-gap"><article data-v-29756cf4="" data-v-1d0e5362="" class="post-wrap"><a data-v-29756cf4="" href="/community/post/eLC7M4kB9cnBH0U-G3An?tag=%EB%B9%84%EA%B3%B5%EC%8B%9D%EC%9E%91%EC%A0%84" class="" id="postList-eLC7M4kB9cnBH0U-G3An"><header data-v-29756cf4="" class="post-info-wrap">
							<div data-v-29756cf4="" class="post-info-user-wrap">
								<span data-v-29756cf4="" class="user-nickname">감마장</span>
								<!---->
								<!---->
							</div>
							<div data-v-29756cf4="" class="post-info-date-wrap">
								<span data-v-29756cf4="" title="2023-07-08 13:20:47" class="post-date">2023.07.08</span>
							</div>
							</header>
							<h2 data-v-29756cf4="" class="post-title">김성훈 감독님</h2>
							<p data-v-29756cf4="" class="post-body">
								정말 기대됩미다 #비공식작전
							</p>
							<!---->
							<div data-v-29756cf4="" class="content-list-wrap">
								<div data-v-29756cf4="" class="content-wrap">
									<svg data-v-29756cf4="" width="16" height="16" fill="none" xmlns="http://www.w3.org/2000/svg" class=""><path data-v-29756cf4="" d="M15.51 15.019h-3.675A8.006 8.006 0 0016 7.999C16 3.59 12.411 0 8 0S0 3.589 0 8c0 4.41 3.589 8 8 8h7.51a.49.49 0 100-.981zM.98 7.999A7.027 7.027 0 018 .982 7.027 7.027 0 0115.02 8 7.027 7.027 0 018 15.019a7.027 7.027 0 01-7.02-7.02z" fill="#3B4869"></path><path data-v-29756cf4="" fill-rule="evenodd" clip-rule="evenodd" d="M8 16A8 8 0 108 0a8 8 0 000 16zm2-12a2 2 0 11-4 0 2 2 0 014 0zm0 8a2 2 0 11-4 0 2 2 0 014 0zm-6-2a2 2 0 100-4 2 2 0 000 4zm10-2a2 2 0 11-4 0 2 2 0 014 0z" fill="#3B4869"></path></svg><span data-v-29756cf4="" class="content-title">비공식작전</span>
								</div>
								<!---->
							</div>
							</a><footer data-v-29756cf4="" class="post-footer">
							<div data-v-29756cf4="" class="badge-wrap">
								<div data-v-de3ba2dc="" data-v-29756cf4="" class="badge-wrap textColorPrimary">
									<svg data-v-29756cf4="" data-v-de3ba2dc="" width="32" height="32" fill="none" xmlns="http://www.w3.org/2000/svg" viewbox="0 0 32 32" class="icon-color-navy06"><path data-v-29756cf4="" data-v-de3ba2dc="" fill-rule="evenodd" clip-rule="evenodd" d="M28.784 14.794c-4.01-5.263-8.372-7.93-12.97-7.789-3.711.103-6.82 1.995-9.019 3.884-2.2 1.89-3.507 3.793-3.615 3.952v.001c-.25.373-.238.855.028 1.214 4.06 5.47 8.388 8.277 12.88 8.277.159 0 .318-.006.473-.011h.001c3.682-.162 6.707-2.179 8.827-4.178 2.122-2 3.357-4 3.459-4.17.224-.372.2-.834-.064-1.18l-.133.093.133-.093zm-17.164.788c0-2.444 2.072-4.436 4.62-4.436 2.546 0 4.618 1.992 4.618 4.436 0 2.445-2.072 4.437-4.619 4.437-2.547 0-4.619-1.992-4.619-4.436z" fill="#98A4B7"></path></svg><span data-v-de3ba2dc="">69</span>
								</div>
								<div data-v-de3ba2dc="" data-v-29756cf4="" class="badge-wrap textColorPrimary">
									<svg data-v-29756cf4="" data-v-de3ba2dc="" width="32" height="32" fill="none" xmlns="http://www.w3.org/2000/svg" viewbox="0 0 32 32" class="icon-color-navy06"><path data-v-29756cf4="" data-v-de3ba2dc="" fill-rule="evenodd" clip-rule="evenodd" d="M13 5a9 9 0 00-5.79 15.89c.342 2.296-.657 4.867-1.055 5.773a.207.207 0 00.22.286c3.867-.575 6.027-2.341 7.22-3.949H19a9 9 0 100-18h-6z" fill="#eee"></path></svg><span data-v-de3ba2dc="">11</span>
								</div>
							</div>
							<div data-v-29756cf4="" class="badge-wrap">
								<button data-v-de3ba2dc="" data-v-29756cf4="" class="badge-wrap reactionButton button textColorPrimary">
								<div data-v-6a12716b="" data-v-29756cf4="" class="icon like" data-v-de3ba2dc="">
								</div>
								<span data-v-de3ba2dc="">1</span></button>
							</div>
							</footer></article></li>
							<li data-v-1d0e5362="" class="list-gap"><article data-v-8a09aa82="" data-v-1d0e5362="" class="blocked-post-wrap">
							<h2 data-v-8a09aa82="" class="blocked-post-title">커뮤니티 정책에 의해 숨겨진 게시글입니다.</h2>
							</article></li>
							<li data-v-1d0e5362="" class="list-gap"><article data-v-29756cf4="" data-v-1d0e5362="" class="post-wrap"><a data-v-29756cf4="" href="/community/post/ArD9MokB9cnBH0U-u2-F?tag=%EB%B9%84%EA%B3%B5%EC%8B%9D%EC%9E%91%EC%A0%84" class="" id="postList-ArD9MokB9cnBH0U-u2-F"><header data-v-29756cf4="" class="post-info-wrap">
							<div data-v-29756cf4="" class="post-info-user-wrap">
								<span data-v-29756cf4="" class="user-nickname">픽시즈</span>
								<!---->
								<!---->
							</div>
							<div data-v-29756cf4="" class="post-info-date-wrap">
								<span data-v-29756cf4="" title="2023-07-08 09:53:56" class="post-date">2023.07.08</span>
							</div>
							</header>
							<h2 data-v-29756cf4="" class="post-title">근데 비공식작전은 진짜 자신있는거같지 않나요?</h2>
							<p data-v-29756cf4="" class="post-body">
								한국영화중에 개봉 3주 전부터 시사회 대량으로 푸는 영화 진짜 드문데... 그리고 대부분 그런 영화들읃 다 대박쳤음 밀수는 워낙 기대치가 높아서 그냥 그 기대치대로 일정 움직이는...
							</p>
							<!---->
							<div data-v-29756cf4="" class="content-list-wrap">
								<div data-v-29756cf4="" class="content-wrap">
									<svg data-v-29756cf4="" width="16" height="16" fill="none" xmlns="http://www.w3.org/2000/svg" class=""><path data-v-29756cf4="" d="M15.51 15.019h-3.675A8.006 8.006 0 0016 7.999C16 3.59 12.411 0 8 0S0 3.589 0 8c0 4.41 3.589 8 8 8h7.51a.49.49 0 100-.981zM.98 7.999A7.027 7.027 0 018 .982 7.027 7.027 0 0115.02 8 7.027 7.027 0 018 15.019a7.027 7.027 0 01-7.02-7.02z" fill="#3B4869"></path><path data-v-29756cf4="" fill-rule="evenodd" clip-rule="evenodd" d="M8 16A8 8 0 108 0a8 8 0 000 16zm2-12a2 2 0 11-4 0 2 2 0 014 0zm0 8a2 2 0 11-4 0 2 2 0 014 0zm-6-2a2 2 0 100-4 2 2 0 000 4zm10-2a2 2 0 11-4 0 2 2 0 014 0z" fill="#3B4869"></path></svg><span data-v-29756cf4="" class="content-title">미션 임파서블: 데드 레코닝 PART ONE</span>
								</div>
								<div data-v-29756cf4="" class="content-wrap">
									<svg data-v-29756cf4="" width="16" height="16" fill="none" xmlns="http://www.w3.org/2000/svg" class=""><path data-v-29756cf4="" d="M15.51 15.019h-3.675A8.006 8.006 0 0016 7.999C16 3.59 12.411 0 8 0S0 3.589 0 8c0 4.41 3.589 8 8 8h7.51a.49.49 0 100-.981zM.98 7.999A7.027 7.027 0 018 .982 7.027 7.027 0 0115.02 8 7.027 7.027 0 018 15.019a7.027 7.027 0 01-7.02-7.02z" fill="#3B4869"></path><path data-v-29756cf4="" fill-rule="evenodd" clip-rule="evenodd" d="M8 16A8 8 0 108 0a8 8 0 000 16zm2-12a2 2 0 11-4 0 2 2 0 014 0zm0 8a2 2 0 11-4 0 2 2 0 014 0zm-6-2a2 2 0 100-4 2 2 0 000 4zm10-2a2 2 0 11-4 0 2 2 0 014 0z" fill="#3B4869"></path></svg><span data-v-29756cf4="" class="content-title">밀수</span>
								</div>
								<div data-v-29756cf4="" class="content-wrap">
									<svg data-v-29756cf4="" width="16" height="16" fill="none" xmlns="http://www.w3.org/2000/svg" class=""><path data-v-29756cf4="" d="M15.51 15.019h-3.675A8.006 8.006 0 0016 7.999C16 3.59 12.411 0 8 0S0 3.589 0 8c0 4.41 3.589 8 8 8h7.51a.49.49 0 100-.981zM.98 7.999A7.027 7.027 0 018 .982 7.027 7.027 0 0115.02 8 7.027 7.027 0 018 15.019a7.027 7.027 0 01-7.02-7.02z" fill="#3B4869"></path><path data-v-29756cf4="" fill-rule="evenodd" clip-rule="evenodd" d="M8 16A8 8 0 108 0a8 8 0 000 16zm2-12a2 2 0 11-4 0 2 2 0 014 0zm0 8a2 2 0 11-4 0 2 2 0 014 0zm-6-2a2 2 0 100-4 2 2 0 000 4zm10-2a2 2 0 11-4 0 2 2 0 014 0z" fill="#3B4869"></path></svg><span data-v-29756cf4="" class="content-title">비공식작전</span>
								</div>
								<!---->
							</div>
							</a><footer data-v-29756cf4="" class="post-footer">
							<div data-v-29756cf4="" class="badge-wrap">
								<div data-v-de3ba2dc="" data-v-29756cf4="" class="badge-wrap textColorPrimary">
									<svg data-v-29756cf4="" data-v-de3ba2dc="" width="32" height="32" fill="none" xmlns="http://www.w3.org/2000/svg" viewbox="0 0 32 32" class="icon-color-navy06"><path data-v-29756cf4="" data-v-de3ba2dc="" fill-rule="evenodd" clip-rule="evenodd" d="M28.784 14.794c-4.01-5.263-8.372-7.93-12.97-7.789-3.711.103-6.82 1.995-9.019 3.884-2.2 1.89-3.507 3.793-3.615 3.952v.001c-.25.373-.238.855.028 1.214 4.06 5.47 8.388 8.277 12.88 8.277.159 0 .318-.006.473-.011h.001c3.682-.162 6.707-2.179 8.827-4.178 2.122-2 3.357-4 3.459-4.17.224-.372.2-.834-.064-1.18l-.133.093.133-.093zm-17.164.788c0-2.444 2.072-4.436 4.62-4.436 2.546 0 4.618 1.992 4.618 4.436 0 2.445-2.072 4.437-4.619 4.437-2.547 0-4.619-1.992-4.619-4.436z" fill="#98A4B7"></path></svg><span data-v-de3ba2dc="">162</span>
								</div>
								<div data-v-de3ba2dc="" data-v-29756cf4="" class="badge-wrap textColorPrimary">
									<svg data-v-29756cf4="" data-v-de3ba2dc="" width="32" height="32" fill="none" xmlns="http://www.w3.org/2000/svg" viewbox="0 0 32 32" class="icon-color-navy06"><path data-v-29756cf4="" data-v-de3ba2dc="" fill-rule="evenodd" clip-rule="evenodd" d="M13 5a9 9 0 00-5.79 15.89c.342 2.296-.657 4.867-1.055 5.773a.207.207 0 00.22.286c3.867-.575 6.027-2.341 7.22-3.949H19a9 9 0 100-18h-6z" fill="#eee"></path></svg><span data-v-de3ba2dc="">28</span>
								</div>
							</div>
							<div data-v-29756cf4="" class="badge-wrap">
								<button data-v-de3ba2dc="" data-v-29756cf4="" class="badge-wrap reactionButton button textColorPrimary">
								<div data-v-6a12716b="" data-v-29756cf4="" class="icon like" data-v-de3ba2dc="">
								</div>
								<span data-v-de3ba2dc="">2</span></button>
							</div>
							</footer></article></li>
							<li data-v-1d0e5362="" class="list-gap"><article data-v-29756cf4="" data-v-1d0e5362="" class="post-wrap"><a data-v-29756cf4="" href="/community/post/oLDIMokB9cnBH0U-rW6u?tag=%EB%B9%84%EA%B3%B5%EC%8B%9D%EC%9E%91%EC%A0%84" class="" id="postList-oLDIMokB9cnBH0U-rW6u"><header data-v-29756cf4="" class="post-info-wrap">
							<div data-v-29756cf4="" class="post-info-user-wrap">
								<span data-v-29756cf4="" class="user-nickname"> 쉼표860508</span><span data-v-bffb6c62="" data-v-29756cf4="" class="user-badge">
								킷발
								<div data-v-bffb6c62="" class="icon">
									⛳️
								</div>
								</span>
								<!---->
							</div>
							<div data-v-29756cf4="" class="post-info-date-wrap">
								<span data-v-29756cf4="" title="2023-07-08 08:55:59" class="post-date">2023.07.08</span>
							</div>
							</header>
							<h2 data-v-29756cf4="" class="post-title">&lt;비공식작전&gt;시사회 정보</h2>
							<p data-v-29756cf4="" class="post-body">
								* 메가박스 회원시사회 https://m.megabox.co.kr/event/detail?eventNo=13609 *대전교통공사https://m.blog.naver.com/d...
							</p>
							<div data-v-29756cf4="" class="og-graph-wrap">
								<div data-v-50a93d1e="" data-v-29756cf4="" class="og-link">
									<div data-v-50a93d1e="" class="og-link__info">
										<p data-v-50a93d1e="" class="og-link__info__title">
											[메가박스]&lt;비공식작전&gt; 메가박스 회원 시사회
										</p>
										<p data-v-50a93d1e="" class="og-link__info__publisher">
											메가박스
										</p>
									</div>
									<div data-v-50a93d1e="" class="og-link__image">
										<img data-v-50a93d1e="" alt="[메가박스]<비공식작전> 메가박스 회원 시사회" src="https://img.megabox.co.kr/SharedImg/event/2023/07/03/wHIpMoPhj4P5PriPtHHPsHpUNNVLgzuo.jpg" loading="lazy" decoding="async">
									</div>
								</div>
							</div>
							<div data-v-29756cf4="" class="content-list-wrap">
								<div data-v-29756cf4="" class="content-wrap">
									<svg data-v-29756cf4="" width="16" height="16" fill="none" xmlns="http://www.w3.org/2000/svg" class=""><path data-v-29756cf4="" d="M15.51 15.019h-3.675A8.006 8.006 0 0016 7.999C16 3.59 12.411 0 8 0S0 3.589 0 8c0 4.41 3.589 8 8 8h7.51a.49.49 0 100-.981zM.98 7.999A7.027 7.027 0 018 .982 7.027 7.027 0 0115.02 8 7.027 7.027 0 018 15.019a7.027 7.027 0 01-7.02-7.02z" fill="#3B4869"></path><path data-v-29756cf4="" fill-rule="evenodd" clip-rule="evenodd" d="M8 16A8 8 0 108 0a8 8 0 000 16zm2-12a2 2 0 11-4 0 2 2 0 014 0zm0 8a2 2 0 11-4 0 2 2 0 014 0zm-6-2a2 2 0 100-4 2 2 0 000 4zm10-2a2 2 0 11-4 0 2 2 0 014 0z" fill="#3B4869"></path></svg><span data-v-29756cf4="" class="content-title">비공식작전</span>
								</div>
								<!---->
							</div>
							</a><footer data-v-29756cf4="" class="post-footer">
							<div data-v-29756cf4="" class="badge-wrap">
								<div data-v-de3ba2dc="" data-v-29756cf4="" class="badge-wrap textColorPrimary">
									<svg data-v-29756cf4="" data-v-de3ba2dc="" width="32" height="32" fill="none" xmlns="http://www.w3.org/2000/svg" viewbox="0 0 32 32" class="icon-color-navy06"><path data-v-29756cf4="" data-v-de3ba2dc="" fill-rule="evenodd" clip-rule="evenodd" d="M28.784 14.794c-4.01-5.263-8.372-7.93-12.97-7.789-3.711.103-6.82 1.995-9.019 3.884-2.2 1.89-3.507 3.793-3.615 3.952v.001c-.25.373-.238.855.028 1.214 4.06 5.47 8.388 8.277 12.88 8.277.159 0 .318-.006.473-.011h.001c3.682-.162 6.707-2.179 8.827-4.178 2.122-2 3.357-4 3.459-4.17.224-.372.2-.834-.064-1.18l-.133.093.133-.093zm-17.164.788c0-2.444 2.072-4.436 4.62-4.436 2.546 0 4.618 1.992 4.618 4.436 0 2.445-2.072 4.437-4.619 4.437-2.547 0-4.619-1.992-4.619-4.436z" fill="#98A4B7"></path></svg><span data-v-de3ba2dc="">155</span>
								</div>
								<div data-v-de3ba2dc="" data-v-29756cf4="" class="badge-wrap textColorPrimary">
									<svg data-v-29756cf4="" data-v-de3ba2dc="" width="32" height="32" fill="none" xmlns="http://www.w3.org/2000/svg" viewbox="0 0 32 32" class="icon-color-navy06"><path data-v-29756cf4="" data-v-de3ba2dc="" fill-rule="evenodd" clip-rule="evenodd" d="M13 5a9 9 0 00-5.79 15.89c.342 2.296-.657 4.867-1.055 5.773a.207.207 0 00.22.286c3.867-.575 6.027-2.341 7.22-3.949H19a9 9 0 100-18h-6z" fill="#eee"></path></svg><span data-v-de3ba2dc="">39</span>
								</div>
							</div>
							<div data-v-29756cf4="" class="badge-wrap">
								<button data-v-de3ba2dc="" data-v-29756cf4="" class="badge-wrap reactionButton button textColorPrimary">
								<div data-v-6a12716b="" data-v-29756cf4="" class="icon like" data-v-de3ba2dc="">
								</div>
								<span data-v-de3ba2dc="">3</span></button>
							</div>
							</footer></article></li>
							<li data-v-1d0e5362="" class="list-gap"><article data-v-29756cf4="" data-v-1d0e5362="" class="post-wrap"><a data-v-29756cf4="" href="/community/post/lsB4MIkB3Eglhu7NTU60?tag=%EB%B9%84%EA%B3%B5%EC%8B%9D%EC%9E%91%EC%A0%84" class="" id="postList-lsB4MIkB3Eglhu7NTU60"><header data-v-29756cf4="" class="post-info-wrap">
							<div data-v-29756cf4="" class="post-info-user-wrap">
								<span data-v-29756cf4="" class="user-nickname">가자가자리</span>
								<!---->
								<!---->
							</div>
							<div data-v-29756cf4="" class="post-info-date-wrap">
								<span data-v-29756cf4="" title="2023-07-07 22:08:57" class="post-date">2023.07.07</span>
							</div>
							</header>
							<h2 data-v-29756cf4="" class="post-title">기대되는 신작 영화들</h2>
							<p data-v-29756cf4="" class="post-body">
								7월 26일에 김혜수 염정아 주연에 조인성, 박정민 배우가 출연하는 영화 밀수가 개봉하는 데 가장 기대하고 있는 여름 영화입니다. 그 외에도 이병헌 박서준 박보영 주연의 콘크리트유...
							</p>
							<!---->
							<div data-v-29756cf4="" class="content-list-wrap">
								<div data-v-29756cf4="" class="content-wrap">
									<svg data-v-29756cf4="" width="16" height="16" fill="none" xmlns="http://www.w3.org/2000/svg" class=""><path data-v-29756cf4="" d="M15.51 15.019h-3.675A8.006 8.006 0 0016 7.999C16 3.59 12.411 0 8 0S0 3.589 0 8c0 4.41 3.589 8 8 8h7.51a.49.49 0 100-.981zM.98 7.999A7.027 7.027 0 018 .982 7.027 7.027 0 0115.02 8 7.027 7.027 0 018 15.019a7.027 7.027 0 01-7.02-7.02z" fill="#3B4869"></path><path data-v-29756cf4="" fill-rule="evenodd" clip-rule="evenodd" d="M8 16A8 8 0 108 0a8 8 0 000 16zm2-12a2 2 0 11-4 0 2 2 0 014 0zm0 8a2 2 0 11-4 0 2 2 0 014 0zm-6-2a2 2 0 100-4 2 2 0 000 4zm10-2a2 2 0 11-4 0 2 2 0 014 0z" fill="#3B4869"></path></svg><span data-v-29756cf4="" class="content-title">콘크리트 유토피아</span>
								</div>
								<div data-v-29756cf4="" class="content-wrap">
									<svg data-v-29756cf4="" width="16" height="16" fill="none" xmlns="http://www.w3.org/2000/svg" class=""><path data-v-29756cf4="" d="M15.51 15.019h-3.675A8.006 8.006 0 0016 7.999C16 3.59 12.411 0 8 0S0 3.589 0 8c0 4.41 3.589 8 8 8h7.51a.49.49 0 100-.981zM.98 7.999A7.027 7.027 0 018 .982 7.027 7.027 0 0115.02 8 7.027 7.027 0 018 15.019a7.027 7.027 0 01-7.02-7.02z" fill="#3B4869"></path><path data-v-29756cf4="" fill-rule="evenodd" clip-rule="evenodd" d="M8 16A8 8 0 108 0a8 8 0 000 16zm2-12a2 2 0 11-4 0 2 2 0 014 0zm0 8a2 2 0 11-4 0 2 2 0 014 0zm-6-2a2 2 0 100-4 2 2 0 000 4zm10-2a2 2 0 11-4 0 2 2 0 014 0z" fill="#3B4869"></path></svg><span data-v-29756cf4="" class="content-title">더 문</span>
								</div>
								<div data-v-29756cf4="" class="content-wrap">
									<svg data-v-29756cf4="" width="16" height="16" fill="none" xmlns="http://www.w3.org/2000/svg" class=""><path data-v-29756cf4="" d="M15.51 15.019h-3.675A8.006 8.006 0 0016 7.999C16 3.59 12.411 0 8 0S0 3.589 0 8c0 4.41 3.589 8 8 8h7.51a.49.49 0 100-.981zM.98 7.999A7.027 7.027 0 018 .982 7.027 7.027 0 0115.02 8 7.027 7.027 0 018 15.019a7.027 7.027 0 01-7.02-7.02z" fill="#3B4869"></path><path data-v-29756cf4="" fill-rule="evenodd" clip-rule="evenodd" d="M8 16A8 8 0 108 0a8 8 0 000 16zm2-12a2 2 0 11-4 0 2 2 0 014 0zm0 8a2 2 0 11-4 0 2 2 0 014 0zm-6-2a2 2 0 100-4 2 2 0 000 4zm10-2a2 2 0 11-4 0 2 2 0 014 0z" fill="#3B4869"></path></svg><span data-v-29756cf4="" class="content-title">밀수</span>
								</div>
								<div data-v-29756cf4="" class="other-content">
									+1
								</div>
							</div>
							</a><footer data-v-29756cf4="" class="post-footer">
							<div data-v-29756cf4="" class="badge-wrap">
								<div data-v-de3ba2dc="" data-v-29756cf4="" class="badge-wrap textColorPrimary">
									<svg data-v-29756cf4="" data-v-de3ba2dc="" width="32" height="32" fill="none" xmlns="http://www.w3.org/2000/svg" viewbox="0 0 32 32" class="icon-color-navy06"><path data-v-29756cf4="" data-v-de3ba2dc="" fill-rule="evenodd" clip-rule="evenodd" d="M28.784 14.794c-4.01-5.263-8.372-7.93-12.97-7.789-3.711.103-6.82 1.995-9.019 3.884-2.2 1.89-3.507 3.793-3.615 3.952v.001c-.25.373-.238.855.028 1.214 4.06 5.47 8.388 8.277 12.88 8.277.159 0 .318-.006.473-.011h.001c3.682-.162 6.707-2.179 8.827-4.178 2.122-2 3.357-4 3.459-4.17.224-.372.2-.834-.064-1.18l-.133.093.133-.093zm-17.164.788c0-2.444 2.072-4.436 4.62-4.436 2.546 0 4.618 1.992 4.618 4.436 0 2.445-2.072 4.437-4.619 4.437-2.547 0-4.619-1.992-4.619-4.436z" fill="#98A4B7"></path></svg><span data-v-de3ba2dc="">108</span>
								</div>
								<div data-v-de3ba2dc="" data-v-29756cf4="" class="badge-wrap textColorPrimary">
									<svg data-v-29756cf4="" data-v-de3ba2dc="" width="32" height="32" fill="none" xmlns="http://www.w3.org/2000/svg" viewbox="0 0 32 32" class="icon-color-navy06"><path data-v-29756cf4="" data-v-de3ba2dc="" fill-rule="evenodd" clip-rule="evenodd" d="M13 5a9 9 0 00-5.79 15.89c.342 2.296-.657 4.867-1.055 5.773a.207.207 0 00.22.286c3.867-.575 6.027-2.341 7.22-3.949H19a9 9 0 100-18h-6z" fill="#eee"></path></svg><span data-v-de3ba2dc="">36</span>
								</div>
							</div>
							<div data-v-29756cf4="" class="badge-wrap">
								<button data-v-de3ba2dc="" data-v-29756cf4="" class="badge-wrap reactionButton button textColorPrimary">
								<div data-v-6a12716b="" data-v-29756cf4="" class="icon like" data-v-de3ba2dc="">
								</div>
								<span data-v-de3ba2dc="">6</span></button>
							</div>
							</footer></article></li>
							<li data-v-1d0e5362="" class="list-gap"><article data-v-29756cf4="" data-v-1d0e5362="" class="post-wrap"><a data-v-29756cf4="" href="/community/post/hcCWL4kB3Eglhu7NnUtI?tag=%EB%B9%84%EA%B3%B5%EC%8B%9D%EC%9E%91%EC%A0%84" class="" id="postList-hcCWL4kB3Eglhu7NnUtI"><header data-v-29756cf4="" class="post-info-wrap">
							<div data-v-29756cf4="" class="post-info-user-wrap">
								<span data-v-29756cf4="" class="user-nickname">르그므르흐</span><span data-v-bffb6c62="" data-v-29756cf4="" class="user-badge">
								킷발
								<div data-v-bffb6c62="" class="icon">
									⛳️
								</div>
								</span>
								<!---->
							</div>
							<div data-v-29756cf4="" class="post-info-date-wrap">
								<span data-v-29756cf4="" title="2023-07-07 18:02:27" class="post-date">2023.07.07</span>
							</div>
							</header>
							<h2 data-v-29756cf4="" class="post-title">&lt;비공식작전&gt; 제작기 영상</h2>
							<p data-v-29756cf4="" class="post-body">
								https://youtu.be/bZmNO5U3qYA#영화 #비공식작전
							</p>
							<div data-v-29756cf4="" class="thumbnail-wrap">
								<img data-v-29756cf4="" alt="thumbnail" data-src="https://i.ytimg.com/vi/bZmNO5U3qYA/hqdefault.jpg" src="https://nujhrcqkiwag1408085.cdn.ntruss.com/static/common/poster_lazyload.png" lazy="loading">
								<!---->
							</div>
							<div data-v-29756cf4="" class="content-list-wrap">
								<div data-v-29756cf4="" class="content-wrap">
									<svg data-v-29756cf4="" width="16" height="16" fill="none" xmlns="http://www.w3.org/2000/svg" class=""><path data-v-29756cf4="" d="M15.51 15.019h-3.675A8.006 8.006 0 0016 7.999C16 3.59 12.411 0 8 0S0 3.589 0 8c0 4.41 3.589 8 8 8h7.51a.49.49 0 100-.981zM.98 7.999A7.027 7.027 0 018 .982 7.027 7.027 0 0115.02 8 7.027 7.027 0 018 15.019a7.027 7.027 0 01-7.02-7.02z" fill="#3B4869"></path><path data-v-29756cf4="" fill-rule="evenodd" clip-rule="evenodd" d="M8 16A8 8 0 108 0a8 8 0 000 16zm2-12a2 2 0 11-4 0 2 2 0 014 0zm0 8a2 2 0 11-4 0 2 2 0 014 0zm-6-2a2 2 0 100-4 2 2 0 000 4zm10-2a2 2 0 11-4 0 2 2 0 014 0z" fill="#3B4869"></path></svg><span data-v-29756cf4="" class="content-title">비공식작전</span>
								</div>
								<!---->
							</div>
							</a><footer data-v-29756cf4="" class="post-footer">
							<div data-v-29756cf4="" class="badge-wrap">
								<div data-v-de3ba2dc="" data-v-29756cf4="" class="badge-wrap textColorPrimary">
									<svg data-v-29756cf4="" data-v-de3ba2dc="" width="32" height="32" fill="none" xmlns="http://www.w3.org/2000/svg" viewbox="0 0 32 32" class="icon-color-navy06"><path data-v-29756cf4="" data-v-de3ba2dc="" fill-rule="evenodd" clip-rule="evenodd" d="M28.784 14.794c-4.01-5.263-8.372-7.93-12.97-7.789-3.711.103-6.82 1.995-9.019 3.884-2.2 1.89-3.507 3.793-3.615 3.952v.001c-.25.373-.238.855.028 1.214 4.06 5.47 8.388 8.277 12.88 8.277.159 0 .318-.006.473-.011h.001c3.682-.162 6.707-2.179 8.827-4.178 2.122-2 3.357-4 3.459-4.17.224-.372.2-.834-.064-1.18l-.133.093.133-.093zm-17.164.788c0-2.444 2.072-4.436 4.62-4.436 2.546 0 4.618 1.992 4.618 4.436 0 2.445-2.072 4.437-4.619 4.437-2.547 0-4.619-1.992-4.619-4.436z" fill="#98A4B7"></path></svg><span data-v-de3ba2dc="">51</span>
								</div>
								<div data-v-de3ba2dc="" data-v-29756cf4="" class="badge-wrap textColorPrimary">
									<svg data-v-29756cf4="" data-v-de3ba2dc="" width="32" height="32" fill="none" xmlns="http://www.w3.org/2000/svg" viewbox="0 0 32 32" class="icon-color-navy06"><path data-v-29756cf4="" data-v-de3ba2dc="" fill-rule="evenodd" clip-rule="evenodd" d="M13 5a9 9 0 00-5.79 15.89c.342 2.296-.657 4.867-1.055 5.773a.207.207 0 00.22.286c3.867-.575 6.027-2.341 7.22-3.949H19a9 9 0 100-18h-6z" fill="#eee"></path></svg><span data-v-de3ba2dc="">15</span>
								</div>
							</div>
							<div data-v-29756cf4="" class="badge-wrap">
								<button data-v-de3ba2dc="" data-v-29756cf4="" class="badge-wrap reactionButton button textColorPrimary">
								<div data-v-6a12716b="" data-v-29756cf4="" class="icon like" data-v-de3ba2dc="">
								</div>
								<span data-v-de3ba2dc="">3</span></button>
							</div>
							</footer></article></li>
							<li data-v-1d0e5362="" class="list-gap"><article data-v-29756cf4="" data-v-1d0e5362="" class="post-wrap"><a data-v-29756cf4="" href="/community/post/vLBVL4kB9cnBH0U-jGjS?tag=%EB%B9%84%EA%B3%B5%EC%8B%9D%EC%9E%91%EC%A0%84" class="" id="postList-vLBVL4kB9cnBH0U-jGjS"><header data-v-29756cf4="" class="post-info-wrap">
							<div data-v-29756cf4="" class="post-info-user-wrap">
								<span data-v-29756cf4="" class="user-nickname">한겨울아이스라떼</span>
								<!---->
								<!---->
							</div>
							<div data-v-29756cf4="" class="post-info-date-wrap">
								<span data-v-29756cf4="" title="2023-07-07 16:51:23" class="post-date">2023.07.07</span>
							</div>
							</header>
							<h2 data-v-29756cf4="" class="post-title">비공식작전 들어갑니다ㅎㅎ</h2>
							<p data-v-29756cf4="" class="post-body">
								#영화 #비공식작전 너무 인기가 많을 것 같아 가만히 있다가 튀겨놓은 팝콘 70개 정도 넣었더니 그래도 15퍼센트대네요. 그냥 운이다..라고 생각하고 더는 안 넣으려구요. ...
							</p>
							<!---->
							<!---->
							</a><footer data-v-29756cf4="" class="post-footer">
							<div data-v-29756cf4="" class="badge-wrap">
								<div data-v-de3ba2dc="" data-v-29756cf4="" class="badge-wrap textColorPrimary">
									<svg data-v-29756cf4="" data-v-de3ba2dc="" width="32" height="32" fill="none" xmlns="http://www.w3.org/2000/svg" viewbox="0 0 32 32" class="icon-color-navy06"><path data-v-29756cf4="" data-v-de3ba2dc="" fill-rule="evenodd" clip-rule="evenodd" d="M28.784 14.794c-4.01-5.263-8.372-7.93-12.97-7.789-3.711.103-6.82 1.995-9.019 3.884-2.2 1.89-3.507 3.793-3.615 3.952v.001c-.25.373-.238.855.028 1.214 4.06 5.47 8.388 8.277 12.88 8.277.159 0 .318-.006.473-.011h.001c3.682-.162 6.707-2.179 8.827-4.178 2.122-2 3.357-4 3.459-4.17.224-.372.2-.834-.064-1.18l-.133.093.133-.093zm-17.164.788c0-2.444 2.072-4.436 4.62-4.436 2.546 0 4.618 1.992 4.618 4.436 0 2.445-2.072 4.437-4.619 4.437-2.547 0-4.619-1.992-4.619-4.436z" fill="#98A4B7"></path></svg><span data-v-de3ba2dc="">109</span>
								</div>
								<div data-v-de3ba2dc="" data-v-29756cf4="" class="badge-wrap textColorPrimary">
									<svg data-v-29756cf4="" data-v-de3ba2dc="" width="32" height="32" fill="none" xmlns="http://www.w3.org/2000/svg" viewbox="0 0 32 32" class="icon-color-navy06"><path data-v-29756cf4="" data-v-de3ba2dc="" fill-rule="evenodd" clip-rule="evenodd" d="M13 5a9 9 0 00-5.79 15.89c.342 2.296-.657 4.867-1.055 5.773a.207.207 0 00.22.286c3.867-.575 6.027-2.341 7.22-3.949H19a9 9 0 100-18h-6z" fill="#eee"></path></svg><span data-v-de3ba2dc="">29</span>
								</div>
							</div>
							<div data-v-29756cf4="" class="badge-wrap">
								<button data-v-de3ba2dc="" data-v-29756cf4="" class="badge-wrap reactionButton button textColorPrimary">
								<div data-v-6a12716b="" data-v-29756cf4="" class="icon default" data-v-de3ba2dc="">
								</div>
								<span data-v-de3ba2dc="">0</span></button>
							</div>
							</footer></article></li>
							<li data-v-1d0e5362="" class="list-gap"><article data-v-29756cf4="" data-v-1d0e5362="" class="post-wrap"><a data-v-29756cf4="" href="/community/post/8bAqLokB9cnBH0U-5mSP?tag=%EB%B9%84%EA%B3%B5%EC%8B%9D%EC%9E%91%EC%A0%84" class="" id="postList-8bAqLokB9cnBH0U-5mSP"><header data-v-29756cf4="" class="post-info-wrap">
							<div data-v-29756cf4="" class="post-info-user-wrap">
								<span data-v-29756cf4="" class="user-nickname">깜찍한_엠마스톤_923761</span>
								<!---->
								<!---->
							</div>
							<div data-v-29756cf4="" class="post-info-date-wrap">
								<span data-v-29756cf4="" title="2023-07-07 11:25:10" class="post-date">2023.07.07</span>
							</div>
							</header>
							<h2 data-v-29756cf4="" class="post-title">이번 개봉작들</h2>
							<p data-v-29756cf4="" class="post-body">
								이번 여름에 개봉학는 작들 되게 기대되는게 많네요! 밀수도 그렇고 콘크리트 유토피아 비공식작전 더 문 미션임파서블 등 등... 여러분들은 어떤게 제일 기대되나요??#영화 #밀수 #...
							</p>
							<!---->
							<div data-v-29756cf4="" class="content-list-wrap">
								<div data-v-29756cf4="" class="content-wrap">
									<svg data-v-29756cf4="" width="16" height="16" fill="none" xmlns="http://www.w3.org/2000/svg" class=""><path data-v-29756cf4="" d="M15.51 15.019h-3.675A8.006 8.006 0 0016 7.999C16 3.59 12.411 0 8 0S0 3.589 0 8c0 4.41 3.589 8 8 8h7.51a.49.49 0 100-.981zM.98 7.999A7.027 7.027 0 018 .982 7.027 7.027 0 0115.02 8 7.027 7.027 0 018 15.019a7.027 7.027 0 01-7.02-7.02z" fill="#3B4869"></path><path data-v-29756cf4="" fill-rule="evenodd" clip-rule="evenodd" d="M8 16A8 8 0 108 0a8 8 0 000 16zm2-12a2 2 0 11-4 0 2 2 0 014 0zm0 8a2 2 0 11-4 0 2 2 0 014 0zm-6-2a2 2 0 100-4 2 2 0 000 4zm10-2a2 2 0 11-4 0 2 2 0 014 0z" fill="#3B4869"></path></svg><span data-v-29756cf4="" class="content-title">콘크리트 유토피아</span>
								</div>
								<div data-v-29756cf4="" class="content-wrap">
									<svg data-v-29756cf4="" width="16" height="16" fill="none" xmlns="http://www.w3.org/2000/svg" class=""><path data-v-29756cf4="" d="M15.51 15.019h-3.675A8.006 8.006 0 0016 7.999C16 3.59 12.411 0 8 0S0 3.589 0 8c0 4.41 3.589 8 8 8h7.51a.49.49 0 100-.981zM.98 7.999A7.027 7.027 0 018 .982 7.027 7.027 0 0115.02 8 7.027 7.027 0 018 15.019a7.027 7.027 0 01-7.02-7.02z" fill="#3B4869"></path><path data-v-29756cf4="" fill-rule="evenodd" clip-rule="evenodd" d="M8 16A8 8 0 108 0a8 8 0 000 16zm2-12a2 2 0 11-4 0 2 2 0 014 0zm0 8a2 2 0 11-4 0 2 2 0 014 0zm-6-2a2 2 0 100-4 2 2 0 000 4zm10-2a2 2 0 11-4 0 2 2 0 014 0z" fill="#3B4869"></path></svg><span data-v-29756cf4="" class="content-title">밀수</span>
								</div>
								<div data-v-29756cf4="" class="content-wrap">
									<svg data-v-29756cf4="" width="16" height="16" fill="none" xmlns="http://www.w3.org/2000/svg" class=""><path data-v-29756cf4="" d="M15.51 15.019h-3.675A8.006 8.006 0 0016 7.999C16 3.59 12.411 0 8 0S0 3.589 0 8c0 4.41 3.589 8 8 8h7.51a.49.49 0 100-.981zM.98 7.999A7.027 7.027 0 018 .982 7.027 7.027 0 0115.02 8 7.027 7.027 0 018 15.019a7.027 7.027 0 01-7.02-7.02z" fill="#3B4869"></path><path data-v-29756cf4="" fill-rule="evenodd" clip-rule="evenodd" d="M8 16A8 8 0 108 0a8 8 0 000 16zm2-12a2 2 0 11-4 0 2 2 0 014 0zm0 8a2 2 0 11-4 0 2 2 0 014 0zm-6-2a2 2 0 100-4 2 2 0 000 4zm10-2a2 2 0 11-4 0 2 2 0 014 0z" fill="#3B4869"></path></svg><span data-v-29756cf4="" class="content-title">비공식작전</span>
								</div>
								<!---->
							</div>
							</a><footer data-v-29756cf4="" class="post-footer">
							<div data-v-29756cf4="" class="badge-wrap">
								<div data-v-de3ba2dc="" data-v-29756cf4="" class="badge-wrap textColorPrimary">
									<svg data-v-29756cf4="" data-v-de3ba2dc="" width="32" height="32" fill="none" xmlns="http://www.w3.org/2000/svg" viewbox="0 0 32 32" class="icon-color-navy06"><path data-v-29756cf4="" data-v-de3ba2dc="" fill-rule="evenodd" clip-rule="evenodd" d="M28.784 14.794c-4.01-5.263-8.372-7.93-12.97-7.789-3.711.103-6.82 1.995-9.019 3.884-2.2 1.89-3.507 3.793-3.615 3.952v.001c-.25.373-.238.855.028 1.214 4.06 5.47 8.388 8.277 12.88 8.277.159 0 .318-.006.473-.011h.001c3.682-.162 6.707-2.179 8.827-4.178 2.122-2 3.357-4 3.459-4.17.224-.372.2-.834-.064-1.18l-.133.093.133-.093zm-17.164.788c0-2.444 2.072-4.436 4.62-4.436 2.546 0 4.618 1.992 4.618 4.436 0 2.445-2.072 4.437-4.619 4.437-2.547 0-4.619-1.992-4.619-4.436z" fill="#98A4B7"></path></svg><span data-v-de3ba2dc="">136</span>
								</div>
								<div data-v-de3ba2dc="" data-v-29756cf4="" class="badge-wrap textColorPrimary">
									<svg data-v-29756cf4="" data-v-de3ba2dc="" width="32" height="32" fill="none" xmlns="http://www.w3.org/2000/svg" viewbox="0 0 32 32" class="icon-color-navy06"><path data-v-29756cf4="" data-v-de3ba2dc="" fill-rule="evenodd" clip-rule="evenodd" d="M13 5a9 9 0 00-5.79 15.89c.342 2.296-.657 4.867-1.055 5.773a.207.207 0 00.22.286c3.867-.575 6.027-2.341 7.22-3.949H19a9 9 0 100-18h-6z" fill="#eee"></path></svg><span data-v-de3ba2dc="">41</span>
								</div>
							</div>
							<div data-v-29756cf4="" class="badge-wrap">
								<button data-v-de3ba2dc="" data-v-29756cf4="" class="badge-wrap reactionButton button textColorPrimary">
								<div data-v-6a12716b="" data-v-29756cf4="" class="icon like" data-v-de3ba2dc="">
								</div>
								<span data-v-de3ba2dc="">3</span></button>
							</div>
							</footer></article></li>
							<li data-v-1d0e5362="" class="list-gap"><article data-v-29756cf4="" data-v-1d0e5362="" class="post-wrap"><a data-v-29756cf4="" href="/community/post/qMCJLYkB3Eglhu7NL0Wa?tag=%EB%B9%84%EA%B3%B5%EC%8B%9D%EC%9E%91%EC%A0%84" class="" id="postList-qMCJLYkB3Eglhu7NL0Wa"><header data-v-29756cf4="" class="post-info-wrap">
							<div data-v-29756cf4="" class="post-info-user-wrap">
								<span data-v-29756cf4="" class="user-nickname">굿즈창고</span>
								<!---->
								<!---->
							</div>
							<div data-v-29756cf4="" class="post-info-date-wrap">
								<span data-v-29756cf4="" title="2023-07-07 08:28:32" class="post-date">2023.07.07</span>
							</div>
							</header>
							<h2 data-v-29756cf4="" class="post-title">밀수vs비공식작전</h2>
							<p data-v-29756cf4="" class="post-body">
								여러분은 어떤 영화 시사회에 응모 하셨나요? 전 밀수 입니다! 김혜수 배우님 만나보는게 버킷리스트라서;; 당첨되면 좋겠습니다ㅎ 모두 파이팅! #밀수 #비공식작전
							</p>
							<!---->
							<div data-v-29756cf4="" class="content-list-wrap">
								<div data-v-29756cf4="" class="content-wrap">
									<svg data-v-29756cf4="" width="16" height="16" fill="none" xmlns="http://www.w3.org/2000/svg" class=""><path data-v-29756cf4="" d="M15.51 15.019h-3.675A8.006 8.006 0 0016 7.999C16 3.59 12.411 0 8 0S0 3.589 0 8c0 4.41 3.589 8 8 8h7.51a.49.49 0 100-.981zM.98 7.999A7.027 7.027 0 018 .982 7.027 7.027 0 0115.02 8 7.027 7.027 0 018 15.019a7.027 7.027 0 01-7.02-7.02z" fill="#3B4869"></path><path data-v-29756cf4="" fill-rule="evenodd" clip-rule="evenodd" d="M8 16A8 8 0 108 0a8 8 0 000 16zm2-12a2 2 0 11-4 0 2 2 0 014 0zm0 8a2 2 0 11-4 0 2 2 0 014 0zm-6-2a2 2 0 100-4 2 2 0 000 4zm10-2a2 2 0 11-4 0 2 2 0 014 0z" fill="#3B4869"></path></svg><span data-v-29756cf4="" class="content-title">밀수</span>
								</div>
								<div data-v-29756cf4="" class="content-wrap">
									<svg data-v-29756cf4="" width="16" height="16" fill="none" xmlns="http://www.w3.org/2000/svg" class=""><path data-v-29756cf4="" d="M15.51 15.019h-3.675A8.006 8.006 0 0016 7.999C16 3.59 12.411 0 8 0S0 3.589 0 8c0 4.41 3.589 8 8 8h7.51a.49.49 0 100-.981zM.98 7.999A7.027 7.027 0 018 .982 7.027 7.027 0 0115.02 8 7.027 7.027 0 018 15.019a7.027 7.027 0 01-7.02-7.02z" fill="#3B4869"></path><path data-v-29756cf4="" fill-rule="evenodd" clip-rule="evenodd" d="M8 16A8 8 0 108 0a8 8 0 000 16zm2-12a2 2 0 11-4 0 2 2 0 014 0zm0 8a2 2 0 11-4 0 2 2 0 014 0zm-6-2a2 2 0 100-4 2 2 0 000 4zm10-2a2 2 0 11-4 0 2 2 0 014 0z" fill="#3B4869"></path></svg><span data-v-29756cf4="" class="content-title">비공식작전</span>
								</div>
								<!---->
							</div>
							</a><footer data-v-29756cf4="" class="post-footer">
							<div data-v-29756cf4="" class="badge-wrap">
								<div data-v-de3ba2dc="" data-v-29756cf4="" class="badge-wrap textColorPrimary">
									<svg data-v-29756cf4="" data-v-de3ba2dc="" width="32" height="32" fill="none" xmlns="http://www.w3.org/2000/svg" viewbox="0 0 32 32" class="icon-color-navy06"><path data-v-29756cf4="" data-v-de3ba2dc="" fill-rule="evenodd" clip-rule="evenodd" d="M28.784 14.794c-4.01-5.263-8.372-7.93-12.97-7.789-3.711.103-6.82 1.995-9.019 3.884-2.2 1.89-3.507 3.793-3.615 3.952v.001c-.25.373-.238.855.028 1.214 4.06 5.47 8.388 8.277 12.88 8.277.159 0 .318-.006.473-.011h.001c3.682-.162 6.707-2.179 8.827-4.178 2.122-2 3.357-4 3.459-4.17.224-.372.2-.834-.064-1.18l-.133.093.133-.093zm-17.164.788c0-2.444 2.072-4.436 4.62-4.436 2.546 0 4.618 1.992 4.618 4.436 0 2.445-2.072 4.437-4.619 4.437-2.547 0-4.619-1.992-4.619-4.436z" fill="#98A4B7"></path></svg><span data-v-de3ba2dc="">149</span>
								</div>
								<div data-v-de3ba2dc="" data-v-29756cf4="" class="badge-wrap textColorPrimary">
									<svg data-v-29756cf4="" data-v-de3ba2dc="" width="32" height="32" fill="none" xmlns="http://www.w3.org/2000/svg" viewbox="0 0 32 32" class="icon-color-navy06"><path data-v-29756cf4="" data-v-de3ba2dc="" fill-rule="evenodd" clip-rule="evenodd" d="M13 5a9 9 0 00-5.79 15.89c.342 2.296-.657 4.867-1.055 5.773a.207.207 0 00.22.286c3.867-.575 6.027-2.341 7.22-3.949H19a9 9 0 100-18h-6z" fill="#eee"></path></svg><span data-v-de3ba2dc="">31</span>
								</div>
							</div>
							<div data-v-29756cf4="" class="badge-wrap">
								<button data-v-de3ba2dc="" data-v-29756cf4="" class="badge-wrap reactionButton button textColorPrimary">
								<div data-v-6a12716b="" data-v-29756cf4="" class="icon like" data-v-de3ba2dc="">
								</div>
								<span data-v-de3ba2dc="">4</span></button>
							</div>
							</footer></article></li>
						</ul>
						<div data-v-07a4f3b7="" data-v-1d0e5362="" class="default-bottom-loader">
							<div data-v-07a4f3b7="" class="loader">
								<svg data-v-07a4f3b7="" viewbox="25 25 50 50" class="circular-loader"><circle data-v-07a4f3b7="" cx="50" cy="50" r="20" fill="none" stroke-width="6" class="loader-path"></circle></svg>
							</div>
						</div>
						<!---->
					</div>
					</section><aside class="side-item side-area" data-v-1d0e5362="">
					<!---->
					<div class="write-wrap" data-v-1d0e5362="">
						<button class="write-btn" data-v-1d0e5362=""><span class="write-btn-text" data-v-1d0e5362="">글 작성하기</span><svg width="32" height="32" fill="none" xmlns="http://www.w3.org/2000/svg" viewbox="0 0 32 32" data-v-1d0e5362="" class=""><rect x="8" y="26" width="16" height="2" rx="1" fill="#EFEFEF" data-v-1d0e5362=""></rect><path fill-rule="evenodd" clip-rule="evenodd" d="M20.813 5.2a.677.677 0 00-.96-.001L18.362 6.69a1.003 1.003 0 00-.001 1.416l3.935 3.951a.997.997 0 001.413.002l1.491-1.492a.68.68 0 00.001-.962L20.812 5.2zm-3.525 3.976a.999.999 0 00-1.414-.002l-7.67 7.663a.68.68 0 00-.2.48L8 21.717c0 .375.303.68.678.68l4.263.003c.265 0 .52-.105.707-.292l7.577-7.569a1 1 0 00.001-1.415l-3.938-3.948z" fill="#EFEFEF" data-v-1d0e5362=""></path></svg>
						<!---->
						</button>
					</div>
					<div data-v-1d0e5362="" class="mapped-content-wrap">
						<div data-v-91ef3b1e="" data-v-1d0e5362="" class="swiper-wrap">
							<div data-v-91ef3b1e="" class="swiper-container swiper-container-multirow swiper-container-initialized swiper-container-horizontal">
								<div class="swiper-wrapper" style="width: 166px; transform: translate3d(0px, 0px, 0px);">
									<div data-v-91ef3b1e="" class="swiper-slide single-content swiper-slide-active" style="width: 166px;">
										<a data-v-5c10ad9e="" data-v-91ef3b1e="" href="/title/102319" class="" id="seasonList-102319">
										<div data-v-5c10ad9e="" class="movie_item">
											<div data-v-5c10ad9e="" class="movie_item__poster">
												<img data-v-7874c524="" data-v-3090f2a6="" data-v-5c10ad9e="" alt="비공식작전" class="poster__img" data-src="https://nujhrcqkiwag1408085.cdn.ntruss.com/static/upload/movie_poster_images/280x400/movie_102319_1687192867.jpg" src="https://nujhrcqkiwag1408085.cdn.ntruss.com/static/upload/movie_poster_images/280x400/movie_102319_1687192867.jpg" lazy="loaded">
											</div>
											<div data-v-5c10ad9e="" class="movie_item__description">
												<h5 data-v-5c10ad9e="" class="description__title">비공식작전</h5>
												<p data-v-5c10ad9e="" class="description__subtitle">
													영화 · 2023
												</p>
												<div data-v-5c10ad9e="" class="description__bottom">
													<img data-v-5c10ad9e="" src="https://static.kinolights.com/icon/light-normal.svg" alt="light-normal" class="light">
													<!---->
												</div>
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
		</div>
	</div>
</div>

</body>
</html>