<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>PTA KEYWORDDETAIL</title>
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
					<h2>키워드 상세정보</h2>
				</header>
				<br>
				<div class="content"> <!-- start of content -->
				    <div class="form">
						<form>
							<c:forEach var="list" items="${list}">
							<div class="fields">
								<div class="field">
									<label style="text-align: left; color:cornflowerblue">키워드ID</label>
									<input name="keyId" id="keyId" type="text" value="${list.keyId}" readonly />																		
								</div>			
								<div class="field">
									<label style="text-align: left; color:cornflowerblue">키워드명</label>
									<input name="keyName" id="keyName" type="text" value="${list.keyName}" />
								</div>
							</div>
							</c:forEach>
							<!-- 버튼영역 -->
							<ul class="actions special">
								<li><input type="button" value="수정" class="button primary" id="editKeyword_btn"></li>
								<li><input type="button" value="목록가기" class="button" onclick="location.href='keywordList'"></li>
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
	// ajax (키워드 수정)
	$("#editKeyword_btn").click(function (){
	
		var keyId = document.getElementById('keyId').value;
		var keyName = document.getElementById('keyName').value;
		
		var param = {
			keyId: keyId,
			keyName: keyName		
		};            
		 
		$.ajax({		
			type : "post",
			data : param,
			url : "/admin/modifyKeywordInfo",
			 
			success : function(result) {
				alert("성공적으로 수정되었습니다");	
				location.href = "keywordList";
			},		
			error : function(result) {
				alert("오류가 발생했습니다");	
			}	 
		});
		
	});
</script>

</body>
</html>
