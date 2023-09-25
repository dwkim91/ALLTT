import { wishSolutionAjax, getPlatformMap  } from './wishSolutionAjax.js';
import { wishContentListAjax } from './wishContentListAjax.js';
import { wishPlatformCntAjax } from './wishPlatformCntAjax.js';

function wishSolution() {
	
	var buttonVal = $(".page_select_layout.btn_popular.click_on").attr("id");
	var filtered = {
			contentType : $('#contentType').val(),
			buttonVal	: buttonVal
	};
	
	wishSolutionAjax(filtered);
}

function wishContentLoad() {
	var contentType = {
			"contentType" : $("#contentType").val()
	}
	
	wishContentListAjax(contentType);
}

function wishPlatformCnt() {
	
	var contentType = {
			"contentType" : $("#contentType").val()
	}
	
	wishPlatformCntAjax(contentType);
	
}

$('.page_select_right').on('click', '.chartType', function(event) {
	var chartType = $('.chartType');
	var seriesBtn = $("#seriesBtn");
	var movieBtn = $("#movieBtn");
	
	if (chartType.text() == '시리즈') {
		chartType.text('영화');
		
		$("#contentType").val('movie');
		movieBtn.removeClass('btn_new').addClass('click_on');
		seriesBtn.removeClass('click_on').addClass('btn_new');
		
	}
	else if (chartType.text() == '영화') {
		chartType.text('전체');
		
		$("#contentType").val('all');
		movieBtn.addClass('click_on');
		seriesBtn.addClass('click_on');
	}
	else if (chartType.text() == '전체') {
		chartType.text('시리즈');
		
		$("#contentType").val('series');
		seriesBtn.removeClass('btn_new').addClass('click_on');
		movieBtn.removeClass('click_on').addClass('btn_new');
	}
	
	$("#wishContainer").empty();
	wishContentLoad();
	wishSolution();
	wishPlatformCnt();
	
});

var platformIcon;

$('.tableContainer').on('click','.platformIcon', function(event) {
	
	var clickedIcon = $(event.target);
	
	// 기존에 클릭된 요소가 있으면 체크해제
	if (platformIcon && platformIcon[0] === clickedIcon[0]) {
		platformIcon.css('background-color', '#f0f0f0');
		platformIcon = null;
	}
	else {
		// 다르다면 새로운 클릭 처리
		// 이전에 클릭한 요소의 배경색을 원래대로 돌린다.
		if (platformIcon) {
			platformIcon.css('background-color', '#f0f0f0');
		}
		// 현재 클릭한 요소의 배경색을 변경한다.
		clickedIcon.css('background-color', 'red');
		platformIcon = clickedIcon; // 이전 클릭을 저장
	}
	
	var clickedId;
	var platformData;
	
	// 이벤트가 발생한 요소 ID
	if (platformIcon) {
		removeItemId();
		clickedId = platformIcon.attr('id');
		
		var platformTr = platformIcon.closest('.platformTr');
		var platformTable = platformTr.closest('.platformTable');

		var platformTrDataId = platformTr.data('id');
		var platformTableDataId = platformTable.data('id');
		
		platformData = getPlatformMap(platformTableDataId, platformTrDataId);
		
		platformData.forEach(function(dataId){
			$('[data-id="' + dataId + '"] .item__tags').attr("id", "wishContent");
			
		});
		
	}
	else {
		removeItemId();
	}

	
});


function removeItemId() {
	$('.item__tags').toArray().forEach(function(item){
		$(item).attr("id", "");
	});
}

$('.layout__flex-left').on('click','.page_select_layout.btn_popular', function(event) {
	// 이벤트 전파 중단 (버블링 현상 대응)
	event.stopPropagation();
	
	// 이벤트가 발생된 요소
	var clickedElement = $(event.target);
	
	// 클릭이 실제로 발생한 클래스
	var clickedClass = clickedElement.attr('id');
	
	var infoBtn = $("#infoBtn");
	var platformBtn = $("#platformBtn");
	var expenseBtn = $("#expenseBtn");
	var message = $("#message");
	
	if (clickedClass == 'infoBtn') {
		infoBtn.removeClass('btn_new').addClass('click_on');
		platformBtn.removeClass('click_on').addClass('btn_new');
		expenseBtn.removeClass('click_on').addClass('btn_new');
		message.text("※ 회원님의 구독정보를 바탕으로 컨텐츠를 통합합니다.");
	}
	else if(clickedClass == 'platformBtn') {
		platformBtn.removeClass('btn_new').addClass('click_on');
		infoBtn.removeClass('click_on').addClass('btn_new');
		expenseBtn.removeClass('click_on').addClass('btn_new');
		message.text("※ 최소 플랫폼 수를 계산하여 컨텐츠를 통합합니다.");
		
	}
	else if(clickedClass == 'expenseBtn') {
		expenseBtn.removeClass('btn_new').addClass('click_on');
		infoBtn.removeClass('click_on').addClass('btn_new');
		platformBtn.removeClass('click_on').addClass('btn_new');
		message.text("※ 최소 구독비를 계산하여 컨텐츠를 통합합니다.");
	}
	
	wishSolution();
	wishPlatformCnt();
	
});

$(function(){
	
	 $("#infoBtn").click();
	
});
