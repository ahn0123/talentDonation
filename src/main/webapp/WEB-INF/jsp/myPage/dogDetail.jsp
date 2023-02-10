<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>PTA DOGDETAIL</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <meta name="description" content="" />
	<meta name="keywords" content="" />
    <link rel="stylesheet" href="../assets/css/main.css" />
    <link rel="stylesheet" href="../assets/css/searchDate.css">
    
    <!-- datepicker 달력  -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="../assets/js/datepicker-ko.js"></script>
	<script src="../assets/js/datepicker-set.js"></script>
    
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
					<h2>반려견 상세정보</h2>
				</header>
				<br>
				<div class="content"> <!-- start of content -->
				    <div class="form">
						<form method="post" action="/myPage/modifyDogInfo">
							<c:forEach var="list" items="${list}">
							<div class="fields">
								<div class="field">
									<label style="text-align: left; color:cornflowerblue">강아지 이름</label>
									<input name="dogName" id="dogName" type="text" value="${list.dogName}" />																		
								</div>			
								<div class="field">
									<label style="text-align: left; color:cornflowerblue">견종</label>
									<input name="dogBreed" id="dogBreed" type="text" value="${list.dogBreed}" />
								</div>
								<div class="field">
									<label style="text-align: left; color:cornflowerblue">생일</label>
									<fmt:formatDate var="dogBirthday" value="${list.dogBirthday}" pattern="yyyy-MM-dd"/>									
									<input type="text" class="datepicker inpType" name="dogBirthday" id="dogBirthday" value="${dogBirthday}">																	
									
								</div>
								<div class="field">
									<label style="text-align: left; color:cornflowerblue">무게</label>
									<input name="dogWeight" id="dogWeight" type="text" value="${list.dogWeight}" />
								</div>
								<div class="field">
									<label style="text-align: left; color:cornflowerblue">비고</label>
									<textarea name="dogRemark" id="dogRemark" rows="3" placeholder="비고를 작성해주세요">${list.dogRemark}</textarea>
								</div>
								<input name="dogId" id="dogId" type="hidden" value="${list.dogId}" />
							</div>
							</c:forEach>
							<!-- 버튼영역 -->
							<ul class="actions special">
								<li><input type="submit" value="수정" class="button primary"></li>
								<li><input type="button" value="삭제" class="button primary" id="deleteDog_btn"></li>
								<li><input type="button" value="목록가기" class="button" onclick="location.href='dogList'"></li>
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
<!-- <script src="../assets/js/jquery.min.js"></script> -->
<script src="../assets/js/jquery.dropotron.min.js"></script>
<script src="../assets/js/browser.min.js"></script>
<script src="../assets/js/breakpoints.min.js"></script>
<script src="../assets/js/util.js"></script>
<script src="../assets/js/main.js"></script>

<script>
	//ajax (반려견 삭제)
	$("#deleteDog_btn").click(function (){
	
		var dogId = document.getElementById('dogId').value;
		
		var param = {
			dogId: dogId,		
		};            
		 
		$.ajax({		
			type : "post",
			data : param,
			url : "/myPage/deleteDog",
			 
			success : function(result) {
				alert("성공적으로 삭제되었습니다");	
				location.href = "dogList";
			},		
			error : function(result) {
				alert("오류가 발생했습니다");	
			}
		});
		
	});
</script>

</body>
</html>
