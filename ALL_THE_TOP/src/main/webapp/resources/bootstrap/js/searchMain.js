$(".searchInput").keyup(function() {
	var searchContent = $(this).val();
	
	if (searchContent.length == 0) {
		$(".searchCancel").css("display", "none");
		$(".searchResult").css("display", "none").empty();
		$(".introBlock").css("display", "block");
	}
	else {
		$.ajax({
			url : "/searchContent",
			type : "POST",
			data : {"contentTitle" : searchContent},
			asyne : true,
		    beforeSend: function(xhr) {
		        // CSRF 토큰을 요청 헤더에 추가
		        xhr.setRequestHeader("X-CSRF-TOKEN", csrfToken);
		    },
			success : function(result) {
				$(".introBlock").css("display", "none");
				
				$(".searchCancel").css("display", "flex");
				
				var searchResultElement = $(".searchResult");
				searchResultElement.empty();
				
				if (result.length > 0) {
					for (var i = 0; i < result.length; i++) {
						var listItem = $("<li></li>");
						var preBlock = $("<div class='preBlock'></div>");
						var searchList = $("<div class='searchList' contentId=" + result[i].contentId + "></div>");
						var searchContentImage = $("<img src='" + result[i].imgUrl + "' alt='' class='searchContentImage'>");
						var kkk = $("<div class='kkk'></div>");
						var searchContentTitle = $("<div class='searchContentTitle'></div>");
						var searchContentTitleDetail = $("<h1 class='searchContentTitleDetail'>" + result[i].title + "</h1>");
						
						searchContentTitle.append(searchContentTitleDetail);
						searchList.append(searchContentImage);
						searchList.append(kkk);
						searchList.append(searchContentTitle);
						listItem.append(preBlock);
						listItem.append(searchList);
						
						searchResultElement.append(listItem);
					}
				}
				else {
					var listItem = $("<li></li>");
					var preBlock = $("<div class='preBlock'></div>");
					var searchList = $("<div class='searchList'></div>");
					var searchContentImage = $("<img src='/resources/bootstrap/img/alltt_logo_white_background_100.png' alt='' class='searchContentImage'>");
					var kkk = $("<div class='kkk'></div>");
					var searchContentTitle = $("<div class='searchContentTitle'></div>");
					var searchContentTitleDetail = $("<h1 class='searchContentTitleDetail'>일치하는 컨텐츠가 없습니다.</h1>");
					
					searchContentTitle.append(searchContentTitleDetail);
					searchList.append(searchContentImage);
					searchList.append(kkk);
					searchList.append(searchContentTitle);
					listItem.append(preBlock);
					listItem.append(searchList);
					
					searchResultElement.append(listItem);
				}
				
				searchResultElement.css("display", "block");
			}
		});
	}
	
});

$(".searchCancel").click(function() {
	$(".searchInput").val("");
	$(".searchCancel").css("display", "none");
	$(".searchResult").css("display", "none").empty();
	$(".introBlock").css("display", "block");
});

$(document).on("click", ".searchList", function() {
	var contentId = $(this).attr("contentid");
	if (contentId != null) {
		location.href="/detail?contentId=" + contentId;
	}
});