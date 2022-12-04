<%@page import="java.util.ArrayList"%>
<%@page import="source.PostDAO"%>
<%@page import="source.Post"%>
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
		
		<div class="slidebox">
            <input type="radio" name="slide" id="slide01" checked>
            <input type="radio" name="slide" id="slide02" >
            <input type="radio" name="slide" id="slide03" >
            <input type="radio" name="slide" id="slide04" >
                <ul class="slidelist">
                    <li class="slideitem">
                        <div>
                            <label for="slide04" class="left"><img src="img/left.png" width="25" height="25" alt=""/></label>
                            <label for="slide02" class="right"><img src="img/right.png" width="25" height="25" alt=""/></label>
                            <a><img src="img/slide01.png" alt="이미지"></a>
                        </div>
                    </li>
                    <li class="slideitem">
                        <div>
                            <label for="slide01" class="left"><img src="img/left.png" width="25" height="25" alt=""/></label>
                            <label for="slide03" class="right"><img src="img/right.png" width="25" height="25" alt=""/></label>
                            <a><img src="img/slide02.png" onclick="location.href='bankAccountTerms.jsp'" alt="이미지"></a>
                        </div>
                    </li>
                    <li class="slideitem">
                        <div>
                            <label for="slide02" class="left"><img src="img/left.png" width="25" height="25" alt=""/></label>
                            <label for="slide04" class="right"><img src="img/right.png" width="25" height="25" alt=""/></label>
                            <a><img src="img/slide03.png" onclick="location.href='postView.jsp?no=5&category=news'" alt="이미지"></a>
                        </div>
                    </li>
                    <li class="slideitem">
                        <div>
                            <label for="slide03" class="left"><img src="img/left.png" width="25" height="25" alt=""/></label>
                            <label for="slide01" class="right"><img src="img/right.png" width="25" height="25" alt=""/></label>
                            <a><img src="img/slide04.png" onclick="location.href='postView.jsp?no=4&category=news'" alt="이미지"></a>
                        </div>
                    </li>
                </ul>
        </div>
		<div class="mainAdd">
			<p>도움이 되실만한 정보를 원한다면</p>
		</div>

		<div class="mainMenu">
			<div class="box">
				<div class="boxHeader1">
					<h2 onclick="location.href='news.jsp'">새소식</h2>
					<hr>
				</div>
				<ul>
				<%
				PostDAO postDAO = new PostDAO();
				ArrayList<Post> list = postDAO.getPostList("news", 1);
				for (int i = 0; i < 5; i++) {
					Post post = list.get(i);
				%>
					<li>
					<a href="postView.jsp?no=<%=post.getNo()%>&category=<%=post.getCategory()%>">
					<%=post.getTitle() %></a>
					</li>
					<%} %>
				</ul>
			</div>
			<div class="box">
				<div class="boxHeader2">
					<h2 onclick="location.href='notice.jsp'">공지사항</h2>
					<hr>
				</div>
				<ul>
				<%
				list = postDAO.getPostList("notice", 1);
				for (int i = 0; i < 5; i++) {
					Post post = list.get(i);
				%>
					<li>
					<a href="postView.jsp?no=<%=post.getNo()%>&category=<%=post.getCategory()%>">
					<%=post.getTitle() %></a>
					</li>
				<% } %>
				</ul>
			</div>
			<div class="box">
				<div class="boxHeader3">
					<h2 onclick="location.href='qna.jsp'">QnA</h2>
					<hr>
				</div>
				<ul>
				<%
				list = postDAO.getPostList("qna", 1);
				for (int i = 0; i < 5; i++) {
					Post post = list.get(i);
				%>
					<li>
					<a href="postView.jsp?no=<%=post.getNo()%>&category=<%=post.getCategory()%>">
					<%=post.getTitle() %></a>
					</li>
				<% } %>
				</ul>
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