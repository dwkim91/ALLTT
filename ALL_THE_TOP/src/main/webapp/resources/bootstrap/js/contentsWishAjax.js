export function wishStateChange(wishData) {
	$.ajax({
		url: '/member/wishStateChange',
		type: 'POST',
		data: wishData,
		
		success: function(resultData) {
			console.log(resultData);
		}
	})
}