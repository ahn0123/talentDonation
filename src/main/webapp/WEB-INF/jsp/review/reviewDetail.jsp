<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>PTA REVIEWDETAIL</title>
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
					<h2>교육후기 상세정보</h2>
				</header>
				<br>
				<div class="content"> <!-- start of content -->
				    <div class="form">
						<form>
							<c:forEach var="list" items="${list}">
							<div class="fields">
								<div class="field">
									<label style="text-align: left; color:cornflowerblue">회원ID</label>
									<input name="dogMemId" id="dogMemId" type="text" value="${list.dogMemId}" readonly />																		
								</div>
								<div class="field">
									<label style="text-align: left; color:cornflowerblue">교육명</label>
									<input name="progTitle" id="progTitle" type="text" value="${list.progTitle}" readonly />																		
								</div>
								<div class="field">
									<label style="text-align: left; color:cornflowerblue">제목</label>
									<input name="revTitle" id="revTitle" type="text" value="${list.revTitle}" />																		
								</div>
								<div class="field">
									<label style="text-align: left; color:cornflowerblue">내용</label>
									<textarea name="revContent" id="revContent" rows="3">${list.revContent}</textarea>
								</div>	
								<div class="field">
									<label style="text-align: left; color:cornflowerblue">작성일</label>
									<fmt:formatDate var="revRegDate" value="${list.revRegDate}" pattern="yyyy-MM-dd"/>
									<input name="revRegDate" id="revRegDate" type="text" value="${revRegDate}" readonly />
								</div>
								<div class="field">
									<label style="text-align: left; color:cornflowerblue">별점</label>
									<input name="revRate" id="revRate" type="text" value="${list.revRate}" readonly />
								</div>
								<input name="revProgId" id="revProgId" type="hidden" value="${list.revProgId}" />
								<input name="revDogId" id="revDogId" type="hidden" value="${list.revDogId}" />
							</div>
							</c:forEach>
							<!-- 버튼영역 -->
							<ul class="actions special">
								<li><input type="button" value="수정" class="button primary" id="editReview_btn"></li>
								<li><input type="button" value="목록가기" class="button" onclick="location.href='reviewList'"></li>
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
	//ajax (교육후기 수정)
	$("#editReview_btn").click(function (){
	
		var revProgId = document.getElementById('revProgId').value;
		var revDogId = document.getElementById('revDogId').value;
		var revTitle = document.getElementById('revTitle').value;
		var revContent = document.getElementById('revContent').value;
		
		var param = {
			revProgId: revProgId,
			revDogId: revDogId,
			revTitle: revTitle,
			revContent: revContent
		};            
		 
		$.ajax({		
			type : "post",
			data : param,
			url : "/review/modifyReviewInfo",
			 
			success : function(result) {
				alert("성공적으로 수정되었습니다");	
				location.href = "reviewList";
			},		
			error : function(result) {
				alert("오류가 발생했습니다");	
			}
		});
		
	});
</script>

</body>
</html>
