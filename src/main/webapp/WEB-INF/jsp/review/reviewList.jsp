<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>PTA REVIEWLIST</title>
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
			<div class="inner5">
				<header class="major">
					<h2>교육후기 목록</h2>
				</header>
				<br>
				<div class="content"> <!-- start of content -->
				    <!-- 검색영역 START -->
					<form id="searchForm">
					<div class="searchArea">											
					<table>
						<tr style="border: 0px;background-color:white;boder-color:white">
							<td>					
							<select name="type" class="se_type01" style="width:150px" >
			                        <option value="" ${pageMaker.cri.type == null ? 'selected' : ''}>검색 기준</option>
			                        <option value="P" ${pageMaker.cri.type == 'P' ? 'selected' : ''}>교육명</option>
			                        <option value="T" ${pageMaker.cri.type == 'T' ? 'selected' : ''}>제목</option>
			                        <option value="I" ${pageMaker.cri.type == 'I' ? 'selected' : ''}>회원ID</option>
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
									<th style="text-align:center;">번호</th>
									<th style="text-align:center;">교육명</th>
									<th style="text-align:center;">제목</th>
									<th style="text-align:center;">회원ID</th>
									<th style="text-align:center;">작성일</th>
								</tr>
							</thead>
							<tbody>
								<c:forEach var="list" items="${list}">
								<tr>
									<td style="text-align:center;">${list.rn}</td>
									<td style="text-align:center;">${list.progTitle}</td>
									<td style="text-align:center;"><a href="reviewDetail?revProgId=${list.revProgId}&revDogId=${list.revDogId}">${list.revTitle}</a></td>
									<td style="text-align:center;">${list.dogMemId}</td>
									<td style="text-align:center;"><fmt:formatDate var="revRegDate" value="${list.revRegDate}" pattern="yyyy-MM-dd"/>${revRegDate}</td>
								</tr>
								</c:forEach>
							</tbody>
						</table>
					</div> <!-- end of Table -->
					
					<!--  페이징 시작 -->
					<ul class="actions special">
					<div class="pageInfo_wrap">
					    <div class="paging">
					        <ul id="pageInfo" class="pageInfo">
					            <!-- 이전페이지 버튼 -->
		              			<c:if test="${pageMaker.prev}">
		                           <a class="button small changePage" href="${pageMaker.startPage - 1}"><code>&lt;</code></a>
		                        </c:if>
		              		    
					            <!-- 각 번호 페이지 버튼 -->
		                        <c:forEach var="num" begin="${pageMaker.startPage}" end="${pageMaker.endPage}">
		                           <c:choose>
		                               <c:when test="${pageMaker.cri.pageNum eq num}">
		                                   <%-- 현재 페이지일 때 --%>
		                                   <code><span class="on" >${num}</span></code>
		                               </c:when>
		                               <c:otherwise>
		                                   <a class="changePage" href="${num}"><code>${num}</code></a>
		                               </c:otherwise>
		                           </c:choose>
		                        </c:forEach>
		                        
		                        <!-- 다음페이지 버튼 -->
		                        <c:if test="${pageMaker.next}">
		                            <a class="button small changePage" href="${pageMaker.endPage + 1}"><code>&gt;</code></a>
		                        </c:if> 
					        </ul> 
					    </div>
					</div> 
					</ul>
					<form id="moveForm" method="get">
					    <input type="hidden" name="pageNum" value="${pageMaker.cri.pageNum}">
		                <input type="hidden" name="amount" value="${pageMaker.cri.amount}">
		                <input type="hidden" name="type" value="${pageMaker.cri.type}">
		                <input type="hidden" name="keyword" value="${pageMaker.cri.keyword}">
		               
					</form>
					<!--//페이징 종료-->
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
var moveForm = $("#moveForm");

$(".changePage").on("click", function(e){
	 
    e.preventDefault();
    moveForm.find("input[name='pageNum']").val($(this).attr("href"));    
    moveForm.attr("action", "/review/reviewList")
    moveForm.submit();
    
});

var searchForm = $("#searchForm");

$("#searchForm a").on("click", function(e){
    e.preventDefault();
    
    let type = $(".searchArea select").val();
    let keyword = $(".searchArea input[name='keyword']").val();        

    //val()은 해당 값이 있으면 true, 없으면 false
    if(!searchForm.find("option:selected").val()){
        alert("검색 종류를 선택하세요");
        return false;
    }

    if(!searchForm.find("input[name='keyword']").val()){
        alert("키워드를 입력하세요")
        return false;
    }

    moveForm.find("input[name='type']").val(type);
    moveForm.find("input[name='keyword']").val(keyword); 
    moveForm.find("input[name='pageNum']").val("1");
    moveForm.submit();
});
</script>

</body>
</html>
