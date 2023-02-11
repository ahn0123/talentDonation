<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>PTA TRAINERDETAIL</title>
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
					<h2>트레이너상세정보</h2>
				</header>
				<br>
				<div class="content"> <!-- start of content -->
				    <div class="form">
						<form method="post" action="/admin/addTrainer" id="trSignUpForm">
							<c:forEach var="list" items="${list}">
							<div class="fields">
								<div class="field">
									<label style="text-align: left; color:cornflowerblue">아이디</label>
									<input name="memId" id="memId" type="text" value="${list.memId}" readonly />																		
								</div>			
								<div class="field">
									<label style="text-align: left; color:cornflowerblue">이름</label>
									<input name="memName" id="memName" type="text" value="${list.memName}" readonly />
								</div>
								<div class="field">
									<label style="text-align: left; color:cornflowerblue">휴대폰 번호</label>
									<input name="memTel" id="memTel" type="text" value="${list.memTel}" readonly />
								</div>
								<div class="field">
									<label style="text-align: left; color:cornflowerblue">이메일</label>
									<input name="memEmail" id="memEmail" type="email" value="${list.memEmail}" readonly />
								</div>
								<div class="field">
									<label style="text-align: left; color:cornflowerblue">경력</label>
									<textarea name="trCareer" id="trCareer" rows="3" placeholder="경력사항을 작성해주세요" value="${list.trCareer}">${list.trCareer}</textarea>
								</div>
								<div class="field">
									<label style="text-align: left; color:cornflowerblue">자격증</label>
									<textarea name="trLicense" id="trLicense" rows="3" placeholder="자격증을 작성해주세요" value="${list.trLicense}">${list.trLicense}</textarea>
								</div>
								<div class="field">
									<label style="text-align: left; color:cornflowerblue">회원유형</label>
									<div class="row gtr-uniform">
										<div class="col-4 col-12-small">
											<input type="radio" id="optUser" name="memType" <c:if test="${list.memType eq 1}">checked</c:if> value="1" disabled>
											<label for="optUser">일반회원</label>
										</div>
										<div class="col-4 col-12-small">
											<input type="radio" id="optTrainer" name="memType" <c:if test="${list.memType eq 2}">checked</c:if> value="2" disabled>
											<label for="optTrainer">트레이너</label>
										</div>
									</div>
								</div>
							</div>
							</c:forEach>
							<!-- 버튼영역 -->
							<ul class="actions special">
								<li><input type="button" value="등록" class="button primary" id="addTrainer_btn"></li>
								<li><input type="button" value="수정" class="button primary" id="editTrainer_btn"></li>
								<li><input type="button" value="목록가기" class="button" onclick="location.href='trainerList'"></li>
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
	
		$("#addTrainer_btn").click(function () {
	
			const trCareer = $("#trCareer").val().replaceAll(" ", "");
			const trLicense = $("#trLicense").val().replaceAll(" ", "");
	
			if (!trCareer) {
				alert("경력사항을 작성해주세요");
			} else if (!trLicense) {
				alert("자격증을 작성해주세요");
			} else {
				$("#trSignUpForm").submit();
			}
	
		})
	})
	
	// ajax (트레이너 수정)
	$("#editTrainer_btn").click(function (){
	
		var memId = document.getElementById('memId').value;
		var trCareer = document.getElementById('trCareer').value;
		var trLicense = document.getElementById('trLicense').value;
		
		var param = {
			memId: memId,
			trCareer: trCareer,
			trLicense: trLicense		
		};            
		 
		$.ajax({		
			type : "post",
			data : param,
			url : "/admin/modifyTrainerInfo",
			 
			success : function(result) {
				alert("성공적으로 수정되었습니다");	
			},		
			error : function(result) {
				alert("오류가 발생했습니다");	
			}	 
		});
		
	});
</script>

</body>
</html>
