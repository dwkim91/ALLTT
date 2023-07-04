<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<div style="background-color: black;">
		<div class="section-title" style="margin-top: 8rem;">
			<h5 style="padding-bottom: 20px;">넷플릭스 최신 컨텐츠</h5>
			<div class="detailList">
				<c:forEach var="netflixContent" items="${netflixContentList}">
					<div class="item" data-id="${netflixContent.contentId}">
						<a class="false css-1djwytu e2ri0zb0" href="/detail?contentId=${netflixContent.contentId}">
							<div class="item__thumb item__thumb-25x36">
								<div class="item__tags">
									<div class="item__tags-left"></div>
									<div class="item__tags-right"></div>
								</div>
								<div class="item__image lazy">
									<img class="loaded css-1doy9ip euf32k22"
										src="${netflixContent.imgUrl}"
										alt="${netflixContent.title}">
								</div>
							</div>
							<div class="item__info ">
								<p class="item__title">${netflixContent.title}</p>
							</div>
						</a>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<div style="background-color: black;">
		<div class="section-title" style="margin-top: 1rem;">
			<h5 style="padding-bottom: 20px;">티빙 최신 컨텐츠</h5>
			<div class="detailList">
				<c:forEach var="tvingContent" items="${tvingContentList}">
					<div class="item" data-id="${tvingContent.contentId}">
						<a class="false css-1djwytu e2ri0zb0" href="/detail?contentId=${tvingContent.contentId}">
							<div class="item__thumb item__thumb-25x36">
								<div class="item__tags">
									<div class="item__tags-left"></div>
									<div class="item__tags-right"></div>
								</div>
								<div class="item__image lazy">
									<img class="loaded css-1doy9ip euf32k22"
										src="${tvingContent.imgUrl}"
										alt="${tvingContent.title}">
								</div>
							</div>
							<div class="item__info ">
								<p class="item__title">${tvingContent.title}</p>
							</div>
						</a>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
	<div style="background-color: black;">
		<div class="section-title" style="margin-top: 1rem;">
			<h5 style="padding-bottom: 20px;">웨이브 최신 컨텐츠</h5>
			<div class="detailList">
				<c:forEach var="wavveContent" items="${wavveContentList}">
					<div class="item" data-id="${wavveContent.contentId}">
						<a class="false css-1djwytu e2ri0zb0" href="/detail?contentId=${wavveContent.contentId}">
							<div class="item__thumb item__thumb-25x36">
								<div class="item__tags">
									<div class="item__tags-left"></div>
									<div class="item__tags-right"></div>
								</div>
								<div class="item__image lazy">
									<img class="loaded css-1doy9ip euf32k22"
										src="${wavveContent.imgUrl}"
										alt="${wavveContent.title}">
								</div>
							</div>
							<div class="item__info ">
								<p class="item__title">${wavveContent.title}</p>
							</div>
						</a>
					</div>
				</c:forEach>
			</div>
		</div>
	</div>
</body>
</html>