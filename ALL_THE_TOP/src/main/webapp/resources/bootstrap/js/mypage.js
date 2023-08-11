//DOM이 완전히 로드된 후에 코드가 실행
document.addEventListener('DOMContentLoaded', function() {
  filterLoad();
});

function filterLoad(){

	// 구독정보
	checkBoxChange('#user-subscription', netflixId, tvingId, wavveId);
	
	// 시리즈 - 필터 적용
	checkBoxChange('#series-filter', s_netflixId, s_tvingId, s_wavveId);
	selectChange('.series-g-select', s_genreId);
	selectChange('.series-w-select', s_wishIncludeYn);
	selectChange('.series-s-select', s_sortType);
	
	// 영화 - 필터 적용
	checkBoxChange('#movie-filter', m_netflixId, m_tvingId, m_wavveId);
	selectChange('.movie-g-select', m_genreId);
	selectChange('.movie-w-select', m_wishIncludeYn);
	selectChange('.movie-s-select', m_sortType);
	
}

// 랜덤 닉네임 가져오기
function getNewNickName() {
	$.ajax({
		url : '/member/randomNickname',
		type : 'POST',
		success : function(data) {
			var newNick = data;
			var nicknameElement = document.querySelector('.nickName');
			// 닉네임text 박스에 값 입력
			nicknameElement.value = newNick;
		}
	});
}
// 닉네임 저장하기
function saveNickname() {
	var nickname = document.querySelector('.nickName').value;
	$.ajax({
		url : '/member/saveNickname',
		type : 'POST',
		data : {
			nickname : nickname
		},
		success : function(response) {
			alert(response);
		}
	});
}

// 탈퇴하기
function withdrawMember(socialNm) {
	var service = socialNm;
	if (confirm("정말 탈퇴 하시겠습니까?")) {
		location.href = '/member/' + service + '/withdraw';
		alert("다음에 다시 만나요.");
	} else {
		alert("감사합니다 ^^");
	}
}

// 체크된 체크박스 가져오기
function setSubscription() {
	
	var sub_netflixCheckbox = document.querySelector('#user-subscription #netflixCheckbox');
	var sub_tvingCheckbox = document.querySelector('#user-subscription #tvingCheckbox');
	var sub_wavveCheckbox = document.querySelector('#user-subscription #wavveCheckbox');
	
	var filterData = {
		"netflixId" : sub_netflixCheckbox.checked ? Number(sub_netflixCheckbox.value) : 0,
		"tvingId" : sub_tvingCheckbox.checked ? Number(sub_tvingCheckbox.value) : 0,
		"wavveId" : sub_wavveCheckbox.checked ? Number(sub_wavveCheckbox.value) : 0,
	};

	$.ajax({
		url : '/member/setSubscription',
		type : 'POST',
		data : JSON.stringify(filterData),
		contentType : 'application/json',
		success : function(response) {
			alert(response);
		}
	});
}

// 체크박스값 변경
function checkBoxChange(selector, netflixId, tvingId, wavveId){
	var netflixCheckbox = document.querySelector(selector + ' #netflixCheckbox');
	var tvingCheckbox = document.querySelector(selector + ' #tvingCheckbox');
	var wavveCheckbox = document.querySelector(selector + ' #wavveCheckbox');
	
	netflixCheckbox.checked = netflixId == 1 ? true : false;
	tvingCheckbox.checked = tvingId == 2 ? true : false;
	wavveCheckbox.checked = wavveId == 3 ? true : false;
}

// select 값 변경
function selectChange(selector, value){
	var items = document.querySelectorAll(selector + ' .list li');
	items.forEach(function(item) {
		var dataValue = item.getAttribute('data-value');
		if (dataValue === value) {
			item.classList.add('selected');
			item.classList.add('focus');
			document.querySelector(selector + ' .current').textContent = item.textContent;
		} else {
			item.classList.remove('selected');
			item.classList.remove('focus');
		}
	});
}

// 시리즈 / 영화 필터 설정 
function setSearchFilter(contentType){

	var netflixCheckbox = document.querySelector('#'+contentType+'-filter #netflixCheckbox');
	var tvingCheckbox = document.querySelector('#'+contentType+'-filter #tvingCheckbox');
	var wavveCheckbox = document.querySelector('#'+contentType+'-filter #wavveCheckbox');
	var genreId = getSelectVal('.' + contentType + '-g-select');
	var wishIncludeYn = getSelectVal('.' + contentType + '-w-select');
	var sortType = getSelectVal('.' + contentType + '-s-select');
	
	var filterData = {
		"netflixId" : netflixCheckbox.checked ? Number(netflixCheckbox.value) : 0,
		"tvingId" : tvingCheckbox.checked ? Number(tvingCheckbox.value) : 0,
		"wavveId" : wavveCheckbox.checked ? Number(wavveCheckbox.value) : 0,
		"genreId" : genreId,
		"wishIncludeYn" : wishIncludeYn,
		"sortType" : sortType,
		"contentType" : contentType,
	};
	
	$.ajax({
		url : '/member/setSearchFilter',
		type : 'POST',
		data : JSON.stringify(filterData),
		contentType : 'application/json',
		success : function(response) {
			alert(response);
		}
	});

}

// selected된 값 가져오기
function getSelectVal(selector){
	var selectedItem = document.querySelector(selector + ' .list li.selected');
	return selectedItem.getAttribute('data-value');
}

//체크박스 변경 시 장르 리스트 동적 변경
$('[name="series"], [name="movie"]').change(function() {
	var checkboxName = $(event.target).attr('name');
	// 체크박스 변경 시 실행될 함수 호출
	updateMemberFilter(checkboxName);
	
});

// 시리즈/영화 필터 장르 부분 OTT선택별 동적 변경 메서드
function updateMemberFilter(contentType) {
	
	var netflixCheckbox = document.querySelector('#'+contentType+'-filter #netflixCheckbox');
	var tvingCheckbox = document.querySelector('#'+contentType+'-filter #tvingCheckbox');
	var wavveCheckbox = document.querySelector('#'+contentType+'-filter #wavveCheckbox');
	
	var filterData = {
		"netflixId" : netflixCheckbox.checked ? Number(netflixCheckbox.value) : 0,
		"tvingId" : tvingCheckbox.checked ? Number(tvingCheckbox.value) : 0,
		"wavveId" : wavveCheckbox.checked ? Number(wavveCheckbox.value) : 0,
		"contentType" : contentType,
	};
	
	$.ajax({
		url : '/member/filterUpdate',
		type : 'GET',
		data : filterData,
		success : function(filterList) {
			// 기존의 옵션 제거
			$('.' + contentType + '-g-select ul').empty();
			var newLiOption = $();// jQuery 객체로 초기화
			$('.' + contentType + '-g-select .current').text('전체');
			newLiOption = newLiOption.add($('<li>').attr('data-value', 0).addClass('option').addClass('selected').html('전체'));
			$(filterList).each(function(){
			    newLiOption = newLiOption.add($('<li>').attr('data-value', this.genreId).addClass('option').html(this.genreNm));
			});
			$('.' + contentType + '-g-select ul').append(newLiOption);
		}
	});
	
}

