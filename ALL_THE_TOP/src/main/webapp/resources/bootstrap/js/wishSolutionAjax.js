var platformMap;

export function wishSolutionAjax(filtered) {
	
	$.ajax({
		url: '/member/wishSolution',
		type: 'POST',
	    data: JSON.stringify(filtered), // 데이터를 JSON 문자열로 변환하여 전송
	    contentType: 'application/json', // 전송하는 데이터의 형식을 JSON으로 지정
		
		success: function(response) {
			
			platformMap = response;
			
			$('#netflixByNetflixCnt').text(response[1][1].length);
			$('#netflixByTvingCnt').text(response[1][2].length);
			$('#netflixByWavveCnt').text(response[1][3].length);
			$('#tvingByTvingCnt').text(response[2][2].length);
			$('#tvingByNetflixCnt').text(response[2][1].length);
			$('#tvingByWavveCnt').text(response[2][3].length);
			$('#wavveByWavveCnt').text(response[3][3].length);
			$('#wavveByNetflixCnt').text(response[3][1].length);
			$('#wavveByTvingCnt').text(response[3][2].length);
			
		}
	})
}

export function getPlatformMap(platformTableDataId, platformTrDataId) {
	
	return platformMap[platformTableDataId][platformTrDataId];
		
}