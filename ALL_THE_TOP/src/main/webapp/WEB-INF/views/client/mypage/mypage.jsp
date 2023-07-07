<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="${contextPath}/resources/bootstrap/css/scss/mypage.css" type="text/css">

<script>
	var newNick;
	// 랜덤 닉네임 가져오기
	function getNewNickName() {
		$.ajax({
			url : '${contextPath}/member/randomNickname',
			method : 'POST',
			success : function(data) {
				newNick = data;
				var nicknameElement = document.querySelector('.nickName');
				// 닉네임text 박스에 값 입력
				nicknameElement.value = newNick;
			}
		});
	}
	
	function saveNickname() {
		if(newNick != null){
			var nickname = document.querySelector('.nickName').value; // 입력된 닉네임 값을 가져옴
			console.log(nickname);
		    // AJAX 요청으로 서버에 저장 요청 보내기
		    $.ajax({
		      url: '${contextPath}/member/saveNickname', // 저장 요청을 처리하는 서버 경로로 변경해야 함
		      method: 'POST',
		      data: { nickname : nickname}, // 요청 데이터로 닉네임 값을 전달
		      success: function(response) {
		        alert(response);
		      }
		    });
		}
	    
	  }
	
	function withdrawMember() {
		var service = '${member.socialNm}';
		console.log(service);
		if (confirm("정말 탈퇴 하시겠습니까?")) {
			location.href='${contextPath}/member/'+service+'/withdraw';
    	  alert("다신오지마셈");
        } else {
            alert("ok 더 즐겨");
        }
	}
	
	function setSubscription() {
		  // 체크된 체크박스 가져오기
		  var filterData = {
		    "netflixId": $('.sub-checkbox #netflixCheckbox').prop('checked') ? Number($('#netflixCheckbox').val()) :  Number('0'),
		    "tvingId": $('.sub-checkbox #tvingCheckbox').prop('checked') ? Number($('#tvingCheckbox').val()) :  Number('0'),
		    "wavveId": $('.sub-checkbox #wavveCheckbox').prop('checked') ? Number($('#wavveCheckbox').val()) :  Number('0'),
		  }

		  $.ajax({
		    url: '${contextPath}/member/setSubscription',
		    method: 'POST',
		    data: JSON.stringify(filterData),
		    contentType: 'application/json', // Content-Type 설정
		    success: function (response) {
		      alert(response);
		    }
		  });
		}
	
	function filterLoad(){
		var subscription = {
	        netflixId: ${subscription.netflixId},
	        tvingId: ${subscription.tvingId},
	        wavveId: ${subscription.wavveId}
	    }; 
		console.log('${subscription}');
		console.log(subscription.netflixId == 1 ? true : false);
		console.log(subscription.tvingId == 2 ? true : false);
		console.log(subscription.wavveId == 3 ? true : false);
		
		$(".sub-checkbox #netflixCheckbox").prop("checked", subscription.netflixId == 1 ? true : false);
		$(".sub-checkbox #tvingCheckbox").prop("checked", subscription.tvingId == 2 ? true : false);
		$(".sub-checkbox #wavveCheckbox").prop("checked", subscription.wavveId == 3 ? true : false);
		
	}
	
</script>


</head>

<body>
	<script>
    	filterLoad();
  	</script>
