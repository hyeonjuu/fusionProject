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
<link rel="stylesheet" href="css/basic.css?after">
<link rel="stylesheet" href="css/bankAccountSignUp.css?after">
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
					<div>
						<p>직업구분</p>
						<input type="text" class="form-control" name="id" maxlength="15" size="10">
					</div>
					<div>
						<p>거래목적</p>
						<input type="text" class="form-control" name="forWhy" maxlength="15" size="10">
					</div>
					<div>
						<p>거래자금의 원천</p>
						<input type="text" class="form-control" name="forWhy" maxlength="15" size="10">
					</div>
					<div class="radio_div">
						<p>거래자금이 본인 소유인가요?</p>
						<input type="radio" name="own" class="form-radio1">아니요
						<input type="radio" name="own" class="form-radio2"> 예 <br> <br>
					</div>
					<div class="radio_div">
						<p>해외 납세 의무자인가요?</p>
						<input type="radio" name="foreign" class="form-radio1">아니요
						<input type="radio" name="foreign" class="form-radio2"> 예 <br> <br>
					</div>
					<div>
						<p>비밀번호</p>
						<input type="password" class="form-control" name="password" maxlength="15" size="10"> <br>
					</div>
					<div>
						<p>비밀번호 확인</p>
						<input type="password" class="form-control" name="password" maxlength="15" size="10"> <br> <br>
					</div>	
					<div>
						<input type="submit" class="btn btn-primary form-control" value="다음">
					</div>
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