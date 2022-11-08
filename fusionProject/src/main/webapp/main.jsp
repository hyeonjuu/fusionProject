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
<link rel="stylesheet" href="css/basic.css">
<link rel="stylesheet" href="css/main.css">

</head>

<body>
	<!--header-->
	<div class="main">
		<%@ include file="nav.jsp"%>


		<!--main-->	
		<div class="mainEvent">
			<div class="mainImg">
				<p>이미지 넣을 곳</p>
			</div>

		</div>
		<ol class="paging">
			<li class="on"><a href="#">1</a></li>
			<li><a href="#">2</a></li>
			<li><a href="#">3</a></li>

		</ol>
		<div class="mainAdd">
			<p>도움이 되실만한 정보를 원한다면</p>
		</div>

		<div class="mainMenu">
			<div class="box">
				<div class="boxHeader1">
					<h2>새소식</h2>
					<hr>
				</div>
				<p>안녕</p>
			</div>
			<div class="box">
				<div class="boxHeader2">
					<h2>공지사항</h2>
					<hr>
				</div>
				<p>안녕 못 해</p>
			</div>
			<div class="box">
				<div class="boxHeader3">
					<h2>QnA</h2>
					<hr>
				</div>
				<p>힝</p>
			</div>
		</div>
	</div>
	<%@ include file="footer.jsp" %>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>

</body>

</html>