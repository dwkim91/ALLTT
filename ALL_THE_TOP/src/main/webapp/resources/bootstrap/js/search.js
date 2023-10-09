import { searchAjax } from './searchAjax.js';

$('#searchButton').click(function() {
    $.ajax({
      url: '/member/checkSession',
      type: 'POST',
      beforeSend: function(xhr) {
    	    // CSRF 토큰을 요청 헤더에 추가
    	    xhr.setRequestHeader("X-CSRF-TOKEN", csrfToken);
    	},
      success: function(response) {
        if (response) {
        	var searchBarContainer = $('#searchBarContainer');

            if (searchBarContainer.hasClass('active')) {
            	closeSearchBar();
            }
            else {
            	openSearchBar();
            }
        } else {
        	window.location.href = '/login';
        }
      }
    });
});

//검색창에서 엔터시 검색
$('#searchBar').on('keyup', function(event) {
	if (event.which === 13 && $("#searchBar").val() != "") { // 검색어 입력 후 엔터시 검색실행
		$(".section-title").empty();
		$(".tempList").empty();
		$("#container").empty();
		var searchKey = {
    		"contentType" : $("#contentType").val(),
    		"searchKey"   : $("#searchBar").val()
    	}
		searchAjax(searchKey);
    }
});

//검색창 오픈 및 포커스
function openSearchBar() {
	$('.checkbox-platform').removeClass('checkbox-platform').addClass('checkboxfalse');
	$('.nice-select').removeClass('nice-select').addClass('selectfalse');
	$('#searchBarContainer').addClass('active');
	$('#searchButton').addClass('active');
	$('#searchBar').focus();
}
  
// 검색창 닫기
function closeSearchBar() {
	$('.checkboxfalse').removeClass('checkboxfalse').addClass('checkbox-platform');
	$('.selectfalse').removeClass('selectfalse').addClass('nice-select');
	$('#searchBarContainer').removeClass('active');
	$('#searchButton').removeClass('active');
}