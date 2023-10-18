<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<script>
	var memberSession = "${sessionScope.memberId}";
	var tvingUrl = "${tvingUrl}";
	var wavveUrl = "${wavveUrl}";
</script>
<link rel="stylesheet" href="${contextPath}/resources/bootstrap/css/detail-custom.css" type="text/css">
<script src="${contextPath}/resources/bootstrap/js/detail-wish.js" type="module"></script>
<script src="${contextPath}/resources/bootstrap/js/detail-contentStyle.js"></script>

</head>
<body>
	<div class="container">
		<div class="anime__details__content">
			<div class="row">
				<div class="col-lg-3">
					<div class="anime__details__pic set-bg" data-setbg="${filteredDTO.imgUrl}"></div>
				</div>
				<div class="col-lg-9">
					<div class="anime__details__text">
						<div class="anime__details__title">
							<c:if test="${not empty filteredDTO.title}">
								<h3>${filteredDTO.title}</h3>
							</c:if>
						</div>
						<p>${filteredDTO.summary}</p>
						<div class="anime__details__widget">
							<div class="row">
								<div class="col-lg-7 col-md-7">
									<ul>
										<c:if test="${not empty filteredDTO.contentType}">
											<li><span>종류:</span> ${filteredDTO.contentType}</li>
										</c:if>
										<c:if test="${not empty filteredDTO.creator}">
											<li><span>크리에이터:</span> ${filteredDTO.creator}</li>
										</c:if>
										<c:if test="${not empty filteredDTO.actors}">
											<li><span>출연진:</span> ${filteredDTO.actors}</li>
										</c:if>
										<c:if test="${not empty filteredDTO.enrollDt}">
											<li><span>등록년도:</span> ${filteredDTO.enrollDt}</li>
										</c:if>
										<c:if test="${not empty genreNmList}">
											<li><span>장르:</span> ${genreNmList}</li>
										</c:if>
									</ul>
									<ul>
										<div class="section-title" style="padding-top: 20px">
											<h5>서비스 플랫폼</h5>
											<div class="platform-container">
												<c:if test="${not empty netflixUrl}">
													<label class="platform-label">
														<a href="${netflixUrl}" class="platform-custom" target="_blank" style="background-image: url('/resources/bootstrap/img/n100.jpeg');"></a>
													</label>
												</c:if>
												<c:if test="${not empty tvingUrl}">
													<label class="platform-label"> 
														<a href="${tvingUrl}" class="platform-custom" target="_blank" style="background-image: url('/resources/bootstrap/img/t100.jpeg');"></a>
													</label>
												</c:if>
												<c:if test="${not empty wavveUrl}">
													<label class="platform-label">
														<a href="${wavveUrl}" class="platform-custom" target="_blank" style="background-image: url('/resources/bootstrap/img/w100.jpeg');"></a>
													</label>
												</c:if>
											</div>
										</div>
									</ul>
									<ul>
										<div class="anime__details__btn">
											<a href="#" class="follow-btn" id="addWish" data-id="${filteredDTO.contentId}">
											<c:choose>
												<c:when test="${filteredDTO.memberId > 0}">
													<i class="fa fa-heart"></i> 컨텐츠 찜											
												</c:when>
												<c:otherwise>
													<i class="fa fa-heart-o"></i> 컨텐츠 찜
												</c:otherwise>											
											</c:choose>
											</a>
										</div>
									</ul>
								</div>
								<div class="col-lg-5 col-md-5">
									<div class="anime__details__review">
										<div class="section-title" style="margin-top: 10px;">
											<h5>게시글</h5>
										</div>
										<ul>
											<c:forEach var="post" items="${postList}">
												<li>
													<a href="/community/post?postId=${post.postId}">
														<div class="anime__review__item">
															<div class="anime__review__item__text" style="background-color: #212121;">
																<h6 style="color:#efefef;">
																	${post.nickName} - 
																	<span style="color:#705a5a;" class="formattedTime">${post.enrollDt}</span>
																	<span class="subject_over" style="width: 100%; color: #f0a9a9;"> ${post.content} </span>
																</h6>
															</div>
														</div>
													</a>
												<li>
											</c:forEach>
											<script>
											window.onload = function() {
												var formattedTimeElements = document.getElementsByClassName("formattedTime");
												for (var i = 0; i < formattedTimeElements.length; i++) {
													formattedTimeElements[i].textContent = dateFormat(formattedTimeElements[i].textContent);
												}
												function dateFormat (enrollDt) {
													
													// 주어진 문자열을 파싱하여 Date 객체로 변환
													var dateString = enrollDt.replace('KST', '');
													var dateObject = new Date(dateString);

													// 현재 시간 구하기
													var currentTime = new Date();

													// 두 시간 사이의 차이 계산 (밀리초 단위)
													var timeDifferenceInMilliseconds = currentTime - dateObject;

													// 시간 간격 계산 함수
													function getTimeIntervalText(timeDifference) {
													    var seconds = Math.floor(timeDifference / 1000);
													    var minutes = Math.floor(seconds / 60);
													    var hours = Math.floor(minutes / 60);
													    var days = Math.floor(hours / 24);
													    var weeks = Math.floor(days / 7);
													    var months = Math.floor(days / 30); // 달은 평균 30일로 가정
													    var years = Math.floor(months / 12);

													    if (years > 0) return years + "년 전";
													    if (months > 0) return months + "달 전";
													    if (weeks > 0) return weeks + "주 전";
													    if (days > 1) return days + "일 전";
													    if (days === 1) return "어제";
													    if (hours > 0) return hours + "시간 전";
													    if (minutes > 0) return minutes + "분 전";
													    if (seconds > 0) return "방금 전";
													    return "지금";
													}

													var timeIntervalText = getTimeIntervalText(timeDifferenceInMilliseconds);
													return timeIntervalText;
												}
											}
											</script>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row" style="margin-top: -8rem">
			<div class="col-lg-12 col-md-12">
				<div class="anime__details__form">
					<main class="is-desktop css-p5l6tq eeennqe0">
						<section class="contents_wrap">
							<section class="contents_wrap wrap_margin">
								<div data-v-a0912140=""
									class="hidden-horizontal-scrollbar filter-bar__provider-row"></div>
								<div class="hidden-horizontal-scrollbar__items"></div>
								<div data-v-a0912140=""
									class="hidden-horizontal-scrollbar filter-bar__provider-row"></div>
								<div class="hidden-horizontal-scrollbar__items"></div>
								<div>
									<div class="section-title" style="margin-bottom: 20px;">
										<h5>${filteredDTO.genreNm} 최신 컨텐츠</h5>
									</div>
									<section class="lists lists__noneLazy">
										<div
											class="lists__columns lists__columns-vertical css-0 enth0yz0"
											id="container">
											<!-- 기본 42개 -->
											<c:forEach var="latestContent" items="${latestList}">
												<div class="item" data-id="${latestContent.contentId}">
													<c:choose>
														<c:when test="${latestContent.memberId == 0}">
															<div class="item__thumb item__thumb-25x36">
														</c:when>
														<c:otherwise>
															<div class="item__thumb item__thumb-25x36"
																id="wishContent">
														</c:otherwise>
													</c:choose>
													<div class="item__tags"></div>
													<div class="item__image lazy">
														<img class="loaded css-1doy9ip euf32k22"
															src="${latestContent.imgUrl}"
															alt="${latestContent.title}">
													</div>
												</div>
												<div class="item__info ">
													<a class="item__title"
														href="/detail?contentId=${latestContent.contentId}">${latestContent.title}</a>
												</div>
										</div>
										</c:forEach>
									</section>
								</div>
								<div>
									<div class="section-title" style="margin-bottom: 20px;">
										<h5>넷플릭스 최신 컨텐츠</h5>
									</div>
									<section class="lists lists__noneLazy">
										<div
											class="lists__columns lists__columns-vertical css-0 enth0yz0"
											id="container">
											<!-- 기본 42개 -->
											<c:forEach var="similarContent" items="${similarList}">
												<div class="item" data-id="${similarContent.contentId}">
													<c:choose>
														<c:when test="${similarContent.memberId == 0}">
															<div class="item__thumb item__thumb-25x36">
														</c:when>
														<c:otherwise>
															<div class="item__thumb item__thumb-25x36"
																id="wishContent">
														</c:otherwise>
													</c:choose>
													<div class="item__tags"></div>
													<div class="item__image lazy">
														<img class="loaded css-1doy9ip euf32k22"
															src="${similarContent.imgUrl}"
															alt="${similarContent.title}">
													</div>
												</div>
												<div class="item__info ">
													<a class="item__title"
														href="/detail?contentId=${similarContent.contentId}">${similarContent.title}</a>
												</div>
										</div>
										</c:forEach>
									</section>
								</div>
							</section>
						</section>
					</main>
				</div>
			</div>
		</div>
	</div>
</body>
</html>