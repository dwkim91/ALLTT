<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${contextPath}/resources/bootstrap/css/post-custom.css" type="text/css">
<link data-n-head="ssr" rel="icon" type="image/png" sizes="32x32" href="https://nujhrcqkiwag1408085.cdn.ntruss.com/static/common/icon/favicon-33x33.png">
<script src="${contextPath}/resources/bootstrap/js/community-getTimeDiff.js"></script>
<script src="${contextPath}/resources/bootstrap/js/post-checkContentWish.js"></script>
<script src="${contextPath}/resources/bootstrap/js/post-replyAction.js"></script>
<script>
$(function() {

	$(".post-date").each(function() {
		const enrollDt = $(this).attr("title"); // 등록일자 데이터 가져오기
		const formattedDate = elapsedTime(enrollDt); // 시간 간격 변환
		$(this).text(formattedDate); // 변환된 시간 간격으로 표시
	});
	
	$(".date").each(function() {
		const replyId = $(this).attr("replyId");
		const enrollDt = $(this).attr("title");
		const formattedDate = elapsedTime(enrollDt);
		$(this).text(formattedDate);
	});
	
	checkContentWish("${checkContentMyWish}");
	
	// 뒤로가기
	$(".back-btn").click(function() {
		history.go(-1);
	});
	
	// 홈버튼
	$("#communityHomeBtn").click(function() {
		location.href="${contextPath}/community/feed";
	});
	
	// 댓글 작성 칸에 댓글 내용이 적혀야지만 button 활성화
	$("#replyArea").on('keydown', function(event) {
		if (event.key === 'Enter') {
			event.preventDefault();
		}
		var replyContent = $(this).val()

		if (replyContent.length > 0) {
			$("#addReplyBtn").removeClass("submit").addClass("submit active").prop("disabled", false);
		}
		else {
			$("#addReplyBtn").removeClass("submit active").addClass("submit").prop("disabled", true);
		}
    });
	
	// 댓글 추가 처리
	$("#addReplyBtn").click(function() {
		if ($("#modifyCancel").css("display") === "none") {
			var postId = "${post.postId}";
			var content = $("#replyArea").val();
			var memberId = "${sessionScope.memberId}";
		
			var param = {
				"postId" : postId,
				"content" : content,
				"memberId" : memberId
			};
			
			$.ajax({
				url : "${contextPath}/community/addReply",
				async : true,
				type : "POST",
				data : param,
				beforeSend: function(xhr) {
				    // CSRF 토큰을 요청 헤더에 추가
				    xhr.setRequestHeader("X-CSRF-TOKEN", csrfToken);
				},
				success : function(data) {
					// 등록이 완료되면 게시판으로 이동
					if (data == "inserted") {
						alert("댓글이 등록되었습니다.");
					}
				}
			});
		}
	});

	// 좋아요 표시
	$("#likeBtn").click(function() {
		$(this).toggleClass("active");
		
		var param = {
				"memberId" : "${memberId}",
				"postId" : "${post.postId}"
			};
		
		$.ajax({
			 url : "${contextPath}/community/postRecmnd",
			 async : true,
			 type : "POST",
			 data : param,
			 beforeSend: function(xhr) {
				    // CSRF 토큰을 요청 헤더에 추가
				    xhr.setRequestHeader("X-CSRF-TOKEN", csrfToken);
				},
			 success : function(result) {
				$("#likeCnt").html(result);
			 }
		});
	});
	
	// 수정하기, 삭제하기 modal 창 열기
	$(".more-button").click(function() {
		// 게시글 작성자만 이 정보를 볼 수 있도록
		if ("${post.memberId}" == "${sessionScope.memberId}") {
			$("div[data-v-327582cc][data-v-00101c0c]").css("display", "block");
			$("#postModal").css("display", "block");
			// body 스크롤 비활성화
			$("body").css("overflow", "hidden");
			
			// 동적으로 모달창 닫는 클릭 이벤트 핸들러 등록
			$("body").on("click", ".modal-bg", function() {
				$("div[data-v-327582cc][data-v-00101c0c]").css("display", "none");
				$("#postModal").css("display", "none");
				$("body").css("overflow", "auto");
			});
			
			// 게시글 수정하기 버튼
			$("#modifyPost").click(function() {
				// 우선 한번 더 검증하는 느낌
				if ("${post.memberId}" == "${sessionScope.memberId}") {
					// 모달창을 닫고 넘어가자
					$("div[data-v-327582cc][data-v-00101c0c]").css("display", "none");
					$("#postModal").css("display", "none");
					$("body").css("overflow", "auto");

					location.href="${contextPath}/community/modify?postId=${post.postId}";
				}
				else {
					alert("잘못된 접근입니다.");
					location.href="${contextPath}/community/feed";
				}
			});
			
			// 삭제하기 버튼
			$("#deletePost").click(function() {
				// 한번 더 검증
				if ("${post.memberId}" == "${sessionScope.memberId}") {
					
					// 모달창 열어서 여기서 처리하자 #deleteModal
					$("#postModal").css("display", "none");
					$("#deleteModal").css("display", "block");
					
					// 동적으로 모달창 닫는 클릭 이벤트 핸들러 등록
					$("body").on("click", ".modal-bg", function() {
						$("div[data-v-327582cc][data-v-00101c0c]").css("display", "none");
						$("#deleteModal").css("display", "none");
						$("body").css("overflow", "auto");
					});
					
					// 뒤로가기
					$("#delete_cancel_btn").click(function() {
						$("div[data-v-327582cc][data-v-00101c0c]").css("display", "none");
						$("#deleteModal").css("display", "none");
						$("body").css("overflow", "auto");
					})
					
					// 비밀번호 입력하고 삭제하기
					$("#delete_confirm_btn").click(function() {
						
						var param = {
								"postId" : "${post.postId}",
								"memberId" : "${sessionScope.memberId}",
								"passwd" : $("#deletePwIn").val()
							};
						
						$.ajax({
							url : "${contextPath}/community/deletePost",
							data : param,
							async : true,
							type : "POST",
							beforeSend: function(xhr) {
							    // CSRF 토큰을 요청 헤더에 추가
							    xhr.setRequestHeader("X-CSRF-TOKEN", csrfToken);
							},
							success : function(data) {
								// 등록이 완료되면 게시판으로 이동
								if (data == "deleted") {
									alert("게시글이 삭제되었습니다.");
									location.href="${contextPath}/community/feed";
								}
								else {
									alert("비밀번호를 확인해주세요.");
									$("#deletePwIn").focus();
								}
							}
						});
					});
				}
				else {
					alert("잘못된 접근입니다.");
					location.href="${contextPath}/community/feed";
				}
			});
		}
		else {
			alert("작성자만 확인할 수 있습니다.");
		}
	});

	// 컨텐츠 + 버튼 
	// 내가 찜한 컨텐츠면 취소되도록, 찜 안한 컨텐츠면 찜 되도록 수정해야함
	$(".movie_more_button").click(function() {
		event.preventDefault(); // 기본 클릭 동작을 중단 -> 컨텐츠 디테일 페이지로 넘어가지 않도록

		
		var param = {
			"memberId"  : "${sessionScope.memberId}",
			"contentId" : "${content.contentId}"
		};
		
		$.ajax({
			
			url : "${contextPath}/community/addMyContent",
			data : param,
			async : true,
			type : "POST",
			beforeSend: function(xhr) {
			    // CSRF 토큰을 요청 헤더에 추가
			    xhr.setRequestHeader("X-CSRF-TOKEN", csrfToken);
			},
			success : function(result) {
				
				if (result) {
					alert("찜 되었습니다.");
					$("#contentWish").attr("src", "${contextPath}/resources/bootstrap/img/like_after.png");
				}
				else {
					alert("찜 해제되었습니다.");
					$("#contentWish").attr("src", "${contextPath}/resources/bootstrap/img/like_before.png");
				}
				
			}
		});
	});
	
});
</script>
</head>
<body>

