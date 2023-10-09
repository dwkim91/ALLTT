export function wishStateChange(wishData) {
	$.ajax({
		url: '/member/wishStateChange',
		type: 'POST',
		data: wishData,
		beforeSend: function(xhr) {
		    // CSRF 토큰을 요청 헤더에 추가
		    xhr.setRequestHeader("X-CSRF-TOKEN", csrfToken);
		},
		success: function(resultData) {
			
			alert(resultData);
		}
	})
}