// 프로필변경 파일업로드 요소 클릭
function openFileInput(contentId) {
    // 파일 업로드(input type="file) 요소를 클릭
    document.getElementById(contentId).click();
}
// 프로필이미지 저장 및 변경
$(".fileInput").on("change", function() {
    var uploadFile = this.files[0];
    console.log(uploadFile);

    if (uploadFile) {
        var formData = new FormData();
        formData.append("uploadFile", uploadFile);

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
            },
            error: function() {
                // 업로드 실패 시 처리
                console.error("파일 업로드 실패");
            }
        });
    }
});