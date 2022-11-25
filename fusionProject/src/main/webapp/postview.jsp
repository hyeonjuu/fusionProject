<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>게시글 상세 페이지</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet" href="./css/PostList.css">
<link rel="stylesheet" href="./css/basic.css">
</head>

<body>
	<!--header-->
	<div class="main">
		<%@ include file="nav.jsp"%>

		<!--main-->
		<div class="post_view">
			<fieldset class="main_field">
                <form action="#" method="post" name="member">
                    <div class="container">
                        <legend class="main_title">게시글</legend>
						<fieldset class="middle_field">
							<div id="title_text">
								<span class="title_text">대면 편취형 보이스피싱 피해 주의</span>
							</div>
							<div id="post_date">
								<span class="post_type">게시판 | 2022.11.25</span>
							</div> <br><br>
							<div id="main_text">
최근 "대면편취형 보이스피싱" 피해사례가 급증하고 있어, 각별한 주의를 당부드립니다.
							</div>
						</fieldset> <br>
						<input type="button" id="list_btn" value="목록으로">	
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