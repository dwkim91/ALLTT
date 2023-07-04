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
  }
  
  .table-container {
    width: 50%;
    margin-bottom: 20px; /* 테이블 아래 간격 */
  }
  
  .table-container table {
    width: 100%;
  }
</style>
<style>
  .userInfo {
    width: 50%;
    height: 100px;
    margin-bottom: 20px; /* 테이블 아래 간격 */
    border: none;
  }
  
  .comunityInfo {
    table-layout: fixed;
    width: 100%;
    background-color: #172036;
    border-collapse: collapse;
    border-radius: 10px;
    margin-bottom: 20px;
    border: none;
  }
  
  .comunityInfo td {
    text-align: center;

    padding: 10px;
    border: 0px solid black;
    border-radius: 20px;
    height: 50px;
    border-right: 0px solid black;
    position: relative; /* 상대적인 위치 지정 */
  }
  
  .comunityInfo td:not(:last-child)::after {
    content: "";
    position: absolute;
    right: 0;
    top: 50%;
    transform: translateY(-50%);
    width: 1px;
    background-color: #98A4B7;
    height: 70%; /* 구분선의 높이 (셀 높이의 70%) */
  }

  .myAllttInfo {
    table-layout: fixed; /* 테이블의 너비를 고정 */
    width: 100%; /* 테이블 전체 너비 */
    background-color: #172036; /* 배경색 지정 */
    border-collapse: collapse;
    border-radius: 10px; /* 테이블의 둥글기 정도 설정 */
    margin-bottom: 20px;
    height: 200px;
    padding-left: 50px;
    border: none;
  }

</style>
</head>
<body>

<div class="page-container">
  <div class="table-container">
    <table class="userInfo" >
      <tr>
        <td>
          <img class="thumbnailImg" style="border-radius: 70px;  width: 100px;"
           src="${memberDTO.thumbnailImg}" />
        </td>
        <td colspan="2">
        	<input type=text name=nickName value="${memberDTO.nickName}"/>
        	<input type="text" name="nickName" placeholder="${memberDTO.nickName}" maxlength="30" required/>
        	<input type="button" onclick="" value="닉네임생성" />
        </td>
      </tr>
    </table>
  
    <table class="comunityInfo" >
      <tr>
        <td><span>찜 컨텐츠</span></td>
        <td><span>두 번째</span></td>
        <td><span>세 번째</span></td>
      </tr>
    </table>
    <table class="myAllttInfo">
      <tr>
        <td><span>&ensp;찜 컨텐츠</span></td>
      </tr>
      <tr>
        <td><span>&ensp;작성한 리뷰</span></td>
      </tr>
      <tr>
        <td><span>&ensp;작성한 댓글</span></td>
      </tr>
      <tr>
        <td><span>&ensp;구독 중인 서비스</span></td>
      </tr>
    </table>
  </div>
</div>

</body>
</html>