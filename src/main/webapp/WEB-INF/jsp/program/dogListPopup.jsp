<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>PTA dogListPopup</title>
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
	<div class="sub_box">
		<!-- 검색영역 START -->
		<form id="searchForm">
		<div class="searchArea">											
		<table>
			<tr style="border: 0px;background-color:white;boder-color:white">
				<td>					
				<select name="type" class="se_type01" style="width:150px" >
                        <option value="" ${pageMaker.cri.type == null ? 'selected' : ''}>검색 기준</option>
                        <option value="I" ${pageMaker.cri.type == 'I' ? 'selected' : ''}>아이디</option>
                        <option value="N" ${pageMaker.cri.type == 'N' ? 'selected' : ''}>이름</option>
                        <option value="E" ${pageMaker.cri.type == 'E' ? 'selected' : ''}>이메일</option>
                </select>       	
	        	</td>
	        	<td>
				<input type="text" id="keyword" name="keyword" value="${pageMaker.cri.keyword }" style="width:450px">
				</td>
				<td>							
				<a href="javascript:void(0)"><button type="button" class="button primary icon solid fa-search">조회</button></a>													
				</td>
			</tr>
		</table>		
        </div>						
		</form>
		<!-- 검색영역 END -->
		
		<!-- Table -->					
		<div class="table-wrapper">
			<table>
				<thead>
					<tr>
						<th style="text-align:center;">강아지 이름</th>
						<th style="text-align:center;">견종</th>
						<th style="text-align:center;">생일</th>
						<th style="text-align:center;">무게</th>
					</tr>
				</thead>
				<tbody>
					<c:forEach var="list" items="${list}">
					<tr>
						<td style="text-align:center;"><a href="${list.dogId}" data-name="${list.dogName}" class="btn_link">${list.dogName}</a></td>
						<td style="text-align:center;">${list.dogBreed}</td>									
						<td style="text-align:center;"><fmt:formatDate var="dogBirthday" value="${list.dogBirthday}" pattern="yyyy-MM-dd"/>${dogBirthday}</td>
						<td style="text-align:center;">${list.dogWeight}</td>				
					</tr>
					</c:forEach>
				</tbody>
			</table>
		</div> <!-- end of Table -->
		
	</div><!--//sub_box-->
	
<!-- Scripts -->
<script src="../assets/js/jquery.min.js"></script>
<script src="../assets/js/jquery.dropotron.min.js"></script>
<script src="../assets/js/browser.min.js"></script>
<script src="../assets/js/breakpoints.min.js"></script>
<script src="../assets/js/util.js"></script>
<script src="../assets/js/main.js"></script>

<script>
	//트레이너명 선택 및 팝업창 닫기
	$(".btn_link").on("click", function(e){
		e.preventDefault();
		
		let dogId = $(this).attr("href");
		let dogName= $(this).data("name");
		$(opener.document).find("#dogId").val(dogId);
		$(opener.document).find("#dogName").val(dogName);
		
		window.close();
	});
</script>

</body>
</html>
