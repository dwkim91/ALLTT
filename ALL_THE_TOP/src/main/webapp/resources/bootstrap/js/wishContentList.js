import { wishContentListAjax } from './wishContentListAjax.js';
import { wishContentRemoveAjax } from './wishContentRemoveAjax.js';

$('.layout__flex-left').on('click','.page_select_layout.btn_popular', function(event) {
	// 이벤트 전파 중단 (버블링 현상 대응)
	event.stopPropagation();
	
	// 이벤트가 발생된 요소
	var clickedElement = $(event.target);
	
	// 클릭이 실제로 발생한 클래스
	var clickedClass = clickedElement.attr('id');
	
	var seriesBtn = $("#seriesBtn");
	var movieBtn = $("#movieBtn");
	
    $(".page_select__hover").addClass("hidden");
    $(".css-110e4jt").removeClass("hidden");
    $(".css-vmfm9q").addClass("hidden");
	
	if (clickedClass == 'seriesBtn') {
		$("#contentType").val('series');
		seriesBtn.removeClass('btn_new');
		seriesBtn.addClass('click_on');
		movieBtn.removeClass('click_on');
		movieBtn.addClass('btn_new');
		$(".chartType").text('시리즈');
		
		$("#wishContainer").empty();
		wishContentLoad();
	}
	else if(clickedClass == 'movieBtn') {
		$("#contentType").val('movie');
		movieBtn.removeClass('btn_new');
		movieBtn.addClass('click_on');
		seriesBtn.removeClass('click_on');
		seriesBtn.addClass('btn_new');
		$('.chartType').text('영화');
		
		$("#wishContainer").empty();
		wishContentLoad();
	}
	
});

function wishContentLoad() {
	var contentType = {
			"contentType" : $("#contentType").val()
	}
	
	wishContentListAjax(contentType);
}

$(".css-110e4jt").on("click", function() {
    // 편집 버튼 클릭 시 전체선택, 선택, 완료 버튼 보이도록 설정
	$("#itemCnt").text("삭제 (0)");
    $(".page_select__hover").removeClass("hidden");
    $(".css-110e4jt").addClass("hidden");
    $(".css-vmfm9q").removeClass("hidden");
    
    $(".item__thumb.item__thumb-25x36").each(function() {
        var html = '<div class="thumb_summary"><button class="btn__check false"></button></div>';
        $(this).append(html);
    });
    
    $(".loaded.css-1doy9ip.euf32k22").each(function() {
    	$(this).css("pointer-events", "none");
    });
    
});

$(".css-vmfm9q").on("click", function() {
    // 완료 버튼 클릭 시 전체선택, 선택, 완료 버튼 숨기고 편집 버튼 보이도록 설정
	$("#itemCnt").text("삭제 (0)");
    $(".page_select__hover").addClass("hidden");
    $(".css-110e4jt").removeClass("hidden");
    $(".css-vmfm9q").addClass("hidden");
    
    $(".thumb_summary").each(function() {
       $(this).remove();
    });
    
    $(".loaded.css-1doy9ip.euf32k22").each(function() {
    	$(this).css("pointer-events", "");
    });
});

$(".page_select_layout.page_select__hover.icon-check").on("click", function() {
	if ($(this).text() == "전체선택") {
		$(".btn__check").removeClass("false").addClass("click_on");
		$(this).text("전체해제");
	}
	else {
		$(".btn__check").removeClass("click_on").addClass("false");
		$(this).text("전체선택");
	}
	
	var itemCount = document.querySelectorAll('.btn__check.click_on').length;
	
	$("#itemCnt").text("삭제 (" + itemCount + ")");
	
})

$("#wishContainer").on("click",".thumb_summary",function(event){
	event.preventDefault();

	// 이벤트가 발생된 요소
	var clickedElement = $(event.target);
	
	var elementClasses = event.target.className.split(' ');
	
	if (elementClasses[0] == 'thumb_summary') {
		var hasChildClass = clickedElement.find(".false").length > 0;
		
		if (hasChildClass) {
			clickedElement.find(".btn__check").removeClass("false").addClass("click_on");
		}
		else {
			clickedElement.find(".btn__check").removeClass("click_on").addClass("false");
		}
		
	}
	else if (elementClasses[0] == 'btn__check') {
		
		if (elementClasses[1] == 'false') {
			clickedElement.removeClass("false").addClass("click_on");
		}
		else {
			clickedElement.removeClass("click_on").addClass("false");			
		}
		
	}
	var itemCount = document.querySelectorAll('.btn__check.click_on').length;
	
	$("#itemCnt").text("삭제 (" + itemCount + ")");
	
});

$("#itemCnt").on("click",function(){
	
	if (document.querySelectorAll('.btn__check.click_on').length == 0) {
		alert("삭제할 컨텐츠를 선택해주세요.");
	}
	else {
		var buttonList = $('.btn__check');
		var removeContentList = [];

		buttonList.each(function() {
		  var isClicked = $(this).hasClass('click_on');
		  var itemElement = $(this).closest('.item');
		  var contentId = itemElement.data('id');
		  
		  if (isClicked) {
			  removeContentList.push({
				  "contentId" : contentId
			  });
			  
			  itemElement.remove();
		  }
		  
		});
		
		$("#itemCnt").text("삭제 (0)");
		
		wishContentRemoveAjax(removeContentList);
		
		location.reload();
		
	}
	
});