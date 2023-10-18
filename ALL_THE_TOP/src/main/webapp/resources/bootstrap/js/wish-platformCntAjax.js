export function wishPlatformCntAjax(filtered) {
	$.ajax({
		url: '/member/getPlatformCntLoad',
		type: 'POST',
		data: filtered,
		beforeSend: function(xhr) {
		    // CSRF 토큰을 요청 헤더에 추가
		    xhr.setRequestHeader("X-CSRF-TOKEN", csrfToken);
		},
		success: function(response) {
			
			$("#netflixWishCnt").text(response[0]);
			$("#tvingWishCnt").text(response[1]);
			$("#wavveWishCnt").text(response[2]);
			
		}
	})
}