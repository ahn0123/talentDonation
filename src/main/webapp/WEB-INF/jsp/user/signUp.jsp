<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE HTML>
<html>
<head>
    <title>PTA SIGNUP</title>
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
			<div class="inner3">
				<header class="major">
					<h2>회원가입</h2>
				</header>
				<br>
				<div class="content">
					<div class="form">
						<form method="post" action="/signUp" modelAttribute="member" id="signUpForm">
							<div class="fields">
								<div class="field">
									<input name="memId" id="memId" placeholder="ID" type="text" onkeyup="characterCheck(this)" onkeydown="characterCheck(this)" />									
									<p id="Check_memId" style="height: 1px; color: #13a2dd; text-align: center;"></p>									
								</div>
																
								<div class="field">
									<input name="memPwd" id="memPwd" placeholder="비밀번호" type="password" />
									<p id="Check_memPwd" style="height: 1px; color: #13a2dd; text-align: center;"></p>
								</div>
								<div class="field">
									<input name="conPwd" id="conPwd" placeholder="비밀번호 확인" type="password" />
									<p id="Check_conPwd" style="height: 1px; color: #13a2dd; text-align: center;"></p>
								</div>								
								<div class="field">
									<input name="memName" id="memName" placeholder="이름" type="text" />
									<p></p>
								</div>
								<div class="field">
									<input name="memTel" id="memTel" placeholder="휴대폰 번호" type="text" />
									<p></p>
								</div>
								<div class="field">
									<input name="memEmail" id="memEmail" placeholder="이메일" type="email" />
									<p></p>
								</div>
								<!-- <div class="field">
									<textarea name="message" id="message" rows="6" placeholder="Message"></textarea>
								</div> -->
								<div class="field">
									<div class="row gtr-uniform">
										<div class="col-4 col-12-small">
											<input type="radio" id="optUser" name="memType" value="1">
											<label for="optUser">일반회원</label>
										</div>
										<div class="col-4 col-12-small">
											<input type="radio" id="optTrainer" name="memType" value="2">
											<label for="optTrainer">트레이너</label>
										</div>
									</div>
									<p></p>
								</div>
							</div>
							<!-- 버튼영역 -->
							<ul class="actions special">
								<li><input type="button" value="등록" class="button primary" id="signUp_btn"></li>
							</ul>
							<p id="checking" style="height: 1px; color: #13a2dd; text-align: center;" ></p>
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
	$('#memId').on("property-change change keyup paste input", function(){
		console.log("들어옴")
		var id = $('#memId').val(); // #memId에 입력되는 값
		var data = {id : id} // '컨트롤에 넘길 데이터 이름' : '데이터(#memId에 입력되는 값)'
		$.ajax({ type : "get",
			url : "/checkId",
			data : data,
			success : function(result){
				$("#Check_memId").text("사용 가능한 아이디입니다" );
				$("#signUp_btn").attr('disabled', false);

				if(result == 'fail'){
					$("#Check_memId").text("이미 사용 중인 아이디입니다");
					$("#signUp_btn").attr('disabled', true);
				}
			}
		});// success 종료
	}); // ajax 종료


	//비밀번호와 비밀번호 확인 일치 여부
	$('#conPwd').on("property-change change keyup paste input", function(){
		var memPwd = $("#memPwd").val();
		var conPwd = $("#conPwd").val();

		if(memPwd != conPwd){
			$("#Check_conPwd").text("비밀번호가 다릅니다");
			$("#signUp_btn").attr('disabled', true);
		} else {
			$("#Check_conPwd").text(" ");
			$("#signUp_btn").attr('disabled', false);

		}
	})

	//비밀번호 양식
	$("#memPwd").on("property-change change keyup paste input", function(){
		var memPwd = $("#memPwd").val();

		function isPassword(asValue) {
			var regExp = /^(?=.*[a-zA-z])(?=.*[0-9])(?=.*[$`~!@$!%*#^?&\\(\\)\-_=+]).{8,16}$/;

			return regExp.test(asValue); // 형식에 맞는 경우 true 리턴
		}

		if(!isPassword(memPwd) ||memPwd.length < 8 || memPwd.length > 16 ){
			$("#Check_memPwd").text("*특수문자/영문/숫자를 포함하여 8~16자");
			$("#signUp_btn").attr('disabled', true);
		} else{
			$("#Check_memPwd").text("비밀번호가 적합합니다");
			$("#signUp_btn").attr('disabled', false);
		}

	})

	// 빈 칸이 있는지 확인
	$(document).ready(function (e) {

		$("#signUp_btn").click(function () {

			const memId = $("#memId").val().replaceAll(" ", "");
			const memPwd = $("#memPwd").val().replaceAll(" ", "");
			const conPwd = $("#conPwd").val().replaceAll(" ", "");
			const memName = $("#memName").val().replaceAll(" ", "");
			const memTel = $("#memTel").val().replaceAll(" ", "");
			const memEmail = $("#memEmail").val().replaceAll(" ", "");			
			const memType = $('input:radio[name=memType]:checked').val();

			if (!memId) {
				$("#checking").text("ID를 입력하세요");
			} else if (!memPwd) {
				$("#checking").text("비밀번호를 입력하세요");
			} else if (!conPwd) {
				$("#checking").text("비밀번호 확인을 입력하세요");
			} else if (!memName) {
				$("#checking").text("이름을 입력하세요");
			} else if (!memTel) {
				$("#checking").text("휴대폰 번호를 입력하세요");
			} else if (!memEmail) {
				$("#checking").text("이메일을 입력하세요");
			} else if (!memType) {
				$("#checking").text("회원유형을 선택하세요");
			} else {
				$("#signUpForm").submit();
			}

		})
	})


	// 이메일로 인증번호 전송, 인증번호 일치 확인
	/* $("#auth_btn").click(function (){
		var email = $("#userEmail").val();
		var data = {email : email};
		var authKey;

		$("#sendEmail_msg").text("이메일을 전송하였습니다.");

		$.ajax({ type : "get",
			url : "/sendMail",
			data : data,
			async : false,
			success : function (data){
			console.log(data);
				authKey = data;
			}
		});

		$('#auth_input').on("property-change change keyup paste input", function(){
			console.log("들어옴");
			if(authKey == $('#auth_input').val()){
				$("#check_auth").text("인증 확인");
				$("#signUp_btn").attr('disabled', false);
			} else {
				$("#check_auth").text("인증번호가 일치하지 않습니다.");
				$("#signUp_btn").attr('disabled', true);
			}
		})

	}) */

	//한글 입력 x
	$("#memId").keyup(function(event){
		if (!(event.keyCode >=37 && event.keyCode<=40)) {
			var inputVal = $(this).val();
			var check = /[ㄱ-ㅎ|ㅏ-ㅣ|가-힣]/;
			if(check.test(inputVal)){
				$(this).val("");
				alert("아이디는 영어와 숫자만 가능합니다");
			}
		}
	});

	// 특수문자 입력 방지
	function characterCheck(obj){
		var regExp = /[ \{\}\[\]\/?.,;:|\)*~`!^\-_+┼<>@\#$%&\'\"\\\(\=]/gi;
		// 허용할 특수문자는 여기서 삭제하면 됨
		// 지금은 띄어쓰기도 특수문자 처리됨
		if( regExp.test(obj.value) ){
			alert("아이디는 영어와 숫자만 가능합니다");
			obj.value = obj.value.substring( 0 , obj.value.length - 1 ); // 입력한 특수문자 한자리 지움
		}
	}

</script>
</body>
</html>