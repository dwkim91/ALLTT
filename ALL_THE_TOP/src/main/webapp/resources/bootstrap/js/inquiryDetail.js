
radioButtonCheck();

function radioButtonCheck() {
	var statusRadios = document.getElementsByName("status"); 

	for (var i = 0; i < statusRadios.length; i++) {
		if (statusRadios[i].value === statusValue) { 
			statusRadios[i].checked = true; 
			break; 
		}
	}
}


//저장 버튼
var saveButton = document.querySelector('.btn-primary');

saveButton.addEventListener('click', function (event) {

    // 라디오 버튼의 선택된 값
    var selectedStatus = document.querySelector('input[name="status"]:checked').value;

    // Answer 텍스트
    var answerText = document.querySelector('textarea[name="content"]').value;

	var data = {
		"supportId" : supportId, 
		"supportStatus": selectedStatus,
		"answer": answerText,
	};
	
	$.ajax({
		url : '/support/registerAnswer',
		type : 'POST',
		data : JSON.stringify(data),
		contentType : 'application/json',
		beforeSend: function(xhr) {
		    // CSRF 토큰을 요청 헤더에 추가
		    xhr.setRequestHeader("X-CSRF-TOKEN", csrfToken);
		},
		success : function(response) {
			alert(response);
			window.location.href = '/support/inquiryList/all';
		}
	});
    
});





