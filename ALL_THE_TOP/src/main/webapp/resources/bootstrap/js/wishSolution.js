import { wishSolution } from './wishSolutionAjax.js';

// 차트 변수
var chartInstance1, chartInstance2, chartInstance3;
// 차트 옵션
const commonOptions = {
	    responsive: true,
	    maintainAspectRatio: false,
	    plugins: {
	        legend: {
	            display: false
	        }
	    },
	    layout: {
	        padding: {
	            left: 70 // 오른쪽 여백 추가
	        }
	    }
	};
// 차트 초기 데이터
var dataValueList1 = [ $('#netflixByNetflixCnt').text(), $('#netflixByTvingCnt').text(), $('#netflixByWavveCnt').text() ]; // 넷플릭스 데이터 변수
var dataValueList2 = [ $('#tvingByTvingCnt').text(), $('#tvingByNetflixCnt').text(), $('#tvingByWavveCnt').text() ]; // 티빙 데이터 변수
var dataValueList3 = [ $('#wavveByWavveCnt').text(), $('#wavveByNetflixCnt').text(), $('#wavveByTvingCnt').text() ]; // 웨이브 데이터 변수

// 넷플릭스 차트 데이터
var data1 = {
	labels : [ '넷플릭스', '티빙', '웨이브' ],
	datasets : [ {
		data : dataValueList1,
		backgroundColor : [ '#FF0000', '#FF48C7', '#0100FF' ],
		borderColor : '#ffffff',
		borderWidth : 1
	} ]
};

// 티빙 차트 데이터
var data2 = {
	labels : [ '티빙', '웨이브', '넷플릭스' ],
	datasets : [ {
		data : dataValueList2,
		backgroundColor : [ '#FF48C7', '#0100FF', '#FF0000' ],
		borderColor : '#ffffff',
		borderWidth : 1
	} ]
};

// 웨이브 차트 데이터
var data3 = {
	labels : [ '웨이브', '넷플릭스', '티빙' ],
	datasets : [ {
		data : dataValueList3,
		backgroundColor : [ '#0100FF', '#FF0000', '#FF48C7' ],
		borderColor : '#ffffff',
		borderWidth : 1
	} ]
};

// 차트 생성
const canvas1 = document.getElementById('netflixChart');
if (canvas1) {
	const ctx1 = canvas1.getContext('2d');
	chartInstance1 = new Chart(ctx1, {
		type : 'doughnut',
		data : data1,
		options: commonOptions
	});	
}

// 차트 생성
const canvas2 = document.getElementById('tvingChart');
if (canvas2) {
	const ctx2 = canvas2.getContext('2d');
	chartInstance2 = new Chart(ctx2, {
		type : 'doughnut',
		data : data2,
		options: commonOptions
	});	
}

// 차트 생성
const canvas3 = document.getElementById('wavveChart');
if (canvas3) {
	const ctx3 = canvas3.getContext('2d');
	chartInstance3 = new Chart(ctx3, {
		type : 'doughnut',
		data : data3,
		options: commonOptions
	});
}

$('.chartType').on('click', function() {
	var chartType = $('.chartType');
	
	if (chartType.text() == '시리즈') {
		chartType.text('영화');
		$("#inquiryType").val('movie');
		
	}
	else if (chartType.text() == '영화') {
		chartType.text('전체');
		$("#inquiryType").val('all');
		
		
	}
	else if (chartType.text() == '전체') {
		chartType.text('시리즈');
		$("#inquiryType").val('series');
		
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
			contentType : $('#inquiryType').val(),
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
		
	}
	else if(clickedClass == 'expenseBtn') {
		expenseBtn.removeClass('btn_new');
		expenseBtn.addClass('click_on');
		infoBtn.removeClass('click_on');
		infoBtn.addClass('btn_new');
		platformBtn.removeClass('click_on');
		platformBtn.addClass('btn_new');
		message.text("※ 최소 구독비를 계산하여 컨텐츠를 통합합니다.");
	}
	
    // 이전에 생성된 차트 파괴
    if (chartInstance1) {
        chartInstance1.destroy();
    }
    if (chartInstance2) {
        chartInstance2.destroy();
    }
    if (chartInstance3) {
        chartInstance3.destroy();
    }
    dataValueList1 = [ $('#netflixByNetflixCnt').text(), $('#netflixByTvingCnt').text(), $('#netflixByWavveCnt').text() ]; // 넷플릭스 데이터 변수
    dataValueList2 = [ $('#tvingByTvingCnt').text(), $('#tvingByNetflixCnt').text(), $('#tvingByWavveCnt').text() ]; // 티빙 데이터 변수
    dataValueList3 = [ $('#wavveByWavveCnt').text(), $('#wavveByNetflixCnt').text(), $('#wavveByTvingCnt').text() ]; // 웨이브 데이터 변수
    
	// 넷플릭스 차트 데이터
	var data1 = {
		labels : [ '넷플릭스', '티빙', '웨이브' ],
		datasets : [ {
			data : dataValueList1,
			backgroundColor : [ '#FF0000', '#FF48C7', '#0100FF' ],
			borderColor : '#ffffff',
			borderWidth : 1
		} ]
	};

	// 티빙 차트 데이터
	var data2 = {
		labels : [ '티빙', '웨이브', '넷플릭스' ],
		datasets : [ {
			data : dataValueList2,
			backgroundColor : [ '#FF48C7', '#0100FF', '#FF0000' ],
			borderColor : '#ffffff',
			borderWidth : 1
		} ]
	};

	// 웨이브 차트 데이터
	var data3 = {
		labels : [ '웨이브', '넷플릭스', '티빙' ],
		datasets : [ {
			data : dataValueList3,
			backgroundColor : [ '#0100FF', '#FF0000', '#FF48C7' ],
			borderColor : '#ffffff',
			borderWidth : 1
		} ]
	};

	// 차트 생성
	const canvas1 = document.getElementById('netflixChart');
	if (canvas1) {
		const ctx1 = canvas1.getContext('2d');
		chartInstance1 = new Chart(ctx1, {
			type : 'doughnut',
			data : data1,
			options: commonOptions
		});	
	}

	// 차트 생성
	const canvas2 = document.getElementById('tvingChart');
	if (canvas2) {
		const ctx2 = canvas2.getContext('2d');
		chartInstance2 = new Chart(ctx2, {
			type : 'doughnut',
			data : data2,
			options: commonOptions
		});	
	}

	// 차트 생성
	const canvas3 = document.getElementById('wavveChart');
	if (canvas3) {
		const ctx3 = canvas3.getContext('2d');
		chartInstance3 = new Chart(ctx3, {
			type : 'doughnut',
			data : data3,
			options: commonOptions
		});
	}
});