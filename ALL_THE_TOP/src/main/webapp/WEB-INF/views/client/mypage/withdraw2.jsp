<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<script>
//탈퇴하기
/*
 * 
 
function withdrawMember(socialNm) {
	var service = socialNm;
	if (confirm("정말 탈퇴 하시겠습니까?")) {
		location.href = '/member/' + service + '/withdraw';
		alert("다음에 다시 만나요.");
	} else {
		alert("감사합니다 ^^");
	}
}
*/

//탈퇴버튼에 클릭 이벤트 리스너 연결
/*
document.getElementById('withdrawButton').addEventListener('click', function() {
    var socialNm = ${member.socialNm};
    withdrawMember(socialNm);
});
*/

//탈퇴하기
function withdrawMember(socialNm){
	console.log(socialNm);

	// 각 체크박스 상태를 저장하는 변수들을 초기화합니다.
	var d_post = 0;
	var d_reply = 0;
	var d_agree = 0;
	
	var dPostCheckbox = document.getElementById('d_post');
    var dReplyCheckbox = document.getElementById('d_reply');
    var dAgreeCheckbox = document.getElementById('d_agree');
    d_agree = dAgreeCheckbox.checked ? 1 : 0;
    
	if (d_agree === 0){
		alert("탈퇴 동의를 체크해 주세요.");
	}
	else if (d_agree === 1){
		
		var filterData = {
			"d_post"  : d_post = dPostCheckbox.checked   ? 1 : 0,
			"d_reply" : d_reply = dReplyCheckbox.checked ? 1 : 0,
		};
		console.log('d_post:', d_post, 'd_reply:', d_reply, 'd_agree:', d_agree);
		/*
		$.ajax({
			url : '/member/' + service + '/withdraw',
			type : 'POST',
			data : JSON.stringify(filterData),
			contentType : 'application/json',
			success : function(response) {
				alert(response);
			}
		});
		*/
		
	}
	/*
	checkboxElements.forEach(function(checkbox) {
	    checkbox.addEventListener('change', function() {
	    	if (checkbox.id === 'reason-0') {
	            ch1 = checkbox.checked ? 1 : 0;
	        } else if (checkbox.id === 'reason-1') {
	            ch2 = checkbox.checked ? 1 : 0;
	        } else if (checkbox.id === 'reason-2') {
	            ch3 = checkbox.checked ? 1 : 0;
	        } else if (checkbox.id === 'agree') {
	            ch4 = checkbox.checked ? 1 : 0;
	        }
	        console.log('ch1:', ch1, 'ch2:', ch2, 'ch3:', ch3, 'ch4:', ch4);
	    });
	});
	*/
	
	/*
	var netflixCheckbox = document.querySelector('#'+contentType+'-filter #netflixCheckbox');
	var tvingCheckbox = document.querySelector('#'+contentType+'-filter #tvingCheckbox');
	var wavveCheckbox = document.querySelector('#'+contentType+'-filter #wavveCheckbox');
	var genreId = getSelectVal('.' + contentType + '-g-select');
	var wishIncludeYn = getSelectVal('.' + contentType + '-w-select');
	var sortType = getSelectVal('.' + contentType + '-s-select');
	
	var filterData = {
		"netflixId" : netflixCheckbox.checked ? Number(netflixCheckbox.value) : 0,
		"tvingId" : tvingCheckbox.checked ? Number(tvingCheckbox.value) : 0,
		"wavveId" : wavveCheckbox.checked ? Number(wavveCheckbox.value) : 0,
		"genreId" : genreId,
		"wishIncludeYn" : wishIncludeYn,
		"sortType" : sortType,
		"contentType" : contentType,
	};
	
	$.ajax({
		url : '/member/' + service + '/withdraw',
		type : 'POST',
		data : JSON.stringify(filterData),
		contentType : 'application/json',
		success : function(response) {
			alert(response);
		}
	});
	*/

}
</script>

	<link rel="stylesheet" href="${contextPath}/resources/bootstrap/css/scss/withdraw.css" type="text/css">
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<div id="__nuxt">
		<div id="__layout">
			<div id="root" data-v-c827bb7e="">
				<main data-v-214537f9="" data-v-c827bb7e="" id="contents">
					<div data-v-214537f9="" class="wrapper">
						<div data-v-214537f9="" class="main-contents-wrap" style="padding-top: 100px;">
							<div data-v-214537f9="" class="main-title">
								<h4 data-v-214537f9="">
									회원님의 <b>삭제할 정보</b>를 선택해 주세요.
								</h4>
								<span data-v-214537f9="">(다중 선택 가능)</span>
							</div>
							<div data-v-214537f9="" class="reason-list">
								<div data-v-214537f9="" class="checkbox-item">
									<span data-v-214537f9="" class="dark-default-check-wrap"><input
										data-v-214537f9="" type="checkbox" id="d_post"
										class="filter-checkbox" value="게시글 지우기"><label
										data-v-214537f9="" for="d_post" class="checker"><span
											data-v-214537f9=""></span></label></span><span data-v-214537f9=""
										class="checkbox-text"><label data-v-214537f9=""
										for="d_post">게시글 지우기</label></span>
								</div>
								<div data-v-214537f9="" class="checkbox-item">
									<span data-v-214537f9="" class="dark-default-check-wrap"><input
										data-v-214537f9="" type="checkbox" id="d_reply"
										class="filter-checkbox" value="댓글 지우기"><label
										data-v-214537f9="" for="d_reply" class="checker"><span
											data-v-214537f9=""></span></label></span><span data-v-214537f9=""
										class="checkbox-text"><label data-v-214537f9=""
										for="d_reply">댓글 지우기</label></span>
								</div>
							</div>
							<div data-v-214537f9="" class="divider"></div>
							<div data-v-214537f9="" class="terms">
								<h4 data-v-214537f9="">반드시 아래 사항을 꼼꼼하게 확인한 후에 탈퇴를 진행해 주세요.</h4>
								<p data-v-214537f9="">탈퇴 시 회원님의 개인정보는 즉시 삭제됩니다.</p>
								<p data-v-214537f9="">회원정보 및 개인형 서비스의 데이터 역시 모두 삭제 됩니다.</p>
								<p data-v-214537f9="">회원님의 삭제된 데이터는 복구할 수 없습니다.</p>
							</div>
							<div data-v-214537f9="" class="checkbox-item">
								<span data-v-214537f9="" class="dark-default-check-wrap"><input
									data-v-214537f9="" type="checkbox" id="d_agree"
									class="filter-checkbox"><label data-v-214537f9=""
									for="d_agree" class="checker"><span data-v-214537f9=""></span></label></span><span
									data-v-214537f9="" class="checkbox-text"><label
									data-v-214537f9="" for="d_agree">위 내용을 모두 확인하였으며, 이에
										동의합니다.</label></span>
							</div>
							<button data-v-214537f9="" class="primary-btn" id="withdrawButton" onclick="withdrawMember('${member.socialNm}')">탈퇴 하기</button>
						</div>
					</div>
					<!---->
				</main>
			</div>
		</div>
	</div>

</body>
</html>