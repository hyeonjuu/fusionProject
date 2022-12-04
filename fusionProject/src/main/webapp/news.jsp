<%@page import="source.Post"%>
<%@page import="java.util.ArrayList"%>
<%@page import="source.PostDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>새소식</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/PostList.css?after">
<link rel="stylesheet" href="css/basic.css?after?after">
</head>


<body>
	<!--header-->
	<div class="main">
		<%@ include file="nav.jsp"%>
		<%
		int pageNumber = 1;

		if (request.getParameter("pageNumber") != null) {
			pageNumber = Integer.parseInt(request.getParameter("pageNumber"));
		}
		%>
		<!--main-->
		<div class="findaccount">
			<fieldset id="main_field">
				<div class="container">
					<legend>새소식</legend>
					<div class="row">
						<table class="table">
							<thead>
								<tr>
									<th>번호</th>
									<th>작성자</th>
									<th>제목</th>
									<th>작성일자</th>
								</tr>
							</thead>
							<tbody style="border-top: none">
							<%
							PostDAO postDAO = new PostDAO();
							ArrayList<Post> list = postDAO.getPostList("news", pageNumber);
							for (int i = 0; i < list.size(); i++) {
								Post post = list.get(i);
								String title = post.getTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>");
								
								%>
							
								<tr>
									<td><%=post.getNo()%></td>
									<td><%=post.getWriter() %></td>
									<td><a href="postView.jsp?no=<%=post.getNo()%>&category=<%=post.getCategory()%>">
										<%=title%>
										</a></td>
									<td><%=post.getDateeOfIssue()%></td>
								</tr>
								<%
								}
								%>
							</tbody>
						</table>
					</div>
					<div>
						<%
						if (pageNumber != 1) {
						%>
						<button class="nextBtn" type="button"
							onclick="location.href='news.jsp?pageNumber=<%=pageNumber - 1%>';">
							<span>이전</span>
						</button>
						<%
						}
						if (postDAO.nextPage("news", pageNumber + 1)) {
						%>
						<button class="nextBtn" type="button"
							onclick="location.href='news.jsp?pageNumber=<%=pageNumber + 1%>';">
							<span>다음</span>
						</button>
						<%
						}
						%>

					</div>
					<div>
						<button class="writeBtn" type="button" onclick="location.href='./write.jsp';">
							<span>글쓰기</span>
						</button>
					</div>


				</div>
			</fieldset>
		</div>

		<%@ include file="footer.jsp"%>

		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
			crossorigin="anonymous"></script>
</body>
</html>
</html>