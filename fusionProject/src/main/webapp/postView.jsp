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
<title>게시글 상세 페이지</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/postView.css?after">
<link rel="stylesheet" href="css/basic.css?after">
</head>

<body>

	<!--header-->
	<div class="main">
		<%@ include file="nav.jsp"%>
		<%
			int postNo = 0;
			String category = null;
			
			if(request.getParameter("no") != null){
				postNo = Integer.parseInt(request.getParameter("no"));
			}
			if(request.getParameter("category") != null){
				category = (String)request.getParameter("category");
			}
			
			PostDAO postDAO = new PostDAO();
			Post post = postDAO.getPost(postNo, category);
			
			String viewCategory = postDAO.translateCategory(category);
			String title = post.getTitle().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>");
			String contents = post.getContents().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>");
			
		%>
		<!--main-->
		<div class="post_view">
                    <div class="container">
                        <legend class="main_title">게시글</legend>
						<fieldset class="middle_field">
							<div id="title_text">
								<span class="title_text"><%=title%></span>
							</div>
							<div id="post_date">
								<span class="post_type"><%=viewCategory %> | <%=post.getDateeOfIssue() %></span>
							</div> <br><br>
							<div id="main_text">
								<%=contents%>
							</div>
						</fieldset> <br>
						<button type="button" id="list_btn" onclick="location.href='<%=category%>.jsp'">
						목록으로
						</button>
						<%
						//어드민이라면
						%>
						<button type="button" id="list_btn" onclick="location.href='update.jsp?no=<%=postNo%>&category=<%=category%>'">
						수정하기
						</button>
						<button type="button" id="list_btn" onclick="location.href='deleteProcess.jsp?no=<%=postNo%>&category=<%=category%>'">
						삭제하기
						</button>
                    </div>
			</fieldset>
		</div>

		<%@ include file="footer.jsp" %>
		
		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
			crossorigin="anonymous"></script>
</body>
</html>