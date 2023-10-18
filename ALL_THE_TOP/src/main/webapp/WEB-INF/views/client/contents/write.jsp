<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet"
	href="${contextPath}/resources/bootstrap/css/custom/write.css"
	type="text/css">
<link rel="stylesheet"
	href="${contextPath}/resources/bootstrap/css/custom/write_tag.css"
	type="text/css">
</head>
<body>
	<noscript data-n-head="ssr" data-hid="gtm-noscript" data-pbody="true"></noscript>
	<div id="__nuxt">
		<div id="__layout">
			<div id="root" data-v-75f0040c="">
				<main id="contents" data-v-6aac2673="" data-v-75f0040c="">
					<section class="fixed-area" data-v-6aac2673="">
						<header class="header-wrap" data-v-36d2ff30="" data-v-6aac2673="">
							<h1 class="header-title" data-v-36d2ff30="">글쓰기</h1>
							<div class="left-wrap" data-v-36d2ff30="">
								<button class="back-btn" data-v-36d2ff30="">
									<i class="kino-icon kino-icon--header-back" data-v-36d2ff30=""></i>
								</button>
								<!---->
							</div>
							<div class="header-button-wrap" data-v-36d2ff30=""
								data-v-6aac2673="">
								<button id="addPostButton" class="btn disabled"
									data-v-de293a14="" data-v-6aac2673="" data-v-36d2ff30="">저장</button>
							</div>
						</header>
					</section>
					<div class="content-area" data-v-6aac2673="">
						<div data-v-4179835d="" data-v-6aac2673="">
							<div class="post_editor" data-v-4179835d="">
								<div class="editor__header" data-v-0c949614=""
									data-v-4179835d="">
									<div class="textarea_auto_height" data-v-0c949614="">
										<textarea maxlength="100" placeholder="제목을 입력해주세요." rows="1"
											value="" class="textarea_auto_height__textarea"
											data-v-0c949614="" autofocus="autofocus"
											style="height: 21px;"></textarea>
									</div>
								</div>
								<div class="post_editor__main" data-v-4179835d="">
									<div class="placeholder main__placeholder" data-v-376be9e4=""
										data-v-4179835d="">
										<div class="placeholder__title" data-v-376be9e4="">
											<span data-v-376be9e4="">본문에 #를 입력하면 작품 검색 및 등록이 가능해요.
											</span><span data-v-376be9e4="">작품이 등록된 게시글은 따로 모아 확인할 수 있어요.</span>
										</div>
										<ul class="placeholder__description" data-v-376be9e4="">
											<li data-v-376be9e4="">• 작품 비하인드 스토리를 알고 있다면 공유해주세요!</li>
											<li data-v-376be9e4="">• 나만의 감상 꿀 팁이나 정보를 알려주세요!</li>
											<li data-v-376be9e4="">• 작품에 대해 궁금한 점이 있다면 질문을 남겨보세요!</li>
											<li data-v-376be9e4="">• 나만의 결말 뇌피셜을 자유롭게 풀어보세요!</li>
										</ul>
									</div>
									<div contenteditable="true" class="main__writer"
										data-v-4179835d=""></div>
								</div>
								<div class="post_editor__footer" data-v-4179835d="">
									<button class="footer__hash-tag-button" data-v-4179835d="">
										<svg width="24" height="24" fill="none"
											xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"
											data-v-4179835d="" class="">
											<path fill-rule="evenodd" clip-rule="evenodd"
												d="M10.216 5.015a1 1 0 00-1.159.812L8.69 7.909H7a1 1 0 100 2h1.337l-.705 4H6a1 1 0 100 2h1.28l-.307 1.735a1 1 0 001.97.348l.367-2.083h3.969l-.306 1.735a1 1 0 101.97.348l.367-2.083H17a1 1 0 100-2h-1.338l.705-4h1.634a1 1 0 100-2h-1.28l.305-1.735a1 1 0 10-1.97-.347l-.367 2.082h-3.968l.306-1.735a1 1 0 00-.811-1.159zm3.415 8.894l.706-4h-3.969l-.705 4h3.968z"
												fill="#98A4B7" data-v-4179835d=""></path></svg>
										<div data-v-4ddcaa90="" data-v-4179835d=""
											class="tooltip hash-tag-button__tooltip tooltip--left-top">
											<p data-v-4ddcaa90="">
												#태그 달고 <span data-v-4179835d="" data-v-4ddcaa90=""
													class="tooltip__primary">3</span>팝콘!
											</p>
											<i data-v-4ddcaa90=""
												class="kino-icon tooltip__close mask kino-icon--close-normal"></i>
										</div>
									</button>
									<form class="image_upload_btn" data-v-7e351278=""
										data-v-4179835d="">
										<button class="image_upload_btn__btn" data-v-7e351278="">
											<svg width="24" height="24" fill="none"
												xmlns="http://www.w3.org/2000/svg" data-v-7e351278=""
												class="">
												<rect x="4.5" y="4.5" width="15" height="15" rx="2"
													fill="#98A4B7" data-v-7e351278=""></rect>
												<path fill-rule="evenodd" clip-rule="evenodd"
													d="M4.518 18.033A2 2 0 006.446 19.5h11c.58 0 1.1-.246 1.466-.64l-3.77-4.523a.5.5 0 00-.768 0l-2.248 2.698-3.05-4.435a.5.5 0 00-.823 0l-3.735 5.433z"
													fill="#BDC6D5" data-v-7e351278=""></path>
												<circle cx="14.813" cy="10.125" r=".938" fill="#BDC6D5"
													data-v-7e351278=""></circle></svg>
											<span class="btn__title" data-v-7e351278="">0/20</span>
										</button>
										<input hidden="hidden" type="file"
											accept="image/gif, image/jpeg, image/png, image/webp"
											multiple="multiple" class="image_upload_btn__input"
											data-v-7e351278="">
									</form>
								</div>
							</div>
							<div class="movie_list" data-v-4179835d=""></div>
							<!---->
							<div data-v-2e4bbd00="" data-v-4179835d=""
								class="post-tag-modal post-modal">
								<div data-v-2e4bbd00="" class="modal">
									<div data-v-2e4bbd00="" class="modal__header">
										<button data-v-2e4bbd00="" disabled="disabled"
											class="button header__button hidden--xlUp">등록</button>
										<h3 data-v-2e4bbd00="" class="header__title">태그 등록</h3>
										<button data-v-2e4bbd00="" class="header__close">
											<i data-v-2e4bbd00=""
												class="kino-icon close__icon kino-icon--filter-close"></i>
										</button>
									</div>
									<div data-v-2e4bbd00="" class="modal__body">
										<form data-v-2e4bbd00="" class="body__form mx">
											<label data-v-2e4bbd00="" for="input-search"><svg
													data-v-2e4bbd00="" width="16" height="16" fill="none"
													xmlns="http://www.w3.org/2000/svg" viewBox="0 0 16 16"
													class="">
													<path data-v-2e4bbd00=""
														d="M5.432 7.256h1.36l-.336 2.048H5v1.072h1.296l-.544 3.36H6.76l.528-3.36h1.76l-.528 3.36h.992l.528-3.36h1.472V9.304h-1.296l.32-2.048h1.408V6.2h-1.216L11.24 3h-.992l-.512 3.2H7.96L8.472 3H7.48l-.512 3.2H5.432v1.056zm2.352 0h1.76l-.32 2.048H7.448l.336-2.048z"
														fill="#637DEA"></path></svg></label><input data-v-2e4bbd00=""
												id="input-search" placeholder="태그 검색" type="text"
												class="form__input">
											<button data-v-2e4bbd00="" type="button" class="form__clear"
												style="">
												<svg data-v-2e4bbd00="" width="24" height="24" fill="none"
													xmlns="http://www.w3.org/2000/svg" viewBox="0 0 24 24"
													class="clear__icon">
													<path data-v-2e4bbd00="" fill-rule="evenodd"
														clip-rule="evenodd"
														d="M21 12a9 9 0 11-18 0 9 9 0 0118 0zm-5.234-3.766a.797.797 0 00-.618-.232.907.907 0 00-.7.264L12 10.714 9.552 8.266a.907.907 0 00-.7-.264.797.797 0 00-.85.85.907.907 0 00.264.7L10.714 12l-2.448 2.448a.907.907 0 00-.264.7.797.797 0 00.85.85.907.907 0 00.7-.264L12 13.286l2.448 2.448c.192.192.448.28.7.264a.797.797 0 00.85-.85.907.907 0 00-.264-.7L13.286 12l2.448-2.448a.907.907 0 00.264-.7.797.797 0 00-.232-.618z"
														fill="#98A4B7"></path></svg>
											</button>
										</form>
										<div data-v-2e4bbd00="" class="body__container">
											<div data-v-2e4bbd00="" class="container__contents">
												<!---->
												<div data-v-2e4bbd00="" class="contents__recommend-tags">
													<h5 data-v-2e4bbd00="" class="recommend-tag__title">추천
														태그</h5>
													<ul data-v-2e4bbd00="" class="recommend-tag__list">
														<li data-v-8e0b61ec="" data-v-2e4bbd00=""
															class="modal-tag-list-item tag-list-item recommendTag"><div
																data-v-8e0b61ec="" class="modal-tag-list-item__icon">
																<i data-v-2e4bbd00=""
																	class="kino-icon mask kino-icon--filter-chip-star"
																	data-v-8e0b61ec=""></i>
															</div>
															<span data-v-8e0b61ec="" title="영화"
															class="modal-tag-list-item__title"> 영화 </span></li>
														<li data-v-8e0b61ec="" data-v-2e4bbd00=""
															class="modal-tag-list-item tag-list-item recommendTag"><div
																data-v-8e0b61ec="" class="modal-tag-list-item__icon">
																<i data-v-2e4bbd00=""
																	class="kino-icon mask kino-icon--filter-chip-star"
																	data-v-8e0b61ec=""></i>
															</div>
															<span data-v-8e0b61ec="" title="드라마"
															class="modal-tag-list-item__title"> 드라마 </span></li>
														<li data-v-8e0b61ec="" data-v-2e4bbd00=""
															class="modal-tag-list-item tag-list-item recommendTag"><div
																data-v-8e0b61ec="" class="modal-tag-list-item__icon">
																<i data-v-2e4bbd00=""
																	class="kino-icon mask kino-icon--filter-chip-star"
																	data-v-8e0b61ec=""></i>
															</div>
															<span data-v-8e0b61ec="" title="예능"
															class="modal-tag-list-item__title"> 예능 </span></li>
														<li data-v-8e0b61ec="" data-v-2e4bbd00=""
															class="modal-tag-list-item tag-list-item recommendTag"><div
																data-v-8e0b61ec="" class="modal-tag-list-item__icon">
																<i data-v-2e4bbd00=""
																	class="kino-icon mask kino-icon--filter-chip-star"
																	data-v-8e0b61ec=""></i>
															</div>
															<span data-v-8e0b61ec="" title="잡담"
															class="modal-tag-list-item__title"> 잡담 </span></li>
													</ul>
												</div>
												<ul data-v-2e4bbd00="" class="contents__tag-list">
													<!---->
												</ul>
												<!---->
											</div>
											<!---->
										</div>
									</div>
									<div data-v-2e4bbd00="" class="modal__footer hidden--xlDown mx">
										<button data-v-2e4bbd00="" disabled="disabled"
											class="button footer__button">등록</button>
									</div>
								</div>
							</div>
							<!---->
						</div>
					</div>
					<!---->
				</main>
				<!---->
			</div>
		</div>
	</div>
</body>
</html>