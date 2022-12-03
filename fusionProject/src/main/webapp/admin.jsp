<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>개발혁동조합 관리자 페이지</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/basic.css">
<!-- <link rel="stylesheet" href="css/LogIn.css?after"> -->

<style>
html {
	background-color: #eeeeee;
}
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
.main_admin{
	background-color:#f7f9f6;
	in-width: 360px;
    position: fixed;
    overflow: hidden;
    width: 100%;
    height: 100%;
}
.login_box{
	background-color:#ffffff;
	    min-width: 0;
    padding: 0;
    border: 1px solid #000000;
    border-radius: 10px;
    text-align: center;
    border-color: #ff7979;
    margin: 10% 25% 5% 25%;
}

.search {
    display: flex;
    text-align: center;
    justify-content: center;
}
.bottomLine{
    border-left :1px solid #808080;
    height: 25px;
    margin: 0px 10px 0px 10px;
}


.search a {
    text-decoration: none;
    color: #000000;
}
.search a:hover {
    text-decoration-line: underline;
}
.login_field{
	margin-top: 1em;
}
.login_field > h3{
	color:#ff7979;
}

</style>
</head>

<body>
	<!--header-->
	<div class="main_admin">

		<!--main-->
		<div class="login">
			<div class="login_wrap">
				
			<div class="login_box">
				<fieldset class="login_field">
				<h3>개발혁동조합 관리자 페이지</h3>
					<legend>관리자 로그인</legend>
					<form action="adminProcess.jsp" method="post" name="member">
						<input type="text" placeholder="ID" class="form-control" name="id"
							maxlength="15" size="20" style="width: 50%; margin-left: 25%;">
						<input type="password" placeholder="PW" class="form-control"
							name="password" maxlength="15" size="20"
							style="width: 50%; margin-left: 25%;"> <br> 
						<input type="submit" class="btn btn-primary form-control" value="로그인"
							style="width: 50%;"> <br> <br>
					</form>
				</fieldset>
			</div>

			<div class="search">
				<div class="searchID">
					<a class="s-ID" href="findAccount.jsp">아이디 찾기</a>
				</div>
				<div class="bottomLine"></div>
				<div class="searchPW">
					<a class="s-PW" href="findAccount.jsp">비밀번호 찾기</a>
				</div>
				<div class="bottomLine"></div>
				<div class="signIn">
					<a class="s-In" href="signUpAdmin.jsp">회원가입</a>
				</div>
			</div>
		</div>

	</div>
</div>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>

</body>

</html>