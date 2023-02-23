<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>PTA RECORDDETAILMEMBER</title>
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
					<h2>교육일지 상세정보</h2>
				</header>
				<br>
				<div class="content"> <!-- start of content -->
				    <div class="form">
						<form>
							<c:forEach var="list" items="${list}">
							<div class="fields">
								<div class="field">
									<label style="text-align: left; color:cornflowerblue">교육명</label>
									<input name="progTitle" id="progTitle" type="text" value="${list.progTitle}" readonly />																		
								</div>
								<div class="field">
									<label style="text-align: left; color:cornflowerblue">작성자</label>
									<input name="progTrmemId" id="progTrmemId" type="text" value="${list.progTrmemId}" readonly />																		
								</div>
								<div class="field">
									<label style="text-align: left; color:cornflowerblue">반려견명</label>
									<input name="dogName" id="dogName" type="text" value="${list.dogName}" readonly />																		
								</div>	
								<div class="field">
									<label style="text-align: left; color:cornflowerblue">작성일</label>
									<fmt:formatDate var="rcRegDate" value="${list.rcRegDate}" pattern="yyyy-MM-dd"/>
									<input name="rcRegDate" id="rcRegDate" type="text" value="${rcRegDate}" readonly />
								</div>
								<div class="field">
									<label style="text-align: left; color:cornflowerblue">제목</label>
									<input name="rcTitle" id="rcTitle" type="text" value="${list.rcTitle}" readonly />
								</div>
								<div class="field">
									<label style="text-align: left; color:cornflowerblue">내용</label>
									<textarea name="rcContent" id="rcContent" rows="3" readonly>${list.rcContent}</textarea>
								</div>
							</div>
							</c:forEach>
							<!-- 버튼영역 -->
							<ul class="actions special">
								<li><input type="button" value="목록가기" class="button" onclick="location.href='recordListMember'"></li>
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
