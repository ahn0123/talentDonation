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
		
	</head>
	<body class="is-preload">

		<!-- Header -->
			<header id="header" class="alt">
				<a class="logo" href="index">PTA&nbsp; <span>by ADS</span></a>
				<nav id="nav">
					<ul>
						<li class="current"><a href="index">Home</a></li>
						<li>
							<a href="#" class="dropdown">사이트소개</a>
							<ul>
								<li><a href="#">Option One</a></li>
								<li><a href="#">Option Two</a></li>
								<li><a href="#">Option Three</a></li>
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
						<li><a href="<%=request.getContextPath()%>/program/programApplyList">교육과정</a></li>
						<li>
							<a href="#" class="dropdown">마이페이지</a>
							<ul>
								<li><a href="<%=request.getContextPath()%>/myPage/myPageMember">회원정보 수정</a></li>
								
								<%-- <c:if test="${list.memType == 1}"> --%>
								<li><a href="<%=request.getContextPath()%>/myPage/applyListMember">신청현황</a></li>
								<%-- </c:if> --%>	
								
								<%-- <c:if test="${memType == 2}"> --%>
								<li><a href="<%=request.getContextPath()%>/myPage/applyListTrainer">신청현황(트레이너)</a></li>
								<%-- </c:if> --%>
								
								<li><a href="#">교육일지</a></li>
								<li><a href="<%=request.getContextPath()%>/myPage/dogList">반려견 정보</a></li>
							</ul>
						</li>
						<li><a href="#">교육후기</a></li>
						<c:if test="${sessionId eq 'admin123'}">
		                <li>
		                	<a href="#" class="dropdown">관리자</a>
		                	<ul>
		                		<li><a href="/admin/applyListAdmin">교육신청 관리</a></li>
								<li><a href="/admin/memberList">회원목록 관리</a></li>
								<li><a href="/admin/trainerList">트레이너목록 관리</a></li>
								<li><a href="/admin/programList">교육목록 관리</a></li>
								<li><a href="#">키워드목록 관리</a></li>
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
							<div class="intro">
								<header>
									<h2 class="left">Eu ligula<br /> consequat</h2>
									<p>Sed egestas, ante et vulputate volutpat pede semper est, vitae luctus metus libero eu augue. Morbi purus libero, faucibus adipiscing.</p>
								</header>
								<ul class="actions">
									<li><a href="#" class="button">Details</a></li>
								</ul>
							</div>
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
								<div class="profile">
									<div class="image">
										<img src="images/pic05.jpg" alt="" />
									</div>
									<div class="content">
										<h3>Ipsum nullam</h3>
										<p>Sed egestas, ante et vulputate volutpat pede semper est luctus metus eu augue. Morbi purus amet libero.</p>
										<ul class="actions">
											<li><a href="#" class="button small">More</a></li>
										</ul>
									</div>
								</div>
								<div class="profile">
									<div class="image">
										<img src="images/pic06.jpg" alt="" />
									</div>
									<div class="content">
										<h3>Metus gravida</h3>
										<p>Sed egestas, ante et vulputate volutpat pede semper est luctus metus eu augue. Morbi purus amet libero.</p>
										<ul class="actions">
											<li><a href="#" class="button small">More</a></li>
										</ul>
									</div>
								</div>
								<div class="profile">
									<div class="image">
										<img src="images/pic07.jpg" alt="" />
									</div>
									<div class="content">
										<h3>Faucibus lorem</h3>
										<p>Sed egestas, ante et vulputate volutpat pede semper est luctus metus eu augue. Morbi purus amet libero.</p>
										<ul class="actions">
											<li><a href="#" class="button small">More</a></li>
										</ul>
									</div>
								</div>
							</div>
						</div>
					</div>
					<footer>
						<ul class="actions">
							<li><a href="#" class="button">Learn More</a></li>
						</ul>
					</footer>
				</div>
			</div>

		<!-- Footer -->
			<div id="footer">
				<div class="wrapper style2">
					<div class="inner">
						<header class="major">
							<h2>Get in touch</h2>
							<p>Sed egestas, ante et vulputate volutpat pede semper est, vitae luctus metus libero eu augue. Morbi purus libero, faucibus adipiscing, commodo quis, gravida id, est. Sed lectus. Praesent elementum lorem ipsum dolor sit amet consequat hendrerit tortor semper lorem at felis.</p>
						</header>
						<div class="content">
							<div class="form">
								<form method="post" action="#">
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
								</form>
							</div>
							<ul class="icons">
								<li>
									<span class="icon solid fa-home"></span>
									<div>
										<strong>Address</strong>
										1234 Somewhere Road #543<br />
										Nashville, TN 00000
									</div>
								</li>
								<li>
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
								</li>
							</ul>
						</div>
					</div>
					<div class="copyright">
						&copy; PTA. All rights reserved.
					</div>
				</div>
			</div>

		<!-- Scripts -->
			<script src="assets/js/jquery.min.js"></script>
			<script src="assets/js/jquery.dropotron.min.js"></script>
			<script src="assets/js/browser.min.js"></script>
			<script src="assets/js/breakpoints.min.js"></script>
			<script src="assets/js/util.js"></script>
			<script src="assets/js/main.js"></script>

	</body>
</html>