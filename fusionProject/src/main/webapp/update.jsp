<%@page import="source.Post"%>
<%@page import="source.PostDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>글 작성하기</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/basic.css">
</head>

<body>
	<!--header-->
	<div class="main">
		<%@ include file="nav.jsp"%>
		<%
		int postNo = 0;
		String category = null;

		if (request.getParameter("no") != null) {
			postNo = Integer.parseInt(request.getParameter("no"));
		}
		if (request.getParameter("category") != null) {
			category = (String) request.getParameter("category");
		}
		
		PostDAO postDAO = new PostDAO();
		Post post = postDAO.getPost(postNo, category);
		%>
		<div class="container">
			<div class="row">
				<form method="post" action="updateProcess.jsp?no=<%=postNo%>&category=<%=category%>">
					<table class="table table-striped"
						style="text-align: center; border: 1px solid #dddddd">
						<thead>
							<tr>
								<th colspan="2"
									style="background-color: #eeeeee; text-align: center;">게시글 수정하기
								</th>
							</tr>
						</thead>
						<tbody>
							<tr>
								<td><input type="text" class="form-control"
									placeholder="글 제목" name="title" maxlength="50" value="<%=post.getTitle() %>"></td>
							</tr>
							<tr>
								<td><textarea class="form-control" placeholder="글 내용"
										name="contents" maxlength="2048" style="height: 350px;"><%=post.getContents() %></textarea></td>
							</tr>
						</tbody>
					</table>
					<input type="submit" class="btn btn-primary pull-right" value="수정하기">
				</form>
			</div>
		</div>

		<%@ include file="footer.jsp"%>

		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
			crossorigin="anonymous"></script>
	</div>
</body>