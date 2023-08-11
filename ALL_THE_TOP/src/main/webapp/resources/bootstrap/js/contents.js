import { contentsLoadAjax } from './contentsAjax.js';

var delay = 100;		 // 딜레이 시간 설정 (밀리초 단위)
var timer;				 // 타이머 변수 선언

$(window).scroll(function() {	// 현재 스크롤 값이 변하면 이벤트 실행
    clearTimeout(timer);		// 이전에 예약된 타이머 취소 (이미 진행중인 작업이 있다면 취소)
    
    timer = setTimeout(function() {	// 스크롤 이벤트 발생 후, delay 시간이 지난 후에 실행되는 코드
        var footerOffset = $('.footer').offset().top; 				// footer 클래스 상단 높이 값
        var windowHeight = $(window).height();		  				// 현재 브라우저 창의 높이 값
        var scrollPosition = $(window).scrollTop() + windowHeight;  // 현재 스크롤 높이 값
        var itemCount = document.querySelectorAll('.item').length;	// 현재 로드된 item개수
        
        if (scrollPosition >= footerOffset) {	// 현재 스크롤위치가 footer상단 위치값보다 크거나 같을때 실행
        	
        	var filterData = {
				"netflixId"		:	$('#netflixCheckbox').prop('checked') ? Number($('#netflixCheckbox').val()) :  Number('0'),
				"tvingId"		:	$('#tvingCheckbox').prop('checked')	  ? Number($('#tvingCheckbox').val()) 	:  Number('0'),
				"wavveId"		:	$('#wavveCheckbox').prop('checked')	  ? Number($('#wavveCheckbox').val()) 	:  Number('0'),
				"isWishInclude"	:	Boolean($('#isWishInclude').val()),
				"contentType"	:	$('#contentType').val(),
				"sortType"		:	$('#sortType').val(),
				"genreId"		:	Number($('#genreId').val()),
				"lastItemCnt"	:	document.querySelectorAll('.item').length,
			}
			contentsLoadAjax(filterData);
        }
    }, delay);
});

$('.checkbox-platform').change(function() {
	$('.scrollLoadFalse').removeClass('scrollLoadFalse').addClass('footer');
	$("#container").empty();
	
	var filterData = {
			"netflixId"		:	$('#netflixCheckbox').prop('checked') ? Number($('#netflixCheckbox').val()) :  Number('0'),
			"tvingId"		:	$('#tvingCheckbox').prop('checked')	  ? Number($('#tvingCheckbox').val()) 	:  Number('0'),
			"wavveId"		:	$('#wavveCheckbox').prop('checked')	  ? Number($('#wavveCheckbox').val()) 	:  Number('0'),
			"isWishInclude"	:	Boolean($('#isWishInclude').val()),
			"contentType"	:	$('#contentType').val(),
			"sortType"		:	$('#sortType').val(),
			"genreId"		:	Number($('#genreId').val()),
			"lastItemCnt"	:	document.querySelectorAll('.item').length
		}
	contentsLoadAjax(filterData);
});

$('.select-filter').change(function() {
	$('.scrollLoadFalse').removeClass('scrollLoadFalse').addClass('footer');
	$("#container").empty();
	
	var filterData = {
			"netflixId"		:	$('#netflixCheckbox').prop('checked') ? Number($('#netflixCheckbox').val()) :  Number('0'),
			"tvingId"		:	$('#tvingCheckbox').prop('checked')	  ? Number($('#tvingCheckbox').val()) 	:  Number('0'),
			"wavveId"		:	$('#wavveCheckbox').prop('checked')	  ? Number($('#wavveCheckbox').val()) 	:  Number('0'),
			"isWishInclude"	:	Boolean($('#isWishInclude').val()),
			"contentType"	:	$('#contentType').val(),
			"sortType"		:	$('#sortType').val(),
			"genreId"		:	Number($('#genreId').val()),
			"lastItemCnt"	:	document.querySelectorAll('.item').length
		}
	contentsLoadAjax(filterData);
});