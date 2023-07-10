import { contentsSearchAjax } from './contentSearchAjax.js';

// 검색버튼 클릭시 검색창 상태 확인하여 열거나 닫기
$('#searchButton').click(function() {
	$('.footer').removeClass('footer').addClass('scrollLoadFalse');
	console.log("검색창 상태확인");
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
	console.log("검색창 값변경");
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
	console.log("검색창 오픈");
	$('.checkbox-label').removeClass('checkbox-label').addClass('checkboxfalse');
	$('.nice-select').removeClass('nice-select').addClass('selectfalse');
	$('#searchBarContainer').addClass('active');
	$('#searchButton').addClass('active');
	$('#searchBar').focus();
}
  
// 검색창 닫기
function closeSearchBar() {
	console.log("검색창 닫기");
	$('.checkboxfalse').removeClass('checkboxfalse').addClass('checkbox-label');
	$('.selectfalse').removeClass('selectfalse').addClass('nice-select');
	$('#searchBarContainer').removeClass('active');
	$('#searchButton').removeClass('active');
}

// 검색창 포커스 풀리면 숨기기 실행
$('#searchBar').blur(function() {
	console.log("포커스 풀림");
	closeSearchBar();
});