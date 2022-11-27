
<%@page import="source.PostDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="source.UserDAO" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="Post" class="source.Post" scope="page" />
<jsp:setProperty name="Post" property="title"/>
<jsp:setProperty name="Post" property="contents"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
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
	
	PrintWriter script = response.getWriter();
	String userID = null;
	String userName = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
			UserDAO userDAO = new UserDAO();
			userName = userDAO.getUserName(userID);
	}
	
	
	Post.setWriter(userName);
	Post.setNo(postNo);
	Post.setCategory(category);
	int result =  postDAO.delete(postNo,category);
	
	if (result == -1){
		script.println("<script>");
		script.println("alert('오류가 발생하였습니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
	
	response.sendRedirect(category+".jsp");
	
	
	
	%>
<body>
    
</body>