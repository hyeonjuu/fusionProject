<%@page import="source.BankAccount"%>
<%@page import="source.BankAccountDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="source.UserDAO" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="BankAccount" class="source.BankAccount" scope="session" />
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
	int create = baDAO.create((String)session.getAttribute("userID"),BankAccount.getPassword());
	
	if(create == 1){
		int result = baDAO.selectBankAccountNumber(BankAccount);
		
		request.setAttribute("bankNumber", BankAccount.getBankNumber());
		request.setAttribute("bank", BankAccount.getBank());
		request.setAttribute("name", BankAccount.getName());
		request.setAttribute("date", BankAccount.getDate());
		
		request.getRequestDispatcher("bankAccountWelcome.jsp").forward(request,response);
	}else{
	
		script.println("<script>");
		script.println("alert('데이터베이스 오류')");
		script.println("history.back()");
		script.println("</script>");
	}
	
	
%>
</body>
</html>