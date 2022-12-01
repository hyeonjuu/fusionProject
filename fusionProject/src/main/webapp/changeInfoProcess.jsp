<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter"%>
<%@ page import="source.UserDAO" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="Member" class="source.Member" scope="page"/>
<jsp:setProperty name="Member" property="id"/>
<jsp:setProperty name="Member" property="name"/>
<jsp:setProperty name="Member" property="password"/>
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
	Member.setId(userID);
	
	UserDAO userDAO = new UserDAO();
	int result = userDAO.updateInfo(Member);
	
	if(result == -1){
		script.println("<script>");
		script.println("alert('오류가 발생했습니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
	else{
		script.println("<script>");
		script.println("alert('수정되었습니다.')");
		script.println("location.href='main.jsp'");
		script.println("</script>");
	}
	
	%>
</body>
</html>