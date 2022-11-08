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
<jsp:setProperty name="Admin" property="code"/>
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
	if(result == -2){
		script.println("<script>");
		script.println("alert('오류가 발생했습니다.')");
		script.println("history.back()");
		script.println("</script>");
	}
	if(result == -1){
		script.println("<script>");
		script.println("alert('관리자 코드를 확인해 주세요.')");
		script.println("history.back()");
		script.println("</script>");
	}
	else{
		script.println("<script>");
		script.println("alert('가입 성공')");
		script.println("location.href='admin'");
		script.println("</script>");
			
		
	}
	
%>
</body>
</html>