<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<head>
	<script src="${contextPath}/resources/bootstrap/js/wishContentList.js" type="module"></script>

	<style>
		.hidden {display:none;}
	</style>
</head>

<main class="is-desktop css-p5l6tq eeennqe0">
	<section class="contents_wrap">
		<div>
			<section class="myprofile__contents myprofile css-yfyhdz e2z45lx0">
				<div><table><tr><td>넷플릭스</td><td>티빙</td><td>웨이브</td></tr></table></div>
				<div class="css-1fee8qh e2sfx0b0"></div>
				<div class="page_select btn_type layout__flex-left">
					<div class="layout__flex-left">
						<button type="button" id="seriesBtn" class="page_select_layout btn_popular click_on">TV프로그램</button>
						<button type="button" id="movieBtn"  class="page_select_layout btn_popular btn_new ">영화</button>
						<input type="hidden" value="series" id="contentType">
					</div>
					<div class="page_select_right">
						  <button class="css-110e4jt">편집</button>
						  <div class="css-k8kcxi e7z8nrj1">
						    <button type="button" class="page_select_layout page_select__hover icon-check hidden">전체선택</button>
						    <button type="button" class="page_select_layout page_select__hover hidden" id="itemCnt">삭제 (0)</button>
						    <button class="css-vmfm9q hidden">완료</button>
						  </div>
					</div>
				</div>
				<section style="grid-column: 1/span 12;">
					
					<section class="lists lists__noneLazy">
						<div class="lists__columns lists__columns-vertical css-0 enth0yz0" id="wishContainer">
						<c:forEach var="wishContent" items="${wishContentList}">
							<div class="item" data-id="${wishContent.contentId}">
								<a class="active css-1djwytu e2ri0zb0" href="/detail?contentId=${wishContent.contentId}">
									<div class="item__thumb item__thumb-25x36">
										<div class="item__tags">
											<div class="item__tags-left"></div>
											<div class="item__tags-right"></div>
										</div>
										<div class="item__image lazy">
											<img class="loaded css-1doy9ip euf32k22" src="${wishContent.imgUrl}" alt="${wishContent.title}">
										</div>
									</div>
									<div class="item__info ">
										<p class="item__title false">${wishContent.title}</p>
									</div>
								</a>
							</div>
							</c:forEach>
						</div>
					</section>
					<div></div>
				</section>
			</section>
		</div>
	</section>
</main>