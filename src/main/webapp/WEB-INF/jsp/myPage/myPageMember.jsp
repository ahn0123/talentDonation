<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>PTA MYPAGEMEMBER</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <meta name="description" content="" />
	<meta name="keywords" content="" />
    <link rel="stylesheet" href="../assets/css/main.css" />
    <script>
        function showPopup() {
            window.open("deleteMember", "회원탈퇴", "width=400, height=400, left=100, top=50");
        }
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
					<h2>마이페이지</h2>
				</header>
				<br>
				<div class="content">
					<div class="form">
						<form method="post" action="/myPage/modifyMemberInfo" id="signUpForm">

							<div class="fields">
								<div class="field">
									<label style="text-align: left; color:cornflowerblue">아이디</label>
									<input name="memId" id="memId" type="text" value="${member.memId}" readonly />																		
								</div>
								<div class="field">
									<label style="text-align: left; color:cornflowerblue">비밀번호</label>
									<input name="memPwd" id="memPwd" type="password" value="${member.memPwd}" />
									<p id="Check_memPwd" style="height: 1px; color: #13a2dd; text-align: center;"></p>
								</div>
								<div class="field">
									<label style="text-align: left; color:cornflowerblue">비밀번호 확인</label>
									<input name="conPwd" id="conPwd" type="password" value="${member.memPwd}" />
									<p id="Check_conPwd" style="height: 1px; color: #13a2dd; text-align: center;"></p>
								</div>	
								<div class="field">
									<label style="text-align: left; color:cornflowerblue">이름</label>
									<input name="memName" id="memName" type="text" value="${member.memName}" />
								</div>
								<div class="field">
									<label style="text-align: left; color:cornflowerblue">휴대폰 번호</label>
									<input name="memTel" id="memTel" type="text" value="${member.memTel}" />
								</div>
								<div class="field">
									<label style="text-align: left; color:cornflowerblue">이메일</label>
									<input name="memEmail" id="memEmail" type="email" value="${member.memEmail}" />
								</div>
								<div class="field">
									<label style="text-align: left; color:cornflowerblue">회원유형</label>
									<div class="row gtr-uniform">
										<div class="col-4 col-12-small">
											<input type="radio" id="optUser" name="memType" <c:if test="${member.memType eq 1}">checked</c:if> value="1" disabled>
											<label for="optUser">일반회원</label>
										</div>
										<div class="col-4 col-12-small">
											<input type="radio" id="optTrainer" name="memType" <c:if test="${member.memType eq 2}">checked</c:if> value="2" disabled>
											<label for="optTrainer">트레이너</label>
										</div>
									</div>
								</div>
							</div>
							
							<!-- 버튼영역 -->
							<ul class="actions special">
								<li><input type="submit" value="수정하기" class="button primary"></li>
								<li><input type="button" value="회원탈퇴" class="button" onclick="showPopup();"></li>
							</ul>
							<p id="checking" style="height: 1px; color: #13a2dd; text-align: center;" ></p>
						</form>
					</div>
				</div>

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
	//비밀번호와 비밀번호 확인 일치 여부
	$('#conPwd').on("property-change change keyup paste input", function(){
		var memPwd = $("#memPwd").val();
		var conPwd = $("#conPwd").val();
	
		if(memPwd != conPwd){
			$("#Check_conPwd").text("비밀번호가 다릅니다");
			$("#signUp_btn").attr('disabled', true);
		} else {
			$("#Check_conPwd").text(" ");
			$("#signUp_btn").attr('disabled', false);
	
		}
	})
	
	//비밀번호 양식
	$("#memPwd").on("property-change change keyup paste input", function(){
		var memPwd = $("#memPwd").val();
	
		function isPassword(asValue) {
			var regExp = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;
	
			return regExp.test(asValue); // 형식에 맞는 경우 true 리턴
		}
	
		if(!isPassword(memPwd) ||memPwd.length < 8 || memPwd.length > 16 ){
			$("#Check_memPwd").text("*특수문자/영문/숫자를 포함하여 8~16자");
			$("#signUp_btn").attr('disabled', true);
		} else{
			$("#Check_memPwd").text("비밀번호가 적합합니다");
			$("#signUp_btn").attr('disabled', false);
		}
	
	})
</script>

</body>
</html>
