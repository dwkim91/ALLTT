<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<head>
<script src="${contextPath}/resources/bootstrap/js/contents.js"
	type="module"></script>
<script src="${contextPath}/resources/bootstrap/js/contentsWish.js"
	type="module"></script>
</head>
<body>
	<main class="is-desktop css-p5l6tq eeennqe0">
		<section class="contents_wrap">
			<section class="contents_wrap wrap_margin">
				<div data-v-a0912140=""
					class="hidden-horizontal-scrollbar filter-bar__provider-row"></div>
				<div class="hidden-horizontal-scrollbar__items"></div>
				<div data-v-a0912140=""
					class="hidden-horizontal-scrollbar filter-bar__provider-row"></div>
				<!-- checkBox -->
				<div class="hidden-horizontal-scrollbar__items"></div>
				<div>
					<div class="checkbox-container">
						<label class="checkbox-label"> <input type="checkbox"
							checked id="netflixCheckbox" value="1"> <span
							class="checkbox-custom"
							style="background-image: url('${contextPath}/resources/bootstrap/img/n100.jpeg');"></span>
						</label> <label class="checkbox-label"> <input type="checkbox"
							checked id="tvingCheckbox" value="2"> <span
							class="checkbox-custom"
							style="background-image: url('${contextPath}/resources/bootstrap/img/t100.jpeg');"></span>
						</label> <label class="checkbox-label"> <input type="checkbox"
							checked id="wavveCheckbox" value="3"> <span
							class="checkbox-custom"
							style="background-image: url('${contextPath}/resources/bootstrap/img/w100.jpeg');"></span>
						</label>
					</div>
					<div class="select-container">
						<select id="genreId">
							<option value="0">전체</option>
							<c:forEach var="genreDTO" items="${genreList}">
								<option value="${genreDTO.genreId}">${genreDTO.genreNm}</option>
							</c:forEach>
						</select> <select id="isWishInclude">
							<option value="ture">찜 포함</option>
							<option value="false">찜 제외</option>
						</select> <select id="sortType">
							<option value="latest">최신순</option>
							<option value="title">이름순</option>
						</select> <input type="hidden" value="series" id="contentType">
					</div>
					<section class="lists lists__noneLazy">
						<div class="lists__columns lists__columns-vertical css-0 enth0yz0" id="container">
							<!-- 기본 42개 -->
							<c:forEach var="content" items="${contentList}">
								<div class="item" data-id="${content.contentId}">
									<c:choose>
										<c:when test="${content.memberId == 0}">
											<div class="item__thumb item__thumb-25x36">
										</c:when>
										<c:otherwise>
											<div class="item__thumb item__thumb-25x36" id="wishContent">
										</c:otherwise>
									</c:choose>
									<div class="item__tags"></div>
									<div class="item__image lazy">
										<img class="loaded css-1doy9ip euf32k22"
											src="${content.imgUrl}" alt="${content.title}">
									</div>
								</div>
								<div class="item__info ">
									<a class="item__title" href="/detail?contentId=${content.contentId}">${content.title}</a>
								</div>
							</div>
							</c:forEach>
						</div>
					</section>
				</div>
			</section>
		</section>
	</main>
</body>