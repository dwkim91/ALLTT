<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<c:set var="contextPath" value="${pageContext.request.contextPath}"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

	<!-- Normal Breadcrumb Begin -->
	<section class="normal-breadcrumb set-bg"
		data-setbg="img/normal-breadcrumb.jpg">
		<div class="container">
			<div class="row">
				<div class="col-lg-12 text-center">
					<div class="normal__breadcrumb__text">
						<h2>Login</h2>
						<p>Welcome to the official Anime blog.</p>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Normal Breadcrumb End -->

	<!-- Login Section Begin -->
	<section class="login spad">
		<div class="container">
			<div class="login__social">
				<div class="row d-flex justify-content-center">
					<div class="col-lg-6">
						<div class="login__social__links">
							<ul>
								<li>
									<a href="${contextPath}/member/naver/login" class="naver" style="font-size: 45px">
  										<img src="${contextPath}/resources/bootstrap/img/icon-id-naver.svg">
  										NAVER
									</a>
								</li>
								<li>
									<a href="${contextPath}/member/kakao/login" class="kakao" style="font-size: 45px">
  										<img src="${contextPath}/resources/bootstrap/img/icon-id-kakao.svg">
  										KAKAO
									</a>
								</li>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</section>
	<!-- Login Section End -->

</body>
</html>