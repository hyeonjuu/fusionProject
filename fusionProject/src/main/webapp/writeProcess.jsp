
<%@page import="source.AdminDAO"%>
<%@page import="source.PostDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="source.UserDAO" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="Post" class="source.Post" scope="page" />
<jsp:setProperty name="Post" property="category"/>
<jsp:setProperty name="Post" property="title"/>
<jsp:setProperty name="Post" property="contents"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	<%
	PostDAO postDAO = new PostDAO();
	String category = Post.getCategory();
	
	PrintWriter script = response.getWriter();
	String userID = null;
	String userName = null;
	String adminID = null;
	String userRank = null;
		if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
			UserDAO userDAO = new UserDAO();
			userName = userDAO.getUserName(userID);
	}
		if(session.getAttribute("adminID") != null){
			session.removeAttribute("userID");
			adminID = (String) session.getAttribute("adminID");
			AdminDAO adminDAO = new AdminDAO();
			userName = adminDAO.getUserName(adminID);
			userRank = adminDAO.getUserRank(adminID);
		}
	
	
	Post.setWriter(userName);
 	System.out.println(Post.getCategory());
 	System.out.println(Post.getTitle());
 	System.out.println(Post.getContents());
 	System.out.println(Post.getWriter());
	
	int result =  postDAO.createPost(Post);
	
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