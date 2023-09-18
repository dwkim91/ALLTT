// 좋아요 표시
function likePostBtn(memberId, postId){
	  	// 클릭된 버튼에만 클래스 변경을 적용하기 위해 id 값을 사용
	  	var btnId = "likeBtn" + postId;
	  	var targetBtn = $("#" + btnId);
		targetBtn.toggleClass("active");
		
		var param = {
			"memberId" : memberId,
			"postId" : postId
		};
		
		$.ajax({
			 url : "/community/postRecmnd",
			 async : true,
			 type : "POST",
			 data : param,
			 success : function(result) {
				targetBtn.find("span").html(result);
			 }
		});
}