<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<!--
	Inverse by Pixelarity
	pixelarity.com | hello@pixelarity.com
	License: pixelarity.com/license
-->
<html>
	<head>
		<title>Untitled</title>
		<meta charset="utf-8" />
		<meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
		<meta name="description" content="" />
		<meta name="keywords" content="" />
		<link rel="stylesheet" href="assets/css/main.css" />
		<link rel="stylesheet" type="text/css" href="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.css"/>
		<script src="assets/js/jquery.min.js"></script>
		<script type="text/javascript" src="https://cdn.jsdelivr.net/npm/slick-carousel@1.8.1/slick/slick.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/chart.js@2.8.0"></script> <!-- chart.js -->
		<style>
			.profile {
			  margin: 0 30px; // space(여백)/2
			}
			.profiles {
			  margin: 0 -30px; // space(여백)/-2
			}
		</style>
	</head>
	<body class="is-preload">

		<!-- Header -->
			<header id="header" class="alt">
				<a class="logo" href="index">PTA&nbsp; <span>by ADS</span></a>
				<nav id="nav">
					<ul>
						<li class="current"><a href="index">Home</a></li>
						<li><a href="<%=request.getContextPath()%>/program/programApplyList">교육과정</a></li>
						<li>
							<a href="#" class="dropdown">마이페이지</a>
							
							<ul>
								<li><a href="<%=request.getContextPath()%>/myPage/myPageMember">회원정보 수정</a></li>
								<c:if test="${memType == 1 || empty sessionId}">
								<li><a href="<%=request.getContextPath()%>/myPage/applyListMember">신청현황</a></li>
								</c:if>
								<c:if test="${memType == 2}">
								<li><a href="<%=request.getContextPath()%>/myPage/applyListTrainer">신청현황(트레이너)</a></li>
								</c:if>
								<c:if test="${memType == 1 || empty sessionId}">
								<li><a href="<%=request.getContextPath()%>/myPage/recordListMember">교육일지</a></li>
								</c:if>
								<c:if test="${memType == 2}">
								<li><a href="<%=request.getContextPath()%>/myPage/recordListTrainer">교육일지(트레이너)</a></li>
								</c:if>
								<li><a href="<%=request.getContextPath()%>/myPage/dogList">반려견 정보</a></li>
							</ul>
							
						</li>
						<li><a href="<%=request.getContextPath()%>/review/reviewList">교육후기</a></li>
						<c:if test="${sessionId eq 'admin123'}">
		                <li>
		                	<a href="#" class="dropdown">관리자</a>
		                	<ul>
		                		<li><a href="/admin/applyListAdmin">교육신청 관리</a></li>
								<li><a href="/admin/memberList">회원목록 관리</a></li>
								<li><a href="/admin/trainerList">트레이너목록 관리</a></li>
								<li><a href="/admin/programList">교육목록 관리</a></li>
								<li><a href="/admin/keywordList">키워드목록 관리</a></li>
							</ul>                
                		</li>
		                </c:if>			
						
						<c:if test="${empty sessionId}">
						<li>
							<a href="login" class="btn_login">로그인</a>
							<!--<a href="/signUp" class="btn_login">회원정보</a>-->
						</li>
						</c:if>
						<c:if test="${not empty sessionId}">
		                <li><a href="<%=request.getContextPath()%>/logout" class="btn_login">로그아웃</a></li>
		                </c:if>
					</ul>
				</nav>
			</header>

		<!-- Banner -->
			<div id="banner">
				<div class="wrapper style1 special">
					<div class="inner">
						<h1 class="heading alt">Pet Training Academy</h1>
						<p>반려견의 행복을 추구하는 PTA 사이트에 오신 것을 환영합니다</p>
						<div class="image fit special">
							<img src="images/pet02.jpg" alt="" />
						</div>
						<ul class="feature-icons">
							<li><a href="program/programApplyList"><span class="icon solid fa-laptop"></span><span class="label">교육과정</span></a></li>
							<c:if test="${memType == 1 || empty sessionId}">
							<li><a href="myPage/recordListMember"><span class="icon solid fa-wifi"></span><span class="label">교육일지</span></a></li>
							</c:if>
							<c:if test="${memType == 2}">
							<li><a href="myPage/recordListTrainer"><span class="icon solid fa-wifi"></span><span class="label">교육일지</span></a></li>
							</c:if>
							<li><a href="review/reviewList"><span class="icon solid fa-cloud"></span><span class="label">교육후기</span></a></li>
						</ul>
					</div>
				</div>
			</div>

		<!-- review and chart -->
			<div id="two">
				<div class="wrapper style2">
					<div class="inner">
						<div class="spotlights">
							<c:forEach var="list2" items="${list2}">
							<div class="intro">
								<header>
									<h2 class="left" style="font-size:30px">${list2.progTitle}</h2>
									<h2 class="left" style="font-size:20px">${list2.revTitle}</h2>
									<p style="width:400px; overflow: hidden; text-overflow: ellipsis; display: -webkit-box; 
										-webkit-line-clamp: 3; -webkit-box-orient: vertical; resize: none; height: 100px;">${list2.revContent}</p>
								</header>
								<ul class="actions">
									<li><a href="review/reviewDetail?revProgId=${list2.revProgId}&revDogId=${list2.revDogId}" class="button">상세보기</a></li>
								</ul>
							</div>
							</c:forEach>
							<div class="spotlight">
								<div class="image fit" style="height:230px; background-color:white;">
									<%-- <div class="box-left w33">
									   <div class="list_type01">
											<table>
												<tr>
													<th>구분</th>
													<th>카운트</th>
													<th>비율</th>
												</tr>
												<tr>
													<td>일반회원</td>
													<td>${memberCount}</td>
													<td><div id="memberRate"></div></td>	
												</tr>
												<tr>
													<td>트레이너</td>
													<td>${trainerCount}</td>
													<td><div id="trainerRate"></div></td>	
												</tr>
											</table>
										</div>
									</div> --%>
									<div>
										<canvas id="typeChart" style="height:230px;"></canvas>
									</div>
								</div>
								<div class="content">회원유형 분석(가입자 수)</div>
							</div>
							<div class="spotlight">
								<div class="image fit" style="height:230px; background-color:white;">
									<div>
										<canvas id="typeChart2" style="height:230px;"></canvas>
									</div>
								</div>
								<div class="content">회원유형 분석(비율)</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		<!-- education program -->
			<div id="three">
				<div class="wrapper alt special">
					<header class="major">
						<h2>실시간 교육 프로그램</h2>
						<p>현재 등록된 실시간 교육 프로그램을 신청해보세요. 반려견의 문제행동은 하루아침에 생긴 것이 아니고 매일 누적되어 생긴 것입니다. 반려견의 마음을 이해하여 함께 행복하게 살 수 있도록 하는 것이<br>
						PTA(Pet Training Academy)의 목표입니다.</p>
					</header>
					<div class="wrapper style3">
					
						<div class="inner">
						
							<div class="profiles">
							<c:forEach var="list" items="${list}">
								<div class="profile">
									<div class="image">
										<img src="images/pet03.jpeg" alt="" style="width:150px; height:150px" />
									</div>
									<div class="content">
										<h3>${list.progTitle}</h3>
										<p style="overflow: hidden; text-overflow: ellipsis; display: -webkit-box; 
										-webkit-line-clamp: 3; -webkit-box-orient: vertical; resize: none; height: 100px;">
										${list.progContent}</p>
										<ul class="actions">
											<li><a href="program/programApplyDetail?progId=${list.progId}&memId=${sessionId}" class="button small">신청</a></li>
										</ul>
									</div>
								</div>
							</c:forEach>
							</div><!--//profiles-->
						
						</div><!--//inner-->
						
					</div><!--//wrapper style3-->
				</div>
			</div>
			<!-- ranking top3-->
			<div id="footer">
				<div class="wrapper style2">
					<div class="inner">
						<header class="major">
							<h2>인기 교육 프로그램 및 리뷰</h2>
							<p>상위 TOP3 인기 교육 프로그램과 인기 트레이너 강사를 실시간으로 확인할 수 있습니다.<br>또한 교육 프로그램에 대한 인기 리뷰를 통해 교육 정보를 간접적으로 체험할 수 있습니다.</p>
						</header>
						<div class="content">
							<div class="form">
								<!-- <form method="post" action="#">
									<div class="fields">
										<div class="field half">
											<input name="name" id="name" placeholder="Name" type="text" />
										</div>
										<div class="field half">
											<input name="email" id="email" placeholder="Email" type="email" />
										</div>
										<div class="field">
											<textarea name="message" id="message" rows="6" placeholder="Message"></textarea>
										</div>
									</div>
									<ul class="actions special">
										<li><input type="button" class="button" value="Send Message" /></li>
									</ul>
								</form> -->
								<div class="table-wrapper">
									<table>
									<p style="text-align:center;color:black;font-size:24px"><b>인기 교육과정 랭킹 순위 </b><br>
										<thead>
											<tr>
												<th style="text-align:center;">랭킹</th>
												<th style="text-align:center;">교육과정명</th>
												<th style="text-align:center;">트레이너ID</th>												
											</tr>
										</thead>
										<tbody>
											<c:forEach var="list3" items="${list3}">
											<tr>
												<td style="text-align:center;color:black">${list3.rn}</td>
												<td style="text-align:center;color:black">${list3.progTitle}</td>
												<td style="text-align:center;color:black">${list3.progTrmemId}</td>														
											</tr>
											</c:forEach>
										</tbody>
									</table>
								</div> <!-- end of Table -->
							</div>
							<ul class="icons">
							<c:forEach var="list3" items="${list3}">
								<li>
									<span class="icon solid fa-home"></span>
									<div>
										<strong>${list3.revTitle}</strong>
										<a href="review/reviewDetail?revProgId=${list3.revProgId}&revDogId=${list3.revDogId}" style="overflow: hidden; text-overflow: ellipsis; display: -webkit-box; 
										-webkit-line-clamp: 3; -webkit-box-orient: vertical; resize: none; height: 100px;">${list3.revContent}</a>
									</div>
								</li>
							</c:forEach>	
								<!-- <li>
									<span class="icon solid fa-envelope"></span>
									<div>
										<strong>Email</strong>
										<a href="mailto:information@domain.ext">information@domain.ext</a>
									</div>
								</li>
								<li>
									<span class="icon solid fa-phone"></span>
									<div>
										<strong>Phone</strong>
										(000) 000-0000 ext 0000
									</div>
								</li> -->
							</ul>
						</div>
					</div>
					<div class="copyright">
						&copy; PTA. All rights reserved.
					</div>
				</div>
			</div>

		<!-- Scripts -->
			
			<script src="assets/js/jquery.dropotron.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>
			
			<script>
				// 프로그램 리스트 슬라이드
			    $('.profiles').slick({
			        slidesToShow: 3, // 보여질 슬라이드 수
			        slidesToScroll: 1, // 넘겨질 슬라이드 수
			        //infinite : true, //무한 반복 옵션
			        autoplay: true, // 자동 넘김 여부
			        autoplaySpeed: 2800, // 자동 넘김시 슬라이드 시간
			        pauseOnHover:true, // 마우스 hover시 슬라이드 멈춤
			        arrows: false, // next, prev 이동 버튼
			        speed : 300 // 슬라이드 속도
			        // dots: true
			    });
				
				// 차트1
			    var ctx = document.getElementById('typeChart');
			    var a = '<c:out value="${memberCount}"/>';
			    var b = '<c:out value="${trainerCount}"/>';
			    
			    var myChart = new Chart(ctx, {
			      type: 'bar',
			      data: {
			        labels: ['일반회원', '트레이너'],
			        datasets: [{
			          /* label: '회원유형', */
			          data: [a, b],
			          backgroundColor: [
			            'rgba(255, 99, 132, 0.2)',
			            'rgba(54, 162, 235, 0.2)',
			          ],
			          borderColor: [
			            'rgba(255, 99, 132, 1)',
			            'rgba(54, 162, 235, 1)',
			          ],
			          borderWidth: 1,     
			          
			        }]
			      },
			      options: {    	 
			          scales: {
			            yAxes: [{
			              ticks: {
			                beginAtZero: true
			              }
			            }]
			          },
			          legend: {
			              display: false,
			              position : 'right'
			            },
			          title : {
			        	  display: true,
			        	  text : '회원유형 분석 통계'
			          }
			        }
			      });
			    
			    // 차트2
			    var ctx = document.getElementById('typeChart2');
			    var a = '<c:out value="${memberCount}"/>';
			    var b = '<c:out value="${trainerCount}"/>';
			    
			    var myPieChart = new Chart(ctx, {
			      type: 'doughnut',
			      data: {
			        labels: ['일반회원', '트레이너'],
			        datasets: [{
			          label: '회원유형',
			          data: [a, b],
			          backgroundColor: [
			            'rgba(255, 99, 132, 0.2)',
			            'rgba(54, 162, 235, 0.2)',
			          ],
			          hoverBackgroundColor: [
			            'rgba(255, 99, 132, 1)',
			            'rgba(54, 162, 235, 1)',
			          ],
			          hoverBorderColor: 'rgba(234, 236, 244, 1)',
			          
			          datalabels: {
			              labels: {
			                  value: {
			                      borderWidth: 2,
			                      borderRadius: 4,
			                      font: {size: 15},
			                      formatter: function(value, ctx) {
			                          var value = ctx.dataset.data[ctx.dataIndex];
			                          return value > 0 ? Math.round(value / (ctx.dataset.data[0] + ctx.dataset.data[1]) * 100) + ' %' : null;
			                      },
			                      color: function(ctx) {
			                          var value = ctx.dataset.data[ctx.dataIndex];
			                          return value > 0 ? 'white' : null;
			                      },
			                      backgroundColor:function(ctx) {
			                          var value = ctx.dataset.data[ctx.dataIndex];
			                          return value > 0 ? 'gray' : null;
			                      },
			                      padding: 4
			                  }
			              }
			          }
			        }]
			      },
			      options: {
			          maintainAspectRatio: false,
			          responsive: true,
			          animation: false,
			          tooltips: {
			            backgroundColor: "rgb(255,255,255)",
			            bodyFontColor: "#858796",
			            borderColor: '#dddfeb',
			            borderWidth: 1,
			            xPadding: 15,
			            yPadding: 15,
			            displayColors: false,
			            caretPadding: 10,
			          },
			          legend: {
			            display: true,
			          },
			          cutoutPercentage: 40,
			        },
			      });
			    
			 	// 회원유형 백분율 구하기
			    var memberRate = Number(a) *100 /(Number(a) + Number(b));
			    var trainerRate = Number(b) *100 /(Number(a) + Number(b)); 

			    if (isNaN(memberRate)) { // 값이 없어서 NaN값이 나올 경우

			    	memberRate = 0;

			    	}
			    
			    if (isNaN(trainerRate)) { // 값이 없어서 NaN값이 나올 경우

			    	trainerRate = 0;

			    	}    
			    
			    var memberRateRound = Math.round(memberRate) + "%";
			    var trainerRateRound = Math.round(trainerRate) + "%";
			    
			    document.getElementById('memberRate').innerHTML = memberRateRound;
			    document.getElementById('trainerRate').innerHTML = trainerRateRound;
			</script>

	</body>
</html>