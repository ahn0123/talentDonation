<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>PTA MEMBERDETAIL</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <meta name="description" content="" />
	<meta name="keywords" content="" />
    <link rel="stylesheet" href="../assets/css/main.css" />
    
</head>
<body class="is-preload">
	<!-- Header -->
	<%@include file ="../header.jsp" %>
	<div id="main">
		<div class="wrapper">
			<div class="inner3">
				<header class="major">
					<h2>회원상세내역</h2>
				</header>
				<br>
				<div class="content"> <!-- start of content -->
				    <div class="form">
						<form method="post" action="/memberDetail" modelAttribute="member">
							<c:forEach var="list" items="${list}">
							<div class="fields">
								<div class="field">
									<label style="text-align: left; color:cornflowerblue">아이디</label>
									<input name="memId" id="memId" type="text" value="${list.memId}" readonly />																		
								</div>			
								<div class="field">
									<label style="text-align: left; color:cornflowerblue">이름</label>
									<input name="memName" id="memName" type="text" value="${list.memName}" readonly />
								</div>
								<div class="field">
									<label style="text-align: left; color:cornflowerblue">휴대폰 번호</label>
									<input name="memTel" id="memTel" type="text" value="${list.memTel}" readonly />
								</div>
								<div class="field">
									<label style="text-align: left; color:cornflowerblue">이메일</label>
									<input name="memEmail" id="memEmail" type="email" value="${list.memEmail}" readonly />
								</div>
								<div class="field">
									<label style="text-align: left; color:cornflowerblue">회원유형</label>
									<div class="row gtr-uniform">
										<div class="col-4 col-12-small">
											<input type="radio" id="optUser" name="memType" <c:if test="${list.memType eq 1}">checked</c:if> value="1" disabled>
											<label for="optUser">일반회원</label>
										</div>
										<div class="col-4 col-12-small">
											<input type="radio" id="optTrainer" name="memType" <c:if test="${list.memType eq 2}">checked</c:if> value="2" disabled>
											<label for="optTrainer">트레이너</label>
										</div>
									</div>
								</div>
							</div>
							</c:forEach>
							<!-- 버튼영역 -->
							<ul class="actions special">
								<li><input type="button" value="목록가기" class="button" onclick="location.href='memberList'"></li>
							</ul>
						</form>
					</div>
				</div> <!-- end of content -->

			</div>
		</div>
	</div>
	
	<!-- Footer -->
	<%@include file ="../footer.jsp" %>
	
<!-- Scripts -->
<script src="../assets/js/jquery.min.js"></script>
<script src="../assets/js/jquery.dropotron.min.js"></script>
<script src="../assets/js/browser.min.js"></script>
<script src="../assets/js/breakpoints.min.js"></script>
<script src="../assets/js/util.js"></script>
<script src="../assets/js/main.js"></script>

</body>
</html>
