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
	$("#search").keyup(function() {
		var search = $(this).val();
		// 검색된 태그 리스트 넣을 ul
		var search_tag_ul = $("#tag-result");
		// 태그 리스트 count
		var search_tag_count = $(".search-tag-count");
		var search_post_ul = $("#post-result");
		var search_post_count = $(".search-post-count");
		var tag_result_found = false;
		var post_result_found = false;
		
		if (search.length == 0) {
			$(".search-base-content").css("display", "block");
			$(".search-content").css("display", "none");
			
			search_tag_ul.empty();
			search_tag_count.text(0);
			search_post_ul.empty();
			search_post_count.text(0);
			$(".default-not-found").css("display", "none");
		}
		else {
			$(".search-base-content").css("display", "none");
			$(".search-content").css("display", "block");

			// 비동기로 데이터를 가져와야 함
			// postTag List
			$.ajax({
				url : "${contextPath}/community/searchPostByTag",
				type : "POST",
				data : {"title" : search},
				async : true,
				success : function(result) {
					if (result.length > 0) {
						tag_result_found = true;
						$(".default-not-found").css("display", "none");
						$("#tag-area").css("display", "block");
						
						// need to empty inside of UL tag
						search_tag_ul.empty();
						search_tag_count.text(" " + result.length);
		                // Loop through the result and create li elements
		                result.forEach(function(tag) {
		                	if ($("#tag-result li").length > 3) return;
		                		
		                    var li = $("<li>").attr("data-v-53eafb8a", "").addClass("tag-wrap");
		                    var a = $("<a>").attr({
		                        "data-v-5b1cfcdf": "",
		                        "data-v-53eafb8a": "",
		                        "href": "${contextPath}/community/feed?tag=" + tag.contentId,
		                        "class": "tag",
		                        "id": "hashtag_0",
		                        "keyword": "f"
		                    });
		                    var iconDiv = $("<div>").attr("data-v-5b1cfcdf", "").addClass("tag__icon result");
		                    var svg = '<svg data-v-5b1cfcdf="" width="24" height="24" fill="none" xmlns="http://www.w3.org/2000/svg" viewbox="0 0 24 24" class=""><path data-v-5b1cfcdf="" fill-rule="evenodd" clip-rule="evenodd" d="M10.216 5.015a1 1 0 00-1.159.812L8.69 7.909H7a1 1 0 100 2h1.337l-.705 4H6a1 1 0 100 2h1.28l-.307 1.735a1 1 0 001.97.348l.367-2.083h3.969l-.306 1.735a1 1 0 101.97.348l.367-2.083H17a1 1 0 100-2h-1.338l.705-4h1.634a1 1 0 100-2h-1.28l.305-1.735a1 1 0 10-1.97-.347l-.367 2.082h-3.968l.306-1.735a1 1 0 00-.811-1.159zm3.415 8.894l.706-4h-3.969l-.705 4h3.968z" fill="#98A4B7"></path></svg>';
		                    var infoDiv = $("<div>").attr("data-v-5b1cfcdf", "").addClass("tag__info");
		                    var textP = $("<p>").attr("data-v-5b1cfcdf", "").addClass("info__text with-count").text(tag.postTag);
		                    var countP = $("<p>").attr("data-v-5b1cfcdf", "").addClass("info__count").text("게시글 " + tag.postCnt + "개");
	
		                    // Append elements
		                    iconDiv.append(svg);
		                    infoDiv.append(textP, countP);
		                    a.append(iconDiv, infoDiv);
		                    li.append(a);
		                    search_tag_ul.append(li);
	                	});
					}
					else {
						$("#tag-area").css("display", "none");
					}
 				}
			});
			// post title, content list
			$.ajax({
				url : "${contextPath}/community/searchPost",
				type : "POST",
				data : {"title" : search},
				async : true,
				success : function(result) {
					if (result.length > 0) {
						post_result_found = true;
						$(".default-not-found").css("display", "none");
						$("#post-area").css("display", "block");

						// need to empty inside of UL tag
						search_post_ul.empty();
						search_post_count.text(" " + result.length);
						result.forEach(function (post) {
							var li = $("<li>").attr("data-v-53eafb8a", "").addClass("");
							var a = $("<a>").attr({
								"data-v-0bcef72e": "",
								"data-v-53eafb8a": "",
								"href": "${contextPath}/community/post?postId=" + post.postId,
								"class": "",
								"id": "communityPost-" + post.postId
							});
							var communityItemDiv = $("<div>").attr("data-v-0bcef72e", "").addClass("community-search-item");
							var infoWrapDiv = $("<div>").attr("data-v-0bcef72e", "").addClass("info-wrap");
							var titleP = $("<p>").attr("data-v-0bcef72e", "").addClass("title").text(post.postTitle);
							var bodyP = $("<p>").attr("data-v-0bcef72e", "").addClass("body").text(post.content);
							var createdP = $("<p>").attr("data-v-0bcef72e", "").addClass("created").text(post.enrollDt);

							// Append elements
							infoWrapDiv.append(titleP, bodyP, createdP);
							communityItemDiv.append(infoWrapDiv);
							a.append(communityItemDiv);
							li.append(a);
							search_post_ul.append(li);
						});
					}
					else {
						$("#post-area").css("display", "none");
					}
				}
			});
			
			if (!tag_result_found && !post_result_found) {
				$(".default-not-found").css("display", "block");
			}
		}

	});
	
	$("#communityTagMoreButton").click(function() {
		location.href="${contextPath}/community/keyword?tag=" + $("#search").val();
	});
	
	$("#communityMoreButton").click(function() {
		location.href="${contextPath}/community/keyword?keyword=" + $("#search").val();
	});
})
</script>
</head>
<body>

