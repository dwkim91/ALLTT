<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>

<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath}/resources/bootstrap/css/custom/support.css" type="text/css">
<link rel="stylesheet" href="${contextPath}/resources/bootstrap/css/custom/support_custom.css" type="text/css">
<title>Insert title here</title>

</head>
<body>
	<div id="__nuxt">
		<div id="__layout">
			<div id="root" data-v-1ee1432e="">
				<main id="contents" data-v-c162d46e="" data-v-1ee1432e="">
					<form class="question-wrap" data-v-c162d46e="">
						<div class="question-type-area" data-v-c162d46e="">
							<div class="question-type-input-wrap" data-v-c162d46e="">
								<div class="input-radio-wrap" data-v-c162d46e="">
									<input name="question_type" id="question_db_and_bug"
										value="DB_AND_BUG_REPORT" type="radio"
										checked="checked" class="primary-radio" data-v-c162d46e=""><label
										for="question_db_and_bug" data-v-c162d46e="">DB 관련 문의</label>
									<p class="radio-detail" data-v-c162d46e="">수정이 필요하거나 없는 작품에
										대해 알려주세요.</p>
								</div>
								<div class="input-radio-wrap" data-v-c162d46e="">
									<input name="question_type" id="question_how_to_use"
										value="SERVICE" type="radio" class="primary-radio"
										data-v-c162d46e=""><label for="question_how_to_use"
										data-v-c162d46e="">서비스 이용 문의</label>
									<p class="radio-detail" data-v-c162d46e="">서비스 이용 중 문제나,
										개선이 필요한 점을 문의해주세요.</p>
								</div>
								<div class="input-radio-wrap" data-v-c162d46e="">
									<input name="question_type" id="question_signup_and_signin"
										value="SIGNUP_AND_SIGNIN" type="radio" class="primary-radio"
										data-v-c162d46e=""><label
										for="question_signup_and_signin" data-v-c162d46e="">회원정보
										문의</label>
									<p class="radio-detail" data-v-c162d46e="">로그인 또는 회원가입 등에
										대해 궁금한 점을 문의해주세요.</p>
								</div>
								<div class="input-radio-wrap" data-v-c162d46e="">
									<input name="question_type" id="question_etc"
										value="QESTION_ETC" type="radio" class="primary-radio"
										data-v-c162d46e=""><label for="question_etc"
										data-v-c162d46e="">기타 문의</label>
								</div>
							</div>
						</div>
						<hr class="primary-divider" style="width: calc(100% - 40px)"
							data-v-c162d46e="">
					</form>
					<span data-v-c162d46e=""><div class="question-contents-area"
							data-v-c162d46e="">
							<span class="content-title" data-v-c162d46e="">문의/제안 내용</span><span
								data-v-c162d46e=""><textarea id="suggestion-text"
									placeholder="누락된 작품 또는 연결이 안 되었거나 잘못된 작품을 제보해주세요.
해당 작품의 제목을 정확히 입력해주셔야 빠른 처리가 가능합니다.
예시) ‘라라랜드’ ‘넷플릭스’에서도 볼 수 있습니다."
									class="renewal-input contents" data-v-c162d46e=""></textarea></span>
						</div>
						<div class="question-contents-area" data-v-c162d46e="">
							<!--fragment#922e446837#head-->
							<span fragment="922e446837" data-v-02f247b4="" data-v-2eaeffe2=""><span
								class="provider error" data-v-02f247b4=""><label
									for="email" class="label" data-v-02f247b4=""> 답변 받을 이메일
								</label><span class="input-container" data-v-02f247b4="">
										<input id="email" placeholder="이메일 주소 입력" type="email"
										value="" class="renewal-input" data-v-02f247b4=""></span><span
									data-v-02f247b4="" class="error-msg">입력창에 내용을 입력해주세요.</span></span></span>
							<!---->
							<!--fragment#922e446837#tail-->
						</div>
						<div class="question-contents-area" data-v-c162d46e=""
							style="padding-bottom: 60px;">

							<span fragment="922e446837" data-v-02f247b4="" data-v-2eaeffe2=""
								style=""><span data-v-c162d46e=""><div
										class="checkbox-item" data-v-c162d46e=""
										style="padding-top: 30px;">
										<span class="dark-default-check-wrap" data-v-c162d46e=""><input
											type="checkbox" id="reason-email" checked="checked"
											class="filter-checkbox" data-v-c162d46e=""><label
											for="reason-email" class="checker" data-v-c162d46e=""><span
												data-v-c162d46e=""></span></label></span><span class="checkbox-text"
											data-v-c162d46e=""><label for="reason-email"
											data-v-c162d46e="">이메일 정보 제공에 동의합니다.</label></span>
									</div>
									<button class="primary-btn" data-v-c162d46e=""
										disabled="disabled" onclick="sendInquiry()">
										<span class="text" data-v-c162d46e="">보내기</span>
									</button></span></span>
						</div></span>
				</main>

			</div>
		</div>
	</div>
	<script src="${contextPath}/resources/bootstrap/js/support.js"></script>
</body>
</html>