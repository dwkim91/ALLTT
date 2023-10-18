//DOM이 완전히 로드된 후에 코드가 실행
document.addEventListener('DOMContentLoaded', function() {
  filterLoad();
  getMemberImg();
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
		beforeSend: function(xhr) {
		    // CSRF 토큰을 요청 헤더에 추가
		    xhr.setRequestHeader("X-CSRF-TOKEN", csrfToken);
		},
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
		beforeSend: function(xhr) {
		    // CSRF 토큰을 요청 헤더에 추가
		    xhr.setRequestHeader("X-CSRF-TOKEN", csrfToken);
		},
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
		beforeSend: function(xhr) {
		    // CSRF 토큰을 요청 헤더에 추가
		    xhr.setRequestHeader("X-CSRF-TOKEN", csrfToken);
		},
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
		beforeSend: function(xhr) {
		    // CSRF 토큰을 요청 헤더에 추가
		    xhr.setRequestHeader("X-CSRF-TOKEN", csrfToken);
		},
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
	// 체크박스 변경 시 실행될 updateMemberFilter함수 호출
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
		beforeSend: function(xhr) {
		    // CSRF 토큰을 요청 헤더에 추가
		    xhr.setRequestHeader("X-CSRF-TOKEN", csrfToken);
		},
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

// 프로필변경 파일업로드 요소 클릭
function openFileInput() {
    // 파일 업로드(input type="file) 요소를 클릭
    document.getElementById("fileInput").click();
}
// 프로필이미지 저장 및 변경
$("#fileInput").on("change", function() {
    var fileInput = document.getElementById("fileInput");
    var uploadFile = fileInput.files[0];

    if (uploadFile) {
        var formData = new FormData();
        formData.append("uploadFile", uploadFile);

        $.ajax({
			url: '/member/changeThumbnailImg',
			type: 'POST',
			data: formData,
			beforeSend: function(xhr) {
			    // CSRF 토큰을 요청 헤더에 추가
			    xhr.setRequestHeader("X-CSRF-TOKEN", csrfToken);
			},
			processData: false, // 데이터 처리 방지
			contentType: false, // 컨텐츠 타입 설정
			success: function(response) {
            	
				if (response.startsWith("Error :")) {
					alert(response);
				}
				else {
					// 업로드 완료 후 이미지 업데이트
					getMemberImg();
				}
            },
            error: function() {
                // 업로드 실패 시 처리
                console.error("Failed to upload file");
            }
        });
    }
});

function getMemberImg() {
	// AJAX 요청을 통해 member 정보를 가져오는 코드
	$.ajax({
		url : '/member/memberInfo',
		type : 'POST',
		beforeSend: function(xhr) {
		    // CSRF 토큰을 요청 헤더에 추가
		    xhr.setRequestHeader("X-CSRF-TOKEN", csrfToken);
		},
		success : function(data) {
			var member = data; // 받아온 data 정보를 member 변수에 할당
			changeThumbnailImg(member); // member의 값을 설정하는 함수 호출
		},
		error : function(error) {
		}
	});
}

// 프로필 이미지 3개요소 변경 메서드
function changeThumbnailImg(member) {
	
	var imgType = member.imgExtension.toLowerCase(); // 이미지 확장자를 소문자로 변환
	var imgSrc = "data:image/" + imgType + ";base64," + member.imgData; // 이미지 데이터(byte[] or String)를 Base64 인코딩된 이미지 소스로 변환
	
	var thumbnailImg = document.querySelector(".thumbnailImg");
	thumbnailImg.setAttribute('src', imgSrc);
	
	// 우측상단 이미지 요소 선택
	var firstImgElement = document.querySelector('.menu_my .loaded.css-1doy9ip.euf32k22');
	// src 값 변경
	firstImgElement.setAttribute('src', imgSrc);
	// 이미지 요소 선택
	var secondImgElement = document.querySelector('.menu_my_content.wrap_margin .loaded.css-1doy9ip.euf32k22');
	// src 값 변경
	secondImgElement.setAttribute('src', imgSrc);
}