<div id="__nuxt">
	<div id="__layout">
		<div id="root" data-v-c827bb7e="">
			<main id="contents" data-fetch-key="data-v-e694bbc4:0" data-v-e694bbc4="" data-v-c827bb7e="">
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
				<!-- 인기 태그 -->
				<section data-v-e694bbc4="" class="search-base-content" style="display: block;">
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
				</section>
				<!-- 검색 결과가 없을 때 -->
				<section data-v-e694bbc4="" class="default-not-found" style="display: none;">
				<div data-v-e694bbc4="" class="text-wrap">
					<span data-v-e694bbc4="" class="not-found-title">검색 결과가 없습니다.</span><br data-v-e694bbc4="">
				</div>
				</section>
				<!---->
				<section data-v-e694bbc4="" class="search-content" style="display: none;">
					<!-- 게시글 태그 결과물 -->
					<section data-v-2f928022="" class="result-section search-community-area" id="tag-area" style="display: none;">
					<div data-v-2f928022="" class="section-title-wrapper community">
						<h3 data-v-2f928022="" class="section-title community"> 커뮤니티 태그 <span data-v-2f928022="" class="search-tag-count"></span>
						<!---->
						<a data-v-2f928022="" class="section-more-btn" id="communityTagMoreButton" title="커뮤니티 태그 더보기"><i data-v-2f928022="" class="kino-icon kino-icon--more-main"></i></a></h3>
					</div>
					<div data-v-2f928022="" class="content-wrap" style="">
						<div data-v-53eafb8a="" data-v-2f928022="" class="filcking">
							<div class="eg-flick-viewport" style="position: relative; z-index: 2000; overflow: visible; min-height: 100%; width: 100%; touch-action: pan-y; user-select: none; -webkit-user-drag: none; height: 144px;">
								<div class="eg-flick-camera" style="width: 100%; height: 100%; will-change: transform; transform: translate3d(0px, 0px, 0px);">
									<ul data-v-53eafb8a="" id="tag-result" class="eg-flick-panel" style="position: absolute; left: 0px;">
									</ul>
								</div>
							</div>
						</div>
					</div>
					</section>
					<!-- 같은 제목 결과물 -->
					<section data-v-2f928022="" class="result-section search-community-area" id="post-area" style="display: none;">
						<div data-v-2f928022="" class="section-title-wrapper community">
							<h3 data-v-2f928022="" class="section-title community"> 커뮤니티 게시글 <span data-v-2f928022="" class="search-post-count"></span>
								<a data-v-2f928022="" class="section-more-btn" id="communityMoreButton" title="커뮤니티 게시글 더보기"><i data-v-2f928022="" class="kino-icon kino-icon--more-main"></i></a></h3>
						</div>
						<div data-v-2f928022="" class="content-wrap" style="">
							<div data-v-53eafb8a="" data-v-2f928022="" class="filcking">
								<div class="eg-flick-viewport" style="position: relative; z-index: 2000; overflow: visible; min-height: 100%; width: 100%; touch-action: pan-y; user-select: none; -webkit-user-drag: none; height: 222px;">
									<div class="eg-flick-camera" style="width: 100%; height: 100%; will-change: transform; transform: translate3d(0px, 0px, 0px);">
										<ul data-v-53eafb8a="" id="post-result" class="eg-flick-panel" style="position: absolute; left: 0px;">
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