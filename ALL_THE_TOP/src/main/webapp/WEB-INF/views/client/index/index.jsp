<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath }" />
<!DOCTYPE html>
<html>
<head>
<script>
</script>
</head>
<body>
		<main class="is-desktop css-p5l6tq eeennqe0">
			<section class="contents_wrap">
				<section class="contents_wrap wrap_margin">
					<div data-v-a0912140="" class="hidden-horizontal-scrollbar filter-bar__provider-row">
						<div class="hidden-horizontal-scrollbar__items">
							<!---->
							<div data-v-a0912140="" class="hidden-horizontal-scrollbar filter-bar__provider-row">
								<div class="hidden-horizontal-scrollbar__items">
									<div class="checkbox-container">
										<label class="checkbox-label">
											<input type="checkbox" checked name="flatformCheckbox">
											<span class="checkbox-custom" style="background-image: url('${contextPath}/resources/bootstrap/img/n100.jpeg');"></span>
										</label>
										<label class="checkbox-label">
											<input type="checkbox" checked name="flatformCheckbox">
											<span class="checkbox-custom" style="background-image: url('${contextPath}/resources/bootstrap/img/t100.jpeg');"></span>
										</label>
										<label class="checkbox-label">
											<input type="checkbox" checked name="flatformCheckbox">
											<span class="checkbox-custom" style="background-image: url('${contextPath}/resources/bootstrap/img/w100.jpeg');"></span>
										</label>
									</div>
									<section class="lists lists__noneLazy">
										<div class="lists__columns lists__columns-vertical css-0 enth0yz0" id="container">
										<!-- 기본 20개 -->
										<c:forEach var="crawlingDTO" items="${contentList}">
											<div class="item" data-id="${crawlingDTO.contentId}">
												<a class="false css-1djwytu e2ri0zb0" href="?contentId=${crawlingDTO.contentId}">
													<div class="item__thumb item__thumb-25x36">
														<div class="item__tags">
															<div class="item__tags-left"></div>
															<div class="item__tags-right"></div>
														</div>
														<div class="item__image lazy">
															<picture class="loaded css-ovhph3 euf32k20">
																<img class="loaded css-1doy9ip euf32k22" src="${crawlingDTO.imgUrl}" alt="${cralwingDTO.title}">
															</picture>
														</div>
													</div>
													<div class="item__info ">
														<p class="item__title false">${crawlingDTO.title}</p>
													</div>
												</a>
											</div>
										</c:forEach>
<%-- 										  <!-- 스크롤 반복구문 Start -->
											  <c:forEach var="crawlingDTO" items="${contentList}">
											    <div class="item" data-id="${crawlingDTO.contentId}">
											      <a class="false css-1djwytu e2ri0zb0" href="?contentId=${crawlingDTO.contentId}">
											        <div class="item__thumb item__thumb-25x36">
											          <div class="item__tags">
											            <div class="item__tags-left"></div>
											            <div class="item__tags-right"></div>
											          </div>
											          <div class="item__image lazy">
											            <picture class="loaded css-ovhph3 euf32k20">
											    	<img class="loaded css-1doy9ip euf32k22" src="${crawlingDTO.imgUrl}" alt="${crawlingDTO.title}">
											    </picture>
											    </div>
											    </div>
											   	<div class="item__info ">
											    	<p class="item__title false">${crawlingDTO.title}</p>
													</div>
													</a>
												</div>
										</c:forEach>
										<!-- 스크롤 반복구문 End --> --%>
									</div>
							</div>
						</section>
					<div></div>
				</section>
			</section>
		</main>
		<div id="modal-root"></div>
	</div>
	<next-route-announcer>
	<p aria-live="assertive" id="__next-route-announcer__" role="alert"
		style="border: 0px; clip: rect(0px, 0px, 0px, 0px); height: 1px; margin: -1px; overflow: hidden; padding: 0px; position: absolute; width: 1px; white-space: nowrap; overflow-wrap: normal;">TVING</p>
	</next-route-announcer>
</body>
</html>

</body>
</html>