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
<link rel="stylesheet" href="${contextPath}/resources/bootstrap/css/scss/bootstrap_InquiryList.min.css"	type="text/css">
<link rel="stylesheet" href="${contextPath}/resources/bootstrap/css/scss/style_InquiryList.css"	type="text/css">
<link rel="stylesheet" href="${contextPath}/resources/bootstrap/css/scss/inquiryList_custom.css" type="text/css">
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
			<!-- Sale & Revenue Start -->
			<div class="container-fluid pt-4 px-4">
				<div class="row g-4">
					<div class="col-sm-6 col-xl-3">
						<div
							class="bg-secondary rounded d-flex align-items-center justify-content-between p-4">
							<i class="fa fa-chart-line fa-3x text-primary"></i>
							<div class="ms-3">
								<p class="mb-2">Today 문의</p>
								<h6 class="mb-0">$1234</h6>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-xl-3">
						<div
							class="bg-secondary rounded d-flex align-items-center justify-content-between p-4">
							<i class="fa fa-chart-bar fa-3x text-primary"></i>
							<div class="ms-3">
								<p class="mb-2">Total 문의</p>
								<h6 class="mb-0">$1234</h6>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-xl-3">
						<div
							class="bg-secondary rounded d-flex align-items-center justify-content-between p-4">
							<i class="fa fa-chart-area fa-3x text-primary"></i>
							<div class="ms-3">
								<p class="mb-2">처리 미완료</p>
								<h6 class="mb-0">$1234</h6>
							</div>
						</div>
					</div>
					<div class="col-sm-6 col-xl-3">
						<div
							class="bg-secondary rounded d-flex align-items-center justify-content-between p-4">
							<i class="fa fa-chart-pie fa-3x text-primary"></i>
							<div class="ms-3">
								<p class="mb-2">처리 완료</p>
								<h6 class="mb-0">$1234</h6>
							</div>
						</div>
					</div>
				</div>
			</div>
			<!-- Sale & Revenue End -->
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
						<h6 class="mb-0">Recent Salse</h6>
						<a href="">Show All</a>
					</div>
					<div class="table-responsive">
						<table
							class="table text-start align-middle table-bordered table-hover mb-0">
							<thead>
								<tr class="text-white">
									<th scope="col"><input class="form-check-input"
										type="checkbox"></th>
									<th scope="col">Date</th>
									<th scope="col">MemberId</th>
									<th scope="col">Question Type</th>
									<th scope="col">Suggestion</th>
									<th scope="col">Email</th>
									<th scope="col">Status</th>
									<th scope="col">Detail</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="supportDTO" items="${inquiryList}">
									<tr>
										<td><input class="form-check-input" type="checkbox"></td>
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
										<td><a class="btn btn-sm btn-primary" href="">Detail</a></td>
									</tr>
								</c:forEach>
							</tbody>
						</table>
					</div>
				</div>
			</div>
			<!-- Recent Sales End -->
		</div>
		<!-- Content End -->
	</div>
</body>
</html>