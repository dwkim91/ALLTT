import { wishStateChange } from './contentType-wishAjax.js';

$("#container").on("click",".item__thumb.item__thumb-25x36", function(event) {
	// 이벤트가 발생된 요소
	var clickedElement = $(event.target);
	
	// 클릭이 실제로 발생한 클래스
	var clickedClass = clickedElement.attr('class');
	
	// 클릭된 요소의 부모 요소 중에서 가장 가까운 ".item" 요소를 찾음
	var itemElement = $(event.target).closest(".item");
	
	// ".item" 요소에서 "data-id" 속성의 값을 가져옴
	var contentId = itemElement.data("id");
	
	if (clickedClass == "item__tags") {
		
		window.location.href = '/detail?contentId=' + contentId;
		
	}
	else {
		// 클릭된 요소 중에서 가장 가까운 ".item__thumb.item__thumb-25x36" 요소를 찾음
		var element = $(event.target).closest(".item__thumb.item__thumb-25x36");

		// 해당 요소의 "id" 속성의 값을 가져옴
		var id = element.attr("id");
		
		// contentId가 null이 아닌 경우 실행
		if (contentId != null) {
			
			// 요소의 id가 "wishContent"인 경우 id 속성 제거
			if (id == "wishContent") {
				element.attr("id", "");
				var wishButton = $(event.target).closest(".tag.tag-age.tag-age-nineteen_true");
				wishButton.removeClass("tag-age-nineteen_true").addClass("tag-age-nineteen");
			}
			// 요소의 id가 "wishContent"가 아닌 경우 id 속성을 "wishContent"로 설정하고 isWishContent 값을 true로 설정
			else {
				element.attr("id", "wishContent");
				var wishButton = $(event.target).closest(".tag.tag-age.tag-age-nineteen");
				wishButton.removeClass("tag-age-nineteen").addClass("tag-age-nineteen_true");
			}

			// 위시 데이터 객체 생성
			var wishData = {
					"contentId": contentId
			};

			// 위시 상태 변경 함수 호출
			wishStateChange(wishData);
		}
		
	}
});