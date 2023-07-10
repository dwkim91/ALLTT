<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<script>
	//구독정보
	var netflixId = ${subscription.netflixId};
	var tvingId = ${subscription.tvingId};
	var wavveId = ${subscription.wavveId};
	//시리즈 - 필터
	var s_netflixId = ${seriesFilter.netflixId};
	var s_tvingId = ${seriesFilter.tvingId};
	var s_wavveId = ${seriesFilter.wavveId};
	var s_genreId = '${seriesFilter.genreId}';
	var s_wishIncludeYn = '${seriesFilter.wishIncludeYn}';
	var s_sortType = '${seriesFilter.sortType}';
	//영화 - 필터
	var m_netflixId = ${movieFilter.netflixId};
	var m_tvingId = ${movieFilter.tvingId};
	var m_wavveId = ${movieFilter.wavveId};
	var m_genreId = '${movieFilter.genreId}';
	var m_wishIncludeYn = '${movieFilter.wishIncludeYn}';
	var m_sortType = '${movieFilter.sortType}';
	
</script>
<meta charset="UTF-8">
<link rel="stylesheet" href="${contextPath}/resources/bootstrap/css/scss/mypage.css" type="text/css">
<link rel="stylesheet" href="${contextPath}/resources/bootstrap/css/scss/mypage_custom.css" type="text/css">
<title>Insert title here</title>
</head>
<body>
	<div id="__nuxt">
		<div id="__layout">
			<div id="root" data-v-00101c0c="">
				<main data-v-014a8b00="" data-v-00101c0c="" id="contents">
					<section data-v-014a8b00="" class="profile-outer-wrap">
						<div data-v-014a8b00="" class="profile-inner-wrap"></div>
					</section>
					<section data-v-014a8b00="" class="profile-outer-wrap">
						<div data-v-014a8b00="" class="profile-inner-wrap" style="">
							<div data-v-014a8b00="" class="profile-info-container">
								<div data-v-014a8b00="" class="user-wrap">
									<div data-v-014a8b00="" class="avatar-wrap">
										<div data-v-c30698f4="" data-v-014a8b00=""
											class="user-profile-wrap">
											<div data-v-c30698f4="" class="circle-profile-wrap">
												<div data-v-c30698f4="" class="default-circle">
													<img class="thumbnailImg" src="${member.thumbnailImg}">
												</div>
											</div>
										</div>
									</div>
									<div data-v-014a8b00="" class="info-wrap"
										style="padding-left: 20px;">
										<span data-v-014a8b00="" class="user-name"><input
											type="text" class="nickName bold-text"
											placeholder="${member.nickName}" maxlength="30" required
											style=""></span>
									</div>
								</div>
								<div data-v-014a8b00="" class="actions-wrap">
									<div data-v-014a8b00="" class="actions__settings"></div>
									<button class="nickname-button" onclick="getNewNickName()"
										data-v-014a8b00="" style="">자동생성</button>
									<button class="nickname-button" onclick="saveNickname()"
										data-v-014a8b00="" style="">저장</button>
								</div>
							</div>
						</div>
					</section>
					<section data-v-014a8b00="" class="profile-contents-wrap"
						style="background: #101322;">
						<div data-v-014a8b00="" class="profile-contents-container">
							<a data-v-014a8b00="" href="/wish" class="content-wrap"
								id="interestLabel" title=""><span data-v-014a8b00=""
								class="content-count">${wishCnt}</span><span data-v-014a8b00=""
								class="content-label">찜 컨텐츠</span></a><a data-v-014a8b00=""
								href="/community/my?tab=post" class="content-wrap"
								id="watchingLabel" title=""><span data-v-014a8b00=""
								class="content-count">${postCnt}</span><span data-v-014a8b00=""
								class="content-label">작성한 글</span></a><a data-v-014a8b00=""
								href="/community/my?tab=comment" class="content-wrap"
								id="watchedLabel" title=""><span data-v-014a8b00=""
								class="content-count">${replyCnt}</span><span data-v-014a8b00=""
								class="content-label">작성한 댓글</span></a>
						</div>
						<div data-v-014a8b00="" class="profile-links-container">
							<div data-v-014a8b00="" class="link-wrap" id="user-subscription"
								title="">
								<div data-v-014a8b00="" class="link-label-wrap">
									<span data-v-014a8b00="" class="link-label">구독 서비스</span>
								</div>
								<div data-v-014a8b00="" class="link-label-wrap">
									<label class="checkbox-label"> <input type="checkbox"
										id="netflixCheckbox" value="1" checked > <span
										class="checkbox-custom resize-checkbox"
										style="background-image: url('/resources/bootstrap/img/n100.jpeg');"></span>
									</label>
								</div>
								<div data-v-014a8b00="" class="link-label-wrap">
									<label class="checkbox-label"> <input type="checkbox"
										id="tvingCheckbox" value="2" checked > <span
										class="checkbox-custom resize-checkbox"
										style="background-image: url('/resources/bootstrap/img/t100.jpeg');"></span>
									</label>
								</div>
								<div data-v-014a8b00="" class="link-label-wrap">
									<label class="checkbox-label"> <input type="checkbox"
										id="wavveCheckbox" value="3" checked > <span
										class="checkbox-custom resize-checkbox"
										style="background-image: url('/resources/bootstrap/img/w100.jpeg');"></span>
									</label>
								</div>
								<div data-v-014a8b00="" class="link-action-wrap">
									<span data-v-014a8b00="" class="link-count"
										onclick="setSubscription()" style="cursor: pointer;">변경</span>
									<svg data-v-014a8b00="" xmlns="http://www.w3.org/2000/svg">
										<path d="M5.293 3.05a1 1 0 000 1.415L8.828 8l-3.535 3.536a1 1 0 101.414 1.414l4.23-4.23a1 1 0 00.013-1.427L6.707 3.051a1 1 0 00-1.414 0z"></path>
									</svg>
								</div>
							</div>
							<div data-v-014a8b00="" class="link-wrap" id="userReviewLabel"
								title="">
								<div data-v-014a8b00="" class="link-label-wrap">
									<span data-v-014a8b00="" class="link-label">넷플릭스 찜 컨텐츠</span>
								</div>
								<div data-v-014a8b00="" class="link-action-wrap">
									<span data-v-014a8b00="" class="link-count">${netflixWishCnt}</span>
									<svg data-v-014a8b00="" xmlns="http://www.w3.org/2000/svg">
										<path d="M5.293 3.05a1 1 0 000 1.415L8.828 8l-3.535 3.536a1 1 0 101.414 1.414l4.23-4.23a1 1 0 00.013-1.427L6.707 3.051a1 1 0 00-1.414 0z"></path>
									</svg>
								</div>
							</div>
							<div data-v-014a8b00="" class="link-wrap" id="userReviewLabel"
								title="">
								<div data-v-014a8b00="" class="link-label-wrap">
									<span data-v-014a8b00="" class="link-label">티빙 찜 컨텐츠</span>
								</div>
								<div data-v-014a8b00="" class="link-action-wrap">
									<span data-v-014a8b00="" class="link-count">${tvingWishCnt}</span>
									<svg data-v-014a8b00="" xmlns="http://www.w3.org/2000/svg">
										<path d="M5.293 3.05a1 1 0 000 1.415L8.828 8l-3.535 3.536a1 1 0 101.414 1.414l4.23-4.23a1 1 0 00.013-1.427L6.707 3.051a1 1 0 00-1.414 0z"></path>
									</svg>
								</div>
							</div>
							<div data-v-014a8b00="" class="link-wrap" id="userReviewLabel"
								title="">
								<div data-v-014a8b00="" class="link-label-wrap">
									<span data-v-014a8b00="" class="link-label">웨이브 찜 컨텐츠</span>
								</div>
								<div data-v-014a8b00="" class="link-action-wrap">
									<span data-v-014a8b00="" class="link-count">${wavveWishCnt}</span>
									<svg data-v-014a8b00="" xmlns="http://www.w3.org/2000/svg">
										<path d="M5.293 3.05a1 1 0 000 1.415L8.828 8l-3.535 3.536a1 1 0 101.414 1.414l4.23-4.23a1 1 0 00.013-1.427L6.707 3.051a1 1 0 00-1.414 0z"></path>
									</svg>
								</div>
							</div>
						</div>
						<div data-v-014a8b00="" class="profile-links-container">
							<div data-v-014a8b00="" class="link-wrap" id="series-filter"
								title="">
								<div data-v-014a8b00="" class="link-label-wrap">
									<span data-v-014a8b00="" class="link-label" 
									style="width: 112px;">시리즈 필터 설정</span>
								</div>
								<div data-v-014a8b00="" class="link-label-wrap">
									<label class="checkbox-label"> <input type="checkbox"
										checked name="series" id="netflixCheckbox" value="1"> <span
										class="checkbox-custom resize-checkbox s-checkbox"
										style="background-image: url('/resources/bootstrap/img/n100.jpeg');"></span>
									</label>
								</div>
								<div data-v-014a8b00="" class="link-label-wrap">
									<label class="checkbox-label"> <input type="checkbox"
										checked name="series" id="tvingCheckbox" value="2"> <span
										class="checkbox-custom resize-checkbox s-checkbox"
										style="background-image: url('/resources/bootstrap/img/t100.jpeg');"></span>
									</label>
								</div>
								<div data-v-014a8b00="" class="link-label-wrap">
									<label class="checkbox-label"> <input type="checkbox"
										checked name="series" id="wavveCheckbox" value="3"> <span
										class="checkbox-custom resize-checkbox s-checkbox"
										style="background-image: url('/resources/bootstrap/img/w100.jpeg');"></span>
									</label>
								</div>
								<div data-v-014a8b00="" class="link-label-wrap"></div>
								<div data-v-014a8b00="" class="link-label-wrap"></div>
							</div>
							<div data-v-014a8b00="" class="link-wrap" id="userReviewLabel"
								title="">

								<div data-v-014a8b00="" class="link-label-wrap"></div>
								<div data-v-014a8b00="" class="link-label-wrap"></div>
								<div data-v-014a8b00="" class="link-label-wrap"
									style="height: 30px;">
									<div class="series-g-select">
										<select id="s-genreId" style="display: none;">
											<option value="0">전체</option>
										<c:forEach var="s_genreDTO" items="${seriesList}">
											<option value="${s_genreDTO.genreId}">${s_genreDTO.genreNm}</option>
										</c:forEach>
										</select>
									</div>
									<div class="series-w-select">
										<select id="s-wishIncludeYn" style="display: none;">
											<option value="Y">찜 포함</option>
											<option value="N">찜 제외</option>
										</select>
									</div>
									<div class="series-s-select">
										<select id="s-sortType" style="display: none;">
											<option value="latest">최신순</option>
											<option value="title">이름순</option>
										</select>
									</div>
									<input type="hidden" value="movie" id="contentType">
								</div>
								<div data-v-014a8b00="" class="link-action-wrap">
									<span data-v-014a8b00="" class="link-count"
										onclick="setSearchFilter('series')" style="cursor: pointer;">변경</span>
									<svg data-v-014a8b00="" xmlns="http://www.w3.org/2000/svg">
										<path d="M5.293 3.05a1 1 0 000 1.415L8.828 8l-3.535 3.536a1 1 0 101.414 1.414l4.23-4.23a1 1 0 00.013-1.427L6.707 3.051a1 1 0 00-1.414 0z"></path>
									</svg>
								</div>
							</div>
							<div data-v-014a8b00="" class="link-wrap" id="movie-filter"
								title="">
								<div data-v-014a8b00="" class="link-label-wrap">
									<span data-v-014a8b00="" class="link-label" 
									style="width: 112px;">영화 필터 설정</span>
								</div>
								<div data-v-014a8b00="" class="link-label-wrap">
									<label class="checkbox-label"> <input type="checkbox"
										checked name="movie" id="netflixCheckbox" value="1"> <span
										class="checkbox-custom resize-checkbox"  
										style="background-image: url('/resources/bootstrap/img/n100.jpeg');"></span>
									</label>
								</div>
								<div data-v-014a8b00="" class="link-label-wrap">
									<label class="checkbox-label"> <input type="checkbox"
										checked name="movie" id="tvingCheckbox" value="2"> <span
										class="checkbox-custom resize-checkbox"
										style="background-image: url('/resources/bootstrap/img/t100.jpeg');"></span>
									</label>
								</div>
								<div data-v-014a8b00="" class="link-label-wrap">
									<label class="checkbox-label"> <input type="checkbox"
										checked name="movie" id="wavveCheckbox" value="3"> <span
										class="checkbox-custom resize-checkbox"
										style="background-image: url('/resources/bootstrap/img/w100.jpeg');"></span>
									</label>
								</div>
								<div data-v-014a8b00="" class="link-label-wrap"></div>
								<div data-v-014a8b00="" class="link-label-wrap"></div>
							</div>
							<div data-v-014a8b00="" class="link-wrap" id="userReviewLabel"
								title="">
								<div data-v-014a8b00="" class="link-label-wrap"></div>
								<div data-v-014a8b00="" class="link-label-wrap"></div>
								<div data-v-014a8b00="" class="link-label-wrap"
									style="height: 30px;">
									<div class="movie-g-select">
										<select id="m-genreId" style="display: none;">
											<option value="0">전체</option>
										<c:forEach var="m_genreDTO" items="${movieList}">
											<option value="${m_genreDTO.genreId}">${m_genreDTO.genreNm}</option>
										</c:forEach>
										</select>
									</div>
									<div class="movie-w-select">
										<select id="m-wishInclude" style="display: none;">
											<option value="Y">찜 포함</option>
											<option value="N">찜 제외</option>
										</select>
									</div>
									<div class="movie-s-select">
										<select id="m-sortType" style="display: none;">
											<option value="latest">최신순</option>
											<option value="title">이름순</option>
										</select>
									</div>
									<input type="hidden" value="movie" id="contentType">
								</div>
								<div data-v-014a8b00="" class="link-action-wrap">
									<span data-v-014a8b00="" class="link-count"
										onclick="setSearchFilter('movie')" style="cursor: pointer;">변경</span>
									<svg data-v-014a8b00="" xmlns="http://www.w3.org/2000/svg">
										<path d="M5.293 3.05a1 1 0 000 1.415L8.828 8l-3.535 3.536a1 1 0 101.414 1.414l4.23-4.23a1 1 0 00.013-1.427L6.707 3.051a1 1 0 00-1.414 0z"></path>
									</svg>
								</div>
							</div>
						</div>
						<div data-v-014a8b00="" class="contents-container">
							<div data-v-014a8b00="" class="empty-contents-wrap">
								<a data-v-014a8b00="" href="javascript:withdrawMember('${member.socialNm}')"
									class="" id="userBestContentsBtn" title="탈퇴하기"><button
										data-v-014a8b00="" class="empty-contents-button"
										style="background: #e53637;">
										<span data-v-014a8b00="" class="empty-contents-button-text">탈퇴하기</span>
									</button></a>
							</div>
						</div>
					</section>
				</main>
			</div>
		</div>
		<div data-v-014a8b00="" class="contents-container"></div>
	</div>
<script src="${contextPath}/resources/bootstrap/js/mypage.js"></script>

</body>
</html>