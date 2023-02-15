<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>PTA APPLYLISTDETAIL</title>
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
					<h2>교육신청 상세정보</h2>
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
									<label style="text-align: left; color:cornflowerblue">교육과정</label>
									<input name="memTel" id="memTel" type="text" value="${list.progTitle}" readonly />
								</div>
								<div class="field">
									<label style="text-align: left; color:cornflowerblue">처리상태</label>
									<!-- Select영역 -->
									<select name="applyStatus" id="applyStatus">
										<option value="" selected disabled>- 선택 -</option>
										<option value="0">대기</option>
										<option value="1">승인</option>
										<option value="-1">반려</option>
										<option value="-2">취소</option>
									</select>
								</div>
								<input type="hidden" id="applyProgId" name="applyProgId" value="${list.applyProgId}">
								<input type="hidden" id="applyDogId" name="applyDogId" value="${list.applyDogId}">
							</div>
							</c:forEach>
							<!-- 버튼영역 -->
							<ul class="actions special">
								<li><input type="button" value="수정" class="button primary" id="editApply_btn"></li>
								<li><input type="button" value="목록가기" class="button" onclick="location.href='applyListAdmin'"></li>
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
	//ajax (신청 정보 상태값 수정)
	$("#editApply_btn").click(function (){
		var applyStatus = document.getElementById('applyStatus').value;
		var applyProgId = document.getElementById('applyProgId').value;
		var applyDogId = document.getElementById('applyDogId').value;
		
		var param = {
			applyStatus: applyStatus,
			applyProgId: applyProgId,
			applyDogId: applyDogId
		};            
		 
		$.ajax({		
			type : "post",
			data : param,
			url : "/admin/modifyApplyStatus",
			 
			success : function(result) {
				alert("성공적으로 수정되었습니다");	
				location.href = "/admin/applyListAdmin";
			},		
			error : function(result) {
				alert("오류가 발생했습니다");	
			}
		});
		
	});
</script>

</body>
</html>
