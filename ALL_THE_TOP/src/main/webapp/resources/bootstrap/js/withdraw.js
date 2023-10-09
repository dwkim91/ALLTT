
updateButtonStatus();
// 동의 체크박스 상태확인 -> 버튼 상태 업데이트
document.getElementById('d_agree').addEventListener('change', updateButtonStatus);

function updateButtonStatus() {
    // 필요한 요소들을 가져오기
    var agreeCheckbox = document.getElementById('d_agree');
    var withdrawButton = document.querySelector('.primary-btn');

    // 동의 체크박스가 체크된 경우
    if (agreeCheckbox.checked) {
        // 버튼 활성화
    	withdrawButton.removeAttribute('disabled');
    } else {
        // 버튼 비활성화
    	withdrawButton.setAttribute('disabled', 'disabled');
    }
}

//탈퇴하기
function withdrawMember(socialNm){
	console.log(socialNm);

	// 각 체크박스 상태를 저장하는 변수들을 초기화합니다.	
	var dPostCheckbox = document.getElementById('dPostYn');
    var dReplyCheckbox = document.getElementById('dReplyYn');
    var dAgreeCheckbox = document.getElementById('d_agree');
    var d_agree = dAgreeCheckbox.checked ? "Y" : "N";
    
	if (d_agree === "N"){
		alert("탈퇴 동의를 체크해 주세요.");
	}
	else if (d_agree === "Y"){
		
		if (confirm("정말 탈퇴 하시겠습니까?")) {
			
			var delete_data = {
				"dPostYn"  : dPostCheckbox.checked   ? "Y" : "N",
				"dReplyYn" : dReplyCheckbox.checked ? "Y" : "N",
			};
			
			$.ajax({
				url : '/member/deleteMyPost',
				type : 'POST',
				data : JSON.stringify(delete_data),
				contentType : 'application/json',
				beforeSend: function(xhr) {
				    // CSRF 토큰을 요청 헤더에 추가
				    xhr.setRequestHeader("X-CSRF-TOKEN", csrfToken);
				},
				success : function(response) {
					alert(response);
					alert("다음에 다시 만나요.");
					var service = socialNm;	
					location.href = '/member/' + service + '/withdraw';
				}
			});
				
		} else {
			alert("감사합니다 ^^");
		}
		
	}

}
