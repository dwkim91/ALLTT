<%@ page language="java" contentType="text/html; charset=UTF-8"	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<script>
	var contentId = "${content.contentId}";
</script>
<meta charset="utf-8">
<link href="https://fonts.googleapis.com/css2?family=Open+Sans:wght@400;600&amp;family=Roboto:wght@500;700&amp;display=swap" rel="stylesheet">
<!-- Icon Font Stylesheet -->
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.10.0/css/all.min.css" rel="stylesheet">
<link rel="stylesheet" href="${contextPath}/resources/bootstrap/css/inquiry-bootstrap.min.css"	type="text/css">
<link rel="stylesheet" href="${contextPath}/resources/bootstrap/css/inquiry-custom.css" type="text/css">
<link rel="stylesheet" href="${contextPath}/resources/bootstrap/css/inquiryList-custom.css"	type="text/css">
<link rel="stylesheet" href="${contextPath}/resources/bootstrap/css/support-bootstrap.css" type="text/css">
</head>
<body>
	<div class="container-fluid position-relative d-flex p-0">
		<!-- Content Start -->
		<div class="content">
			<div class="container" style="padding-top: 5rem;">
				<div class="row g-4">
					<div class="col-sm-12 col-xl-6"></div>
					<div class="col-sm-12 col-xl-6"></div>
				</div>
			</div>
			<!-- Sales Chart Start -->
			<div class="container-fluid pt-4 px-4">
				<div class="row g-4">
					<div class="col-sm-12 col-xl-6"></div>
					<div class="col-sm-12 col-xl-6"></div>
				</div>
			</div>
			<!-- Sales Chart End -->
			<!-- Recent Sales Start -->
			<div class="container-fluid pt-4 px-4">
				<div class="bg-secondary text-center rounded p-4">
					<div class="d-flex align-items-center justify-content-between mb-4">
						<a href="/support/contentManagement">
							<div>
								<h6 class="mb-0">컨텐츠 관리</h6>
							</div>
						</a>
						<a class="btn btn-sm btn-primary" style="color: white;">저장</a>
					</div>
					<div class="table-responsive">
						<table
							class="table text-start align-middle table-bordered table-hover mb-0">
							<thead>
								<tr class="text-white">
									<th scope="col">CONTENT_ID</th>
									<th scope="col">${content.contentId}</th>
								</tr>
								<tr class="text-white">
									<td>TITLE</td>
									<td><input type="text" name="title" value="${content.title}" style="width: 100%; text-align: left;"></td>
								</tr>
								<tr class="text-white">
									<td>CREATOR</td>
									<td><input type="text" name="creator" value="${content.creator}" style="width: 100%; text-align: left;"></td>
								</tr>
								<tr class="text-white">
									<td>ACTORS</td>
									<td><input type="text" name="actors" value="${content.actors}" style="width: 100%; text-align: left;"></td>
								</tr>
								<tr class="text-white">
									<td>SUMMARY</td>
									<td><textarea rows="10" name="summary" style="width: 100%;">${content.summary}</textarea></td>
								</tr>
								<tr class="text-white">
									<td>ENROLL_DT</td>
									<td><input type="text" name="enrollDt" value="${content.enrollDt}" style="width: 100%; text-align: left;"></td>
								</tr>
								<tr class="text-white">
									<td>CONTENT_TYPE</td>
									<td>${content.contentType}</td>
								</tr>
							</thead>
						</table>
					</div>
				</div>
			</div>
			<!-- Recent Sales End -->
		</div>
		<!-- Content End -->
	</div>
	<script src="${contextPath}/resources/bootstrap/js/contentDetail.js"></script>
</body>
</html>