<div class="page-container">
  <div class="table-container">
    <table class="userInfo" >
    	<tr>
    		<td rowspan="2" class="thumbnailcell">
	    		<img class="thumbnailImg" src="${member.thumbnailImg}" />
           	</td>
    		<td rowspan="2"class="nickNameCell">
    			<input type="text" class="nickName bold-text" placeholder="${member.nickName}" maxlength="30" required/>
    		</td>
        <td class="nickbutton"><button class="genNickName bold-text" onclick="getNewNickName()">자동생성</button></td>
    	</tr>
    	<tr class="nickNameButton">
    		<td class="nickbutton">
    			<button class="setNickName bold-text" onclick="saveNickname()">저장</button>
    		</td>
    	</tr>
    </table>
  
    <table class="communityInfo bold-text" >
      <tr>
        <td><span>찜 컨텐츠</span></td>
        <td class="communityInfoCnt"><span><a href="${contextPath}/wish">${wishCnt} ></a></span></td>
        <td><span>작성한 글</span></td>
        <td class="communityInfoCnt"><span><a href="${contextPath}/community/my?tab=post">${postCnt} ></a></span></td>
        <td><span>작성한 댓글</span></td>
        <td class="communityInfoCnt"><span><a href="${contextPath}/community/my?tab=comment">${replyCnt} ></a></span></td>
      </tr>
    </table>
    
    <table class="myAllttInfo bold-text">
      <tr>
        <td><span>구독 중인 서비스</span></td>
        <td class="sub-checkbox">
	        <div class="checkbox-container">
	        	
				<label class="checkbox-label">
					<input type="checkbox" checked="" id="netflixCheckbox" value="1">
					<span class="checkbox-custom resize-checkbox" style="background-image: url('/resources/bootstrap/img/n100.jpeg');"></span>
				</label>
				<label class="checkbox-label">
					<input type="checkbox" checked="" id="tvingCheckbox" value="2">
					<span class="checkbox-custom resize-checkbox" style="background-image: url('/resources/bootstrap/img/t100.jpeg');"></span>
				</label>
				<label class="checkbox-label">
					<input type="checkbox" checked="" id="wavveCheckbox" value="3">
					<span class="checkbox-custom resize-checkbox" style="background-image: url('/resources/bootstrap/img/w100.jpeg');"></span>
				</label>
			</div>
        </td>
        <td class="sub-set"><span onclick="setSubscription()">변경 ></span></td>
      </tr>
	       <tr class="wishList">
	        <td><span>넷플릭스 찜 컨텐츠</span></td>
           <td><span></span></td>
	        <td class="wishListCnt"><span>${netflixWishCnt} ></span></td>
	      </tr>
	      <tr class="wishList">
	        <td><span>티빙 찜 컨텐츠</span></td>
          <td><span></span></td>
	        <td class="wishListCnt"><span>${tvingWishCnt} ></span></td>
	      </tr>
	      <tr class="wishList">
	        <td><span>웨이브 찜 컨텐츠</span></td>
          <td><span></span></td>
	        <td class="wishListCnt"><span>${wavveWishCnt} ></span></td>
	      </tr>
    </table>
    
    <table class="default-filter bold-text">
	    <tr>
		  <td rowspan="2">
		    <span>시리즈 필터 설정</span>
		  </td>
		  <td class="series-checkbox">
		    <div class="checkbox-container">
		      <label class="checkbox-label">
		        <input type="checkbox" checked="" id="netflixCheckboxSeries" value="1">
		        <span class="checkbox-custom resize-checkbox" style="background-image: url('/resources/bootstrap/img/n100.jpeg');"></span>
		      </label>
		      <label class="checkbox-label">
		        <input type="checkbox" checked="" id="tvingCheckboxSeries" value="2">
		        <span class="checkbox-custom resize-checkbox" style="background-image: url('/resources/bootstrap/img/t100.jpeg');"></span>
		      </label>
		      <label class="checkbox-label">
		        <input type="checkbox" checked="" id="wavveCheckboxSeries" value="3">
		        <span class="checkbox-custom resize-checkbox" style="background-image: url('/resources/bootstrap/img/w100.jpeg');"></span>
		      </label>
		    </div>
		  </td>
		  <td rowspan="2" class="sub-set">
		    <span>설정 변경 ></span>
		  </td>
		</tr>
		<tr>
		  <td class="series-select">
				<div class="select-container">
				<select id="genreId">
						<option value="0">전체</option>
					<c:forEach var="genreDTO" items="${genreList}">
						<option value="${genreDTO.genreId}">${genreDTO.genreNm}</option>
					</c:forEach>
					</select>
					<select id="isWishInclude">
						<option value="true">찜 포함</option>
						<option value="false">찜 제외</option>
					</select>
					<select id="sortType">
						<option value="latest">최신순</option>
						<option value="title">이름순</option>
					</select>
					<input type="hidden" value="movie" id="contentType">
				</div>
		  </td>
		</tr>
    </table>
	  <div>
		  <button class="withdraw bold-text" onclick="withdrawMember()">회원탈퇴</button>
	  </div>
  </div>
</div>
</body>
</html>