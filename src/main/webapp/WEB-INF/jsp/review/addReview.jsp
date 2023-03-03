<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE HTML>
<html>
<head>
    <title>PTA ADDREVIEW</title>
    <meta charset="utf-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1, user-scalable=no" />
    <meta name="description" content="" />
	<meta name="keywords" content="" />
    <link rel="stylesheet" href="../assets/css/main.css" />
    <link rel="stylesheet" href="../assets/css/star.css" />
    
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
					<h2>교육후기 등록</h2>
				</header>
				<br>
				<div class="content"> <!-- start of content -->
				    <div class="form">
						<form method="post" name="myform" action="/review/addReview" id="addReviewForm">
							
							<div class="fields">
								<div class="field">
									<label style="text-align: left; color:cornflowerblue">제목</label>
									<input name="revTitle" id="revTitle" type="text" />																	
								</div>
								<div class="field">
									<label style="text-align: left; color:cornflowerblue">내용</label>
									<textarea name="revContent" id="revContent" rows="3" placeholder="내용을 작성해주세요"></textarea>
								</div>
								<div class="field">
									<label style="text-align: left; color:cornflowerblue">별점</label>
									<!-- <input name="revRate" id="revRate" type="text" /> -->
									<span class="star-input">
										<span class="input">
									    	<input type="radio" name="revRate" id="p1" value="1"><label for="p1">1</label>
									    	<input type="radio" name="revRate" id="p2" value="2"><label for="p2">2</label>
									    	<input type="radio" name="revRate" id="p3" value="3"><label for="p3">3</label>
									    	<input type="radio" name="revRate" id="p4" value="4"><label for="p4">4</label>
									    	<input type="radio" name="revRate" id="p5" value="5"><label for="p5">5</label>
									    	<input type="radio" name="revRate" id="p6" value="6"><label for="p6">6</label>
									    	<input type="radio" name="revRate" id="p7" value="7"><label for="p7">7</label>
									    	<input type="radio" name="revRate" id="p8" value="8"><label for="p8">8</label>
									    	<input type="radio" name="revRate" id="p9" value="9"><label for="p9">9</label>
									    	<input type="radio" name="revRate" id="p10" value="10"><label for="p10">10</label>
									  	</span>
									  	<output for="star-input"><b>0</b>점</output>
									</span>
								</div>
								<input type="hidden" name="revProgId" id="revProgId" value="${revProgId}" />
								<input type="hidden" name="revDogId" id="revDogId" value="${revDogId}" />
							</div>
							
							<!-- 버튼영역 -->
							<ul class="actions special">
								<li><input type="button" value="등록" class="button primary" id="addReview_btn"></li>
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
	
		$("#addReview_btn").click(function () {
	
			const revTitle = $("#revTitle").val().replaceAll(" ", "");
			const revContent = $("#revContent").val().replaceAll(" ", "");
			const revRate = $("input[name='revRate']:checked").val();
	
			if (!revTitle) {
				$("#checking").text("제목을 입력하세요");
			} else if (!revContent) {
				$("#checking").text("내용을 입력하세요");
			} else if (!revRate) {
				$("#checking").text("별점을 입력하세요");
			} else {
				$("#addReviewForm").submit();
			}
	
		})
	})
	
	//star rating
	var starRating = function(){
	  var $star = $(".star-input"),
	      $result = $star.find("output>b");
	  $(document)
	    .on("focusin", ".star-input>.input", function(){
	    $(this).addClass("focus");
	  })
	    .on("focusout", ".star-input>.input", function(){
	    var $this = $(this);
	    setTimeout(function(){
	      if($this.find(":focus").length === 0){
	        $this.removeClass("focus");
	      }
	    }, 100);
	  })
	    .on("change", ".star-input :radio", function(){
	    $result.text($(this).next().text());
	  })
	    .on("mouseover", ".star-input label", function(){
	    $result.text($(this).text());
	  })
	    .on("mouseleave", ".star-input>.input", function(){
	    var $checked = $star.find(":checked");
	    if($checked.length === 0){
	      $result.text("0");
	    } else {
	      $result.text($checked.next().text());
	    }
	  });
	};
	starRating();
</script>

</body>
</html>
