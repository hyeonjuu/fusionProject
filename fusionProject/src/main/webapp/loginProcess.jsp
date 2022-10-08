<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="source.UserDAO" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="Account" class="source.Account" scope="page" />
<jsp:setProperty name="Account" property="id"/>
<jsp:setProperty name="Account" property="password"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	UserDAO userDAO = new UserDAO();
	PrintWriter script = response.getWriter();
	int result = userDAO.login(Account.getId(),Account.getPassword());
	switch(result){
	case 1:
		
		script.println("<script>");
		script.println("alert('로그인 성공')");
		script.println("location.href='main.jsp'");
		script.println("</script>");
		break;
	case 0:
		script.println("<script>");
		script.println("alert('비밀번호가 틀립니다.')");
		script.println("history.back()");
		script.println("</script>");
		break;
	
	case -1:
		script.println("<script>");
		script.println("alert('존재하지 않는 아이디입니다.')");
		script.println("history.back()");
		script.println("</script>");
		break;
	
	case -2:
		script.println("<script>");
		script.println("alert('데이터베이스 오류')");
		script.println("history.back()");
		script.println("</script>");
		break;
	}
	
	
%>
</body>
</html>