<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>검색</title>
<link rel="stylesheet" href="${contextPath}/resources/css/search.css" type="text/css">
<link rel="stylesheet" href="${contextPath}/resources/css/footerCustom.css" type="text/css">
<script src="${contextPath}/resources/jquery/jquery-3.6.1.min.js"></script>
</head>
<body>

<div id="__nuxt">
	<div id="__layout">
		<div id="root" data-v-00101c0c="">
			<main data-v-e694bbc4="" data-v-00101c0c="" id="contents">
			<div data-v-e694bbc4="" class="main-header">
				<section data-v-e694bbc4="" class="search-section back"><button data-v-e694bbc4="" class="btn-back"><i data-v-e694bbc4="" class="kino-icon kino-icon--header-back"></i></button>
				<div data-v-e694bbc4="" id="searchText" class="search-field">
					<form data-v-e694bbc4="">
						<span data-v-02f247b4="" data-v-d948bc00="" data-v-e694bbc4="" id="searchInput" class="customInput"><span data-v-02f247b4="" class="provider"><label data-v-02f247b4="" for="search" class="label">
						</label><span data-v-02f247b4="" class="input-container"><input data-v-02f247b4="" id="search" placeholder="작품명, 게시글" maxlength="100" type="text" class="renewal-input"></span>
						<!---->
						</span></span>
					</form>
				</div>
				</section>
			</div>
			<div data-v-e694bbc4="" class="search-container">
				<section data-v-e694bbc4="" class="search-base-content">
				<!---->
				<hr data-v-e694bbc4="" class="divider">
				<section data-v-21cc99af="" data-v-e694bbc4="" class="tag-list">
				<h2 data-v-21cc99af="" class="title-wrap__title">인기 태그</h2>
				<ul data-v-21cc99af="" class="tag-list__container">
				<c:forEach var="content" items="${tagContent}" varStatus="i">
					<li data-v-21cc99af="">
						<a data-v-93ed3f00="" data-v-21cc99af="" href="/community/feed?tag=%ED%82%A4%EB%85%B8%EB%9E%91" class="tag" id="hotTag_${i}">
						<div data-v-93ed3f00="" class="tag__icon">
						<svg data-v-93ed3f00="" width="24" height="24" fill="none" xmlns="http://www.w3.org/2000/svg" viewbox="0 0 24 24" class="">
							<path data-v-93ed3f00="" fill-rule="evenodd" clip-rule="evenodd" d="M10.216 5.015a1 1 0 00-1.159.812L8.69 7.909H7a1 1 0 100 2h1.337l-.705 4H6a1 1 0 100 2h1.28l-.307 1.735a1 1 0 001.97.348l.367-2.083h3.969l-.306 1.735a1 1 0 101.97.348l.367-2.083H17a1 1 0 100-2h-1.338l.705-4h1.634a1 1 0 100-2h-1.28l.305-1.735a1 1 0 10-1.97-.347l-.367 2.082h-3.968l.306-1.735a1 1 0 00-.811-1.159zm3.415 8.894l.706-4h-3.969l-.705 4h3.968z" fill="#98A4B7"/>
						</svg>
						</div>
						<span data-v-93ed3f00="" class="tag__text">${content.title}</span>
						</a>
					</li>
				</c:forEach>
				</ul>
				</section>
				<section data-v-e694bbc4="" class="default-not-found" style="display: none;">
				<div data-v-e694bbc4="" class="text-wrap">
					<span data-v-e694bbc4="" class="not-found-title">검색 결과가 없습니다.</span><br data-v-e694bbc4="">
				</div>
				</section>
				<!---->
			</div>
			</main>
		</div>
	</div>
</div>

</body>
</html>