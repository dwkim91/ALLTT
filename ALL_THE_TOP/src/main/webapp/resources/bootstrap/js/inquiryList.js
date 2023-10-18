
var postContentId;

// 프로필변경 파일업로드 요소 클릭
function openFileInput(contentId) {
    // 파일 업로드(input type="file) 요소를 클릭
    document.getElementById(contentId).click();
    postContentId = contentId;
}

function platformCostModify() {
	var platformCost = document.getElementsByName("platformCost");
	var dataArray = [];

	for (var i = 0; i < platformCost.length; i++) {
	    dataArray.push(platformCost[i].value);
	}
	
	// Ajax 요청을 보냄
	var xhr = new XMLHttpRequest();
	var url = "/support/platformCostModify"; // 컨트롤러의 URL을 여기에 입력

	xhr.open("POST", url, true);
	xhr.setRequestHeader("Content-Type", "application/json;charset=UTF-8");

	// 데이터 배열을 JSON 형식으로 변환하여 전송
	xhr.setRequestHeader("X-CSRF-TOKEN", csrfToken);
	xhr.send(JSON.stringify(dataArray));
	xhr.onreadystatechange = function () {
	    if (xhr.readyState === 4 && xhr.status === 200) {
	        // 서버로부터 응답을 받았을 때 실행할 코드
	        alert(xhr.responseText); // 서버의 응답을 로그에 출력
	    }
	};
}

// 프로필이미지 저장 및 변경
$(".fileInput").on("change", function() {
    var uploadFile = this.files[0];

    if (uploadFile) {
        var formData = new FormData();
        formData.append("uploadFile", uploadFile);
        formData.append("contentId", postContentId);

        $.ajax({
			url: '/support/changeImg',
			type: 'POST',
			data: formData,
			processData: false, // 데이터 처리 방지
			contentType: false, // 컨텐츠 타입 설정
			beforeSend: function(xhr) {
			    // CSRF 토큰을 요청 헤더에 추가
			    xhr.setRequestHeader("X-CSRF-TOKEN", csrfToken);
			},
			success: function(response) {
            	
				
				if (response.startsWith("Error :")) {
					alert(response);
				}

				window.location.reload();
            },
            error: function() {
                // 업로드 실패 시 처리
                console.error("파일 업로드 실패");
            }
        });
    }
});