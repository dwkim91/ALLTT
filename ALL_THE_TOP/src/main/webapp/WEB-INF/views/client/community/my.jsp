<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>myPage</title>
<link rel="stylesheet" href="${contextPath}/resources/css/my.css" type="text/css">
<script src="${contextPath}/resources/jquery/jquery-3.6.1.min.js"></script>
<script>
$(function() {
	
	// 뒤로가기 버튼
	$(".back-btn").click(function() {
		location.href="${contextPath}/community/feed";
	});
	
	// 어느곳에 focused를 줄건지
	$("#${tab}Tab").addClass('focused');

	// 게시글 탭과 댓글 탭을 와리가리 하는 과정
	$(document).on('click', '.tab-item:not(.focused)', function() {
		// 기존에 focused 클래스를 가진 요소에서 focused 클래스 제거
		$('.tab-item.focused').removeClass('focused');

		// 클릭한 요소에 focused 클래스 추가
		$(this).addClass('focused');
		
		// 해당 페이지로 이동
		location.href="${contextPath}/community/my?tab=" + $(this).attr('id').replace('Tab', '');
		
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
				<main data-v-487a239a="" data-v-00101c0c="" id="contents">
				<section data-v-487a239a="" class="fixed-area">
				<header data-v-36d2ff30="" data-v-487a239a="" class="header-wrap">
				<h1 data-v-36d2ff30="" class="header-title"> 내 활동 내역 </h1>
				<div data-v-36d2ff30="" class="left-wrap">
					<button data-v-36d2ff30="" class="back-btn"><i data-v-36d2ff30="" class="kino-icon kino-icon--header-back"></i></button>
				</div>
				</header>
				</section>
				<section data-v-487a239a="" class="content-area">
				<div data-v-487a239a="" class="mainContent">
					<div data-v-487a239a="" class="content-inner-wrap">
					<c:choose>
						<c:when test="${myList != null }">
							<p data-v-487a239a="" class="count-wrap">총 ${myList.size()}개</p>
							<c:choose>
								<c:when test="${tab eq 'post'}">
									<ul data-v-487a239a="">
									<c:forEach var="myPost" items="${myList}">
										<li data-v-487a239a="" class="posts-gap">
										<article data-v-b0785d82="" data-v-487a239a="" class="post-wrap">
										<a data-v-b0785d82="" href="${contextPath}/community/post?postId=${myPost.postId}" id="undefined-p7DLH4kB9cnBH0U-iFAK">
											<header data-v-b0785d82="" class="post-info-wrap">
											<div data-v-b0785d82="" class="post-info-user-wrap">
												<span data-v-b0785d82="" class="user-nickname">${myPost.nickName}</span>
											</div>
											<div data-v-b0785d82="" class="post-info-date-wrap">
												<span data-v-b0785d82="" title="${myPost.enrollDt}" class="post-date"></span>
											</div>
											</header>
											<h2 data-v-b0785d82="" class="post-title">${myPost.postTitle}</h2>
											<p data-v-b0785d82="" class="post-body">${myPost.content}</p>
											<c:if test="${myPost.postTag != null}">
												<div data-v-b0785d82="" class="content-list-wrap">
													<div data-v-b0785d82="" class="content-wrap">
														<svg data-v-b0785d82="" width="16" height="16" fill="none" xmlns="http://www.w3.org/2000/svg" class=""><path data-v-b0785d82="" d="M15.51 15.019h-3.675A8.006 8.006 0 0016 7.999C16 3.59 12.411 0 8 0S0 3.589 0 8c0 4.41 3.589 8 8 8h7.51a.49.49 0 100-.981zM.98 7.999A7.027 7.027 0 018 .982 7.027 7.027 0 0115.02 8 7.027 7.027 0 018 15.019a7.027 7.027 0 01-7.02-7.02z" fill="#6A5656"></path><path data-v-b0785d82="" fill-rule="evenodd" clip-rule="evenodd" d="M8 16A8 8 0 108 0a8 8 0 000 16zm2-12a2 2 0 11-4 0 2 2 0 014 0zm0 8a2 2 0 11-4 0 2 2 0 014 0zm-6-2a2 2 0 100-4 2 2 0 000 4zm10-2a2 2 0 11-4 0 2 2 0 014 0z" fill="#6A5656"/></svg><span data-v-b0785d82="" class="content-title">${myPost.postTag}</span>
													</div>
												</div>
											</c:if>
										</a>
										<footer data-v-b0785d82="" class="post-footer">
										<div data-v-b0785d82="" class="badge-wrap">
											<div data-v-de3ba2dc="" data-v-b0785d82="" class="badge-wrap textColorPrimary">
												<svg data-v-b0785d82="" data-v-de3ba2dc="" width="32" height="32" fill="none" xmlns="http://www.w3.org/2000/svg" viewbox="0 0 32 32" class="icon-color-navy06"><path data-v-b0785d82="" data-v-de3ba2dc="" fill-rule="evenodd" clip-rule="evenodd" d="M28.784 14.794c-4.01-5.263-8.372-7.93-12.97-7.789-3.711.103-6.82 1.995-9.019 3.884-2.2 1.89-3.507 3.793-3.615 3.952v.001c-.25.373-.238.855.028 1.214 4.06 5.47 8.388 8.277 12.88 8.277.159 0 .318-.006.473-.011h.001c3.682-.162 6.707-2.179 8.827-4.178 2.122-2 3.357-4 3.459-4.17.224-.372.2-.834-.064-1.18l-.133.093.133-.093zm-17.164.788c0-2.444 2.072-4.436 4.62-4.436 2.546 0 4.618 1.992 4.618 4.436 0 2.445-2.072 4.437-4.619 4.437-2.547 0-4.619-1.992-4.619-4.436z" fill="#98A4B7"></path></svg><span data-v-de3ba2dc="">${myPost.readCnt}</span>
											</div>
											<div data-v-de3ba2dc="" data-v-b0785d82="" class="badge-wrap textColorPrimary">
												<svg data-v-b0785d82="" data-v-de3ba2dc="" width="32" height="32" fill="none" xmlns="http://www.w3.org/2000/svg" viewbox="0 0 32 32" class="icon-color-navy06"><path data-v-b0785d82="" data-v-de3ba2dc="" fill-rule="evenodd" clip-rule="evenodd" d="M13 5a9 9 0 00-5.79 15.89c.342 2.296-.657 4.867-1.055 5.773a.207.207 0 00.22.286c3.867-.575 6.027-2.341 7.22-3.949H19a9 9 0 100-18h-6z" fill="#eee"></path></svg><span data-v-de3ba2dc="">${myPost.replyCnt}</span>
											</div>
										</div>
										<div data-v-29756cf4="" class="badge-wrap">
										<c:choose>
										<c:when test="${myPost.myRecmnd != 0}">
											<button data-v-de3ba2dc="" data-v-b0785d82="" id="likeBtn${myPost.postId}" onclick="likePostBtn('${myPost.postId}')" class="badge-wrap reactionButton button textColorPrimary active">
												<div data-v-6a12716b="" data-v-b0785d82="" class="icon like" data-v-de3ba2dc=""></div>
												<span data-v-de3ba2dc="" id="likeCnt${myPost.postId}">${myPost.recmndCnt}</span>
											</button>
										</c:when>
										<c:otherwise>
											<button data-v-de3ba2dc="" data-v-b0785d82="" id="likeBtn${myPost.postId}" onclick="likePostBtn('${myPost.postId}')" class="badge-wrap reactionButton button textColorPrimary">
												<div data-v-6a12716b="" data-v-b0785d82="" class="icon like" data-v-de3ba2dc=""></div>
												<span data-v-de3ba2dc="" id="likeCnt${myPost.postId}">${myPost.recmndCnt}</span>
											</button>
										</c:otherwise>
										</c:choose>
										</div>
										</footer>
										</article>
										</li>
									</c:forEach>
									</ul>
								</c:when>
								<c:otherwise>
								<ul data-v-487a239a="">
								<c:forEach var="myPost" items="${myList}">
									<div data-v-f30c54de="" data-v-487a239a="" class="my-comment-item-wrap comments-gap">
										<div data-v-f30c54de="" class="post-wrap">
											<h2 data-v-f30c54de="" class="">${myPost.postTitle}</h2>
												<a data-v-f30c54de="" href="${contextPath}/community/post?postId=${myPost.postId}" class="link-area"></a>
										</div>
										<div data-v-f30c54de="" class="comment-wrap">
										<p data-v-f30c54de="" class="content-area">${myPost.content}</p>
										<span data-v-f30c54de="" title="${myPost.enrollDt}" class="date"></span>
										</div>
									</div>
								</c:forEach>
								</ul>
								</c:otherwise>
							</c:choose>
						</c:when>
						<c:otherwise>
							<p data-v-487a239a="" class="count-wrap"> 회원님의 활동을 확인할 수 없습니다! </p>
						</c:otherwise>
					</c:choose>
					</div>
				</div>
				</section>
				<aside data-v-487a239a="" class="side-area">
				<div data-v-487a239a="" class="side-tab-wrap">
					<div data-v-487a239a="" id="postTab" class="tab-item">
						<span data-v-487a239a="">내가 쓴 글</span>
					</div>
					<div data-v-487a239a="" id="commentTab" class="tab-item">
						<span data-v-487a239a="">내가 쓴 댓글</span>
					</div>
				</div>
				</aside>
				<!---->
				</main>
			</div>
		</div>
	</div>

</body>
</html>