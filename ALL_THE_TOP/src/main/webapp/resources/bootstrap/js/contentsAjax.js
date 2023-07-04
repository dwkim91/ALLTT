export function contentsLoadAjax(filterData) {
	$.ajax({
		url: '/contentLoad',
		type: 'POST',
		data: filterData,
	
		success: function(contentList) {
			console.log(contentList);
			var container = $("#container");
			var html = "";

			for (var i = 0; i < contentList.length; i++) {
				var dto = contentList[i];
					html += '<div class="item" data-id="' + dto.contentId +'">';
					html += 	'<a class="false css-1djwytu e2ri0zb0" href=/detail?contentId=' + dto.contentId + '>';
					html += 		'<div class="item__thumb item__thumb-25x36">';
					html += 			'<div class="item__tags">';
					html += 			'<div class="item__tags-left"></div>';
					html += 				'<div class="item__tags-right"></div>';
					html += 			'</div>';
					html += 			'<div class="item__image lazy">';
					html += 				'<img class="loaded css-1doy9ip euf32k22" src="'+ dto.imgUrl +'" alt="'+ dto.title +'">';
					html += 			'</div>';
					html += 		'</div>';
					html += 		'<div class="item__info ">';
					html += 			'<p class="item__title false">'+ dto.title +'</p>';
					html += 		'</div>';
					html += 	'</a>';
					html += '</div>';
			}
			
			container.append(html);
		},
	});
}