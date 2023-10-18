<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${contextPath}/resources/bootstrap/css/write-bootstrap.css" type="text/css">
<link data-n-head="ssr" rel="icon" type="image/png" sizes="32x32" href="https://nujhrcqkiwag1408085.cdn.ntruss.com/static/common/icon/favicon-33x33.png">
<script>
$(function() {
	
	$(".back-btn").click(function() {
		history.go(-1);
	});

	$("#content").keyup(function() {
		var content = $(this).val();

		if (content != "${post.content}") {
			$("#modifyBtn").removeClass("disabled").prop("disabled", false);
		}
		else {
			$("#modifyBtn").addClass("disabled").prop("disabled", true);
		}

	});

	// 태그 검색창 띄우기
	$("#tagBtn").click(function() {

		if($(".movie_list").children().length > 0) {
			alert("이미 태그된 컨텐츠가 있습니다.");
		}
		else {
			$("#addContentId").css("display", "block");
			$("body").css("overflow", "hidden"); // 스크롤바 제거
		}
	});

	// 태그 검색 삭제
	$(".form__clear").click(function() {
		$("#input-search").val("");
	})

	// 태그 검색
	$("#input-search").keyup(function() {
		var searchTitle = $(this).val();

		$.ajax({
			url : "${contextPath}/community/getContent",
			type : "POST",
			async : true,
			data : {"searchTitle" : searchTitle},
			beforeSend: function(xhr) {
			    // CSRF 토큰을 요청 헤더에 추가
			    xhr.setRequestHeader("X-CSRF-TOKEN", csrfToken);
			},
			success : function(result) {
				var searchList = $("#tag_list");
				searchList.empty(); // 기존 내용 제거
				
				if (result != null) {
					// 리스트의 각 요소를 반복하면서 내용을 생성하여 추가
					result.forEach(function(content) {
						var contentItem = $("<li></li>")
										.attr("data-v-8e0b61ec", "")
										.attr("data-v-2e4bbd00", "")
										.attr("id", "contentItem")
										.addClass("modal-tag-list-item tag-list-item recommendTag");
						
						var icon = $("<div></div>")
										.attr("data-v-8e0b61ec", "")
										.addClass("modal-tag-list-item__icon");
						
						var iconInner = $("<i></i>")
										.attr("data-v-2e4bbd00", "")
										.addClass("kino-icon mask kino-icon--filter-chip-star")
										.attr("data-v-8e0b61ec", "");
						
						var title = $("<span></span>")
										.attr("data-v-8e0b61ec", "")
										.attr("contentId", content.contentId)
										.addClass("modal-tag-list-item__title")
										.text(content.title);
						
						icon.append(iconInner);
						contentItem.append(icon, title);

						searchList.append(contentItem);
					});
				}
			}
		});
	});

	// 검색된 content 의 제목을 클릭했을 때, content의 id와 제목을 넘겨주기
	$("#tag_list").on("click", "li", function() {

		var selectedContent = $(this).find("span");
		var contentInfo = null;
		var contentImgUrl = null;

		// 모달창 닫기
		$("#input-search").val("");
		$("#addContentId").css("display", "none");
		$("body").css("overflow", "auto"); // 스크롤바 보이기

		// 선택된 content 추가
		$.ajax({
			url : "${contextPath}/community/getContentInfo",
			type : "GET",
			async : true,
			data : { "contentId" : selectedContent.attr("contentId")},
			beforeSend: function(xhr) {
			    // CSRF 토큰을 요청 헤더에 추가
			    xhr.setRequestHeader("X-CSRF-TOKEN", csrfToken);
			},
			success : function(content) {

				var html = '<div data-v-5dec5019="" data-v-4179835d="" class="movie_item">';
					html += '<div data-v-5dec5019="" class="movie_item__poster" id=' + content.contentId + '>';
					html += '<img data-v-7874c524="" data-v-3090f2a6="" data-v-5dec5019="" alt="' + content.title + '" class="poster__img" data-src="' + content.imgUrl + '" src="' + content.imgUrl + '" lazy="loaded">';
					html += '</div>';
					html += '<div data-v-5dec5019="" class="movie_item__description">';
					html += '<h5 data-v-5dec5019="" class="description__title">' + content.title + '</h5>';
					html += '<p data-v-5dec5019="" class="description__subtitle">' + content.contentType + '</p>';
					if (content.enrollDt != 9999) {
						html += '<span data-v-5c10ad9e="" class="description__subtitle">' + content.enrollDt + '</span>';
					}
					html += '<div data-v-5dec5019="" class="description__bottom">';
					html += '<img data-v-5dec5019="" src="" class="light">';
					html += '<!---->';
					html += '</div>';
					html += '</div>';
					html += '<div data-v-5dec5019="" class="movie_item__more">';
					html += '<button data-v-5dec5019="" class="more__btn" id="deleteBtn">삭제</button>';
					html += '</div>';
					html += '</div>';

					// 생성된 HTML 코드를 movie_list 요소의 자식 태그로 추가
					$('.movie_list').append(html);
					
					// 저장 버튼 활성화
					$("#modifyBtn").removeClass("disabled").prop("disabled", false);
			}
		});
	});

	// 추가된 tag 삭제
	$(document).on('click', '#deleteBtn', function() {
		$(".movie_list").empty();
	});

	// modifyBtn
	$("#modifyBtn").click(function() {

		// 비밀번호 인풋이 있어야 함
		if ($("#passwd").val().length > 0) {
			var title = $("#title").val();
			var content = $("#content").val();
			var passwd = $("#passwd").val();
			var postId = "${post.postId}";
			var contentId = $(".movie_item__poster").attr("id");
			
			var param = {
				"postTitle" : title,
				"postId" : postId,
				"memberId" : "${sessionScope.memberId}",
				"content" : content,
				"passwd" : passwd,
				"contentId" : contentId
			};
			
			$.ajax({
				url : "${contextPath}/community/modifyPost",
				async : true,
				type : "POST",
				data : param,
				beforeSend: function(xhr) {
				    // CSRF 토큰을 요청 헤더에 추가
				    xhr.setRequestHeader("X-CSRF-TOKEN", csrfToken);
				},
				success : function(data) {
					// 등록이 완료되면 게시판으로 이동
					if (data == "modified") {
						alert("게시글이 수정되었습니다.");
						location.href="${contextPath}/community/feed";
					}
					else {
						alert("비밀번호를 확인해주세요.");
						location.reload();
					}
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
			<h1 data-v-36d2ff30="" class="header-title"> 수정하기 </h1>
			<div data-v-36d2ff30="" class="left-wrap">
				<button data-v-36d2ff30="" class="back-btn"><i data-v-36d2ff30="" class="kino-icon kino-icon--header-back"></i></button>
				<!---->
			</div>
			<div data-v-052fb8ca="" data-v-36d2ff30="" class="header-button-wrap">
				<button data-v-de293a14="" data-v-052fb8ca="" id="modifyBtn" class="btn disabled" data-v-36d2ff30="">저장</button>
			</div>
			</header>
			</section>
			<div data-v-052fb8ca="" class="content-area">
				<div data-v-4179835d="" data-v-052fb8ca="">
					<div data-v-4179835d="" class="post_editor">
						<div data-v-0c949614="" data-v-4179835d="" class="editor__header">
							<div data-v-0c949614="" class="textarea_auto_height">
								<textarea data-v-0c949614="" maxlength="100" placeholder="제목을 입력해주세요." rows="1" class="textarea_auto_height__textarea" id="title" style="height: 21px;">${post.postTitle}</textarea>
							</div>
						</div>
						<div data-v-4179835d="" class="post_editor__main">
							<!---->
							<textarea class="main__writer" id="content" data-v-4179835d="">${post.content}</textarea>
						</div>
						<div data-v-4179835d="" class="post_editor__footer">
							<button class="footer__hash-tag-button" id="tagBtn" data-v-4179835d="">
								<svg width="24" height="24" fill="none" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" data-v-4179835d="" class="">
									<path fill-rule="evenodd" clip-rule="evenodd"
										d="M10.216 5.015a1 1 0 00-1.159.812L8.69 7.909H7a1 1 0 100 2h1.337l-.705 4H6a1 1 0 100 2h1.28l-.307 1.735a1 1 0 001.97.348l.367-2.083h3.969l-.306 1.735a1 1 0 101.97.348l.367-2.083H17a1 1 0 100-2h-1.338l.705-4h1.634a1 1 0 100-2h-1.28l.305-1.735a1 1 0 10-1.97-.347l-.367 2.082h-3.968l.306-1.735a1 1 0 00-.811-1.159zm3.415 8.894l.706-4h-3.969l-.705 4h3.968z"
										fill="#98A4B7" data-v-4179835d=""></path></svg>
							</button>
						</div>
							<div data-v-4179835d="" class="post_editor__footer">
								<form data-v-4179835d="" class="footer__passwd">
									<input data-v-4179835d="" class="pwin" type="password" id="passwd" placeholder="  비밀번호를 입력하세요. (4자 이상 10자 이하)">
								</form>
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
					<div data-v-2e4bbd00="" data-v-4179835d="" class="post-tag-modal post-modal" id="addContentId" style="display: none;">
						<div data-v-2e4bbd00="" class="modal">
							<div data-v-2e4bbd00="" class="modal__header">
								<h3 data-v-2e4bbd00="" class="header__title">태그 등록</h3>
								<button data-v-2e4bbd00="" class="header__close">
									<i data-v-2e4bbd00="" class="kino-icon close__icon kino-icon--filter-close"></i>
								</button>
							</div>
							<div data-v-2e4bbd00="" class="modal__body">
								<form data-v-2e4bbd00="" class="body__form mx">
									<label data-v-2e4bbd00="" for="input-search">
									<svg data-v-2e4bbd00="" width="16" height="16" fill="none" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" class="">
										<path data-v-2e4bbd00=""
												d="M5.432 7.256h1.36l-.336 2.048H5v1.072h1.296l-.544 3.36H6.76l.528-3.36h1.76l-.528 3.36h.992l.528-3.36h1.472V9.304h-1.296l.32-2.048h1.408V6.2h-1.216L11.24 3h-.992l-.512 3.2H7.96L8.472 3H7.48l-.512 3.2H5.432v1.056zm2.352 0h1.76l-.32 2.048H7.448l.336-2.048z"
												fill="#ea6363"></path>
									</svg>
									</label>
									<input data-v-2e4bbd00="" id="input-search" placeholder="태그 검색" type="text" class="form__input">
									<button data-v-2e4bbd00="" type="button" class="form__clear" style="">
										<svg data-v-2e4bbd00="" width="24" height="24" fill="none"
											xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"
											class="clear__icon">
											<path data-v-2e4bbd00="" fill-rule="evenodd"
												clip-rule="evenodd"
												d="M21 12a9 9 0 11-18 0 9 9 0 0118 0zm-5.234-3.766a.797.797 0 00-.618-.232.907.907 0 00-.7.264L12 10.714 9.552 8.266a.907.907 0 00-.7-.264.797.797 0 00-.85.85.907.907 0 00.264.7L10.714 12l-2.448 2.448a.907.907 0 00-.264.7.797.797 0 00.85.85.907.907 0 00.7-.264L12 13.286l2.448 2.448c.192.192.448.28.7.264a.797.797 0 00.85-.85.907.907 0 00-.264-.7L13.286 12l2.448-2.448a.907.907 0 00.264-.7.797.797 0 00-.232-.618z"
												fill="#98A4B7"></path></svg>
									</button>
								</form>
								<div data-v-2e4bbd00="" class="body__container">
									<div data-v-2e4bbd00="" class="container__contents">
										<!---->
										<div data-v-2e4bbd00="" class="contents__recommend-tags">
											<ul data-v-2e4bbd00="" class="recommend-tag__list" id="tag_list">
											</ul>
										</div>
										<ul data-v-2e4bbd00="" class="contents__tag-list">
											<!---->
										</ul>
										<!---->
									</div>
									<!---->
								</div>
							</div>
						</div>
					</div>
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