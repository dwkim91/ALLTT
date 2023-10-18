import { contentsSearchAjax } from './contentType-filterAjax.js';

// 검색버튼 클릭시 검색창 상태 확인하여 열거나 닫기
$('#searchButton').click(function() {
	var searchBarContainer = $('#searchBarContainer');

    if (searchBarContainer.hasClass('active')) {
    	closeSearchBar();
    }
    else {
    	openSearchBar();
    }
});

// 검색창에서 엔터시 검색
$('#searchBar').on('keyup', function(event) {
	if (event.which === 13 && $("#searchBar").val() != "") { // 검색어 입력 후 엔터시 검색실행
		$("#container").empty();
		var searchKey = {
    		"contentType" : $("#contentType").val(),
    		"searchKey"   : $("#searchBar").val()
    	}
		contentsSearchAjax(searchKey);
    }
});

// 검색창 오픈 및 포커스
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
