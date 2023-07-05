<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
</head>
<body>
	<div class="container">
		<div class="anime__details__content">
			<div class="row">
				<div class="col-lg-3">
					<div class="anime__details__pic set-bg"
						data-setbg="${filteredDataDTO.imgUrl}"></div>
				</div>
				<div class="col-lg-9">
					<div class="anime__details__text">
						<div class="anime__details__title">
							<h3>${filteredDataDTO.title}</h3>
						</div>
						<p>${filteredDataDTO.summary}</p>
						<div class="anime__details__widget">
							<div class="row">
								<div class="col-lg-7 col-md-7">
									<ul>
										<li><span>종류:</span> ${filteredDataDTO.contentType}</li>
										<li><span>크리에이터:</span> ${filteredDataDTO.creator}</li>
										<li><span>출연진:</span> ${filteredDataDTO.actors}</li>
										<li><span>등록년도:</span> ${filteredDataDTO.enrollDt}</li>
										<li><span>장르:</span> ${genreNmList}</li>
									</ul>
								</div>
								<div class="col-lg-5 col-md-5">
									<div class="anime__details__review">
										<div class="section-title" style="margin-top: 10px;">
											<h5>게시글</h5>
										</div>
										<ul>
											<li><a href="">
												<div class="anime__review__item">
													<div class="anime__review__item__text">
														<h6>
															닉네임<span> - 1시간 전</span><span class="subject_over" style="width: 100%;">게시글 제목이길때는 어찌되는지 확인해보아자아자아자아자아장장자</span>
														</h6>
													</div>
												</div>
												</a>
										</div>
										<li>
									</ul>
								</div>
							</div>
						</div>
						<div class="anime__details__btn">
							<a href="#" class="follow-btn" id="addWish"> <i
								class="fa fa-heart-o"></i> 컨텐츠 찜
							</a>
						</div>
						<div class="section-title" style="padding-top: 20px">
							<h5>서비스 플랫폼</h5>
							<div class="platform-container">
								<c:if test="${not empty netflixUrl}">
									<label class="platform-label"> <a href="${netflixUrl}"
										class="platform-custom" target="_blank"
										style="background-image: url('/resources/bootstrap/img/n100.jpeg');"></a>
									</label>
								</c:if>
								<c:if test="${not empty tvingUrl}">
									<label class="platform-label"> <a href="${tvingUrl}"
										class="platform-custom" target="_blank"
										style="background-image: url('/resources/bootstrap/img/t100.jpeg');"></a>
									</label>
								</c:if>
								<c:if test="${not empty wavveUrl}">
									<label class="platform-label"> <a href="${wavveUrl}"
										class="platform-custom" target="_blank"
										style="background-image: url('/resources/bootstrap/img/w100.jpeg');"></a>
									</label>
								</c:if>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
		<div class="row">
			<div class="col-lg-12 col-md-12">
				<div class="anime__details__form">
					<div class="section-title">
						<div class="section-title">
							<h5 style="padding-bottom: 20px;">${filteredDataDTO.genreNm}
								최신 컨텐츠</h5>
							<div class="detailList">
								<c:forEach var="latestList" items="${latestList}">
									<div class="item" data-id="${latestList.contentId}">
										<a class="false css-1djwytu e2ri0zb0"
											href="?contentId=${latestList.contentId}">
											<div class="item__thumb item__thumb-25x36">
												<div class="item__tags">
													<div class="item__tags-left"></div>
													<div class="item__tags-right"></div>
												</div>
												<div class="item__image lazy">
													<img class="loaded css-1doy9ip euf32k22"
														src="${latestList.imgUrl}" alt="${latestList.title}">
												</div>
											</div>
											<div class="item__info ">
												<p class="item__title">${latestList.title}</p>
											</div>
										</a>
									</div>
								</c:forEach>
							</div>
						</div>
						<div class="section-title">
							<h5 style="padding-bottom: 20px;">비슷한 컨텐츠</h5>
							<div class="detailList">
								<c:forEach var="similarList" items="${similarList}">
									<div class="item" data-id="${similarList.contentId}">
										<a class="false css-1djwytu e2ri0zb0"
											href="?contentId=${similarList.contentId}">
											<div class="item__thumb item__thumb-25x36">
												<div class="item__tags">
													<div class="item__tags-left"></div>
													<div class="item__tags-right"></div>
												</div>
												<div class="item__image lazy">
													<img class="loaded css-1doy9ip euf32k22"
														src="${similarList.imgUrl}" alt="${similarList.title}">
												</div>
											</div>
											<div class="item__info ">
												<p class="item__title">${similarList.title}</p>
											</div>
										</a>
									</div>
								</c:forEach>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</body>
</html>