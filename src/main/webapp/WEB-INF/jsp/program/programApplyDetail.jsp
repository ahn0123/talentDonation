<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>PTA PROGRAMAPPLYDETAIL</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <meta name="description" content="" />
	<meta name="keywords" content="" />
    <link rel="stylesheet" href="../assets/css/main.css" />
    
</head>
<body class="is-preload">
	<!-- Header -->
	<%@include file ="../header.jsp" %>
	<div id="main">
		<div class="wrapper">
			<div class="inner3">
				<header class="major">
					<h2>교육 상세정보</h2>
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
									<label style="text-align: left; color:cornflowerblue">장소</label>
									<input name="progLocation" id="progLocation" type="text" value="${list.progLocation}" readonly />
								</div>
								<div class="field">
									<label style="text-align: left; color:cornflowerblue">수강료</label>
									<input name="progPrice" id="progPrice" type="text" value="${list.progPrice}" readonly />
								</div>
								<div class="field">
									<label style="text-align: left; color:cornflowerblue">모집인원</label>
									<input name="progRecruitNum" id="progRecruitNum" type="text" value="${list.progRecruitNum}" readonly />
								</div>
								<div class="field">
									<label style="text-align: left; color:cornflowerblue">소개글</label>
									<textarea name="progContent" id="progContent" rows="3" placeholder="소개글을 작성해주세요" value="${list.progContent}" readonly>${list.progContent}</textarea>
								</div>
								<div class="field">
									<label style="text-align: left; color:cornflowerblue">모집마감일</label>
									<fmt:formatDate var="progDue" value="${list.progDue}" pattern="yyyy-MM-dd"/>
									<input name="progDue" id="progDue" type="text" value="${progDue}" readonly  />
								</div>
								<div class="field">
									<label style="text-align: left; color:cornflowerblue">트레이너명</label>
									<input id="trName" type="text" style="width:300px" value="${list.memName}" readonly />
								</div>
								<div class="field">
									<label style="text-align: left; color:cornflowerblue">키워드명</label>
									<input id="keyName" type="text" style="width:300px" value="${list.keyName}" readonly />
								</div>								
								<div class="field">
									<label style="text-align: left; color:cornflowerblue">시작일</label>
									<fmt:formatDate var="progStartDate" value="${list.progStartDate}" pattern="yyyy-MM-dd"/>
									<input name="progStartDate" id="progStartDate" type="text" value="${progStartDate}" readonly />
								</div>
								<div class="field">
									<label style="text-align: left; color:cornflowerblue">종료일</label>
									<fmt:formatDate var="progEndDate" value="${list.progEndDate}" pattern="yyyy-MM-dd"/>
									<input name="progEndDate" id="progEndDate" type="text" value="${progEndDate}" readonly />
								</div>
								<%-- <input type="hidden" id="progId" name="progId" value="${list.progId}"> --%>
							</div>
							
							
							<!-- 버튼영역 -->							
							<ul class="actions special">
								<c:if test="${empty sessionId}">
									<li><input type="button" value="신청" class="button primary" id="applyProgram_btn1"></li>
								</c:if>
								<c:if test="${not empty sessionId}">								
									<li><a href="addApply?progId=${list.progId}&memId=${sessionId}"><input type="button" value="신청" class="button primary" id="applyProgram_btn2"></a></li>
								</c:if>
							</ul>
							</c:forEach>
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
	$(document).ready(function () {
		$("#applyProgram_btn1").click(function () {
	    	alert("로그인을 진행해주세요");
	    	location.href = "<%=request.getContextPath()%>/login";
	  	});
	});
</script>

</body>
</html>
