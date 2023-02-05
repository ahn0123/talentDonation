<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>PTA LOGIN</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <meta name="description" content="" />
	<meta name="keywords" content="" />
    <link rel="stylesheet" href="../assets/css/main.css" />
    
    <!-- <script type="text/javascript">

        function checkValue()
        {
            inputForm = eval("document.loginInfo");
            if(!inputForm.memId.value)
            {
                alert("아이디를 입력하세요");
                inputForm.memId.focus();
                return false;
            }
            if(!inputForm.memPwd.value)
            {
                alert("비밀번호를 입력하세요");
                inputForm.memPwd.focus();
                return false;
            }
        }

    </script> -->
</head>
<body class="is-preload">
	<!-- Header -->
	<%@include file ="../header.jsp" %>
	<div id="main">
		<div class="wrapper">
			<div class="inner2">
				<header class="major">
					<h2>로그인</h2>
				</header>
				<br>
				<div class="content">
					<div class="form">
						
					    <form method="post" name="loginInfo" action="/login" id="loginInfo">
						<!-- <form method="post" name="loginInfo" onsubmit="return checkValue()"> -->
							<div class="fields">
								<div class="field">
									<input name="memId" id="memId" placeholder="ID" type="text" />
								</div>
								<div class="field">
									<input name="memPwd" id="memPwd" placeholder="PASSWORD" type="password" />
								</div>								
							</div>
							<!-- 버튼영역 -->
							<ul class="actions special">						
								<li><input type="button" value="로그인" class="button primary" id="login_btn"></li>
								<li><a href="signUp" class="button">회원가입</a></li>
							</ul>
							<div class="field" style="text-align: center; color: #575757">${msg}</div>				
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
 $(document).ready(function (e) {

	$("#login_btn").click(function () {

		const memId = $("#memId").val().replaceAll(" ", "");					
		const memPwd = $("#memPwd").val().replaceAll(" ", "");
		
		if (!memId) {
			alert("아이디를 입력하세요");
		} else if (!memPwd) {
			alert("비밀번호를 입력하세요");
							
		} else {						
			$("#loginInfo").submit();
		}

	})
})
			
 $('#memId, #memPwd').on('keypress', function(e){
	 if(e.keyCode == '13'){
		 $('#login_btn').click();
     }
 });


</script>
</body>
</html>
