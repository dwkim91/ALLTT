const textarea = document.getElementById('suggestion-text');
const radioButtons = document.querySelectorAll('input[name="question_type"]');

radioButtons.forEach(radioButton => {
	radioButton.addEventListener('change', function() {
		if (this.value === 'DB_AND_BUG_REPORT') {
			textarea.placeholder = '누락된 작품 또는 연결이 안 되었거나 잘못된 작품을 제보해주세요.\n해당 작품의 제목을 정확히 입력해주셔야 빠른 처리가 가능합니다.\n예시) ‘라라랜드’ ‘넷플릭스’에서도 볼 수 있습니다.';
		} else {
			textarea.placeholder = '문의 및 제안 내용을 입력해주세요.';
		}
	});
});


const emailInput = document.getElementById('email');
const errorMsg = document.querySelector('.error-msg');
var emailVaildation = false; 
emailInput.addEventListener('input', function() {
	const email = emailInput.value;
	var msg = '';
	var color = '';
	if (emailInput.value === '') {
		msg = '입력창에 내용을 입력해주세요.';
		color = 'red'; // 에러 메시지 텍스트 색상
	  	showErrorMsg(msg, color);
	}
	else{
		// AJAX 요청 보내기
		$.ajax({
			url: '/support/validateEmail',
			type: 'POST',
			data : {
				email : email
			},
			success: function(response) {
				msg = response;
				if (msg === 'vaildated') {
					msg = '유효한 이메일 주소입니다.';
					color = 'lime';
					showErrorMsg(msg, color);
					emailVaildation = true;					
				}
				else {
					msg = '유효하지 않은 이메일 주소입니다.';
					color = 'red';
					showErrorMsg(msg, color);
					emailVaildation = false;
				}
				updateButtonStatus();
			},
		});
	}	  
});

function showErrorMsg(msg, color) {
	errorMsg.textContent = msg;
	errorMsg.style.color = color;
}

updateButtonStatus();

// 이메일 입력, 문의 내용 입력, 동의 체크박스 상태확인 -> 버튼 상태 업데이트
document.getElementById('suggestion-text').addEventListener('input', updateButtonStatus);
document.getElementById('reason-email').addEventListener('change', updateButtonStatus);

function updateButtonStatus() {
    // 필요한 요소들을 가져오기
    var email = emailVaildation;
    var suggestionText = document.getElementById('suggestion-text');
    var reasonEmailCheckbox = document.getElementById('reason-email');
    var sendButton = document.querySelector('.primary-btn');

    // 이메일 주소가 비어 있지 않고, 문의 내용이 비어 있지 않고, 동의 체크박스가 체크된 경우
    if (email && suggestionText.value.trim() !== '' && reasonEmailCheckbox.checked) {
        // 버튼 활성화
        sendButton.removeAttribute('disabled');
    } else {
        // 버튼 비활성화
        sendButton.setAttribute('disabled', 'disabled');
    }
}

//요청문의 보내기
function sendInquiry(){
	
	// 이메일 주소, 문의 내용, 동의 체크박스 값을 가져옴
	var questionType = $("input[name='question_type']:checked").val();
	var suggestion = $("#suggestion-text").val();
	var email = $("#email").val();
	
	var inquiryData = {
			"questionType" : questionType,
			"suggestion" : suggestion,
			"email" : email,
	};
		
	$.ajax({
		url : '/support/inquiryRegistration',
		type : 'POST',
		data: JSON.stringify(inquiryData),
        contentType: "application/json",
		success : function(response) {
			alert(response);
			window.location.href = '/support/inquiry';
		}
	});
	
}