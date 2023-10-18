export function wishContentRemoveAjax(removeContentList) {
	$.ajax({
		url: '/member/removeWishContent',
		type: 'POST',
		contentType: 'application/json',
		data: JSON.stringify(removeContentList),
		beforeSend: function(xhr) {
		    // CSRF 토큰을 요청 헤더에 추가
		    xhr.setRequestHeader("X-CSRF-TOKEN", csrfToken);
		},
		success: function(successCheck) {
		}
	})
}