<div id="root" data-v-75f0040c="">
	<main data-v-af062606="" data-v-75f0040c="" id="contents">
		<section data-v-af062606="" class="fixed-area">
			<header data-v-36d2ff30="" data-v-af062606="" class="header-wrap">
				<div data-v-36d2ff30="" class="left-wrap">
					<button data-v-36d2ff30="" class="back-btn">
						<i data-v-36d2ff30="" class="kino-icon kino-icon--header-back"></i>
					</button>
					<button data-v-36d2ff30="" id="communityHomeBtn" class="home-btn">
						<svg data-v-36d2ff30="" width="22" height="22" fill="none" xmlns="http://www.w3.org/2000/svg" class="">
						<path data-v-36d2ff30="" fill-rule="evenodd" clip-rule="evenodd" d="M10.43 4.294L4.364 9.57a.687.687 0 00.45 1.206h.913v6.875c0 .38.307.688.687.688h2.75v-2.75c0-.38.308-.688.688-.688h2.062c.38 0 .688.308.688.688v2.75h2.75c.38 0 .687-.308.687-.688v-6.875h.912a.687.687 0 00.45-1.206l-6.067-5.276a.688.688 0 00-.902 0z" fill="#f0a9a9"></path></svg>
						<span data-v-36d2ff30="">커뮤니티</span>
					</button>
				</div>
				<div data-v-af062606="" data-v-36d2ff30="" class="header-button-wrap">
					<button data-v-af062606="" data-v-36d2ff30="" class="more-button">
						<i data-v-af062606="" class="kino-icon kino-icon--more-dot" data-v-36d2ff30="" style="width: 32px; height: 32px;"></i>
					</button>
				</div>
			</header>
		</section>
		<section data-v-af062606="" class="content-area">
			<div data-v-af062606="">
				<div data-v-af062606="" class="mainContent">
					<div data-v-af062606="" class="post-info-wrap section-divider">
						<div data-v-af062606="" class="post-info-user-wrap">
							<div data-v-af062606="" class="post-author-wrap">
								<c:choose>
								<c:when test="${post.nickName != null}">
								<span data-v-af062606="" class="user-nickname">${post.nickName}</span>
								</c:when>
								<c:otherwise>
								<span data-v-af062606="" class="user-nickname">탈퇴한 회원입니다</span>
								</c:otherwise>
								</c:choose>
							</div>
							<div data-v-af062606="" class="post-info-date-wrap">
								<span data-v-af062606="" class="post-date" title="${post.enrollDt}">${post.enrollDt}</span>
							</div>
						</div>
						<div data-v-af062606="" class="post-body">
							<h1 data-v-af062606="" class="post-title">${post.postTitle}</h1>
							<div data-v-4179835d="" data-v-af062606="" class="post-body">
								<div data-v-4179835d="" class="post_editor post_editor--readonly">
									<div data-v-4179835d="" class="post_editor__main">
										<div data-v-4179835d="" class="main__writer">
											<div>${post.content}</div>
										</div>
									</div>
								</div>
							</div>
						</div>
						<div data-v-af062606="" class="post-footer">
							<div data-v-af062606="" class="badge-wrap">
								<div data-v-de3ba2dc="" data-v-af062606="" class="badge-wrap textColorPrimary">
									<svg data-v-af062606="" data-v-de3ba2dc="" width="32" height="32" fill="none" xmlns="http://www.w3.org/2000/svg" viewbox="0 0 32 32" class="icon-color-navy06"><path data-v-af062606="" data-v-de3ba2dc="" fill-rule="evenodd" clip-rule="evenodd" d="M28.784 14.794c-4.01-5.263-8.372-7.93-12.97-7.789-3.711.103-6.82 1.995-9.019 3.884-2.2 1.89-3.507 3.793-3.615 3.952v.001c-.25.373-.238.855.028 1.214 4.06 5.47 8.388 8.277 12.88 8.277.159 0 .318-.006.473-.011h.001c3.682-.162 6.707-2.179 8.827-4.178 2.122-2 3.357-4 3.459-4.17.224-.372.2-.834-.064-1.18l-.133.093.133-.093zm-17.164.788c0-2.444 2.072-4.436 4.62-4.436 2.546 0 4.618 1.992 4.618 4.436 0 2.445-2.072 4.437-4.619 4.437-2.547 0-4.619-1.992-4.619-4.436z" fill="#98A4B7"></path></svg><span data-v-de3ba2dc="">${post.readCnt}</span>
								</div>
								<div data-v-de3ba2dc="" data-v-af062606="" class="badge-wrap textColorPrimary">
									<svg data-v-af062606="" data-v-de3ba2dc="" width="32" height="32" fill="none" xmlns="http://www.w3.org/2000/svg" viewbox="0 0 32 32" class="icon-color-navy06"><path data-v-af062606="" data-v-de3ba2dc="" fill-rule="evenodd" clip-rule="evenodd" d="M13 5a9 9 0 00-5.79 15.89c.342 2.296-.657 4.867-1.055 5.773a.207.207 0 00.22.286c3.867-.575 6.027-2.341 7.22-3.949H19a9 9 0 100-18h-6z" fill="#eee"></path></svg><span data-v-de3ba2dc="">${replyList.size()}</span>
								</div>
							<c:choose>
							<c:when test="${post.myRecmnd == 0}">
								<button data-v-de3ba2dc="" data-v-b0785d82="" id="likeBtn" class="badge-wrap reactionButton button textColorPrimary">
									<div data-v-6a12716b="" data-v-b0785d82="" class="icon like" data-v-de3ba2dc="">
									</div>
									<span data-v-de3ba2dc="" id="likeCnt">${post.recmndCnt}</span>
								</button>
							</c:when>
							<c:otherwise>
								<button data-v-de3ba2dc="" data-v-b0785d82="" id="likeBtn" class="badge-wrap reactionButton button textColorPrimary active">
									<div data-v-6a12716b="" data-v-b0785d82="" class="icon like" data-v-de3ba2dc="">
									</div>
									<span data-v-de3ba2dc="" id="likeCnt">${post.recmndCnt}</span>
								</button>
							</c:otherwise>
							</c:choose>
							</div>
						</div>
					</div>
					<c:if test="${content != null}">
					<div data-v-af062606="" class="post-content-wrap section-divider">
						<h2 data-v-af062606="" class="post-content-subtitle subtitle">${post.nickName}님이 연결한 작품</h2>
						<a data-v-5c10ad9e="" data-v-af062606="" href="${contextPath}/detail?contentId=${content.contentId}" class="" id="seasonList-15474">
							<div data-v-5c10ad9e="" class="movie_item">
								<div data-v-5c10ad9e="" class="movie_item__poster">
									<img data-v-7874c524="" data-v-3090f2a6="" data-v-5c10ad9e="" alt="${content.title}" class="poster__img" data-src="${content.imgUrl}" src="${content.imgUrl}" lazy="loaded">
								</div>
								<div data-v-5c10ad9e="" class="movie_item__description">
									<h5 data-v-5c10ad9e="" class="description__title">${content.title}</h5>
									<p data-v-5c10ad9e="" class="description__subtitle">
										${content.contentType}<c:if test="${content.enrollDt != 9999}"><span data-v-5c10ad9e="" class="description__subtitle"> · ${content.enrollDt}</span></c:if>
									</p>
									<div data-v-5c10ad9e="" class="description__bottom">
									</div>
								</div>
								<button data-v-5761e1ae="" data-v-5c10ad9e="" type="button" title="보고 싶은 작품을 찜해 보세요" class="movie_more_button content_option_button">
									<img src="${contextPath}/resources/bootstrap/img/like_before.png" id="contentWish" style="max-width: 90%; max-height: 90%;" >
								</button>
							</div>
						</a>
					</div>
					</c:if>
					<div data-v-af062606="" class="comments-area">
					<c:choose>
					<c:when test="${replyList.size() != 0}">
						<h2 data-v-af062606="" class="subtitle margin"> 댓글 <span data-v-af062606="">${replyList.size()}</span></h2>
						<ul data-v-ed47b9c6="" data-v-af062606="" class="comment-list-wrap">
							<c:forEach var="reply" items="${replyList}">
									<li data-v-ed47b9c6="" class="comment-list">
									<div data-v-4851ddd6="" data-v-ed47b9c6="" class="comment" style="--depth: 0;">
										<div data-v-4851ddd6="" class="comment-header">
											<div data-v-4851ddd6="" class="left-area">
												<c:choose>
												<c:when test="${reply.nickName != null}">
												<span data-v-4851ddd6="" class="name">${reply.nickName}</span>
												</c:when>
												<c:otherwise>
												<span data-v-4851ddd6="" class="name">탈퇴한 회원입니다</span>
												</c:otherwise>
												</c:choose>
											</div>
											<div data-v-4851ddd6="" class="right-area">
												<span data-v-4851ddd6="" data-replyId="${reply.replyId}" title="${reply.enrollDt}" class="date">${reply.enrollDt}</span>
												<button data-v-4851ddd6="" class="more" onclick='replyAction("${post.postId}", "${reply.replyId}", "${reply.memberId}", "${sessionScope.memberId}")'>
													<svg data-v-4851ddd6="" width="18" height="18" fill="none" xmlns="http://www.w3.org/2000/svg" class="">
														<path data-v-4851ddd6="" fill-rule="evenodd" clip-rule="evenodd" d="M10.5 3.563a1.313 1.313 0 11-2.625 0 1.313 1.313 0 012.625 0zm0 5.718a1.312 1.312 0 11-2.625 0 1.312 1.312 0 012.625 0zm-1.313 7.031a1.313 1.313 0 100-2.625 1.313 1.313 0 000 2.626z" fill="#98A4B7"/>
													</svg>
												</button>
											</div>
										</div>
										<p data-v-4851ddd6="" class="content-area">${reply.content}</p>
									</div>
									<div data-v-67519862="" data-v-ed47b9c6="" class="reply-wrap">
									</div>
									<hr data-v-ed47b9c6="" class="divider">
									</li>
							</c:forEach>
						</ul>
					</c:when>
					<c:otherwise>
						<h2 data-v-af062606="" class="subtitle margin">새로운 댓글을 작성해보세요!</h2>
						<hr data-v-ed47b9c6="" class="divider">
					</c:otherwise>
					</c:choose>
						<div data-v-6bdd51b8="" data-v-af062606="" class="target" style="--offset: 600px;">
						</div>
						<c:if test="${relatedPostList.size() != 0}">
							<div data-v-24000807="" data-v-af062606="" class="post-card-wrap">
								<div data-v-120b3626="" data-v-24000807="" class="target before-post-target">
								</div>
								<h2 data-v-24000807="" class="subtitle"> 같은 작품에 대한 글 </h2>
								<div data-v-a9f12d9a="" data-v-24000807="" class="posts-wrap post-card-list">
								<c:forEach var="relatedPost" items="${relatedPostList}">
								<a data-v-6008a2fc="" data-v-a9f12d9a="" href="${contextPath}/community/post?postId=${relatedPost.postId}" class="post-wrap" id="communityPost-0">
								<div data-v-6008a2fc="">
									<h4 data-v-6008a2fc="" class="post-title">${relatedPost.postTitle}</h4>
									<p data-v-6008a2fc="" class="post-write">${relatedPost.nickName}</p>
								</div>
								</a>
								</c:forEach>
								</div>
							</div>
						</c:if>
					</div>
				</div>
			</div>
			<div data-v-af062606="" class="comment-input-area">
				<div data-v-45ef652a="" data-v-af062606="">
					<form data-v-45ef652a="">
						<div data-v-45ef652a="" class="input-wrap">
							<div data-v-6669f73c="" data-v-45ef652a="" class="textarea-wrap">
								<textarea data-v-6669f73c="" id="replyArea" placeholder="댓글을 작성해주세요." rows="1" class="original" style="--limit: 5; height: 20px;"></textarea>
							</div>
							<button data-v-45ef652a="" type="button" class="cancel" id="modifyCancel" style="display: none;">취소</button>
							<button data-v-45ef652a="" id="addReplyBtn" name="postId" value="${post.postId}" disabled="disabled" class="submit"> 등록 </button>
						</div>
					</form>
				</div>
			</div>
		</section>
	</main>
	
	<div data-v-327582cc="" data-v-00101c0c="" style="display: none;">
		<div data-v-327582cc="" class="modal-bg"></div>
		<!-- 수정하기, 삭제하기 modal 창 -->
		<div data-v-327582cc="" class="modal-layer" id="postModal" style="display: none;">
			<div data-v-3478b392="" data-v-327582cc="" class="outerModal" style="">
				<div data-v-3478b392="" class="innerModal" style="position: relative;">
					<ul data-v-3478b392="" class="contents-wrap">
						<li data-v-3478b392=""><button data-v-3478b392="" id="modifyPost"> 게시글 수정하기 </button></li>
						<li data-v-3478b392=""><button data-v-3478b392="" id="deletePost"> 게시글 삭제하기 </button></li>
					</ul>
					<object style="position: absolute; top: 0; left: 0; height: 100%; width: 100%; pointer-events: none; z-index: -1; opacity: 0;" class="resize-sensor" tabindex="-1" type="text/html" data="about:blank"></object>
				</div>
			</div>
		</div>
		<!-- 게시글 삭제 컨펌 -->
		<div data-v-48d16333="" class="modal-layer" style="display: none;" id="deleteModal">
			<div data-v-7e7b7a4d="" data-v-48d16333="" class="confirm-modal-container">
				<div data-v-7e7b7a4d="" class="confirm-modal-header">
					<h2 data-v-7e7b7a4d="" name="header">게시글이 삭제됩니다...</h2>
				</div>
				<div data-v-7e7b7a4d="" class="confirm-modal-body">
					<input data-v-7e7b7a4d="" type="password" id="deletePwIn" class="pwIn" placeholder="게시글 비밀번호를 입력하세요."/>
				</div>
				<div data-v-7e7b7a4d="" class="confirm-modal-footer">
					<div data-v-7e7b7a4d="" name="footer">
						<button data-v-7e7b7a4d="" id="delete_cancel_btn" class="gray-btn"><span data-v-7e7b7a4d="" class="건너뛰기">뒤로가기</span></button><button data-v-7e7b7a4d="" id="delete_confirm_btn" class="primary-btn"><span data-v-7e7b7a4d="" class="text">삭제하기</span></button>
					</div>
				</div>
			</div>
		</div>

			<!-- 댓글 수정, 삭제하기 창 -->
		<div data-v-327582cc="" class="modal-layer" id="replyModal" style="display: none;">
			<div data-v-3478b392="" data-v-327582cc="" class="outerModal" style="">
				<div data-v-3478b392="" class="innerModal" style="position: relative;">
					<ul data-v-3478b392="" class="contents-wrap">
						<li data-v-3478b392=""><button data-v-3478b392="" id="modifyReply">
						 댓글 수정하기 </button></li>
						<li data-v-3478b392=""><button data-v-3478b392="" id="deleteReply">
						<!---->
						 댓글 삭제하기 </button></li>
					</ul>
					<object style="position: absolute; top: 0; left: 0; height: 100%; width: 100%; pointer-events: none; z-index: -1; opacity: 0;" class="resize-sensor" tabindex="-1" type="text/html" data="about:blank"></object>
				</div>
			</div>
		</div>
		<!-- 확인받는 modal 창 -->
		<div data-v-327582cc="" class="modal-layer" id="confirmModal" style="display: none;">
			<div data-v-7e7b7a4d="" data-v-327582cc="" class="confirm-modal-container">
				<div data-v-7e7b7a4d="" class="confirm-modal-header">
					<h2 data-v-7e7b7a4d="" name="header">대상이 삭제됩니다..</h2>
				</div>
				<div data-v-7e7b7a4d="" class="confirm-modal-body">
					<h3 data-v-7e7b7a4d="" name="body">내용을 삭제하시겠어요?</h3>
				</div>
				<div data-v-7e7b7a4d="" class="confirm-modal-footer">
					<div data-v-7e7b7a4d="" name="footer">
						<button data-v-7e7b7a4d="" id="closeButton" class="gray-btn"><span data-v-7e7b7a4d="" class="건너뛰기">뒤로가기</span></button><button data-v-7e7b7a4d="" id="confirmButton" class="primary-btn"><span data-v-7e7b7a4d="" class="text">삭제하기</span></button>
					</div>
				</div>
			</div>
		</div>
		<!-- 컨텐츠 관련 modal -->

	</div>

</div>

</body>
</html>