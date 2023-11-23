<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<head>
<script src="${contextPath}/resources/bootstrap/js/wish-contentListLoad.js" type="module"></script>
<script src="${contextPath}/resources/bootstrap/js/wish-solution.js" type="module"></script>
<link rel="stylesheet" href="${contextPath}/resources/bootstrap/css/wish-custom.css" type="text/css">
</head>

<main class="is-desktop css-p5l6tq eeennqe0">
	<section class="contents_wrap">
		<div>
			<section class="myprofile__contents myprofile css-yfyhdz e2z45lx0">
				<div style="color: navajowhite;" id="message">※ 회원님께서 찜한 시리즈컨텐츠 수는 총 ${totalCnt}개 입니다.</div>
				<div>
					<table class="tableContainer">
						<tr>
							<td>기준</td>
							<td>넷플릭스</td>
							<td>시청가능한 컨텐츠 수</td>
							<td>티빙</td>
							<td>시청가능한 컨텐츠 수</td>
							<td>웨이브</td>
							<td>시청가능한 컨텐츠 수</td>
							<td>Basic</td>
							<td>Standard</td>
							<td>Premium</td>
						</tr>
						<tr>
							<td>현재</td>
							<c:choose>
								<c:when test="${subscription.netflixId != 0}">
									<td data-id="1" class="platformTd">
										<img src="/resources/bootstrap/img/n100.jpeg" class="platformIcon">
									</td>
									<td id= "myNetflixCnt">${netflixWishCnt}</td>
								</c:when>
								<c:otherwise>
									<td></td>
									<td></td>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${subscription.tvingId != 0}">
									<td data-id="2" class="platformTd">
										<img src="/resources/bootstrap/img/t100.jpeg" class="platformIcon">
									</td>
									<td id= "tvingWishCnt">${tvingWishCnt}</td>
								</c:when>
								<c:otherwise>
									<td></td>
									<td></td>
								</c:otherwise>
							</c:choose>
							<c:choose>
								<c:when test="${subscription.wavveId != 0}">
									<td data-id="3" class="platformTd">
										<img src="/resources/bootstrap/img/w100.jpeg" class="platformIcon">
									</td>
									<td id= "wavveWishCnt">${wavveWishCnt}</td>
								</c:when>
								<c:otherwise>
									<td></td>
									<td></td>
								</c:otherwise>
							</c:choose>
							<td><fmt:formatNumber value="${myBasicCost}" pattern="#,###"/>원</td>
							<td><fmt:formatNumber value="${myStandardCost}" pattern="#,###"/>원</td>
							<td><fmt:formatNumber value="${myPremiumCost}" pattern="#,###"/>원</td>
						</tr>
						<tr>
							<td>제안</td>
							<td id = "netflixIcon" data-id="1" class="platformTd"></td>
							<td id = "netflixCnt"></td>
							<td id = "tvingIcon" data-id="2" class="platformTd"></td>
							<td id = "tvingCnt"></td>
							<td id = "wavveIcon" data-id="3" class="platformTd"></td>
							<td id = "wavveCnt"></td>
							<td id = "basicCost"></td>
							<td id = "standardCost" ></td>
							<td id = "premiumCost"></td>
						</tr>
					</table>
					<input type="hidden" id="netflixBasic" value="${netflixCost.platformCostBasic}">
					<input type="hidden" id="tvingBasic" value="${tvingCost.platformCostBasic}">
					<input type="hidden" id="wavveBasic" value="${wavveCost.platformCostBasic}">
					<input type="hidden" id="netflixStandard" value="${netflixCost.platformCostStandard}">
					<input type="hidden" id="tvingStandard" value="${tvingCost.platformCostStandard}">
					<input type="hidden" id="wavveStandard" value="${wavveCost.platformCostStandard}">
					<input type="hidden" id="netflixPremium" value="${netflixCost.platformCostPremium}">
					<input type="hidden" id="tvingPremium" value="${tvingCost.platformCostPremium}">
					<input type="hidden" id="wavvePremium" value="${wavveCost.platformCostPremium}">
				</div>
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