<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${contextPath}/resources/css/write.css" type="text/css">
<link data-n-head="ssr" rel="icon" type="image/png" sizes="32x32" href="https://nujhrcqkiwag1408085.cdn.ntruss.com/static/common/icon/favicon-33x33.png">
<script src="${contextPath}/resources/jquery/jquery-3.6.1.min.js"></script>
<script>
$(function() {
	
	$(".back-btn").click(function() {
		location.href="${contextPath}/community/post?postId=${post.postId}";
	});
	
	// 버튼 활성화
	$("#passwd").keyup(function() {
		var inputPasswd = $(this).val();
		
		if (inputPasswd.length > 0) {
			$("#deleteBtn").removeClass("disabled").prop("disabled", false);
		}
		else {
			$("#deleteBtn").addClass("disabled").prop("disabled", true);
		}
	});

	// delete
	$("#deleteBtn").click(function() {

		// 비밀번호 인풋이 있어야 함
		if ($("#passwd").val().length > 0) {
			var postId = "${post.postId}";
			var memberId = "${sessionScope.memberId}";
			var passwd = $("#passwd").val();
			
			var param = {
				"postId" : postId,
				"memberId" : memberId,
				"passwd" : passwd
			};
			
			// post 로 작성된 내용을 넘기고
			$.post("${contextPath}/community/deletePost", param, function(data) {
				// 등록이 완료되면 게시판으로 이동
				if (data == "deleted") {
					alert("게시글이 삭제되었습니다.");
					location.href="${contextPath}/community/feed";
				}
				else {
					alert("비밀번호를 확인해주세요.");
					location.reload();
				}
			});
		}
		else {
			alert("게시글 비밀번호를 입력해주세요.");
			$("#passwd").focus();
		}

	});


});
</script>
</head>
<body>

<div id="__nuxt">
	<div id="__layout">
		<div id="root" data-v-00101c0c="">
			<main data-v-052fb8ca="" data-v-00101c0c="" id="contents">
			<section data-v-052fb8ca="" class="fixed-area">
			<header data-v-36d2ff30="" data-v-052fb8ca="" class="header-wrap">
			<h1 data-v-36d2ff30="" class="header-title"> 삭제하기 </h1>
			<div data-v-36d2ff30="" class="left-wrap">
				<button data-v-36d2ff30="" class="back-btn"><i data-v-36d2ff30="" class="kino-icon kino-icon--header-back"></i></button>
				<!---->
			</div>
			<div data-v-052fb8ca="" data-v-36d2ff30="" class="header-button-wrap">
				<button data-v-de293a14="" data-v-052fb8ca="" id="deleteBtn" class="btn disabled" data-v-36d2ff30="">삭제</button>
			</div>
			</header>
			</section>
			<div data-v-052fb8ca="" class="content-area">
				<div data-v-4179835d="" data-v-052fb8ca="">
					<div data-v-4179835d="" class="post_editor">
						<div data-v-0c949614="" data-v-4179835d="" class="editor__header">
							<div data-v-0c949614="" class="textarea_auto_height">
								<textarea data-v-0c949614="" maxlength="100" placeholder="제목을 입력해주세요." rows="1" class="textarea_auto_height__textarea" style="height: 21px;">${post.postTitle}</textarea>
							</div>
						</div>
						<div data-v-4179835d="" class="post_editor__main">
							<!---->
							<div data-v-4179835d="" contenteditable="true">
								<div>${post.content}</div>
							</div>
						</div>
						<div data-v-4179835d="" class="post_editor__footer">
							<input data-v-4179835d="" type="password" id="passwd" placeholder="비밀번호를 입력하세요.">
						</div>
					</div>
					<div data-v-4179835d="" class="movie_list">
					<c:if test="${post.postTag != null }">
						<div data-v-5dec5019="" data-v-4179835d="" class="movie_item">
							<div data-v-5dec5019="" class="movie_item__poster" id="${content.contentId}">
								<img data-v-7874c524="" data-v-3090f2a6="" data-v-5dec5019="" alt="${content.title}" class="poster__img" data-src="${content.imgUrl}" src="${content.imgUrl}" lazy="loaded">
							</div>
							<div data-v-5dec5019="" class="movie_item__description">
								<h5 data-v-5dec5019="" class="description__title">${content.title}</h5>
								<p data-v-5dec5019="" class="description__subtitle">
									${content.contentType} · 
									<c:if test="${content.enrollDt != 9999}"><span>${content.enrollDt}</span></c:if>
								</p>
								<div data-v-5dec5019="" class="description__bottom">
									<img data-v-5dec5019="" src="https://static.kinolights.com/icon/light-normal.svg" alt="light-normal" class="light">
									<!---->
								</div>
							</div>
							<div data-v-5dec5019="" class="movie_item__more">
								<button data-v-5dec5019="" class="more__btn" id="deleteBtn">삭제</button>
							</div>
						</div>
					</c:if>
					</div>
					<!---->
				</div>
			</div>
			<!---->
			</main>
			<!---->
		</div>
	</div>
</div>

</body>
</html>