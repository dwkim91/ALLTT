$(function() {
	
	// 수정하기, 삭제하기 modal 창 가리기
	$(document).ready(function() {
		$("div[data-v-327582cc][data-v-00101c0c]").css("display", "none");
		$("#postModal").css("display", "none");
		$("#replyModal").css("display", "none");
		$("#confirmModal").css("display", "none");
	});
	
	$(".back-btn").click(function() {
		history.go(-1);
	});
	
	$("#communityHomeBtn").click(function() {
		location.href="${contextPath}/community/feed";
	});
	
	// 댓글 작성 칸에 댓글 내용이 적혀야지만 button 활성화
	$("#replyArea").keyup(function() {
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
		var postId = "${post.postId}";
		var content = $("#replyArea").val();
		var memberId = "${sessionScope.memberId}";
	
		var param = {
			"postId" : postId,
			"content" : content,
			"memberId" : memberId
		};
		
		// post 로 작성된 내용을 넘기고
		$.post("${contextPath}/community/addReply", param, function(data) {
			// 등록이 완료되면 게시판으로 이동
			if (data == "inserted") {
				alert("댓글이 등록되었습니다.");
			}
		});
	});

	// 좋아요 표시
	$("#likeBtn").click(function() {
		$(this).toggleClass("active");
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
		}
	});
	
	// 게시글 수정하기 버튼
	$("#modifyPost").click(function() {
		// 우선 한번 더 검증하는 느낌
		if ("${post.memberId}" == "${sessionScope.memberId}") {
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
			location.href="${contextPath}/community/delete?postId=${post.postId}";
		}
		else {
			alert("잘못된 접근입니다.");
			location.href="${contextPath}/community/feed";
		}
	});
	
	// 댓글 추가, 삭제 진행 버튼
	$(".more").click(function() {
		var replyId = $(this).data("1");
		var memberId = $(this).data("2");
		
		// 만약 댓글 쓴 member와 지금 로그인한 사람이 같다면
		if (memberId == "${sessionScope.memberId}") {
			$("div[data-v-327582cc][data-v-00101c0c]").css("display", "block");
			$("#replyModal").css("display", "block");
			// body 스크롤 비활성화
			$("body").css("overflow", "hidden");
			
			// 동적으로 모달창 닫는 클릭 이벤트 핸들러 등록
			$("body").on("click", ".modal-bg", function() {
				$("div[data-v-327582cc][data-v-00101c0c]").css("display", "none");
				$("#replyModal").css("display", "none");
				$("body").css("overflow", "auto");
			});
			
			// 댓글 수정하기 버튼
			$("#modifyReply").click(function() {
				
			});
			
			// 댓글 삭제하기 버튼
			$("#deleteReply").click(function() {
				$("#confirmModal").css("display", "block");
				
				// 동적으로 모달창 닫는 클릭 이벤트 핸들러 등록
				$("body").on("click", ".modal-bg", function() {
					$("div[data-v-327582cc][data-v-00101c0c]").css("display", "none");
					$("#replyModal").css("display", "none");
					$("body").css("overflow", "auto");
					$("#confirmModal").css("display", "none");
				});
				
				// 뒤로가기
				$("#closeButton").click(function() {
					$("#confirmModal").css("display", "none");
				});
				
				// 삭제하기
				$("#confirmButton").click(function() {
					$.post("${contextPath}/community/deleteReply", replyId, function(data) {
						// 완료되면 게시판으로 이동
						if (data == "deleted") {
							alert("댓글이 삭제되었습니다.");
							location.reload();
						}
					});
				})
			})
		}
	});
	

});