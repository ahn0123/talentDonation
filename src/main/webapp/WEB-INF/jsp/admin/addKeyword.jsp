<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE HTML>
<html>
<head>
    <title>PTA ADDKEYWORD</title>
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
					<h2>키워드 등록</h2>
				</header>
				<br>
				<div class="content"> <!-- start of content -->
				    <div class="form">
						<form method="post" action="/admin/addKeyword" id="addKeywordForm">
							
							<div class="fields">
								<div class="field">
									<label style="text-align: left; color:cornflowerblue">키워드ID</label>
									<input name="keyId" id="keyId" type="text" onkeyup="characterCheck(this)" onkeydown="characterCheck(this)" />
									<p id="Check_keyId" style="height: 1px; color: #13a2dd; text-align: center;"></p>
								</div>			
								<div class="field">
									<label style="text-align: left; color:cornflowerblue">키워드명</label>
									<input name="keyName" id="keyName" type="text" />
								</div>
							</div>
							
							<!-- 버튼영역 -->
							<ul class="actions special">
								<li><input type="button" value="등록" class="button primary" id="addKeyword_btn"></li>
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
	//키워드ID 중복체크
	$('#keyId').on("property-change change keyup paste input", function(){
		console.log("들어옴")
		var id = $('#keyId').val(); // #keyId에 입력되는 값
		var data = {id : id} // '컨트롤에 넘길 데이터 이름' : '데이터(#keyId에 입력되는 값)'
		$.ajax({ type : "get",
			url : "/admin/checkKeyId",
			data : data,
			success : function(result){
				$("#Check_keyId").text("사용 가능한 키워드ID입니다" );
				$("#addKeyword_btn").attr('disabled', false);
	
				if(result == 'fail'){
					$("#Check_keyId").text("이미 사용 중인 키워드ID입니다");
					$("#addKeyword_btn").attr('disabled', true);
				}
			}
		});// success 종료
	}); // ajax 종료
	
	//빈 칸이 있는지 확인
	$(document).ready(function (e) {
	
		$("#addKeyword_btn").click(function () {
	
			const keyId = $("#keyId").val().replaceAll(" ", "");
			const keyName = $("#keyName").val().replaceAll(" ", "");
	
			if (!keyId) {
				$("#checking").text("키워드ID를 입력하세요");
			} else if (!keyName) {
				$("#checking").text("키워드명을 입력하세요");
			} else {
				$("#addKeywordForm").submit();
			}
	
		})
	})
	
	//숫자만 입력
	$("#keyId").keyup(function(event){
        if (!(event.keyCode >=37 && event.keyCode<=40)) {
            var inputVal = $(this).val();
            $(this).val(inputVal.replace(/[^0-9]/gi,''));
        }
    });

	// 특수문자 입력 방지
	function characterCheck(obj){
		var regExp = /[ \{\}\[\]\/?.,;:|\)*~`!^\-_+┼<>@\#$%&\'\"\\\(\=]/gi;
		// 허용할 특수문자는 여기서 삭제하면 됨
		// 지금은 띄어쓰기도 특수문자 처리됨
		if( regExp.test(obj.value) ){
			alert("키워드ID는 숫자만 가능합니다");
			obj.value = obj.value.substring( 0 , obj.value.length - 1 ); // 입력한 특수문자 한자리 지움
		}
	}
</script>

</body>
</html>
