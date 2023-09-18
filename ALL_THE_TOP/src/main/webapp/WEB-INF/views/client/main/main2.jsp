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
			<section class="contents_wrap wrap_margin" style="margin: 2rem;">
				<div data-v-a0912140=""
					class="hidden-horizontal-scrollbar filter-bar__provider-row"></div>
				<div class="hidden-horizontal-scrollbar__items"></div>
				<div data-v-a0912140=""
					class="hidden-horizontal-scrollbar filter-bar__provider-row"></div>
				<div class="hidden-horizontal-scrollbar__items"></div>
				<section class="lists lists__noneLazy">
				<div class="lists__columns lists__columns-vertical css-0 enth0yz0" id="container"></div></section>				
				<div>
					<div class="section-title" style="margin-bottom: 20px;">
						<h5>넷플릭스 최신 컨텐츠</h5>
					</div>
					<section class="lists lists__noneLazy">
						<div class="lists__columns lists__columns-vertical css-0 enth0yz0"
							id="container">
							<!-- 기본 42개 -->
							<c:forEach var="netflixContent" items="${netflixContentList}">
								<div class="item" data-id="${netflixContent.contentId}">
									<c:choose>
										<c:when test="${netflixContent.memberId == 0}">
											<div class="item__thumb item__thumb-25x36">
										</c:when>
										<c:otherwise>
											<div class="item__thumb item__thumb-25x36" id="wishContent">
										</c:otherwise>
									</c:choose>
									<div class="item__tags"></div>
									<div class="item__image lazy">
										<a href="/detail?contentId=${netflixContent.contentId}">
											<img class="loaded css-1doy9ip euf32k22" src="${netflixContent.imgUrl}" alt="${netflixContent.title}">
										</a>
									</div>
								</div>
								<div class="item__info ">
									<a class="item__title"
										href="/detail?contentId=${netflixContent.contentId}">${netflixContent.title}</a>
								</div>
						</div>
						</c:forEach>
					</section>
				</div>
				<div class="tempList">
					<div class="section-title" style="margin-bottom: 20px;">
						<h5>티빙 최신 컨텐츠</h5>
					</div>
					<section class="lists lists__noneLazy">
						<div class="lists__columns lists__columns-vertical css-0 enth0yz0"
							id="container">
							<!-- 기본 42개 -->
							<c:forEach var="tvingContent" items="${tvingContentList}">
								<div class="item" data-id="${tvingContent.contentId}">
									<c:choose>
										<c:when test="${tvingContent.memberId == 0}">
											<div class="item__thumb item__thumb-25x36">
										</c:when>
										<c:otherwise>
											<div class="item__thumb item__thumb-25x36" id="wishContent">
										</c:otherwise>
									</c:choose>
									<div class="item__tags"></div>
									<div class="item__image lazy">
										<a href="/detail?contentId=${tvingContent.contentId}">
											<img class="loaded css-1doy9ip euf32k22" src="${tvingContent.imgUrl}" alt="${tvingContent.title}">
										</a>
									</div>
								</div>
								<div class="item__info ">
									<a class="item__title"
										href="/detail?contentId=${tvingContent.contentId}">${tvingContent.title}</a>
								</div>
						</div>
						</c:forEach>
					</section>
				</div>
				<div class="tempList">
					<div class="section-title" style="margin-bottom: 20px;">
						<h5>웨이브 최신 컨텐츠</h5>
					</div>
					<section class="lists lists__noneLazy">
						<div class="lists__columns lists__columns-vertical css-0 enth0yz0"
							id="container">
							<!-- 기본 42개 -->
							<c:forEach var="wavveContent" items="${wavveContentList}">
								<div class="item" data-id="${wavveContent.contentId}">
									<c:choose>
										<c:when test="${wavveContent.memberId == 0}">
											<div class="item__thumb item__thumb-25x36">
										</c:when>
										<c:otherwise>
											<div class="item__thumb item__thumb-25x36" id="wishContent">
										</c:otherwise>
									</c:choose>
									<div class="item__tags"></div>
									<div class="item__image lazy">
										<a href="/detail?contentId=${wavveContent.contentId}">
											<img class="loaded css-1doy9ip euf32k22" src="${wavveContent.imgUrl}" alt="${wavveContent.title}">
										</a>
									</div>
								</div>
								<div class="item__info ">
									<a class="item__title"
										href="/detail?contentId=${wavveContent.contentId}">${wavveContent.title}</a>
								</div>
						</div>
						</c:forEach>
					</section>
				</div>
				<div class="tempList">
					<div class="section-title" style="margin-bottom: 20px;">
						<h5>액션 최신 컨텐츠</h5>
					</div>
					<section class="lists lists__noneLazy">
						<div class="lists__columns lists__columns-vertical css-0 enth0yz0"
							id="container">
							<!-- 기본 42개 -->
							<c:forEach var="actionContent" items="${actionContentList}">
								<div class="item" data-id="${wavveContent.contentId}">
									<c:choose>
										<c:when test="${actionContent.memberId == 0}">
											<div class="item__thumb item__thumb-25x36">
										</c:when>
										<c:otherwise>
											<div class="item__thumb item__thumb-25x36" id="wishContent">
										</c:otherwise>
									</c:choose>
									<div class="item__tags"></div>
									<div class="item__image lazy">
										<a href="/detail?contentId=${actionContent.contentId}">
											<img class="loaded css-1doy9ip euf32k22" src="${actionContent.imgUrl}" alt="${actionContent.title}">
										</a>
									</div>
								</div>
								<div class="item__info ">
									<a class="item__title"
										href="/detail?contentId=${actionContent.contentId}">${actionContent.title}</a>
								</div>
						</div>
						</c:forEach>
					</section>
				</div>
				<div class="tempList">
					<div class="section-title" style="margin-bottom: 20px;">
						<h5>드라마 최신 컨텐츠</h5>
					</div>
					<section class="lists lists__noneLazy">
						<div class="lists__columns lists__columns-vertical css-0 enth0yz0"
							id="container">
							<!-- 기본 42개 -->
							<c:forEach var="dramaContent" items="${dramaContentList}">
								<div class="item" data-id="${dramaContent.contentId}">
									<c:choose>
										<c:when test="${dramaContent.memberId == 0}">
											<div class="item__thumb item__thumb-25x36">
										</c:when>
										<c:otherwise>
											<div class="item__thumb item__thumb-25x36" id="wishContent">
										</c:otherwise>
									</c:choose>
									<div class="item__tags"></div>
									<div class="item__image lazy">
										<a href="/detail?contentId=${dramaContent.contentId}">
											<img class="loaded css-1doy9ip euf32k22" src="${dramaContent.imgUrl}" alt="${dramaContent.title}">
										</a>
									</div>
								</div>
								<div class="item__info ">
									<a class="item__title"
										href="/detail?contentId=${dramaContent.contentId}">${dramaContent.title}</a>
								</div>
						</div>
						</c:forEach>
					</section>
				</div>
			</section>
		</section>
	</main>
</body>
</html>