<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>PTA APPLYDETAILADMIN</title>
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
					<h2>교육신청 상세정보(트레이너)</h2>
				</header>
				<br>
				<div class="content"> <!-- start of content -->
				    <div class="form">
						<form>
							<c:forEach var="list" items="${list}">
							<div class="fields">
								<div class="field">
									<label style="text-align: left; color:cornflowerblue">신청인</label>
									<input name="memName" id="memName" type="text" value="${list.memName}" readonly />																		
								</div>			
								<div class="field">
									<label style="text-align: left; color:cornflowerblue">연락처</label>
									<input name="memTel" id="memTel" type="text" value="${list.memTel}" readonly />
								</div>
								<div class="field">
									<label style="text-align: left; color:cornflowerblue">이메일</label>
									<input name="memEmail" id="memEmail" type="text" value="${list.memEmail}" readonly />
								</div>
								<div class="field">
									<label style="text-align: left; color:cornflowerblue">반려견명</label>
									<input name="dogName" id="dogName" type="text" value="${list.dogName}" readonly />
								</div>
								<div class="field">
									<label style="text-align: left; color:cornflowerblue">견종</label>
									<input name="memTel" id="memTel" type="text" value="${list.dogBreed}" readonly />
								</div>
								<div class="field">
									<label style="text-align: left; color:cornflowerblue">반려견 생일</label>
									<fmt:formatDate var="dogBirthday" value="${list.dogBirthday}" pattern="yyyy-MM-dd"/>
									<input name="dogBirthday" id="dogBirthday" type="text" value="${dogBirthday}" readonly />
								</div>
								<div class="field">
									<label style="text-align: left; color:cornflowerblue">반려견 무게</label>
									<input name="dogWeight" id="dogWeight" type="text" value="${list.dogWeight}" readonly />
								</div>
								<div class="field">
									<label style="text-align: left; color:cornflowerblue">반려견 비고</label>
									<input name="dogRemark" id="dogRemark" type="text" value="${list.dogRemark}" readonly />
								</div>
							</div>
							</c:forEach>
							<!-- 버튼영역 -->
							<ul class="actions special">
								<li><input type="button" value="닫기" class="button" onclick="window.close()"></li>
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
