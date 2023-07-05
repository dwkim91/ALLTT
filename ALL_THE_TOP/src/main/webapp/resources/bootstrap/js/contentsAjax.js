export function contentsLoadAjax(filterData) {
	$.ajax({
		url: '/contentLoad',
		type: 'POST',
		data: filterData,
	
		success: function(contentList) {
			console.log(filterData);
			var container = $("#container");
			var html = "";

			for (var i = 0; i < contentList.length; i++) {
				var dto = contentList[i];
				
				html += '<div class="item" data-id="'+ dto.contentId + '">';
				if (dto.memberId != 0) {
					html += '<div class="item__thumb item__thumb-25x36" id="wishContent"><div class="item__tags"></div><div class="item__image lazy">';					
				}
				else {
					html += '<div class="item__thumb item__thumb-25x36"><div class="item__tags"></div><div class="item__image lazy">';										
				}
				html += '<img class="loaded css-1doy9ip euf32k22" src="' + dto.imgUrl + '" alt="' + dto.title + '"></div></div>';
				html += '<div class="item__info ">';
				html += '<a class="item__title" href="/detail?contentId=' + dto.contentId + '">' + dto.title + '</a></div></div>';
			}
			
			container.append(html);
			
		},
	});
}
