<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>PTA ADDRECORD</title>
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
					<h2>교육일지 등록</h2>
				</header>
				<br>
				<div class="content"> <!-- start of content -->
				    <div class="form">
						<form method="post" action="/myPage/addRecord" id="addRecordForm" modelAttribute="record">
							
							<div class="fields">
								<div class="field">
									<label style="text-align: left; color:cornflowerblue">제목</label>
									<input name="rcTitle" id="rcTitle" type="text" />																	
								</div>
								<div class="field">
									<label style="text-align: left; color:cornflowerblue">내용</label>
									<textarea name="rcContent" id="rcContent" rows="3" placeholder="내용을 작성해주세요"></textarea>
								</div>
								<input type="hidden" name="rcProgId" id="rcProgId" value="${rcProgId}" />
								<input type="hidden" name="rcDogId" id="rcDogId" value="${rcDogId}" />
							</div>
							
							<!-- 버튼영역 -->
							<ul class="actions special">
								<li><input type="button" value="등록" class="button primary" id="addRecord_btn"></li>
							</ul>
							<p id="checking" style="height: 1px; color: #13a2dd; text-align: center;" ></p>
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
	
		$("#addRecord_btn").click(function () {
	
			const rcTitle = $("#rcTitle").val().replaceAll(" ", "");
			const rcContent = $("#rcContent").val().replaceAll(" ", "");
			//const rcProgId = $("#rcProgId").val().replaceAll(" ", "");
			//const rcDogId = $("#rcDogId").val().replaceAll(" ", "");
	
			if (!rcTitle) {
				$("#checking").text("제목을 입력하세요");
			} else if (!rcContent) {
				$("#checking").text("내용을 입력하세요");
			} else {
				$("#addRecordForm").submit();
			}
	
		})
	})
</script>

</body>
</html>
