<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>고객정보수정</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/basic.css?after">
<link rel="stylesheet" href="css/amendUserAccount.css?after">

</head>

<body>

	<!--header-->
	<div class="main">
		<%@ include file="nav.jsp"%>


		<!--main-->	
		<div class="amenduseraccount">
			<fieldset class="main_field">
				<legend>User님의 정보</legend>
				<form action="#" method="post" name="modify">
					<p>ID</p>
					<input type="text" class="form-control" name="id" maxlength="15" value ="">

					<p>이메일</p>
					<input type="email" class="form-control" name="adress" value="" >

					<p>전화번호</p>
					<input type="tel" class="form-control" name="tel" value="">

                    <p>신용도</p>
                    <select class="form-control" name="creditrating">
                        <option value="1">1</option>
                        <option value="2">2</option>
                        <option value="3">3</option>
                        <option value="4">4</option>
                        <option value="5">5</option>
                    </select>

					<p>은행 계좌</p>
					<div class="account_flex">
						<div>
							<select class="flex form-control" name="bankaccount">
                   	     		<option value="xxxx-xx-xxxxxxx">xxxx-xx-xxxxxxx</option>
                   	     		<option value="0000-00-0000000">0000-00-0000000</option>
                  	  		</select>
						</div>
                		<div>
                			<input type="button" class="flex btn btn-primary" value="계좌 조회">
                		</div>
					</div>
					
                    <input type="submit" class="btn btn-primary" value="변경">
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