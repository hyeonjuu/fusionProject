
<%@page import="java.io.PrintWriter"%>
<%@page import="source.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>메인페이지</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/basic.css?after">
<style>
.btn-primary {
	color: #fff;
	background-color: #ff7979;
	border-color: #ff7979;
}

.btn-primary:hover {
	color: #fff;
	background-color: #ff5656;
	border-color: #ff5656;
}

.btn:focus, .btn:active {
	outline: none !important;
	box-shadow: none !important;
}

.form-control:focus, .form-control:active {
	outline: none !important;
	box-shadow: none !important;
}

fieldset {
	border: 1px solid #ff7979;
	border-radius: 10px;
	padding-top: 30px;
	margin: 5% 15% 5% 15%;
}

form {
	padding-left: 20%;
}

legend {
	text-align: center;
}

p {
	margin-bottom: 5px;
	margin-top: 5px;
}
</style>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	var pwdReg = RegExp(/^[0-9]{4}$/);
	$("#password").change(function(){
		if(!pwdReg.test($("#password").val())){
        	alert("비밀번호는 숫자로만 4글자 입력하세요.");
        	$("#password").val("");
            $("#password").focus();
            
        }
	})
	$("#pwdChk").change(function(){
		if(!pwdReg.test($("#pwdChk").val())){
        	alert("비밀번호는 숫자로만 4글자 입력하세요.");
        	$("#pwdChk").val("");
            $("#pwdChk").focus();
            
        }
	})
	
	
	$("#go").click(function(){    
        
        if($("#password").val() == ""){
        	alert("비밀번호를 입력하세요.");
            $("#password").focus();
            return;
        }
        
        if($("#password").val() != ($("#pwdChk").val())){
            alert("비밀번호가 일치하지 않습니다.");
            $("#pwdChk").focus();
            return;
        }else{
            $("#form").submit();
        }
    });


	
 });
 </script>

</head>

<body>
	<!--header-->
	<div class="main">
		<%@ include file="nav.jsp"%>
		
		<% 
		PrintWriter script = response.getWriter();
		if(userID == null){
			script.println("<script>");
			script.println("alert('로그인 후 이용하세요.')");
			script.println("location.href='main.jsp'");
			script.println("</script>");
		}
		
		UserDAO userDAO = new UserDAO();
		Member member = userDAO.getInfo(userID);
		
		String id = member.getId();
		String email = member.getEmail();
		String tel = member.getTel();
		
		%>

		<!--main-->
		<div class="signup">
			<fieldset>
				<legend>개인정보 수정</legend>
				<form action="changeInfoProcess.jsp" method="post" name="modify">
					<p>ID</p>
					<input type="text" class="form-control" name="id" maxlength="15"
						size="10" style="width: 70%;" value ="<%=id%>">
					<p>비밀번호</p>
					<input type="password" id="password" class="form-control" name="password"
						maxlength="15" size="10"
						style="width: 70%; border-top: 0px; border-left: 0px; border-right: 0px; border-radius: 0;">
					<p>비밀번호 확인</p>
					<input type="password" id="pwdChk" class="form-control" name="passwordChk"
						maxlength="15" size="10"
						style="width: 70%; border-top: 0px; border-left: 0px; border-right: 0px; border-radius: 0;">
					<p style="color: #15db15; font-size: 10px;">&nbsp;&nbsp;&nbsp;&nbsp;비밀번호가
						일치합니다.</p>
					<p style="color: #ff7979; font-size: 10px;">&nbsp;&nbsp;&nbsp;&nbsp;비밀번호가
						일치하지 않습니다.</p>

					<p>이메일</p>
					<input type="text" class="form-control" name="email" size="10"
						style="width: 70%; border-top: 0px; border-left: 0px; border-right: 0px; border-radius: 0;"value="<%=email%>" >

					<p>전화번호</p>
					<input type="text" class="form-control" name="tel"
						size="10"
						style="width: 70%; border-top: 0px; border-left: 0px; border-right: 0px; border-radius: 0;" value="<%=tel%>">
					<br> <br> <input type="submit"
						class="btn btn-primary form-control" value="변경"
						style="width: 20%; margin-left: 25%; margin-bottom: 5%;">
				</form>
			</fieldset>
		</div>
	</div>

	<%@ include file="footer.jsp"%>




	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>

</body>

</html>