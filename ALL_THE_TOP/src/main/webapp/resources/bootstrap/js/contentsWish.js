import { wishStateChange } from './contentsWishAjax.js';

$(".item__tags-right").on("click", function(event) {
	console.log("1");
	// 클릭된 요소의 부모 요소 중에서 가장 가까운 ".item" 요소를 찾음
	var itemElement = $(event.target.parentElement).closest(".item");

	// ".item" 요소에서 "data-id" 속성의 값을 가져옴
	var contentId = itemElement.data("id");

	// 클릭된 요소 중에서 가장 가까운 ".item__thumb.item__thumb-25x36" 요소를 찾음
	var element = $(event.target).closest(".item__thumb.item__thumb-25x36");

	// 해당 요소의 "id" 속성의 값을 가져옴
	var id = element.attr("id");

	// 위시 컨텐츠인지 여부를 나타내는 변수
	var isWishContent = false;

	// contentId가 null이 아닌 경우 실행
	if (contentId != null) {
		// 요소의 id가 "wishContent"인 경우 id 속성 제거
		if (id == "wishContent") {
			element.attr("id", "");
		}
		// 요소의 id가 "wishContent"가 아닌 경우 id 속성을 "wishContent"로 설정하고 isWishContent 값을 true로 설정
		else {
			element.attr("id", "wishContent");
			isWishContent = true;
		}

		// 위시 데이터 객체 생성
		var wishData = {
				"contentId": contentId,
				"isWishContent": isWishContent
		};

		// 위시 상태 변경 함수 호출
		wishStateChange(wishData);
	}
});


$("loaded.css-1doy9ip.euf32k22").on("click", function(event) {
	console.log("1");
	// 클릭된 요소의 부모 요소 중에서 가장 가까운 ".item" 요소를 찾음
	var itemElement = $(event.target.parentElement).closest(".item");

	// ".item" 요소에서 "data-id" 속성의 값을 가져옴
	var contentId = itemElement.data("id");

	// contentId가 null이 아닌 경우 실행
	if (contentId != null) {
		// 요소의 id가 "wishContent"인 경우 id 속성 제거
		if (id == "wishContent") {
			element.attr("id", "");
		}
		// 요소의 id가 "wishContent"가 아닌 경우 id 속성을 "wishContent"로 설정하고 isWishContent 값을 true로 설정
		else {
			element.attr("id", "wishContent");
			isWishContent = true;
		}

	}
});