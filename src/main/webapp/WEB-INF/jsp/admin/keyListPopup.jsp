<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>PTA keyListPopup</title>
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
		
		<div class="list_type01">
			<table>
				<colspan>
					<col width="30">
					<col width="60">
					<col width="60">				
				</colspan>
				<tr>
					<th>번호</th>
					<th>키워드ID</th>
					<th>키워드명</th>
				</tr>
				
                   <c:forEach var="list" items="${list}">
				<tr>
					<td>${list.rn}</td>
					<td><a href="${list.keyId}" data-name="${list.keyName}" class="btn_link">${list.keyId}</a></td>
					<td>${list.keyName}</td>
				</tr>
				</c:forEach>
			</table>
		</div><!--//list_type01-->
		
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
		
		let keyId = $(this).attr("href");
		let keyName= $(this).data("name");
		$(opener.document).find("#progKeyId").val(keyId);
		$(opener.document).find("#keyName").val(keyName);
		
		window.close();
	});
</script>

</body>
</html>
