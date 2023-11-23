
//검색 버튼
var searchButton = document.querySelector('.btn-primary');

searchButton.addEventListener('click', function (event) {
	
    var searchTitle = document.querySelector('.searchInput').value; // 검색어 가져오기
    
    var tableBody = document.querySelector('tbody'); // <tbody> 요소 가져오기
    tableBody.innerHTML = ''; // <tbody> 내부의 요소들 삭제
    
    if (searchTitle === '') {
        alert('검색어를 입력해주세요!'); // 검색어가 비어 있는 경우 경고창 표시
    }
    else {
		
    	$.ajax({
			url : '/support/searchContent',
			type : 'GET',
			data : {title : searchTitle},
			contentType : 'application/json',
			beforeSend: function(xhr) {
			    // CSRF 토큰을 요청 헤더에 추가
			    xhr.setRequestHeader("X-CSRF-TOKEN", csrfToken);
			},
			success : function(filteredDTOList) {
				
				// 클래스 이름을 사용하여 요소 찾기
				var contentCntElement = document.querySelector('.contentCnt');
				// filteredDTOList의 크기를 가져와서 변수에 저장
			    var filteredDTOListSize = filteredDTOList.length;

			    // contentCntElement의 내용을 변경
			    contentCntElement.textContent = `컨텐츠 관리 ( ${filteredDTOListSize} )`;
				
				$(filteredDTOList).each(function(){
				    
					var contentId = this.contentId;
			        var title = this.title;
			        var creator = this.creator;
			        var actors = this.actors;
			        var enrollDt = this.enrollDt;
			        var contentType = this.contentType;
					
			        var row = `
		                <tr>
		                    <td>${contentId}</td>
		                    <td>${title}</td>
		                    <td>${creator}</td>
		                    <td>${actors}</td>
		                    <td>${enrollDt}</td>
		                    <td>${contentType}</td>
		                    <td class="center-text">
		                        <a class="btn btn-sm btn-primary" href="${contextPath}/support/misContentDetail?contentId=${contentId}">Detail</a>
		                    </td>
		                </tr>
		            `;

		            // 생성한 행을 tableBody에 추가
		            tableBody.insertAdjacentHTML('beforeend', row);
					
				});
			}
		});
    }
    
});





