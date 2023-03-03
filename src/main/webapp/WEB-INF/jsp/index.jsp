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
								<li>
									<a href="#">Submenu</a>
									<ul>
										<li><a href="#">Option One</a></li>
										<li><a href="#">Option Two</a></li>
										<li><a href="#">Option Three</a></li>
										<li><a href="#">Option Four</a></li>
									</ul>
								</li>
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
							<li><span class="icon solid fa-laptop"></span><span class="label">Magna aliquam</span></li>
							<li><span class="icon solid fa-wifi"></span><span class="label">Etiam feugiat</span></li>
							<li><span class="icon solid fa-cloud"></span><span class="label">Nisl adipiscing</span></li>
						</ul>
					</div>
				</div>
			</div>

		<!-- One -->
			<div id="one">
				<div class="wrapper special">
					<div class="inner">
						<header class="major">
							<h2>Amet magna adipiscing</h2>
						</header>
						<div class="image fit special">
							<img src="images/pic02.jpg" alt="" />
						</div>
						<p class="special">Sed egestas, ante et vulputate volutpat pede semper est, vitae luctus metus libero eu augue. Morbi purus libero, faucibus adipiscing, commodo quis, gravida id, est. Sed lectus. Praesent elementum lorem ipsum dolor sit amet consequat hendrerit tortor semper lorem at felis.</p>
						<ul class="actions">
							<li><a href="#" class="button">Details</a></li>
						</ul>
					</div>
				</div>
			</div>

		<!-- Two -->
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
									<li><a href="review/reviewDetail?revProgId=${list2.revProgId}&revDogId=${list2.revDogId}" class="button">Details</a></li>
								</ul>
							</div>
							</c:forEach>
							<div class="spotlight">
								<div class="image fit">
									<img src="images/pic03.jpg" alt="" />
								</div>
								<div class="content">Magna sed tempus</div>
							</div>
							<div class="spotlight">
								<div class="image fit">
									<img src="images/pic04.jpg" alt="" />
								</div>
								<div class="content">Lorem ipsum dolor</div>
							</div>
						</div>
					</div>
				</div>
			</div>

		<!-- Three -->
			<div id="three">
				<div class="wrapper alt special">
					<header class="major">
						<h2>Ante gravida elementum</h2>
						<p>Sed egestas, ante et vulputate volutpat pede semper est, vitae luctus metus libero eu augue. Morbi purus libero, faucibus adipiscing, commodo quis, gravida id, est. Sed lectus. Praesent elementum lorem ipsum dolor sit amet consequat hendrerit tortor semper lorem at felis.</p>
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
					<footer>
						<ul class="actions">
							<li><a href="#" class="button">Learn More</a></li>
						</ul>
					</footer>
				</div>
			</div>

		<!-- Footer -->
			<%@include file ="footer.jsp" %>

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
			</script>

	</body>
</html>