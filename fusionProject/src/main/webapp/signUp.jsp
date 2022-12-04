<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">


<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/SignUp.css?after">
<link rel="stylesheet" href="css/basic.css?after">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	function available() {
		let userId = $('#id').val(); // input_id에 입력되는 값
		var idlength = /^[a-zA-z0-9]{8,20}$/;  //정규식
		
		if(!idlength.test(userId)){
			$("#available").html('사용할 수 없는 아이디입니다.');
			$("#available").css("color","#ff7979");
			$("#btnJoin").attr("disabled",true);
			$("#id").focus();
	    }else{
		
		$.ajax({
			url : "IdCheckService",
			type : "post",
			data : {userId: userId},
			dataType : 'json',
			success : function(result){
				if(result == 0){
					$("#available").html('사용할 수 없는 아이디입니다.');
					$("#available").css("color","#ff7979");
					$("#btnJoin").attr("disabled",true);
					$("#id").focus();
					
				} else{
					$("#available").html('사용할 수 있는 아이디입니다.');
					$("#available").css("color","#15db15");
					$("#btnJoin").attr("disabled",false);
				} 
			},
			 error: function (request, status, error) {
			        console.log("code: " + request.status)
			        console.log("message: " + request.responseText)
			        console.log("error: " + error);
			    }
		})
	    }
	}
	
	function check(){
		
	    var form = document.getElementById("form");

	    if(form.id.value == ""){
	        alert("아이디를 입력하세요.");
	        form.id.focus();
	        return false;

	    }
	    var idlength = /^[a-zA-z0-9]{8,20}$/;  //정규식

	    if(!idlength.test(form.id.value)){
	        alert("아이디는 영문 대/소문자 8~20글자만 가능합니다.");
	        form.id.focus();
	        return false;
	    }
	    if (form.password.value == ""){
	        alert("비밀번호를 입력하세요.");
	        form.password.focus();
	        return false;
	    }
	    if(form.password.value != form.pwcheck.value){
	        alert("비밀번호가 틀립니다.");
	        return false;
	    }
	    if (form.name.value == ""){
	        alert("이름을 입력하세요.");
	        form.name.focus();
	        return false;
	    }
	    if (form.birth.value == ""){
	        alert("생년월일을 입력하세요.");
	        form.birth.focus();
	        return false;
	    }
	    if (form.gender.value == ""){
	        alert("성별을 선택하세요.");
	        form.gender.focus();
	        return false;
	    }
	    if (form.email.value == ""){
	        alert("이메일을 입력하세요.");
	        form.email.focus();
	        return false;
	    }
	    if (form.tel.value == ""){
	        alert("전화번호를 입력하세요.");
	        form.tel.focus();
	        return false;
	    }
	    return true;
	}

	</script>


</head>

<body>
	<!--header-->
	<div class="main">
		<%@ include file="nav.jsp"%>

		<!--main-->
		<div class="signup">
			<fieldset>
				<legend>회원가입</legend>
				<form action="signUpProcess.jsp" method="post" id = "form" name="member" onsubmit="return check()">
					<div class="join_content">
						<div class="join_row_group">
							<h3 class="join_title">
								<label for="id">아이디</label>
							</h3>
							<span class="ps_box int_id"> 
								<input type="text" id="id" name="id" class="int" title="ID" maxlength="20" onchange="available()">
								<div id="id_check"></div>

							</span>
							<p id="available" style="font-size: 20px;"></p>
							<div class="join_row">
								<h3 class="join_title">
									<label for="pswd1">비밀번호</label>
								</h3>
								<span class="ps_box int_pass" id="pswd1Img"> <input
									type="password" id="pswd1" name="password" class="int"
									title="비밀번호 입력" aria-describedby="pswd1Msg" maxlength="20">
								</span>
								<h3 class="join_title">
									<label for="pswd2">비밀번호 재확인</label>
								</h3>
								<span class="ps_box int_pass_check" id="pswd2Img"> <input
									type="password" id="pswd2" class="int" title="비밀번호 재확인"
									aria-describedby="pswd2Blind" maxlength="20">
								</span>
							</div>
						</div>
						<div class="join_row_group">
							<h3 class="join_title">
								<label for="name">이름</label>
							</h3>
							<span class="ps_box box_right_space"> <input type="text"
								id="name" name="name" title="이름" class="int" maxlength="40">
							</span>
							<!--생년월일-->
							<div class="join_row join_birthday">
								<h3 class="join_title">
									<label for="yy">생년월일</label>
								</h3>
								<div class="bir_wrap">
									<div class="bir_yy">
										<span class="ps_box"> <input type="text" id="yy"
											name="birth" placeholder="생년월일 6자리" aria-label="생년월일 6자리"
											class="int" maxlength="6">
										</span>
									</div>
								</div>
							</div>
							<!--성별-->
							<div class="join_row join_gender">
								<h3 class="join_title">
									<label for="gender">성별</label>
								</h3>
								<div class="ps_box gender_code">
									<label class="male"><input type="radio" name="gender" value="male">남 </label>
									<label class="female"><input type="radio" name="gender" value="female"> 여 </label>
								</div>
							</div>
							<!--이메일-->
							<div class="join_row join_email">
								<h3 class="join_title">
									<label for="email">이메일</label>
								</h3>
								<span class="ps_box int_email box_right_space"> <input
									type="text" id="email" name="email" class="int" maxlength="100">
								</span>
							</div>
							<!--전화번호-->
							<div class="join_row join_tel">
								<h3 class="join_title">
									<label for="tel">전화번호</label>
								</h3>
								<span class="ps_box int_tel box_right_space"> <input
									type="tel" id="tel" name="tel" class="int" maxlength="13" oninput="phone()">
								</span>
							</div>
							
						</div>
						<div class="join_row_group">
							<!--버튼-->
							<div class="btn_area">
								<button type="submit" id="btnJoin" class="btn_type btn_primary">
									<span>회원가입</span>
								</button>
							</div>
						</div>
					</div>
				</form>
			</fieldset>
		</div>

		<%@ include file="footer.jsp"%>

		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
			crossorigin="anonymous"></script>
</body>
</html>