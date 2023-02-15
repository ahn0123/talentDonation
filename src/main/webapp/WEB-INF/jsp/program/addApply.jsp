<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>PTA ADDAPLY</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <meta name="description" content="" />
	<meta name="keywords" content="" />
    <link rel="stylesheet" href="../assets/css/main.css" />    

<script>
var isMessage = true;
<c:if test="${!empty message}">
if(isMessage){
	 alert("${message}");
	 isMessage = false;
}
</c:if>
</script> 
    
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
					<h2>교육신청</h2>
				</header>
				<br>
				<div class="content"> <!-- start of content -->
				    <div class="form">
						<form method="post" action="/program/addApply" id="addApplyForm">
							<c:forEach var="list" items="${list}">
							<div class="fields">
								<div class="field">
									<label style="text-align: left; color:cornflowerblue">교육명</label>
									<input name="progTitle" id="progTitle" type="text" value="${list.progTitle}" readonly />																		
								</div>			
								<div class="field">
									<label style="text-align: left; color:cornflowerblue">수강료</label>
									<input name="progPrice" id="progPrice" type="text" value="${list.progPrice}" readonly />
								</div>
								<div class="field">
									<label style="text-align: left; color:cornflowerblue">트레이너명</label>
									<input id="trName" type="text" style="width:300px" value="${list.memName}" readonly />
								</div>
								<div class="field">
									<label style="text-align: left; color:cornflowerblue">반려견명</label>
									<table>
									<tr style="border: 0px;background-color:white;boder-color:white">
									<td>
									<input id="dogName" type="text" style="width:300px" />
									<input type="hidden" id="dogId" name="dogId">
									</td>
									<td>
									<button type="button" class="button primary icon solid fa-search" onclick="javascript:dogNamePopup();">조회</button>
									</td>
									</tr>
									</table>
								</div>
								<input type="hidden" id="progId" name="progId" value="${list.progId}">
							</div>
							
							
							<!-- 버튼영역 -->							
							<ul class="actions special">
								<li><input type="button" value="등록" class="button primary" id="addApply_btn"></li>
							</ul>
							</c:forEach>
							<p id="checking" style="height: 1px; color: #13a2dd; text-align: center;" >${msg}</p>
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
	
		$("#addApply_btn").click(function () {
	
			const dogName = $("#dogName").val().replaceAll(" ", "");
	
			if (!dogName) {
				$("#checking").text("반려견명을 입력하세요");
			} else {
				$("#addApplyForm").submit();
			}
	
		})
	})

	//반려견명 찾기 팝업
	function dogNamePopup(){
		window.open("dogListPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes");
	}
</script>

</body>
</html>
