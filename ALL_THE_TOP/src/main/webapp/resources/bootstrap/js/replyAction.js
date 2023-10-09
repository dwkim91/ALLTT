function replyAction(postId, replyId, memberId, sessionMember) {
	// 만약 댓글 쓴 member와 지금 로그인한 사람이 같다면
	if (memberId == sessionMember) {
		$("div[data-v-327582cc][data-v-00101c0c]").css("display", "block");
		$("#replyModal").css("display", "block");
		$("body").css("overflow", "hidden");
		
		// 동적으로 모달창 닫는 클릭 이벤트 핸들러 등록
		$("body").on("click", ".modal-bg", function() {
			$("div[data-v-327582cc][data-v-00101c0c]").css("display", "none");
			$("#replyModal").css("display", "none");
			$("body").css("overflow", "auto");
		});
		
		// 댓글 수정하기 버튼
		$("#modifyReply").click(function() {
			// 모달창을 닫고
			$("div[data-v-327582cc][data-v-00101c0c]").css("display", "none");
			$("#replyModal").css("display", "none");
			$("body").css("overflow", "auto");
			
			// 댓글 입력하는 칸에다가 댓글내용 수정 받고
			$("#replyArea").focus().val("");
			$("#addReplyBtn").attr("id", "modifyReplyBtn").removeClass("submit").addClass("submit active").prop("disabled", false).text("수정");
			$("#modifyCancel").css("display", "block");
			
			$.ajax({
				url : "/community/getReply",
				async : true,
				type : "GET",
				data : {"replyId" : replyId},
				beforeSend: function(xhr) {
				    // CSRF 토큰을 요청 헤더에 추가
				    xhr.setRequestHeader("X-CSRF-TOKEN", csrfToken);
				},
				success : function(result) {
					$("#replyArea").val(result.content);
				}
			});
			
			// 취소버튼을 누르면
			$("#modifyCancel").click(function() {
				$(this).css("display", "none");
				$("#replyArea").val("");
				$("#modifyReplyBtn").attr("id", "addReplyBtn").removeClass("submit active").addClass("submit").prop("disabled", true).text("등록");
			});
			
			// 댓글 수정하기
			$("#modifyReplyBtn").click(function(){
				if ($("#modifyCancel").css("display") === "block") {
					var content = $("#replyArea").val();
					
					var param = {
						"postId" : postId,
						"content" : content,
						"memberId" : memberId,
						"replyId" : replyId
					};
					
					$.ajax({
						url : "/community/modifyReply",
						type : "POST",
						async : true,
						data : param,
						beforeSend: function(xhr) {
						    // CSRF 토큰을 요청 헤더에 추가
						    xhr.setRequestHeader("X-CSRF-TOKEN", csrfToken);
						},
						success : function(data) {
							// 등록이 완료되면 게시판으로 이동
							if (data == "modified") {
								alert("댓글이 수정되었습니다.");
							}
						}
					});
				}
			});
		});
		
		// 댓글 삭제하기 버튼
		$("#deleteReply").click(function() {
			$("#confirmModal").css("display", "block");
			$("#replyModal").css("display", "none");
			
			// 동적으로 모달창 닫는 클릭 이벤트 핸들러 등록
			$("body").on("click", ".modal-bg", function() {
				$("div[data-v-327582cc][data-v-00101c0c]").css("display", "none");
				$("#replyModal").css("display", "none");
				$("body").css("overflow", "auto");
				$("#confirmModal").css("display", "none");
			});
			
			// 뒤로가기
			$("#closeButton").click(function() {
				$("div[data-v-327582cc][data-v-00101c0c]").css("display", "none");
				$("#replyModal").css("display", "none");
				$("body").css("overflow", "auto");
				$("#confirmModal").css("display", "none");
			});
			
			// 삭제 확인버튼
			$("#confirmButton").click(function() {
				$("div[data-v-327582cc][data-v-00101c0c]").css("display", "none");
				$("#replyModal").css("display", "none");
				$("body").css("overflow", "auto");
				$("#confirmModal").css("display", "none");
				
				$.ajax({
					url : "/community/deleteReply",
					async : true,
					type : "POST",
					data : {"replyId" : replyId},
					beforeSend: function(xhr) {
					    // CSRF 토큰을 요청 헤더에 추가
					    xhr.setRequestHeader("X-CSRF-TOKEN", csrfToken);
					},
					success : function(result) {
						if (result == "deleted") {
							location.reload();
						}
					}
				});
			});
		});
	}
}