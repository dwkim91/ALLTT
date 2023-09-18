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
<link rel="stylesheet" href="${contextPath}/resources/bootstrap/css/scss/support.css" type="text/css">
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
						<h6 class="mb-0">Recent Salse</h6>
						<a class="btn btn-sm btn-primary" href="${contextPath }/support/inquiryDetail?supportId=${supportDTO.supportId}">저장</a>
					</div>
					<div class="table-responsive">
						<table
							class="table text-start align-middle table-bordered table-hover mb-0">
							<thead>
								<tr class="text-white">
									<th scope="col">Date</th>
									<th scope="col"><fmt:formatDate value="${supportDTO.enrollDt}" pattern="yyyy-MM-dd HH:mm:ss"/></th>
									<th scope="col">MemberId</th>
									<th scope="col">${supportDTO.memberId}</th>
								</tr>
								<tr class="text-white">
									<td>Email</td>
									<td>${supportDTO.email}</td>
									<td>Question Type</td>
									<td>${supportDTO.questionType}</td>
								</tr>
								<tr class="text-white">
									<td>Status</td>
									<td colspan="3">
										<div class="input-radio-wrap" data-v-c162d46e="">
											<input name="question_type" id="new" value="new" type="radio" class="primary-radio" data-v-c162d46e="">
											<label for="new" data-v-c162d46e="">new</label>
											&nbsp;&nbsp;&nbsp;&nbsp;
											<input name="question_type" id="inProgress" value="inProgress" type="radio" class="primary-radio" data-v-c162d46e="">
											<label for="inProgress" data-v-c162d46e="">in progress</label>
											&nbsp;&nbsp;&nbsp;&nbsp;
											<input name="question_type" id="done" value="done" type="radio" class="primary-radio" data-v-c162d46e="">
											<label for="done" data-v-c162d46e="">done</label>
										</div>
									</td>
								</tr>
								<tr class="text-white">
									<td>Suggestion</td>
									<td colspan="3">${supportDTO.suggestion}</td>
								</tr>
								<tr class="text-white">
									<td>처리내용</td>
									<td colspan="3"><textarea rows="10" name="content" style="width: 100%;">${supportDTO.suggestion}</textarea></td>
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
</body>
</html>