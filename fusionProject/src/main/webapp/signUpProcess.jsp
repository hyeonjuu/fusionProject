<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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
	
	UserDAO userDAO = new UserDAO();
	int result = userDAO.signUp(Member);
	if(result == -1){
		script.println("<script>");
		script.println("alert('오류가 발생했습니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
	if(result == -2){
		script.println("<script>");
		script.println("alert('아이디 중복')");
		script.println("history.back()");
		script.println("</script>");
	}
	else{
		script.println("<script>");
		script.println("alert('가입 성공')");
		script.println("location.href='login.jsp'");
		script.println("</script>");
			
		
		}
	
%>
</body>
</html>