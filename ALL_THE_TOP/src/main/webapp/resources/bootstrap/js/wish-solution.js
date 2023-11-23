import { wishSolutionAjax, getPlatformMap  } from './wish-solutionAjax.js';
import { wishContentListAjax } from './wish-contentListLoadAjax.js';

function wishSolution() {
	
	var filtered = {
			contentType : $('#contentType').val(),
	};
	
	wishSolutionAjax(filtered);
}

wishSolution();

function wishContentLoad() {
	var contentType = {
			"contentType" : $("#contentType").val()
	}
	
	$("#wishContainer").empty();
	wishContentListAjax(contentType);
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
	
	wishContentLoad();
	wishSolution();
	
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
		
		var platformTd = platformIcon.closest('.platformTd');

		var platformTdDataId = platformTd.data('id');
		
		
		const array = [1,2,3];
		
		for(const elemetn of array) {
			platformData = getPlatformMap(platformTdDataId, elemetn);
			platformData.forEach(function(dataId){
				$('[data-id="' + dataId + '"] .item__tags').attr("id", "wishContent");
				
			});
			platformData = getPlatformMap(elemetn, platformTdDataId);
			platformData.forEach(function(dataId){
				$('[data-id="' + dataId + '"] .item__tags').attr("id", "wishContent");
				
			});
		}
		
		
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
