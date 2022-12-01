<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	<!DOCTYPE html>
	<html lang="en">
	<head>
		<meta charset="UTF-8">
		<meta http-equiv="X-UA-Compatible" content="IE=edge">
		<meta name="viewport" content="width=device-width, initial-scale=1.0">
		<title>계좌 상태 수정</title>
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
			integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
		<link rel="stylesheet" href="css/bankAccountStatus.css?after">
	</head>
	
	<body>
	<%
		String bankNumber = null;
		if(request.getParameter("bankNumber") != null){
			bankNumber = (String)request.getParameter("bankNumber");
		}

	%>
		<!--main-->
		<div class="backaccountstatus">
			<fieldset class="main_field">
				<!-- 거래가능 및 거래중지 (대기)-->
				<fieldset class="account_status">
					<form action="bankAccountStatusProcess.jsp" method="post" name="member" id="accountstatus">
						<label>계좌번호 : <input type="text" name="bankNumber" value= "<%=bankNumber %>" readonly></label>
						<div> 
							<input type="radio" name="status" value="거래가능"> 거래가능
							<input type="radio" name="status" value="거래중지"> 거래중지
							<input type="radio" name="status" value="대기"> 대기	
						</div>
						<input type="submit" value="저장">
					</form>
				</fieldset>
			</fieldset>
		</div>

		<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>

	</body>
	</html>