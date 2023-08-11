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
<script>
$(function() {
	$(".btn-back").click(function() {
		location.href="${contextPath}/community";
	});

	// 게시글 검색 > 태그 검색만 할 수 있게
	$("#renewal-input").keyup(function() {
		
	});
})
</script>
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
						</label><span data-v-02f247b4="" class="input-container"><input data-v-02f247b4="" id="search" placeholder="작품명으로 게시글을 검색하세요" maxlength="100" type="text" class="renewal-input" autofocus="autofocus"></span>
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
						<a data-v-93ed3f00="" data-v-21cc99af="" href="${contextPath}/community/feed?tag=${content.contentId}" class="tag" id="hotTag_${i}">
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
				<section data-v-2f928022="" class="search-content" style="">
				<section data-v-2f928022="" class="result-section search-community-area">
				<div data-v-2f928022="" class="section-title-wrapper community">
					<h3 data-v-2f928022="" class="section-title community"> 커뮤니티 태그 <span data-v-2f928022="" class="search-count"> 8 </span>
					<!---->
					<a data-v-2f928022="" href="/search/tags?keyword=f" class="section-more-btn" id="communityTagMoreButton" title="커뮤니티 태그 더보기"><i data-v-2f928022="" class="kino-icon kino-icon--more-main"></i></a></h3>
				</div>
				<div data-v-2f928022="" class="content-wrap" style="">
					<div data-v-53eafb8a="" data-v-2f928022="" class="filcking">
						<div class="eg-flick-viewport" style="position: relative; z-index: 2000; overflow: visible; min-height: 100%; width: 100%; touch-action: pan-y; user-select: none; -webkit-user-drag: none; height: 144px;">
							<div class="eg-flick-camera" style="width: 100%; height: 100%; will-change: transform; transform: translate3d(0px, 0px, 0px);">
								<ul data-v-53eafb8a="" class="eg-flick-panel" style="position: absolute; left: 0px;">
									<!---->
									<div data-v-53eafb8a="" style="width: 100%;">
										<li data-v-53eafb8a="" class="tag-wrap">
										<!---->
										<a data-v-5b1cfcdf="" data-v-53eafb8a="" href="/community/feed?tag=f1%EB%B3%B8%EB%8A%A5%EC%9D%98%EC%A7%88%EC%A3%BC%EC%8B%9C%EC%A6%8C5" class="tag" id="hashtag_0" keyword="f">
										<div data-v-5b1cfcdf="" class="tag__icon result">
											<svg data-v-5b1cfcdf="" width="24" height="24" fill="none" xmlns="http://www.w3.org/2000/svg" viewbox="0 0 24 24" class=""><path data-v-5b1cfcdf="" fill-rule="evenodd" clip-rule="evenodd" d="M10.216 5.015a1 1 0 00-1.159.812L8.69 7.909H7a1 1 0 100 2h1.337l-.705 4H6a1 1 0 100 2h1.28l-.307 1.735a1 1 0 001.97.348l.367-2.083h3.969l-.306 1.735a1 1 0 101.97.348l.367-2.083H17a1 1 0 100-2h-1.338l.705-4h1.634a1 1 0 100-2h-1.28l.305-1.735a1 1 0 10-1.97-.347l-.367 2.082h-3.968l.306-1.735a1 1 0 00-.811-1.159zm3.415 8.894l.706-4h-3.969l-.705 4h3.968z" fill="#98A4B7"/></svg>
										</div>
										<div data-v-5b1cfcdf="" class="tag__info">
											<p data-v-5b1cfcdf="" class="info__text with-count">f1본능의질주시즌5</p>
											<p data-v-5b1cfcdf="" class="info__count">게시글 2개</p>
										</div>
										</a>
										</li>
									</div>
								</ul>
							</div>
						</div>
					</div>
				</div>
				</section>
				</section>
			</div>
			</main>
		</div>
	</div>
</div>

</body>
</html>