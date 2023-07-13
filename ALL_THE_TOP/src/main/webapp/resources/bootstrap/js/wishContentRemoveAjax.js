export function wishContentRemoveAjax(removeContentList) {
	$.ajax({
		url: '/member/removeWishContent',
		type: 'POST',
		contentType: 'application/json',
		data: JSON.stringify(removeContentList),
		
		success: function(successCheck) {
			console.log(successCheck);
		}
	})
}