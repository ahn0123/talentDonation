<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>PTA ADDDOG</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <meta name="description" content="" />
	<meta name="keywords" content="" />
    <link rel="stylesheet" href="../assets/css/main.css" />
    
</head>
<body class="is-preload">
	<c:if test="${empty sessionId}">
		<script>
			alert("로그인을 진행해주세요");
			location.href = "<%=request.getContextPath()%>/login";
		</script>
	</c:if>
	<!-- Header -->
	<%@include file ="../header.jsp" %>
	<div id="main">
		<div class="wrapper">
			<div class="inner3">
				<header class="major">
					<h2>반려견 등록</h2>
				</header>
				<br>
				<div class="content"> <!-- start of content -->
				    <div class="form">
						<form method="post" action="/myPage/addDog" id="addDogForm" modelAttribute="dog">
							
							<div class="fields">
								<div class="field">
									<label style="text-align: left; color:cornflowerblue">강아지 이름</label>
									<input name="dogName" id="dogName" type="text" />																		
								</div>			
								<div class="field">
									<label style="text-align: left; color:cornflowerblue">견종</label>
									<input name="dogBreed" id="dogBreed" type="text" />
								</div>
								<div class="field">
									<label style="text-align: left; color:cornflowerblue">생일</label>
									<input name="dogBirthday" id="dogBirthday" type="text" />
								</div>
								<div class="field">
									<label style="text-align: left; color:cornflowerblue">무게</label>
									<input name="dogWeight" id="dogWeight" type="text" />
								</div>
								<div class="field">
									<label style="text-align: left; color:cornflowerblue">비고</label>
									<textarea name="dogRemark" id="dogRemark" rows="3" placeholder="비고를 작성해주세요"></textarea>
								</div>
								<input type="hidden" name="dogMemId" id="dogMemId" value="${sessionId}" />
							</div>
							
							<!-- 버튼영역 -->
							<ul class="actions special">
								<li><input type="button" value="등록" class="button primary" id="addDog_btn"></li>
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

<script>
	//빈 칸이 있는지 확인
	$(document).ready(function (e) {
	
		$("#addDog_btn").click(function () {
	
			const dogName = $("#dogName").val().replaceAll(" ", "");
			const dogBreed = $("#dogBreed").val().replaceAll(" ", "");
			const dogBirthday = $("#dogBirthday").val().replaceAll(" ", "");
			const dogWeight = $("#dogWeight").val().replaceAll(" ", "");
			const dogRemark = $("#dogRemark").val().replaceAll(" ", "");
			const dogMemId = $("#dogMemId").val().replaceAll(" ", "");
	
			if (!dogName) {
				$("#checking").text("ID를 입력하세요");
			} else if (!dogBreed) {
				$("#checking").text("비밀번호를 입력하세요");
			} else if (!dogBirthday) {
				$("#checking").text("비밀번호 확인을 입력하세요");
			} else if (!dogWeight) {
				$("#checking").text("이름을 입력하세요");
			} else if (!dogRemark) {
				$("#checking").text("휴대폰 번호를 입력하세요");
			} else {
				$("#addDogForm").submit();
			}
	
		})
	})
</script>

</body>
</html>
