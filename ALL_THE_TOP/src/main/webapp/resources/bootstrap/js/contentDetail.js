
//저장 버튼
var saveButton = document.querySelector('.btn-primary');

saveButton.addEventListener('click', function (event) {

	var title = document.querySelector('input[name="title"]').value;
	var creator = document.querySelector('input[name="creator"]').value;
	var actors = document.querySelector('input[name="actors"]').value;
	var summary = document.querySelector('textarea[name="summary"]').value;
	var enrollDt = document.querySelector('input[name="enrollDt"]').value;
	
	var data = {
		"contentId" : contentId, 
		"title": title != null ? title : "",
		"creator": creator != null ? creator : "",
		"actors": actors != null ? actors : "",
		"summary": summary != null ? summary : "",
		"enrollDt": enrollDt,
	};
	
	$.ajax({
		url : '/support/modifyContentInfo',
		type : 'POST',
		data : JSON.stringify(data),
		contentType : 'application/json',
		beforeSend: function(xhr) {
		    // CSRF 토큰을 요청 헤더에 추가
		    xhr.setRequestHeader("X-CSRF-TOKEN", csrfToken);
		},
		success : function(response) {
			alert(response);
			window.location.href = '/support/contentManagement';
		}
	});
	
    
});





