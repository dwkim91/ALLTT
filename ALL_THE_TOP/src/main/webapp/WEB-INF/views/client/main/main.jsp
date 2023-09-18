<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<script src="${contextPath}/resources/bootstrap/js/contentsWish.js" type="module"></script>
<script src="${contextPath}/resources/bootstrap/js/search.js" type="module"></script>
</head>
<body>
	<main class="is-desktop css-p5l6tq eeennqe0">
		<div id="searchBarContainer">
		   	<input type="text" id="searchBar" placeholder="검색어를 입력하세요" />
		</div>
		<section class="contents_wrap">
		</section>
	</main>
</body>
</html>