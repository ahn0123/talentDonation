<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>PTA PROGRAMDETAIL</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <meta name="description" content="" />
	<meta name="keywords" content="" />
    <link rel="stylesheet" href="../assets/css/main.css" />
    
    <!-- datepicker 달력  -->
	<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
	<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
	<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
	<script src="../assets/js/datepicker-ko.js"></script>
    <script src="../assets/js/datepicker.js"></script>
    
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
					<h2>교육 상세정보</h2>
				</header>
				<br>
				<div class="content"> <!-- start of content -->
				    <div class="form">
						<form method="post" action="/admin/modifyProgramInfo" id="progEditForm">
							<c:forEach var="list" items="${list}">
							<div class="fields">
								<div class="field">
									<label style="text-align: left; color:cornflowerblue">교육명</label>
									<input name="progTitle" id="progTitle" type="text" value="${list.progTitle}" />																		
								</div>			
								<div class="field">
									<label style="text-align: left; color:cornflowerblue">장소</label>
									<input name="progLocation" id="progLocation" type="text" value="${list.progLocation}" />
								</div>
								<div class="field">
									<label style="text-align: left; color:cornflowerblue">수강료</label>
									<input name="progPrice" id="progPrice" type="text" value="${list.progPrice}" />
								</div>
								<div class="field">
									<label style="text-align: left; color:cornflowerblue">모집인원</label>
									<input name="progRecruitNum" id="progRecruitNum" type="text" value="${list.progRecruitNum}" />
								</div>
								<div class="field">
									<label style="text-align: left; color:cornflowerblue">소개글</label>
									<textarea name="progContent" id="progContent" rows="3" placeholder="소개글을 작성해주세요" value="${list.progContent}" >${list.progContent}</textarea>
								</div>
								<div class="field">
									<label style="text-align: left; color:cornflowerblue">모집마감일</label>
									<fmt:formatDate var="progDue" value="${list.progDue}" pattern="yyyy-MM-dd"/>
									<input name="progDue" id="progDue" type="text" class="datepicker inpType" value="${progDue}" />
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
									<input name="progStartDate" id="progStartDate" type="text" class="datepicker inpType" value="${progStartDate}" />
								</div>
								<div class="field">
									<label style="text-align: left; color:cornflowerblue">종료일</label>
									<fmt:formatDate var="progEndDate" value="${list.progEndDate}" pattern="yyyy-MM-dd"/>
									<input name="progEndDate" id="progEndDate" type="text" class="datepicker inpType" value="${progEndDate}" />
								</div>
								<div class="field">
									<label style="text-align: left; color:cornflowerblue">모집상태</label>
									<!-- Select영역 -->
									<select name="progRsvStatus" id="progRsvStatus">
										<option value="1" <c:if test ="${list.progRsvStatus eq 1}">selected="selected"</c:if>>모집</option>
										<option value="-1" <c:if test ="${list.progRsvStatus eq -1}">selected="selected"</c:if>>마감</option>
									</select>
								</div>
								<div class="field">
									<label style="text-align: left; color:cornflowerblue">교육상태</label>
									<!-- Select영역 -->
									<select name="progStatus" id="progStatus">
										<option value="0" <c:if test ="${list.progStatus eq 0}">selected="selected"</c:if>>교육예정</option>
										<option value="1" <c:if test ="${list.progStatus eq 1}">selected="selected"</c:if>>교육완료</option>
										<option value="-1" <c:if test ="${list.progStatus eq -1}">selected="selected"</c:if>>교육취소</option>
									</select>
								</div>
								<input type="hidden" id="progId" name="progId" value="${list.progId}">
							</div>
							</c:forEach>
							<!-- 버튼영역 -->
							<ul class="actions special">
								<li><input type="button" value="수정" class="button primary" id="editProgram_btn"></li>
								<li><input type="button" value="삭제" class="button primary" id="deleteProgram_btn"></li>
								<li><input type="button" value="목록가기" class="button" onclick="location.href='programList'"></li>
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
	//빈 칸이 있는지 확인
	$(document).ready(function (e) {
	
		$("#editProgram_btn").click(function () {
	
			const progTitle = $("#progTitle").val().replaceAll(" ", "");
			const progLocation = $("#progLocation").val().replaceAll(" ", "");
			const progPrice = $("#progPrice").val().replaceAll(" ", "");
			const progRecruitNum = $("#progRecruitNum").val().replaceAll(" ", "");
			const progContent = $("#progContent").val().replaceAll(" ", "");
			const progDue = $("#progDue").val().replaceAll(" ", "");
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
			} else if (!progStartDate) {
				$("#checking").text("시작일을 입력하세요");
			} else if (!progEndDate) {
				$("#checking").text("종료일을 입력하세요");
			} else {
				$("#progEditForm").submit();
			}
	
		})
	})
	
	// ajax (프로그램 삭제)
	$("#deleteProgram_btn").click(function (){
	
		var progId = document.getElementById('progId').value;
		
		var param = {
			progId : progId
		};            
		 
		$.ajax({		
			type : "post",
			data : param,
			url : "/admin/deleteProgram",
			 
			success : function(result) {
				alert("성공적으로 삭제되었습니다");	
				location.href = "programList";
			},		
			error : function(result) {
				alert("오류가 발생했습니다");	
			}	 
		});
		
	});
	
	$("#progDue").datepicker({
    	language: 'ko'
    });
	
	$("#progStartDate").datepicker({
    	language: 'ko'
    });
	
	$("#progEndDate").datepicker({
    	language: 'ko'
    });
</script>

</body>
</html>
