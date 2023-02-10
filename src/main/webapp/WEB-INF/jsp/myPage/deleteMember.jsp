<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>PTA DELETEMEMBER</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <meta name="description" content="" />
	<meta name="keywords" content="" />
    <link rel="stylesheet" href="../assets/css/main.css" />
    
    <script>
        function mypage_check() {
            window.opener.location.href="../";
            window.close();
        }
    </script>
</head>
<body class="is-preload">
<c:if test="${not empty sessionId}">
    <form method="post" action="/myPage/deleteMember" id="deleteMemberForm">
        <div class="row gtr-uniform" style="text-align: center; width: 90%; float: right;">
            <div class="field" style="text-align: center;">
                <label for="memId">아이디</label>
                <input type="text" id="memId" name="memId" value="${sessionId}" readonly/>
            </div>

            <div class="field" style="text-align: center;">
                <label for="memPwd">비밀번호</label>
                <input type="password" id="memPwd" name="memPwd" />
            </div>

            <div class="field">
                <button class="btn btn-success" type="button" value="회원탈퇴" id="deleteMember_btn">회원탈퇴</button>
                <button class="cancel btn btn-danger" type="button" onclick="window.close()">취소</button>
            </div>
            <div class="field" style="color:blue">${msg}</div>
        </div>

    </form>
</c:if>

<c:if test="${empty sessionId}">
    <form action="#">
        <div class="row gtr-uniform" style="text-align: center; width: 90%;   float: right;">
            <div class="field" style="color:blue">${msg}</div>
            <br>
            <div class="field">
                <button class="cancel btn btn-danger" type="button" onclick="mypage_check();">닫기</button>
            </div>
        </div>
    </form>
</c:if>
<!-- Scripts -->
<script src="../assets/js/jquery.min.js"></script>
<script src="../assets/js/jquery.dropotron.min.js"></script>
<script src="../assets/js/browser.min.js"></script>
<script src="../assets/js/breakpoints.min.js"></script>
<script src="../assets/js/util.js"></script>
<script src="../assets/js/main.js"></script>

<script type="text/javascript">
	 $(document).ready(function (e) {

		$("#deleteMember_btn").click(function () {
			const memPwd = $("#memPwd").val().replaceAll(" ", "");
			
							
			if (!memPwd) {
				alert("비밀번호를 입력하세요");
			} else {
				$("#deleteMemberForm").submit();
			}

		});
	})
</script>	
</body>
</html>
