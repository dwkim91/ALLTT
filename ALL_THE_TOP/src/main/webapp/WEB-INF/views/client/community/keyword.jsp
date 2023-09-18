<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>tag</title>
<link rel="stylesheet" href="${contextPath}/resources/bootstrap/css/tagFeed.css" type="text/css">
<link rel="stylesheet" href="${contextPath}/resources/bootstrap/css/footerCustom.css" type="text/css">
<script src="${contextPath}/resources/bootstrap/js/jquery-3.6.1.min.js"></script>
<script src="${contextPath}/resources/bootstrap/js/getTimeDiff.js"></script>
<script type="text/javascript">
$(function() {

	$(".created").each(function() {
		const enrollDt = $(this).attr("title"); // 등록일자 데이터 가져오기
		const formattedDate = elapsedTime(enrollDt); // 시간 간격 변환
		$(this).text(formattedDate); // 변환된 시간 간격으로 표시
	});

	$(".btn-back").click(function() {
		location.href="${contextPath}/community/search";
	});
});
</script>
</head>
<body>

<div id="__nuxt">
	<div id="__layout">
		<div id="root" data-v-c827bb7e="">
			<main data-v-6608d693="" data-v-c827bb7e="" id="contents">
			<div data-v-455cd5b8="" data-v-6608d693="" id="header" class="sub-header tit_page">
				<div data-v-455cd5b8="" class="header-inner">
				<c:choose>
				<c:when test="${tag != null}">
					<h1 data-v-455cd5b8="" class="">커뮤니티 태그</h1>
				</c:when>
				<c:otherwise>
					<h1 data-v-455cd5b8="" class="">커뮤니티 게시글</h1>
				</c:otherwise>
				</c:choose>
					<button data-v-455cd5b8="" class="btn-back"><i data-v-455cd5b8="" class="kino-icon kino-icon--header-back"></i></button>
				</div>
			</div>
			<c:choose>
			<c:when test="${keyword != null}">
				<section data-v-6608d693="" class="list-area">
				<c:forEach var="post" items="${postList}" varStatus="i">
					<div data-v-6608d693="">
					<c:if test="${!i.first}">
						<hr data-v-0bcef72e="" class="divider">
					</c:if>
						<a data-v-0bcef72e="" data-v-6608d693="" href="${contextPath}/community/post?postId=${post.postId}" class="">
							<div data-v-0bcef72e="" class="community-search-item">
								<div data-v-0bcef72e="" class="info-wrap">
									<p data-v-0bcef72e="" class="title"> ${post.postTitle} </p>
									<p data-v-0bcef72e="" class="body"> ${post.content} </p>
									<p data-v-0bcef72e="" title="${post.enrollDt}" class="created">  </p>
								</div>
							</div>
						</a>
						<div data-v-6bdd51b8="" data-v-6608d693="" class="target" style="--offset: 300px;">
						</div>
					</div>
				</c:forEach>
				<!-- 무한스크롤 -->
				<div data-v-07a4f3b7="" data-v-6608d693="" class="default-bottom-loader">
					<div data-v-07a4f3b7="" class="loader">
						<svg data-v-07a4f3b7="" viewbox="25 25 50 50" class="circular-loader"><circle data-v-07a4f3b7="" cx="50" cy="50" r="20" fill="none" stroke-width="6" class="loader-path"></circle></svg>
					</div>
				</div>
				<div data-v-6608d693="" class="link-area">
					<a data-v-6e512271="" data-v-6608d693="" href="${contextPath}/community" class="link-wrap" id="communityHomeButton">
					<p data-v-6e512271="" class="text">
						🤓 놓치면 아쉬운 <b data-v-6e512271="">인기글</b> 보러갈까요?!<i data-v-6e512271="" class="kino-icon kino-icon--more-gray" style="width: 20px; height: 20px;"></i>
					</p>
					</a>
				</div>
			</c:when>
			<c:otherwise>
				<section data-v-214515f0="" class="list-area">
				<ul data-v-214515f0="">
				<c:forEach var="tag" items="${tagList}">
				<li data-v-214515f0="" class="tag-wrap">
					<a data-v-5b1cfcdf="" data-v-214515f0="" href="${contextPath}/community/feed?tag=${tag.contentId}" class="tag" id="hashtag_0">
						<div data-v-5b1cfcdf="" class="tag__icon result">
							<svg data-v-5b1cfcdf="" width="24" height="24" fill="none" xmlns="http://www.w3.org/2000/svg" viewbox="0 0 24 24" class=""><path data-v-5b1cfcdf="" fill-rule="evenodd" clip-rule="evenodd" d="M10.216 5.015a1 1 0 00-1.159.812L8.69 7.909H7a1 1 0 100 2h1.337l-.705 4H6a1 1 0 100 2h1.28l-.307 1.735a1 1 0 001.97.348l.367-2.083h3.969l-.306 1.735a1 1 0 101.97.348l.367-2.083H17a1 1 0 100-2h-1.338l.705-4h1.634a1 1 0 100-2h-1.28l.305-1.735a1 1 0 10-1.97-.347l-.367 2.082h-3.968l.306-1.735a1 1 0 00-.811-1.159zm3.415 8.894l.706-4h-3.969l-.705 4h3.968z" fill="#b79898"></path></svg>
						</div>
						<div data-v-5b1cfcdf="" class="tag__info">
							<p data-v-5b1cfcdf="" class="info__text with-count"> ${tag.postTag} </p>
							<p data-v-5b1cfcdf="" class="info__count"> 게시글 ${tag.postCnt}개 </p>
						</div>
					</a>
				</li>
			</c:forEach>
			</ul>
			</c:otherwise>
			</c:choose>

			</section></main>
		</div>
	</div>
</div>

</body>
</html>