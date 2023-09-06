<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<c:set var="contextPath" value="${pageContext.request.contextPath}" />
<!DOCTYPE html>
<head>
	<script src="${contextPath}/resources/bootstrap/js/wishContentList.js" type="module"></script>
	<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
	<style>
		.hidden {display:none;}
	</style>
</head>

<main class="is-desktop css-p5l6tq eeennqe0">
	<section class="contents_wrap">
		<div>
			<section class="myprofile__contents myprofile css-yfyhdz e2z45lx0">
<div style="display: flex;flex-wrap: nowrap;width: 100%;max-width: 100%; margin: 1rem;">  
  <select id="타입">
    <option value="all">전체</option>
    <option value="series" selected>시리즈</option>
    <option value="movie">영화</option>
  </select>
  
  <select id="우선순위">
    <option value="true">최소플랫폼</option>
    <option value="false">구독서비스</option>
    <option value="">최저요금</option>
  </select>
</div>
<div style="display: flex; flex-wrap: nowrap; justify-content: space-between; width: 100%; max-width: 100%; overflow: hidden;">

  <!-- 도넛 차트 1 -->
  <div style="position: relative;flex: 1;min-width: 0;margin: 1rem;">
    <canvas id="myChart1" style="display: block; box-sizing: border-box; width: 100%;"></canvas>
    <div id="centerText1" style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); font-size: 18px; font-weight: bold;">
      넷플릭스
    </div>
  </div>

  <!-- 도넛 차트 2 -->
  <div style="position: relative;flex: 1;min-width: 0;margin: 1rem;">
    <canvas id="myChart2" style="display: block; box-sizing: border-box; width: 100%;"></canvas>
    <div id="centerText2" style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); font-size: 18px; font-weight: bold;">
      티빙
    </div>
  </div>

  <!-- 도넛 차트 3 -->
  <div style="position: relative;flex: 1;min-width: 0;margin: 1rem;">
    <canvas id="myChart3" style="display: block; box-sizing: border-box; width: 100%;"></canvas>
    <div id="centerText3" style="position: absolute; top: 50%; left: 50%; transform: translate(-50%, -50%); font-size: 18px; font-weight: bold;">
      웨이브
    </div>
  </div>

</div>
<div>
	<h6 style="color: navajowhite; ">※ 중복된 컨텐츠는 마이페이지 > 구독 서비스를 기준으로 통합됩니다.</h6>
</div>

<script>
  var dataValueList1 = ${wishPlatform}; // 넷플릭스 데이터 변수
  var dataValueList2 = [20,10,30];   // 티빙 데이터 변수
  var dataValueList3 = [30,10,20];    // 웨이브 데이터 변수

  // 도넛 차트 1 데이터
  var data1 = {
    labels: ['넷플릭스', '티빙', '웨이브'],
    datasets: [{
      data: dataValueList1,
      backgroundColor: ['#FF0000', '#FF48C7', '#0100FF'],
      borderColor: '#ffffff',
      borderWidth: 1
    }]
  };

  // 도넛 차트 2 데이터
  var data2 = {
    labels: ['티빙','웨이브', '넷플릭스'],
    datasets: [{
      data: dataValueList2,
      backgroundColor: ['#FF48C7', '#0100FF', '#FF0000'],
      borderColor: '#ffffff',
      borderWidth: 1
    }]
  };

  // 도넛 차트 3 데이터
  var data3 = {
    labels: ['웨이브', '넷플릭스', '티빙'],
    datasets: [{
      data: dataValueList3,
      backgroundColor: ['#0100FF' ,'#FF0000', '#FF48C7'],
      borderColor: '#ffffff',
      borderWidth: 1
    }]
  };

  // 차트 생성
  const ctx1 = document.getElementById('myChart1').getContext('2d');
  const chartInstance1 = new Chart(ctx1, {
    type: 'doughnut',
    data: data1,
    options: {
      responsive: true,
      maintainAspectRatio: false,
      plugins: {
        legend: {
          display: false
        }
      }
    }
  });

  const ctx2 = document.getElementById('myChart2').getContext('2d');
  const chartInstance2 = new Chart(ctx2, {
    type: 'doughnut',
    data: data2,
    options: {
      responsive: true,
      maintainAspectRatio: false,
      plugins: {
        legend: {
          display: false
        }
      }
    }
  });

  const ctx3 = document.getElementById('myChart3').getContext('2d');
  const chartInstance3 = new Chart(ctx3, {
    type: 'doughnut',
    data: data3,
    options: {
      responsive: true,
      maintainAspectRatio: false,
      plugins: {
        legend: {
          display: false
        }
      }
    }
  });

</script>
				<div>
					<c:forEach var="wishqwer" items="${wishPlatform}">
					</c:forEach>
				<div class="css-1fee8qh e2sfx0b0"></div>
				<div class="page_select btn_type layout__flex-left">
					<div class="layout__flex-left">
						<button type="button" id="seriesBtn" class="page_select_layout btn_popular click_on">TV프로그램</button>
						<button type="button" id="movieBtn"  class="page_select_layout btn_popular btn_new ">영화</button>
						<input type="hidden" value="series" id="contentType">
					</div>
					<div class="page_select_right">
						  <button class="css-110e4jt">편집</button>
						  <div class="css-k8kcxi e7z8nrj1">
						    <button type="button" class="page_select_layout page_select__hover icon-check hidden">전체선택</button>
						    <button type="button" class="page_select_layout page_select__hover hidden" id="itemCnt">삭제 (0)</button>
						    <button class="css-vmfm9q hidden">완료</button>
						  </div>
					</div>
				</div>
				<section style="grid-column: 1/span 12;">
					
					<section class="lists lists__noneLazy">
						<div class="lists__columns lists__columns-vertical css-0 enth0yz0" id="wishContainer">
						<c:forEach var="wishContent" items="${wishContentList}">
							<div class="item" data-id="${wishContent.contentId}">
								<a class="active css-1djwytu e2ri0zb0" href="/detail?contentId=${wishContent.contentId}">
									<div class="item__thumb item__thumb-25x36">
										<div class="item__tags">
											<div class="item__tags-left"></div>
											<div class="item__tags-right"></div>
										</div>
										<div class="item__image lazy">
											<img class="loaded css-1doy9ip euf32k22" src="${wishContent.imgUrl}" alt="${wishContent.title}">
										</div>
									</div>
									<div class="item__info ">
										<p class="item__title false">${wishContent.title}</p>
									</div>
								</a>
							</div>
							</c:forEach>
						</div>
					</section>
					<div></div>
				</section>
			</section>
		</div>
	</section>
</main>