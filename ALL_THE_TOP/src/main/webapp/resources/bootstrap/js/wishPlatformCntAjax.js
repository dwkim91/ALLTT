export function wishPlatformCntAjax(filtered) {
	$.ajax({
		url: '/member/getPlatformCntLoad',
		type: 'POST',
		data: filtered,
		
		success: function(response) {
			
			$("#netflixWishCnt").text(response[0]);
			$("#tvingWishCnt").text(response[1]);
			$("#wavveWishCnt").text(response[2]);
			
		}
	})
}