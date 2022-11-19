<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>개인정보 입력</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/basic.css">
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
	margin: 10% 15% 10px 15%;
}

form {
	padding-left: 30px;
}

legend {
	text-align: center;
}
</style>
</head>

<body>
	<!--header-->
	<div class="main">
		<%@ include file="nav.jsp"%>

		<!--main-->
		<div class="signup">
			<fieldset>
				<legend>개인정보 입력</legend>
				<form action="bankAccountProcess.jsp" method="post" name="ADMIN">
					<p>직업구분</p>
					<input type="text" class="form-control" name="id" maxlength="15"
						size="10" style="width: 50%;">
					<p>거래목적</p>
					<input type="text" class="form-control" name="forWhy"
						maxlength="15" size="10" style="width: 50%;">
					<p>거래자금의 원천</p>
					<input type="text" class="form-control" name="forWhy"
						maxlength="15" size="10" style="width: 50%;">
					<p>거래자금이 본인 소유인가요?</p>
					<input type="radio" name="own">아니요 <input type="radio"
						name="own"> 예 <br> <br>

					<p>해외 납세 의무자인가요?</p>
					<input type="radio" name="foreign">아니요 <input type="radio"
						name="foreign"> 예 <br> <br>

					<p>비밀번호</p>
					<input type="password" class="form-control" name="password"
						maxlength="15" size="10" style="width: 50%;"> <br>

					<p>비밀번호 확인</p>
					<input type="password" class="form-control" name="password"
						maxlength="15" size="10" style="width: 50%;"> <br> <br>

					<input type="submit" class="btn btn-primary form-control"
						value="다음" style="width: 20%;">
				</form>
			</fieldset>
		</div>

	</div>

	<%@ include file="footer.jsp" %>


	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>

</body>

</html>