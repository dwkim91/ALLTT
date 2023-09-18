import { wishStateChange } from './contentsWishAjax.js';

$("#addWish").on("click", function(event) {
	if (memberSession.length > 0){
		var contentId = $(this).data("id");
		
		var heartIcon = document.querySelector("#addWish i.fa-heart");
		
		if (heartIcon == null) {
			heartIcon = document.querySelector("#addWish i.fa-heart-o");
			heartIcon.classList.remove("fa-heart-o");
			heartIcon.classList.add("fa-heart");
		}
		else {
			heartIcon.classList.remove("fa-heart");
			heartIcon.classList.add("fa-heart-o");
		}
		
		var wishData = {
				"contentId": contentId
		};
		// 위시 상태 변경 함수 호출
		wishStateChange(wishData);
	}
	else{
		alert("로그인 후 이용 가능합니다.");
	}

});