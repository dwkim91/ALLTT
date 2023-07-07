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
			$("body").on("click", ".modal", function() {
				$("#tag_list").empty();
				$("#addContentId").css("display", "none");
				$("body").css("overflow", "auto");
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