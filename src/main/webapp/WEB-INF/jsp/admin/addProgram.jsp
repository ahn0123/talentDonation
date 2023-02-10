<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<html>
<head>
    <title>PTA ADDPROGRAM</title>
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
					<h2>프로그램 등록</h2>
				</header>
				<br>
				<div class="content"> <!-- start of content -->
				    <div class="form">
						<form method="post" action="/admin/addProgram" id="addProgramForm">
							
							<div class="fields">
								<div class="field">
									<label style="text-align: left; color:cornflowerblue">교육명</label>
									<input name="progTitle" id="progTitle" type="text" />																		
								</div>			
								<div class="field">
									<label style="text-align: left; color:cornflowerblue">장소</label>
									<input name="progLocation" id="progLocation" type="text" />
								</div>
								<div class="field">
									<label style="text-align: left; color:cornflowerblue">수강료</label>
									<input name="progPrice" id="progPrice" type="text" />
								</div>
								<div class="field">
									<label style="text-align: left; color:cornflowerblue">모집인원</label>
									<input name="progRecruitNum" id="progRecruitNum" type="text" />
								</div>
								<div class="field">
									<label style="text-align: left; color:cornflowerblue">소개글</label>
									<textarea name="progContent" id="progContent" rows="3" placeholder="소개글을 작성해주세요"></textarea>
								</div>
								<div class="field">
									<label style="text-align: left; color:cornflowerblue">모집마감일</label>
									<input name="progDue" id="progDue" type="text" />
								</div>
								<div class="field">
									<label style="text-align: left; color:cornflowerblue">트레이너명</label>
									<table>
									<tr style="border: 0px;background-color:white;boder-color:white">
									<td>
									<input id="trName" type="text" style="width:300px" />
									<input type="hidden" id="progTrmemId" name="progTrmemId" >
									</td>
									<td>
									<button type="button" class="button primary icon solid fa-search" onclick="javascript:tNamePopup();">조회</button>
									</td>
									</tr>
									</table>
								</div>
								<div class="field">
									<label style="text-align: left; color:cornflowerblue">키워드명</label>
									<table>
									<tr style="border: 0px;background-color:white;boder-color:white">
									<td>
									<input id="keyName" type="text" style="width:300px" />
									<input type="hidden" id="progKeyId" name="progKeyId" >
									</td>
									<td>
									<button type="button" class="button primary icon solid fa-search" onclick="javascript:keyNamePopup();">조회</button>
									</td>
									</tr>
									</table>
								</div>								
								<div class="field">
									<label style="text-align: left; color:cornflowerblue">시작일</label>
									<input name="progStartDate" id="progStartDate" type="text" />
								</div>
								<div class="field">
									<label style="text-align: left; color:cornflowerblue">종료일</label>
									<input name="progEndDate" id="progEndDate" type="text" />
								</div>
							</div>
							
							<!-- 버튼영역 -->
							<ul class="actions special">
								<li><input type="button" value="등록" class="button primary" id="addProgram_btn"></li>
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
	//빈 칸이 있는지 확인
	$(document).ready(function (e) {
	
		$("#addProgram_btn").click(function () {
	
			const progTitle = $("#progTitle").val().replaceAll(" ", "");
			const progLocation = $("#progLocation").val().replaceAll(" ", "");
			const progPrice = $("#progPrice").val().replaceAll(" ", "");
			const progRecruitNum = $("#progRecruitNum").val().replaceAll(" ", "");
			const progContent = $("#progContent").val().replaceAll(" ", "");
			const progDue = $("#progDue").val().replaceAll(" ", "");
			const trName = $("#trName").val().replaceAll(" ", "");
			const keyName = $("#keyName").val().replaceAll(" ", "");
			const progStartDate = $("#progStartDate").val().replaceAll(" ", "");
			const progEndDate = $("#progEndDate").val().replaceAll(" ", "");
	
			if (!progTitle) {
				$("#checking").text("교육명을 입력하세요");
			} else if (!progLocation) {
				$("#checking").text("장소를 입력하세요");
			} else if (!progPrice) {
				$("#checking").text("수강료를 입력하세요");
			} else if (!progRecruitNum) {
				$("#checking").text("모집인원을 입력하세요");
			} else if (!progContent) {
				$("#checking").text("소개글을 입력하세요");
			} else if (!progDue) {
				$("#checking").text("모집마감일을 입력하세요");
			} else if (!trName) {
				$("#checking").text("트레이너명을 입력하세요");
			} else if (!keyName) {
				$("#checking").text("키워드명을 입력하세요");
			} else if (!progStartDate) {
				$("#checking").text("시작일을 입력하세요");
			} else if (!progEndDate) {
				$("#checking").text("종료일을 입력하세요");
			} else {
				$("#addProgramForm").submit();
			}
	
		})
	})
	
	//트레이너명 찾기 팝업
	function tNamePopup(){
		var spop = window.open("trainerListPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	}
	
	//키워드명 찾기 팝업
	function keyNamePopup(){
		var spop = window.open("keyListPopup","pop","width=570,height=420, scrollbars=yes, resizable=yes"); 
	}
</script>

</body>
</html>
