document.addEventListener('DOMContentLoaded', function() {
	contentImgStyleChange();
});

function contentImgStyleChange() {
	// anime__details__pic 요소
	var animeDetailsPic = document.querySelector('.anime__details__pic');
	// tvingUrl과 wavveUrl이 모두 비어있을 때
	if (!tvingUrl && !wavveUrl) {
		// background-size 스타일을 cover로 설정
		animeDetailsPic.style.backgroundSize = 'cover';
	}
}