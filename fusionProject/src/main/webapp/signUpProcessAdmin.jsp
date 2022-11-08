<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="source.AdminDAO" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="Admin" class="source.Admin" scope="page"/>
<jsp:setProperty name="Admin" property="id"/>
<jsp:setProperty name="Admin" property="name"/>
<jsp:setProperty name="Admin" property="password"/>
<jsp:setProperty name="Admin" property="birth"/>
<jsp:setProperty name="Admin" property="dept"/>
<jsp:setProperty name="Admin" property="rank"/>
<jsp:setProperty name="Admin" property="email"/>
<jsp:setProperty name="Admin" property="tel"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	PrintWriter script = response.getWriter();
	
	AdminDAO adminDAO = new AdminDAO();
	
	int result = adminDAO.signUpAdmin(Admin);
	if(result == -1){
		script.println("<script>");
		script.println("alert('뭔가 오류')");
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