<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>상품가입 완료 페이지</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/BankAccountWelcome.css?after">
<link rel="stylesheet" href="css/basic.css?after">
</head>

<body>
	<!--header-->
	<div class="main">
		<%@ include file="nav.jsp"%>
	<% String name = (String)request.getAttribute("name");  
		String bankNumber = (String)request.getAttribute("bankNumber"); 
		String bank = (String)request.getAttribute("bank"); 
		String date = (String)request.getAttribute("date"); 

	%>
		<!--main-->
		<div class="bankaccountwelcome">
			<fieldset>
				<img src="" alt="QR코드">
				<legend>상품 가입이 완료되었습니다.</legend>
				<form action="" method="post" name="member" id="bankaccountwelcome">
					<!-- 신청인 -->
					<div class="applicant">
						<h3 class="title">
							<label>신청인</label>
						</h3>
						<span class="applicant_main"> <input type="text" value="<%=userName%>">
						</span>
					</div>
					<!-- 상품명 및 계좌번호 -->
					<div class="middle">
						<div class="middle1">
							<h3 class="title">
								<label>상품명</label>
							</h3>
							<span class="product_name"> <input type="text" value="<%=name%>">
							</span>
						</div>
						<div class="middle2">
							<h3 class="title">
								<label>계좌번호</label>
							</h3>
							<span class="accountNum"> <input type="text" value="<%=bankNumber%>">
							</span>
						</div>
					</div>
					<!-- 개설일 -->
					<div class="openingDate">
						<h3 class="title">
							<label>개설일</label>
						</h3>
						<span class="openingDate_main"> <input type="text" value="<%=date%>">
						</span>
					</div>
					<!-- 메인 버튼 -->
					<div class="btn">
						<button type="button" class="mainBtn" onclick="location.href='main.jsp'">
							<span>메인으로</span>
						</button>
					</div>
				</form>
			</fieldset>
		</div>
		
		<%@ include file="footer.jsp" %>

		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
			crossorigin="anonymous"></script>
</body>
</html>