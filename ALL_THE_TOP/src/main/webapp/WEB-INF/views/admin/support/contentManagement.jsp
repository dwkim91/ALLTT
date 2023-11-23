<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&amp;family=Roboto:wght@500;700&amp;display=swap" rel="stylesheet">
<!-- Icon Font Stylesheet -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
<link rel="stylesheet" href="${contextPath}/resources/bootstrap/css/inquiry-bootstrap.min.css"	type="text/css">
<link rel="stylesheet" href="${contextPath}/resources/bootstrap/css/inquiryList-custom.css"	type="text/css">
<link rel="stylesheet" href="${contextPath}/resources/bootstrap/css/inquiry-custom.css" type="text/css">
<script>
	var contextPath = "${contextPath}";
</script>
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
					<div class="col-sm-12 col-xl-6"></div>
					<div class="col-sm-12 col-xl-6"></div>
				</div>
			</div>
			
			<div class="container-fluid pt-4 px-4">
				<div class="d-flex align-items-center justify-content-between mb-4">
					<a href="/support/contentManagement">
						<div>
							<h6 class="contentCnt">컨텐츠 관리 ( ${fn:length(misContentList)} )</h6>
						</div>
					</a>
					<a href="/support/inquiryList/all">
						<div>
							<h6 class="mb-0">관리자 페이지</h6>
						</div>
					</a>
					<div>
						<input type="text" placeholder="작품명으로 검색해보세요." class="searchInput" value="" style="width: 200px; height: 24px;">
						<a class="btn btn-sm btn-primary" style="color: white;">검색</a>
					</div>
				</div>
			</div>
			<div class="container-fluid pt-4 px-4">
				<div class="bg-secondary text-center rounded p-4">
					<div class="table-responsive">
						<table class="table text-start align-middle table-bordered table-hover mb-0">
							<thead>
								<tr class="text-white">
									<th scope="col" class="center-text">CONTENT_ID</th>
									<th scope="col" class="center-text">TITLE</th>
									<th scope="col" class="center-text">CREATOR</th>
									<th scope="col" class="center-text">ACTORS</th>
									<th scope="col" class="center-text">ENROLL_DT</th>
									<th scope="col" class="center-text">CONTENT_TYPE</th>
									<th scope="col" class="center-text">Modify</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="contentDTO" items="${misContentList}">
									<tr>
										<td>${contentDTO.contentId}</td>
										<td>${contentDTO.title}</td>
										<td>${contentDTO.creator}</td>
										<td>${contentDTO.actors}</td>
										<td>${contentDTO.enrollDt}</td>
										<td>${contentDTO.contentType}</td>
										<td class="center-text"><a class="btn btn-sm btn-primary" href="${contextPath }/support/contentDetail?contentId=${contentDTO.contentId}">Detail</a></td>
									</tr>
								</c:forEach>	
							</tbody>
						</table>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script src="${contextPath}/resources/bootstrap/js/contentManagement.js"></script>
</body>
</html>