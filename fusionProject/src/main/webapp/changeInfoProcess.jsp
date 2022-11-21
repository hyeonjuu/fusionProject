<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter"%>
<%@ page import="source.UserDAO" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="Member" class="source.Member" scope="page"/>
<jsp:setProperty name="Member" property="id"/>
<jsp:setProperty name="Member" property="name"/>
<jsp:setProperty name="Member" property="password"/>
<jsp:setProperty name="Member" property="birth"/>
<jsp:setProperty name="Member" property="gender"/>
<jsp:setProperty name="Member" property="email"/>
<jsp:setProperty name="Member" property="tel"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	PrintWriter script = response.getWriter();
	String userID = null;
	if(session.getAttribute("userID") != null){
		userID = (String)session.getAttribute("userID");
	}
	
	
	%>
</body>
</html>