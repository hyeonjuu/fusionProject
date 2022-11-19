<%@page import="source.BankAccountDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="source.UserDAO" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="BankAccount" class="source.BankAccount" scope="page" />
<jsp:setProperty name="BankAccount" property="password"/>
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
	

	BankAccountDAO baDAO = new BankAccountDAO();
	int result = baDAO.create(BankAccount,(String)session.getAttribute("userID"));
	switch(result){
	case 1:
		script.println("<script>");
		script.println("alert('계좌생 성공')");
		script.println("location.href='main.jsp'");
		script.println("</script>");
		break;

	case -1:
		script.println("<script>");
		script.println("alert('존재하지 않는 아이디입니다.')");
		script.println("history.back()");
		script.println("</script>");
		break;
	
	default:
		script.println("<script>");
		script.println("alert('데이터베이스 오류')");
		script.println("history.back()");
		script.println("</script>");
		break;
	}
	
	
%>
</body>
</html>