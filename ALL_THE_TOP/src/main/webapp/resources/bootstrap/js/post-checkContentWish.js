function checkContentWish(myWish) {
	// 찜 이미지 로그인한 멤버에 맞춰서 표시
	if (myWish == "true") {
		$("#contentWish").attr("src", "/resources/bootstrap/img/like_after.png");
	}
	else {
		$("#contentWish").attr("src", "/resources/bootstrap/img/like_before.png");
	}
}