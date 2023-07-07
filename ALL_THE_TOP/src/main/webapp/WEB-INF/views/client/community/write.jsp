<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="${contextPath}/resources/css/write.css" type="text/css">
<script src="${contextPath}/resources/jquery/jquery-3.6.1.min.js"></script>
<script type="text/javascript">
$(function() {
	
	// modal 창 가리기
	$("#addContentId").css("display", "none");
	
	// 뒤로가기
	$("#backBtn").click(function() {
		location.href="${contextPath}/community";
	});

	$("#content").keyup(function() {
		var postContent = $(this).val();

		if (postContent.length > 0) {
			$("#addPostBtn").removeClass("disabled").addClass("btn");
		} else {
			$("#addPostBtn").removeClass("btn").addClass("disabled");
		}

	});

	// 게시글 추가하기
	$("#addPostBtn").click(function() {

		// 비밀번호 설정이 되어있는 경우에만
		if ($("#passwd").val().length > 0) {
			var title = $("#title").val();
			var content = $("#content").val();
			var passwd = $("#passwd").val();
			var contentId = $(".movie_item__poster").attr("id");
			
			var param = {
				"postTitle" : title,
				"memberId" : "${sessionScope.memberId}",
				"content" : content,
				"passwd" : passwd,
				"contentId" : contentId
			};
			
			// post 로 작성된 내용을 넘기고
			$.post("${contextPath}/community/addPost", param, function(data) {
				// 등록이 완료되면 게시판으로 이동
				if (data == "inserted") {
					alert("게시글이 등록되었습니다.");
					location.href="${contextPath}/community/feed";
				}
			});
		}
		else {
			alert("게시글 비밀번호를 입력해주세요.");
			$("#passwd").focus();
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
			
			// 동적으로 모달창 닫는 클릭 이벤트 핸들러 등록
			$(document).on("click", ".post-modal", function(event) {
				  var target = $(event.target);
				  if (!target.closest(".modal__body").length) {
						$(".recommend-tag__list").empty();
						$("#addContentId").css("display", "none");
						$("body").css("overflow", "auto");
				  }
			});
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
			}
		});
	});

	// 추가된 tag 삭제
	$(document).on('click', '#deleteBtn', function() {
		$(".movie_list").empty();
	});
	
});
</script>
</head>
<body>
	<div id="__nuxt">
		<div id="__layout">
			<div id="root" data-v-75f0040c="">
				<main id="contents" data-v-6aac2673="" data-v-75f0040c="">
					<section class="fixed-area" data-v-6aac2673="">
						<header class="header-wrap" data-v-36d2ff30="" data-v-6aac2673="">
							<h1 class="header-title" data-v-36d2ff30="">글쓰기</h1>
							<div class="left-wrap" data-v-36d2ff30="">
								<button id="backBtn" class="back-btn" data-v-36d2ff30="">
									<i class="kino-icon kino-icon--header-back" data-v-36d2ff30=""></i>
								</button>
								<!---->
							</div>
							<div class="header-button-wrap" data-v-36d2ff30="" data-v-6aac2673="">
								<button id="addPostBtn" class="btn disabled" data-v-de293a14="" data-v-6aac2673="" data-v-36d2ff30="">저장</button>
							</div>
						</header>
					</section>
					<div class="content-area" data-v-6aac2673="">
						<div data-v-4179835d="" data-v-6aac2673="">
							<div class="post_editor" data-v-4179835d="">
								<div class="editor__header" data-v-0c949614=""
									data-v-4179835d="">
									<div class="textarea_auto_height" data-v-0c949614="">
										<textarea id="title" maxlength="100" placeholder="제목을 입력해주세요." rows="1"
											value="" class="textarea_auto_height__textarea"
											data-v-0c949614="" autofocus="autofocus"
											style="height: 21px;"></textarea>
									</div>
								</div>
								<div class="post_editor__main" data-v-4179835d="">
									<div class="placeholder main__placeholder" data-v-376be9e4="" data-v-4179835d="">
									</div>
									<textarea id="content" class="main__writer" data-v-4179835d="" data-v-0c949614="" placeholder="#태그로 작품이 등록된 게시글은 따로 모아 확인할 수 있어요."></textarea>
								</div>
								<div class="post_editor__footer" data-v-4179835d="">
									<button class="footer__hash-tag-button" id="tagBtn" data-v-4179835d="">
										<svg width="24" height="24" fill="none" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24" data-v-4179835d="" class="">
											<path fill-rule="evenodd" clip-rule="evenodd"
												d="M10.216 5.015a1 1 0 00-1.159.812L8.69 7.909H7a1 1 0 100 2h1.337l-.705 4H6a1 1 0 100 2h1.28l-.307 1.735a1 1 0 001.97.348l.367-2.083h3.969l-.306 1.735a1 1 0 101.97.348l.367-2.083H17a1 1 0 100-2h-1.338l.705-4h1.634a1 1 0 100-2h-1.28l.305-1.735a1 1 0 10-1.97-.347l-.367 2.082h-3.968l.306-1.735a1 1 0 00-.811-1.159zm3.415 8.894l.706-4h-3.969l-.705 4h3.968z"
												fill="#98A4B7" data-v-4179835d=""></path></svg>
									</button>
								</div>
								<div data-v-4179835d="" class="post_editor__footer">
									<input data-v-4179835d="" type="password" id="passwd" placeholder="비밀번호를 입력하세요.">
								</div>
							</div>
							<div data-v-4179835d="" class="movie_list">
							</div>
							<!---->
								<div data-v-2e4bbd00="" data-v-4179835d="" class="post-tag-modal post-modal" id="addContentId">
									<div data-v-2e4bbd00="" class="modal">
										<div data-v-2e4bbd00="" class="modal__body">
											<form data-v-2e4bbd00="" class="body__form mx">
												<label data-v-2e4bbd00="" for="input-search">
												<svg data-v-2e4bbd00="" width="16" height="16" fill="none" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16" class="">
													<path data-v-2e4bbd00=""
															d="M5.432 7.256h1.36l-.336 2.048H5v1.072h1.296l-.544 3.36H6.76l.528-3.36h1.76l-.528 3.36h.992l.528-3.36h1.472V9.304h-1.296l.32-2.048h1.408V6.2h-1.216L11.24 3h-.992l-.512 3.2H7.96L8.472 3H7.48l-.512 3.2H5.432v1.056zm2.352 0h1.76l-.32 2.048H7.448l.336-2.048z"
															fill="#637DEA"></path>
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
							<!---->
						</div>
					</div>
					<!---->
				</main>
				<!-- 뒤로가기 누르면 modal 창 뜨면서 뒤로가기, 삭제하기 나오는거.. 추후 구현
				<div data-v-327582cc="" data-v-75f0040c="">
					<div data-v-327582cc="" class="modal-bg">
					</div>
					<div data-v-327582cc="" class="modal-layer">
						<div data-v-7e7b7a4d="" data-v-327582cc="" class="confirm-modal-container">
							<div data-v-7e7b7a4d="" class="confirm-modal-header">
								<h2 data-v-7e7b7a4d="" name="header">작성중인 내용이 모두 삭제됩니다.</h2>
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
				</div>
				-->
			</div>
		</div>
	</div>
</body>
</html>