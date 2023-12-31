<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<head>
<script src="${contextPath}/resources/bootstrap/js/wish-contentListLoad.js"
	type="module"></script>
<script src="${contextPath}/resources/bootstrap/js/wish-solution.js"
	type="module"></script>
<link rel="stylesheet"
	href="${contextPath}/resources/bootstrap/css/wish-custom.css"
	type="text/css">
</head>

<main class="is-desktop css-p5l6tq eeennqe0">
	<section class="contents_wrap">
		<div>
			<section class="myprofile__contents myprofile css-yfyhdz e2z45lx0">
				<div class="page_select btn_type layout__flex-left">
					<div class="layout__flex-left">
						<button type="button" id="infoBtn"
							class="page_select_layout btn_popular click_on">구독정보</button>
						<button type="button" id="platformBtn"
							class="page_select_layout btn_popular btn_new ">플랫폼</button>
						<button type="button" id="costBtn"
							class="page_select_layout btn_popular btn_new ">구독비</button>
					</div>
					<div class="page_select_right">
						<button class="chartType">시리즈</button>
					</div>
				</div>
				<div style="color: navajowhite;" id="message">※ 회원님의 구독정보를 바탕으로 컨텐츠를 통합합니다.</div>
				<div style="display: flex; flex-wrap: wrap;" class="tableContainer">
					<table class="platformTable" data-id="1">
						<tr>
							<td colspan="2">넷플릭스 ( <span id="netflixWishCnt">${netflixWishCnt}</span> )</td>
						</tr>
						<tr class="platformTr" data-id="1">
							<td><img src="/resources/bootstrap/img/n100.jpeg"
								class="platformIcon" id="netflixByNetflixBtn"></td>
							<td style="text-align: left;" id="netflixByNetflixCnt"></td>
						</tr>
						<tr class="platformTr" data-id="2">
							<td><img src="/resources/bootstrap/img/t100.jpeg"
								class="platformIcon" id="netflixByTvingBtn"></td>
							<td style="text-align: left;" id="netflixByTvingCnt"></td>
						</tr>
						<tr class="platformTr" data-id="3">
							<td><img src="/resources/bootstrap/img/w100.jpeg"
								class="platformIcon" id="netflixByWavveBtn"></td>
							<td style="text-align: left;" id="netflixByWavveCnt"></td>
						</tr>
					</table>
					<table class="platformTable" data-id="2">
						<tr>
							<td colspan="3">티빙 ( <span id="tvingWishCnt">${tvingWishCnt}</span> )</td>
						</tr>
						<tr class="platformTr" data-id="2">
							<td><img src="/resources/bootstrap/img/t100.jpeg"
								class="platformIcon" id="tvingByTvingBtn"></td>
							<td style="text-align: left;" id="tvingByTvingCnt"></td>
						</tr>
						<tr class="platformTr" data-id="1">
							<td><img src="/resources/bootstrap/img/n100.jpeg"
								class="platformIcon" id="tvingByNetflixBtn"></td>
							<td style="text-align: left;" id="tvingByNetflixCnt"></td>
						</tr>
						<tr class="platformTr" data-id="3">
							<td><img src="/resources/bootstrap/img/w100.jpeg"
								class="platformIcon" id="tvingByWavveBtn"></td>
							<td style="text-align: left;" id="tvingByWavveCnt"></td>
						</tr>
					</table>
					<table class="platformTable" data-id="1">
						<tr>
							<td colspan="3">웨이브 ( <span id="wavveWishCnt">${wavveWishCnt}</span> )</td>
						</tr>
						<tr class="platformTr" data-id="3">
							<td><img src="/resources/bootstrap/img/w100.jpeg"
								class="platformIcon" id="wavveByWavveBtn"></td>
							<td style="text-align: left;" id="wavveByWavveCnt"></td>
						</tr>
						<tr class="platformTr" data-id="1">
							<td><img src="/resources/bootstrap/img/n100.jpeg"
								class="platformIcon" id="wavveByNetflixBtn"></td>
							<td style="text-align: left;" id="wavveByNetflixCnt"></td>
						</tr>
						<tr class="platformTr" data-id="2">
							<td><img src="/resources/bootstrap/img/t100.jpeg"
								class="platformIcon" id="wavveByTvingBtn"></td>
							<td style="text-align: left;" id="wavveByTvingCnt"></td>
						</tr>
					</table>
				</div>
				<div>
					<div class="page_select btn_type layout__flex-left">
						<div class="layout__flex-left">
							<button type="button" id="seriesBtn"
								class="page_select_layout btn_popular click_on">TV프로그램</button>
							<button type="button" id="movieBtn"
								class="page_select_layout btn_popular btn_new ">영화</button>
							<input type="hidden" value="series" id="contentType">
						</div>
						<div class="page_select_right">
							<button class="css-110e4jt">편집</button>
							<div class="css-k8kcxi e7z8nrj1">
								<button type="button"
									class="page_select_layout page_select__hover icon-check hidden">전체선택</button>
								<button type="button"
									class="page_select_layout page_select__hover hidden"
									id="itemCnt">삭제 (0)</button>
								<button class="css-vmfm9q hidden">완료</button>
							</div>
						</div>
					</div>
					<section style="grid-column: 1/span 12;">

						<section class="lists lists__noneLazy">
							<div
								class="lists__columns lists__columns-vertical css-0 enth0yz0"
								id="wishContainer">
								<c:forEach var="wishContent" items="${wishContentList}">
									<div class="item" data-id="${wishContent.contentId}">
										<a class="active css-1djwytu e2ri0zb0"
											href="/detail?contentId=${wishContent.contentId}">
											<div class="item__thumb item__thumb-25x36">
												<div class="item__tags">
													<div class="item__tags-left"></div>
													<div class="item__tags-right"></div>
												</div>
												<div class="item__image lazy">
													<img class="loaded css-1doy9ip euf32k22"
														src="${wishContent.imgUrl}" alt="${wishContent.title}">
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