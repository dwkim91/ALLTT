$(document).ready(function() {
	if (memberSession.length != 0) {
		getMember();
	}
});

function getMember() {
	// AJAX 요청을 통해 member 정보를 가져오는 코드
	$.ajax({
		url : '/member/memberInfo',
		type : 'POST',
		success : function(data) {
			var member = data; // 받아온 data 정보를 member 변수에 할당
			headerSetMemberInfo(member); // member의 값을 설정하는 함수 호출
		},
		error : function(error) {
			console.log('Failed to fetch member information.');
		}
	});
}

function headerSetMemberInfo(member) {
	// 닉네임 요소 선택
	var nicknameElement = document.querySelector('.profile_info_name');
	// text 값 입력
	nicknameElement.innerText = member.nickName;
	
	var imgType = member.imgExtension.toLowerCase(); // 이미지 확장자를 소문자로 변환
	var imgSrc = "data:image/" + imgType + ";base64," + member.imgData; // 이미지 데이터(byte[] or String)를 Base64 인코딩된 이미지 소스로 변환
	
	// 이미지 요소 선택
	var firstImgElement = document.querySelector('.menu_my .loaded.css-1doy9ip.euf32k22');
	// src 값 변경
	firstImgElement.setAttribute('src', imgSrc);
	
	// 이미지 요소 선택
	var secondImgElement = document.querySelector('.menu_my_content.wrap_margin .loaded.css-1doy9ip.euf32k22');
	// src 값 변경
	secondImgElement.setAttribute('src', imgSrc);
}
