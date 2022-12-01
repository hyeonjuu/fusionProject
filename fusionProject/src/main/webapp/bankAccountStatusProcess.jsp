<%@page import="source.AdminDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="source.UserDAO" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="BankAccount" class="source.BankAccount" scope="page" />
<jsp:setProperty name="BankAccount" property="status"/>
<jsp:setProperty name="BankAccount" property="bankNumber"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	<%
	
	System.out.print(BankAccount.getBankNumber()+"프로세스");
	
	AdminDAO adminDAO = new AdminDAO();
	int result = adminDAO.setStatus(BankAccount);
	System.out.print(result);
	PrintWriter script = response.getWriter();
	
	if (result == -1){
		script.println("<script>");
		script.println("alert('오류가 발생하였습니다.')");
		script.println("window.close()");
		script.println("</script>");
	} else{
		script.println("<script>");
		script.println("alert('수정되었습니다.')");
		script.println("window.close()");
		script.println("opener.location.reload()");
		script.println("</script>");
	}
	
	
	
	%>
<body>
    
</body>