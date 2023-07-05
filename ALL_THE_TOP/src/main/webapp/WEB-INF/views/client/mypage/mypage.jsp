<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<style>
  html, body {
    height: 100%;
    margin: 0;
  }
  
  .page-container {
    padding-top: 100px; /* Header의 높이만큼 여백 추가 */
    z-index: 1;
    color: white;
    background-color: #101322;
    display: flex;
    justify-content: center;
    align-items: center;
    height: 100%;
    min-height: 100vh; /* 최소 높이를 브라우저 높이로 설정 */
  }
  
  .table-container {
    width: 50%;  /* 테이블의 폭 설정 */
    height: 100%;
  }
  
  .table-container table {
    width: 100%;
  }

  .userInfo {
    width: 50%;
    height: 20%;
    margin-bottom: 10px; /* 테이블 아래 간격 */
    border: none;
  }

  .userInfo .thumbnailcell {
    text-align: center;
    width:30%;
  }

  .userInfo .thumbnailcell img {
    border-radius: 70px;
    width:50%;
  }
  .userInfo .nickNameCell {
    width: 70%; /* 원하는 버튼의 너비 */
    height: 80%; /* 원하는 높이 */
    border: none;
  } 
  .nickName {
    width: 90%;
    height: 80%;
    font-size: 24px;
  }
  .userInfo .nickNameButton Button {
    width: 100px; /* 원하는 버튼의 너비 */
    height: 80%; /* 원하는 버튼의 높이 */
    border-radius: 10px; /* 버튼의 둥근 정도 조절 */
    background-color: #172036; /* 버튼의 배경색 지정 */
    color: #98A4B7;  /* 버튼의 글자색 지정 */
    font-size: 16px; /* 버튼의 글자 크기 조절 */
    border: none;
    text-align: center; /* 버튼 안의 글자를 가운데 정렬 */
  }
    
  .comunityInfo {
    table-layout: fixed;
    width: 100%;
    height: 30%;
    background-color: #172036;
    border-collapse: collapse;
    border-radius: 10px;
    margin-bottom: 20px;
    border: none;
  }
  
  .comunityInfo td {
    text-align: center;
    padding: 10px;
    border-radius: 20px;
    height: 50px;
    position: relative;
    color: #98A4B7;
    width: 16.66%; /* 수정: 각 td 요소의 폭 설정 */
  }
  
  .comunityInfoCnt {
    position: relative;
  }
  
  .comunityInfoCnt::after {
    content: "";
    position: absolute;
    right: 0;
    top: 50%;
    transform: translateY(-50%);
    background-color: #98A4B7;
    width: 1px; /* 세로 구분선을 생성하기 위해 너비를 1px로 설정합니다 */
    height: 70%; /* 구분선의 높이를 조정합니다 */
  }
  
  .comunityInfo td:last-child::after {
    content: none; /* 마지막 요소의 오른쪽 구분선을 제거합니다 */
  }

  .myAllttInfo {
    table-layout: fixed;
    width: 100%;
    height: 100%;
    color: #98A4B7;
    background-color: #172036;
    border-collapse: collapse;
    border-radius: 10px;
    margin-bottom: 20px;
    border: none;
  }

  .myAllttInfo tr:not(:last-child) {
    position: relative;
  }

  .myAllttInfo td {
    width: 50%; /* 수정: 각 td 요소의 폭 설정 */
  }

  .myAllttInfo td span {
    display: inline-block;
    padding: 0 5%;
  }

  .myAllttInfo tr:not(:last-child) td::after {
    content: "";
    position: absolute;
    bottom: 0;
    left: 50%;
    transform: translateX(-50%);
    width: 90%; /* 구분선의 길이 비율 (100%) */
    border-bottom: 1px solid #98A4B7;
  }
  
  .sub-checkbox {
    height: 100px;
  }
  
  .sub-set {
  	text-align: right; /* 텍스트 오른쪽 정렬 */
    padding-right: 10%;
  }
  .wishList {
  	 height: 70px;
  }
  
  .wishListCnt {
    text-align: right; /* 텍스트 오른쪽 정렬 */
    padding-right: 10%;
  }
</style>

</head>

<body>

