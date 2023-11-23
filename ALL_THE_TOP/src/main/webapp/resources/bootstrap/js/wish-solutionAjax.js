var platformMap;

export function wishSolutionAjax(filtered) {
	
	$.ajax({
		url: '/member/wishSolution',
		type: 'POST',
	    data: JSON.stringify(filtered), // 데이터를 JSON 문자열로 변환하여 전송
	    contentType: 'application/json', // 전송하는 데이터의 형식을 JSON으로 지정
	    beforeSend: function(xhr) {
	        // CSRF 토큰을 요청 헤더에 추가
	        xhr.setRequestHeader("X-CSRF-TOKEN", csrfToken);
	    },
		success: function(response) {
			
			platformMap = response;
			
			var netflixContentCnt = platformMap[1][1].length + platformMap[1][2].length + platformMap[1][3].length;
			var tvingContentCnt = platformMap[2][1].length + platformMap[2][2].length + platformMap[2][3].length;
			var wavveContentCnt = platformMap[3][1].length + platformMap[3][2].length + platformMap[3][3].length;
			var totalContentCnt = netflixContentCnt+tvingContentCnt+wavveContentCnt;
			var myNetflixContentCnt = netflixContentCnt + platformMap[2][1].length + platformMap[3][1].length
			var myTvingContentCnt = tvingContentCnt + platformMap[1][2].length + platformMap[3][2].length
			var myWavveContentCnt = wavveContentCnt + platformMap[1][3].length + platformMap[2][3].length
			
			$('#netflixIcon').empty();
			$('#tvingIcon').empty();
			$('#wavveIcon').empty();
			$('#netflixCnt').empty();
			$('#tvingCnt').empty();
			$('#wavveCnt').empty();
			$('#myNetflixCnt').text(myNetflixContentCnt);
			$('#myTvingCnt').text(myTvingContentCnt);
			$('#myWavveCnt').text(myWavveContentCnt);
			
			var basicCost = 0;
			var standardCost = 0;
			var premiumCost = 0;
			
			if (filtered.contentType == "series") {
				$('#message').text("※ 회원님께서 찜한 시리즈컨텐츠 수는 총 " + totalContentCnt  +"개 입니다.");
			}
			else {
				$('#message').text("※ 회원님께서 찜한 영화컨텐츠 수는 총 " + totalContentCnt +"개 입니다.");
			}
			if (netflixContentCnt != 0) {
				$('#netflixIcon').html('<img src="/resources/bootstrap/img/n100.jpeg" class="platformIcon">');
				$('#netflixCnt').text(netflixContentCnt);
				basicCost += Number($('#netflixBasic').val());
				standardCost += Number($('#netflixStandard').val());
				premiumCost += Number($('#netflixPremium').val());
			}
			if (tvingContentCnt != 0) {
				$('#tvingIcon').html('<img src="/resources/bootstrap/img/t100.jpeg" class="platformIcon">');
				$('#tvingCnt').text(tvingContentCnt);
				basicCost += Number($('#tvingBasic').val());
				standardCost += Number($('#tvingStandard').val());
				premiumCost += Number($('#tvingPremium').val());
			}
			if (wavveContentCnt != 0) {
				$('#wavveIcon').html('<img src="/resources/bootstrap/img/w100.jpeg" class="platformIcon">');
				$('#wavveCnt').text(wavveContentCnt);
				basicCost += Number($('#wavveBasic').val());
				standardCost += Number($('#wavveStandard').val());
				premiumCost += Number($('#wavvePremium').val());
			}
			
			$('#basicCost').html(basicCost.toLocaleString() + "원");
			$('#standardCost').html(standardCost.toLocaleString() + "원");
			$('#premiumCost').html(premiumCost.toLocaleString() + "원");
		}
	})
}

export function getPlatformMap(platformTableDataId, platformTdDataId) {
	
	return platformMap[platformTableDataId][platformTdDataId];
		
}