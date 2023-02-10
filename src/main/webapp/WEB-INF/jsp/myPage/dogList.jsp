<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>PTA DOGLIST</title>
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
			<div class="inner5">
				<header class="major">
					<h2>반려견 목록</h2>
				</header>
				<br>
				<div class="content"> <!-- start of content -->
					<!-- Table -->
					
					<div class="table-wrapper">
						<table>
							<thead>
								<tr>
									<th style="text-align:center;">강아지 이름</th>
									<th style="text-align:center;">견종</th>
									<th style="text-align:center;">생일</th>
									<th style="text-align:center;">무게</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="list" items="${list}">
								<tr>
									<td style="text-align:center;"><a href="dogDetail?dogId=${list.dogId}">${list.dogName}</a></td>
									<td style="text-align:center;">${list.dogBreed}</td>									
									<td style="text-align:center;"><fmt:formatDate var="dogBirthday" value="${list.dogBirthday}" pattern="yyyy-MM-dd"/>${dogBirthday}</td>
									<td style="text-align:center;">${list.dogWeight}</td>				
								</tr>
								</c:forEach>
							</tbody>
						</table>
					</div> <!-- end of Table -->
					<!-- 버튼영역 -->
					<ul class="actions special">
						<li><input type="button" value="등록" class="button primary" onclick="location.href='addDog'"></li>
					</ul>
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
