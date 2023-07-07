import { wishStateChange } from './contentsWishAjax.js';

$("#container").on("click",$(".item__thumb.item__thumb-25x36") , function(event) {
	var itemElement = $(event.target.parentElement).closest(".item");
	var contentId = itemElement.data("id");
	var element = $(event.target).closest(".item__thumb.item__thumb-25x36");
	var id = element.attr("id");
	var isWishContent = false;
	
	if (id == "wishContent") {
		element.attr("id", "");
	}
	else {
		element.attr("id", "wishContent");
		isWishContent = true;
  	}
	
	var wishData = {
			"contentId" : contentId,
			"isWishContent" : isWishContent
	}
	
	wishStateChange(wishData);
	
});