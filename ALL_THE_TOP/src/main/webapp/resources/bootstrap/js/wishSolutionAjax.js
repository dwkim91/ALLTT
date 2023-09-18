export function wishSolution(filtered) {
	$.ajax({
		url: '/member/wishSolution',
		type: 'POST',
	    data: JSON.stringify(filtered), // 데이터를 JSON 문자열로 변환하여 전송
	    contentType: 'application/json', // 전송하는 데이터의 형식을 JSON으로 지정
		
		success: function(filteredData) {
			
			console.log("ㅋㅋ");
			
		}
	})
}