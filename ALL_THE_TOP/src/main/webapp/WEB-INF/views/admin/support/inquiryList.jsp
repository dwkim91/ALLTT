<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&amp;family=Roboto:wght@500;700&amp;display=swap" rel="stylesheet">
<!-- Icon Font Stylesheet -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
<link rel="stylesheet" href="${contextPath}/resources/bootstrap/css/custom/bootstrap_InquiryList.min.css"	type="text/css">
<link rel="stylesheet" href="${contextPath}/resources/bootstrap/css/custom/style_InquiryList.css"	type="text/css">
<link rel="stylesheet" href="${contextPath}/resources/bootstrap/css/custom/inquiryList_custom.css" type="text/css">
</head>
<body>
	<div class="container-fluid position-relative d-flex p-0">
		<div class="content">
			<div class="container" style="padding-top: 5rem;">
				<div class="row g-4">
					<div class="col-sm-12 col-xl-6"></div>
					<div class="col-sm-12 col-xl-6"></div>
				</div>
			</div>
			<div class="container-fluid pt-4 px-4">
				<div class="row g-4">
					<div class="col-sm-6 col-xl-3">
						<a href="/support/inquiryList/all">
							<div class="bg-secondary rounded d-flex align-items-center justify-content-between p-4">
								<i class="fa fa-chart-line fa-3x text-primary"></i>
								<div class="ms-3">
									<p class="mb-2">전체</p>
									<h6 class="mb-0">${totalCnt} 건</h6>
								</div>
							</div>
						</a>
					</div>
					<div class="col-sm-6 col-xl-3">
						<a href="/support/inquiryList/new">
							<div class="bg-secondary rounded d-flex align-items-center justify-content-between p-4">
								<i class="fa fa-chart-bar fa-3x text-primary"></i>
								<div class="ms-3">
									<p class="mb-2">신규</p>
									<h6 class="mb-0">${newCnt} 건</h6>
								</div>
							</div>
						</a>
					</div>
					<div class="col-sm-6 col-xl-3">
						<a href="/support/inquiryList/in progress">
							<div class="bg-secondary rounded d-flex align-items-center justify-content-between p-4">
								<i class="fa fa-chart-area fa-3x text-primary"></i>
								<div class="ms-3">
									<p class="mb-2">진행</p>
									<h6 class="mb-0">${inProgressCnt} 건</h6>
								</div>
							</div>
						</a>	
					</div>
					<div class="col-sm-6 col-xl-3">
						<a href="/support/inquiryList/done">
							<div class="bg-secondary rounded d-flex align-items-center justify-content-between p-4">
								<i class="fa fa-chart-pie fa-3x text-primary"></i>
								<div class="ms-3">
									<p class="mb-2">완료</p>
									<h6 class="mb-0">${doneCnt} 건</h6>
								</div>
							</div>
						</a>	
					</div>
				</div>
			</div>
			<div class="container-fluid pt-4 px-4">
				<div class="row g-4">
					<div class="col-sm-12 col-xl-6"></div>
					<div class="col-sm-12 col-xl-6"></div>
				</div>
			</div>
			<div class="container-fluid pt-4 px-4">
				<div class="bg-secondary text-center rounded p-4">
					<div class="d-flex align-items-center justify-content-between mb-4">
						<a href="/support/inquiryList/all">
							<div>
								<h6 class="mb-0">고객 문의 리스트</h6>
							</div>
						</a>
						<a href="/support/inquiryList/platformCost">
							<div>
								<h6>플랫폼별 가격조사</h6>
							</div>
						</a>
						<a href="/support/inquiryList/damagedImage">
							<div>
								<h6 class="mb-0">손상된 이미지 리스트</h6>
								<p class="mb-0">${damagedImageCnt} 건</p>
							</div>
						</a>
					</div>
					<div class="table-responsive">
						<table class="table text-start align-middle table-bordered table-hover mb-0">
							<c:choose>
								<c:when test="${'platformCost' == status}">
									<thead>
										<tr class="text-white">
											<th scope="col" class="center-text"> / </th>
											<th scope="col" class="center-text">Basic (HD)</th>
											<th scope="col" class="center-text" >Standard (FHD)</th>
											<th scope="col" class="center-text">Premium (4K)</th>
											<th scope="col" class="center-text">Modify</th>
										</tr>
									</thead>
									<tbody>
										<tr>
											<td scope="col" class="center-text">
												<a href="https://www.netflix.com/signup/planform" target="_blank">Netflix</a>
											</td>
											<td scope="col" class="center-text"><input type="text" name="platformCost" value="${netflixCost.platformCostBasic}"></td>
											<td scope="col" class="center-text"><input type="text" name="platformCost" value="${netflixCost.platformCostStandard}"></td>
											<td scope="col" class="center-text"><input type="text" name="platformCost" value="${netflixCost.platformCostPremium}"></td>
											<td rowspan="3" style="vertical-align: middle;">
												<a class="btn btn-sm btn-primary" onclick="platformCostModify()" style="width: -webkit-fill-available;">Modify</a>
											</td>
										</tr>
										<tr>
											<td scope="col" class="center-text">
												<a href="https://www.tving.com/membership/tving" target="_blank">Tving</a>
											</td>
											<td scope="col" class="center-text"><input type="text" name="platformCost" value="${tvingCost.platformCostBasic}"></td>
											<td scope="col" class="center-text"><input type="text" name="platformCost" value="${tvingCost.platformCostStandard}"></td>
											<td scope="col" class="center-text"><input type="text" name="platformCost" value="${tvingCost.platformCostPremium}"></td>
										</tr>
										<tr>
											<td scope="col" class="center-text">
												<a href="https://www.wavve.com/voucher/index.html" target="_blank">Wavve</a>
											</td>
											<td scope="col" class="center-text"><input type="text" name="platformCost" value="${wavveCost.platformCostBasic}"></td>
											<td scope="col" class="center-text"><input type="text" name="platformCost" value="${wavveCost.platformCostStandard}"></td>
											<td scope="col" class="center-text"><input type="text" name="platformCost" value="${wavveCost.platformCostPremium}"></td>
										</tr>
									</tbody>
								</c:when>
								<c:when test="${'damagedImage' == status}">
									<thead>
										<tr class="text-white">
											<th scope="col" class="center-text" style="width: 30%;">ContentId</th>
											<th scope="col" class="center-text" style="width: 30%;">ViewImage</th>
											<th scope="col" class="center-text" style="width: 30%;">Upload</th>
										</tr>
									</thead>
									<tbody>
									<c:forEach var="filteredDTO" items="${damagedImageList}">
										<tr>
											<td class="center-text">${filteredDTO.contentId}</td>
											<td class="url-text"><a href="${filteredDTO.imgUrl}" target="_blank" >Image View Button</a></td>
											<td class="center-text">
												<a class="btn btn-sm btn-primary" onclick="openFileInput('${filteredDTO.contentId}')">Upload</a>
												<input type="file" class="fileInput" id="${filteredDTO.contentId}" accept=".jpg, .jpeg, .png, .webp" style="display: none;">
											</td>
										</tr>
									</c:forEach>
								</c:when>
								<c:otherwise>
									<thead>
										<tr class="text-white">
											<th scope="col" class="center-text">Date</th>
											<th scope="col" class="center-text">MemberId</th>
											<th scope="col" class="center-text">Question Type</th>
											<th scope="col" class="center-text">Suggestion</th>
											<th scope="col" class="center-text">Email</th>
											<th scope="col" class="center-text">Status</th>
											<th scope="col" class="center-text">Detail</th>
										</tr>
									</thead>
									<tbody>
										<c:forEach var="supportDTO" items="${inquiryList}">
											<tr>
												<td><fmt:formatDate value="${supportDTO.enrollDt}" pattern="yyyy-MM-dd HH:mm:ss"/></td>
												<td>${supportDTO.memberId}</td>
												<td>${supportDTO.questionType}</td>
												<c:set var="maxLength" value="20" />
										    	<script>
										        	var suggestion = "${supportDTO.suggestion}";
										        	var maxLength = ${maxLength};
										        	if (suggestion.length > maxLength) {
											            suggestion = suggestion.substring(0, maxLength) + "...";
										        	}
										        	var tdElement = document.createElement("td");
										        	tdElement.textContent = suggestion;
											        document.currentScript.parentElement.appendChild(tdElement);
										    	</script>
												<td>${supportDTO.email}</td>
												<td>${supportDTO.supportStatus}</td>
												<td class="center-text"><a class="btn btn-sm btn-primary" href="${contextPath }/support/inquiryDetail?supportId=${supportDTO.supportId}">Detail</a></td>
											</tr>
										</c:forEach>
								</c:otherwise>
							</c:choose>
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="${contextPath}/resources/bootstrap/js/inquiryList.js"></script>
</body>
</html>