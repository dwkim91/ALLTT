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
					html += '<div class="item__thumb item__thumb-25x36" id="wishContent">';					
				}
				else {
					html += '<div class="item__thumb item__thumb-25x36">';										
				}
				html += '<div class="item__tags" style="pointer-events: auto;">';
				html += '<div class="item__tags-right">';
				if (dto.memberId != 0) {
					html += '<button class="tag tag-age tag-age-nineteen_true" id="wishButton">';
				}
				else {
					html += '<button class="tag tag-age tag-age-nineteen" id="wishButton">';					
				}
				html += '</button></div>';
				html += '</div>';
				html += '<div class="item__image lazy">';
				html += '<img class="loaded css-1doy9ip euf32k22" src="' + dto.imgUrl + '" alt="' + dto.title + '"></div></div>';
				html += '<div class="item__info ">';
				html += '<a class="item__title" href="/detail?contentId=' + dto.contentId + '">' + dto.title + '</a></div></div>';
			}
			
			container.append(html);
			
		},
	});
}
