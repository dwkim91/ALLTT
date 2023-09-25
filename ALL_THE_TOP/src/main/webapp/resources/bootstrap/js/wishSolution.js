import { wishSolution } from './wishSolutionAjax.js';
import { wishContentListAjax } from './wishContentListAjax.js';

function wishContentLoad() {
	var contentType = {
			"contentType" : $("#contentType").val()
	}
	
	wishContentListAjax(contentType);
}

$('.chartType').on('click', function() {
	var chartType = $('.chartType');
	
	var seriesBtn = $("#seriesBtn");
	var movieBtn = $("#movieBtn");
	
	if (chartType.text() == '시리즈') {
		chartType.text('영화');
		$("#contentType").val('movie');
		movieBtn.removeClass('btn_new');
		movieBtn.addClass('click_on');
		seriesBtn.removeClass('click_on');
		seriesBtn.addClass('btn_new');
		
		$("#wishContainer").empty();
		wishContentLoad();
		
	}
	else if (chartType.text() == '영화') {
		chartType.text('전체');
		$("#contentType").val('all');
		movieBtn.addClass('click_on');
		seriesBtn.addClass('click_on');
		
		$("#wishContainer").empty();
		wishContentLoad();
	}
	else if (chartType.text() == '전체') {
		chartType.text('시리즈');
		$("#contentType").val('series');
		
		seriesBtn.removeClass('btn_new');
		seriesBtn.addClass('click_on');
		movieBtn.removeClass('click_on');
		movieBtn.addClass('btn_new');
		
		$("#wishContainer").empty();
		wishContentLoad();
		
	}
	
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
    
	// 이벤트가 발생한 요소 ID
    if (platformIcon) {
    	clickedId = platformIcon.attr('id');
    	console.log(clickedId);
    }
    else {
    	// 이전 요소 체크해제 이벤트
    	console.log("체크해제");
    }

	
});

$('.layout__flex-left').on('click','.page_select_layout.btn_popular', function(event) {
	// 이벤트 전파 중단 (버블링 현상 대응)
	event.stopPropagation();
	
	// 이벤트가 발생된 요소
	var clickedElement = $(event.target);
	
	// 클릭이 실제로 발생한 클래스
	var clickedClass = clickedElement.attr('id');
	
	var filtered = {
			contentType : $('#contentType').val(),
			buttonVal	: clickedClass
	};
	
	var infoBtn = $("#infoBtn");
	var platformBtn = $("#platformBtn");
	var expenseBtn = $("#expenseBtn");
	var message = $("#message");
	
	if (clickedClass == 'infoBtn') {
		infoBtn.removeClass('btn_new');
		infoBtn.addClass('click_on');
		platformBtn.removeClass('click_on');
		platformBtn.addClass('btn_new');
		expenseBtn.removeClass('click_on');
		expenseBtn.addClass('btn_new');
		message.text("※ 회원님의 구독정보를 바탕으로 컨텐츠를 통합합니다.");
		wishSolution(filtered);
		
	}
	else if(clickedClass == 'platformBtn') {
		platformBtn.removeClass('btn_new');
		platformBtn.addClass('click_on');
		infoBtn.removeClass('click_on');
		infoBtn.addClass('btn_new');
		expenseBtn.removeClass('click_on');
		expenseBtn.addClass('btn_new');
		message.text("※ 최소 플랫폼 수를 계산하여 컨텐츠를 통합합니다.");
		wishSolution(filtered);
		
	}
	else if(clickedClass == 'expenseBtn') {
		expenseBtn.removeClass('btn_new');
		expenseBtn.addClass('click_on');
		infoBtn.removeClass('click_on');
		infoBtn.addClass('btn_new');
		platformBtn.removeClass('click_on');
		platformBtn.addClass('btn_new');
		message.text("※ 최소 구독비를 계산하여 컨텐츠를 통합합니다.");
		wishSolution(filtered);
	}
	
});