<div class="page-container">
  <div class="table-container">
    <table class="userInfo" >
    	<tr>
    		<td rowspan="2" class="thumbnailcell">
	    			<img class="thumbnailImg" src="http://k.kakaocdn.net/dn/blYePf/btrHdH6qxnB/hYP92mvlkmkB34A0qwpyQK/img_110x110.jpg" />
           	</td>
    		<td colspan="2"class="nickNameCell">
    			<input type="text" class="nickName" placeholder="${memberDTO.nickName}" maxlength="30" required/>
    		</td>
    	</tr>
    	<tr class="nickNameButton">
    		<td>
    			<button class="genNickName" onclick="location.href='${contextPath}/member/getNickName'">자동생성</button>
    		</td>
    		<td>
    			<button class="setNickName" onclick="location.href='${contextPath}/member/setNickName'">변경</button>
    		</td>
    	</tr>
    </table>
  
    <table class="comunityInfo" >
      <tr>
        <td><span>찜 컨텐츠</span></td>
        <td class="comunityInfoCnt"><span>0 ></span></td>
        <td><span>작성한 리뷰</span></td>
        <td class="comunityInfoCnt"><span>0 ></span></td>
        <td><span>작성한 댓글</span></td>
        <td class="comunityInfoCnt"><span>0 ></span></td>
      </tr>
    </table>
    
    <table class="myAllttInfo">
      <tr>
        <td class="sub-checkbox">
	        <div class="checkbox-container">
	        	<span>구독 중인 서비스</span>
				<label class="checkbox-label">
					<input type="checkbox" checked="" id="netflixCheckbox" value="1">
					<span class="checkbox-custom" style="background-image: url('/resources/bootstrap/img/n100.jpeg');"></span>
				</label>
				<label class="checkbox-label">
					<input type="checkbox" checked="" id="tvingCheckbox" value="2">
					<span class="checkbox-custom" style="background-image: url('/resources/bootstrap/img/t100.jpeg');"></span>
				</label>
				<label class="checkbox-label">
					<input type="checkbox" checked="" id="wavveCheckbox" value="3">
					<span class="checkbox-custom" style="background-image: url('/resources/bootstrap/img/w100.jpeg');"></span>
				</label>
			</div>
        </td>
        <td class="sub-set"><span>설정 변경 ></span></td>
      </tr>
	       <tr class="wishList">
	        <td><span>넷플 찜 컨텐츠</span></td>
	        <td class="wishListCnt"><span>0 ></span></td>
	      </tr>
	      <tr class="wishList">
	        <td><span>티빙 찜 컨텐츠</span></td>
	        <td class="wishListCnt"><span>0 ></span></td>
	      </tr>
	      <tr class="wishList">
	        <td><span>웨이브 찜 컨텐츠</span></td>
	        <td class="wishListCnt"><span>0 ></span></td>
	      </tr>
    </table>
    
    <table class="myAllttInfo">
      <tr>
        <td class="sub-checkbox">
	        <div class="checkbox-container">
	        	<span>시리즈 필터 설정</span>
				<label class="checkbox-label">
					<input type="checkbox" checked="" id="netflixCheckbox" value="1">
					<span class="checkbox-custom" style="background-image: url('/resources/bootstrap/img/n100.jpeg');"></span>
				</label>
				<label class="checkbox-label">
					<input type="checkbox" checked="" id="tvingCheckbox" value="2">
					<span class="checkbox-custom" style="background-image: url('/resources/bootstrap/img/t100.jpeg');"></span>
				</label>
				<label class="checkbox-label">
					<input type="checkbox" checked="" id="wavveCheckbox" value="3">
					<span class="checkbox-custom" style="background-image: url('/resources/bootstrap/img/w100.jpeg');"></span>
				</label>
			</div>
        </td>
        <td class="sub-set"><span>설정 변경 ></span></td>
       </tr>
       <tr>
        <td class="sub-checkbox">
	        <div class="checkbox-container">
	        	<span>영화 필터 설정</span>
				<label class="checkbox-label">
					<input type="checkbox" checked="" id="netflixCheckbox" value="1">
					<span class="checkbox-custom" style="background-image: url('/resources/bootstrap/img/n100.jpeg');"></span>
				</label>
				<label class="checkbox-label">
					<input type="checkbox" checked="" id="tvingCheckbox" value="2">
					<span class="checkbox-custom" style="background-image: url('/resources/bootstrap/img/t100.jpeg');"></span>
				</label>
				<label class="checkbox-label">
					<input type="checkbox" checked="" id="wavveCheckbox" value="3">
					<span class="checkbox-custom" style="background-image: url('/resources/bootstrap/img/w100.jpeg');"></span>
				</label>
			</div>
        </td>
        <td class="sub-set"><span>설정 변경 ></span></td>
       </tr>
    </table>
  </div>
</div>


</body>
</html>