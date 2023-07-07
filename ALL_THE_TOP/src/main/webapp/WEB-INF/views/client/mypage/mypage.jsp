<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath"  value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="${contextPath}/resources/bootstrap/css/scss/mypage.css" type="text/css">
<script src="${contextPath}/resources/bootstrap/js/mypage.js" type="module"></script>

</head>

<body>

<div class="page-container">
  <div class="table-container">
    <table class="userInfo" >
    	<tr>
    		<td rowspan="2" class="thumbnailcell">
	    			<img class="thumbnailImg" src="http://k.kakaocdn.net/dn/blYePf/btrHdH6qxnB/hYP92mvlkmkB34A0qwpyQK/img_110x110.jpg" />
           	</td>
    		<td rowspan="2"class="nickNameCell">
    			<input type="text" class="nickName bold-text" placeholder="${memberDTO.nickName}" maxlength="30" required/>
    		</td>
        <td class="nickbutton"><button class="genNickName bold-text" onclick="location.href='${contextPath}/member/getNickName'">자동생성</button></td>
    	</tr>
    	<tr class="nickNameButton">
    		<td class="nickbutton">
    			<button class="setNickName bold-text" onclick="location.href='${contextPath}/member/setNickName'">저장</button>
    		</td>
    	</tr>
    </table>
  
    <table class="comunityInfo bold-text" >
      <tr>
        <td><span>찜 컨텐츠</span></td>
        <td class="comunityInfoCnt"><span>0 ></span></td>
        <td><span>작성한 리뷰</span></td>
        <td class="comunityInfoCnt"><span>0 ></span></td>
        <td><span>작성한 댓글</span></td>
        <td class="comunityInfoCnt"><span>0 ></span></td>
      </tr>
    </table>
    
    <table class="myAllttInfo bold-text">
      <tr>
        <td><span>구독 중인 서비스</span></td>
        <td class="sub-checkbox">
	        <div class="checkbox-container">
	        	
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
	        <td><span>넷플릭스 찜 컨텐츠</span></td>
           <td><span></span></td>
	        <td class="wishListCnt"><span>0 ></span></td>
	      </tr>
	      <tr class="wishList">
	        <td><span>티빙 찜 컨텐츠</span></td>
          <td><span></span></td>
	        <td class="wishListCnt"><span>0 ></span></td>
	      </tr>
	      <tr class="wishList">
	        <td><span>웨이브 찜 컨텐츠</span></td>
          <td><span></span></td>
	        <td class="wishListCnt"><span>0 ></span></td>
	      </tr>
    </table>
    
    <table class="default-filter bold-text">
      <tr>
        <td><span>시리즈 필터 설정</span></td>
        <td class="sub-checkbox">
	        <div class="checkbox-container">
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
        
        <td class="sub-set"><span>설정 변경 ></span></td>
       </tr>
       <tr>
        <td><span>영화 필터 설정</span></td>
        <td class="sub-checkbox">
	        <div class="checkbox-container">
	        	
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
	  <div>
		  <button class="withdraw bold-text" onclick="location.href='${contextPath}/member/${memberDTO.socialNm}/callback/withdraw'">회원탈퇴</button>
	  </div>
  </div>
</div>
</body>
</html>