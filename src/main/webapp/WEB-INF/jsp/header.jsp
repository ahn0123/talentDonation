<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
    <link rel="stylesheet" href="<%=request.getContextPath()%>/css/style.css">
    <meta charset="UTF-8">
    <title>Header</title>
</head>
<body>
<!-- Header -->
	<header id="header">
		<a class="logo" href="/">PTA&nbsp; <span>by ADS</span></a>
		<nav id="nav">
			<ul>
				<li class="current"><a href="/">Home</a></li>
				<li>
					<a href="<%=request.getContextPath()%>/login" class="dropdown">사이트소개</a>
					<ul>
						<li><a href="#">Option One</a></li>
						<li><a href="#">Option Two</a></li>
						<li><a href="#">Option Three</a></li>
						<li>
							<a href="#">사이트소개</a>
							<ul>
								<li><a href="#">Option One</a></li>
								<li><a href="#">Option Two</a></li>
								<li><a href="#">Option Three</a></li>
								<li><a href="#">Option Four</a></li>
							</ul>
						</li>
					</ul>
				</li>
				<li><a href="<%=request.getContextPath()%>/program/programApplyList">교육과정</a></li>
				<li>
					<a href="#" class="dropdown">마이페이지</a>
					
					<ul>
						<li><a href="<%=request.getContextPath()%>/myPage/myPageMember">회원정보 수정</a></li>
						<c:if test="${memType == 1 || empty sessionId}">
						<li><a href="<%=request.getContextPath()%>/myPage/applyListMember">신청현황</a></li>
						</c:if>
						<c:if test="${memType == 2}">
						<li><a href="<%=request.getContextPath()%>/myPage/applyListTrainer">신청현황(트레이너)</a></li>
						</c:if>
						<c:if test="${memType == 1 || empty sessionId}">
						<li><a href="<%=request.getContextPath()%>/myPage/recordListMember">교육일지</a></li>
						</c:if>
						<c:if test="${memType == 2}">
						<li><a href="<%=request.getContextPath()%>/myPage/recordListTrainer">교육일지(트레이너)</a></li>
						</c:if>
						<li><a href="<%=request.getContextPath()%>/myPage/dogList">반려견 정보</a></li>
					</ul>
					
				</li>
				<li><a href="<%=request.getContextPath()%>/review/reviewList">교육후기</a></li>				
				<c:if test="${sessionId eq 'admin123'}">
                <li>
                	<a href="#" class="dropdown">관리자</a>
                	<ul>
                		<li><a href="/admin/applyListAdmin">교육신청 관리</a></li>
						<li><a href="/admin/memberList">회원목록 관리</a></li>
						<li><a href="/admin/trainerList">트레이너목록 관리</a></li>
						<li><a href="/admin/programList">교육목록 관리</a></li>
						<li><a href="/admin/keywordList">키워드목록 관리</a></li>
						<li>
							<a href="#">Submenu</a>
							<ul>
								<li><a href="#">Option One</a></li>
								<li><a href="#">Option Two</a></li>
								<li><a href="#">Option Three</a></li>
								<li><a href="#">Option Four</a></li>
							</ul>
						</li>
					</ul>                
                </li>
                </c:if>			
				
				<c:if test="${empty sessionId}">
				<li>
					<a href="<%=request.getContextPath()%>/login" class="btn_login">로그인</a>
					<!--<a href="/signUp" class="btn_login">회원정보</a>-->
				</li>
				</c:if>
				<c:if test="${not empty sessionId}">
                <li><a href="<%=request.getContextPath()%>/logout" class="btn_login">로그아웃</a></li>
                </c:if>
			</ul>
		</nav>
	</header>
</body>
</html>