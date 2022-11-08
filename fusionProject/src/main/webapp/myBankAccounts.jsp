<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>이체내역</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet" href="/css/MyBankAccounts.css">
</head>

<body>
	<!--header-->
	<div class="main">
		<%@ include file="nav.jsp"%>

		<!--main-->
		<div class="mybankaccounts">
			<fieldset id="main_field">
				<legend>내 계좌</legend>
				<!--총 계좌 목록-->
				<fieldset id="bank_list_field">
					<div id="bank_list_money">
						<h3 id="bank_list_h3">총 2개</h3>
						<h1 id="mybank_money">327,000원</h1>
					</div>
				</fieldset>
				<!--계좌1-->
				<fieldset id="mybank">
					<div id="user_bank">
						<div>
							<h3 id="mybank_h3">홍길동</h3>
							<h3 id="mybank_h3">1234-5678-1234</h3>
						</div>
						<div id="dropdownmenu"></div>
					</div>
					<div id="bank_money">
						<div>
							<h4>KH예금통장</h4>
							<h4>2022.10.31 11:04</h4>
						</div>
						<div>
							<h1 id="mybank_money">300,000원</h1>
						</div>
					</div>
				</fieldset>
				<!--계좌2-->
				<fieldset id="mybank">
					<div id="user_bank">
						<h3 id="mybank_h3">홍길동</h3>
						<h3 id="mybank_h3">1234-5678-1234</h3>
						<br>
					</div>
					<div id="bank_money">
						<div>
							<h4>KH예금통장</h4>
							<h4>2022.10.31 11:04</h4>
						</div>
						<div>
							<h1 id="mybank_money">27,000원</h1>
						</div>
					</div>
				</fieldset>
			</fieldset>
		</div>

		<%@ include file="footer.jsp" %>

		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
			crossorigin="anonymous"></script>
</body>
</html>