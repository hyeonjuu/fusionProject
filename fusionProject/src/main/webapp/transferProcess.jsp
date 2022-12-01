<%@page import="source.DealDAO"%>
<%@page import="source.BankAccount"%>
<%@page import="source.BankAccountDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="source.UserDAO" %>
<% request.setCharacterEncoding("UTF-8"); %>
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
	
	String hostBankAccount = (String)request.getParameter("host");
	String targetBankAccount = (String)request.getParameter("target");
	String password = (String)request.getParameter("password");
	String showMessage = (String)request.getParameter("showMesseage");
	int amount = Integer.parseInt(request.getParameter("amount"));
	
	DealDAO dealDAO = new DealDAO();
	BankAccount host = dealDAO.getBankAccount(hostBankAccount);
	BankAccount target = dealDAO.getBankAccount(targetBankAccount);
	
	int result = dealDAO.deposit(host, target, amount, showMessage);
	System.out.println(result);
%>
</body>
</html>