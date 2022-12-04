<%@page import="source.DealDAO"%>
<%@page import="source.BankAccount"%>
<%@page import="source.BankAccountDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="source.UserDAO"%>
<%
request.setCharacterEncoding("UTF-8");
%>
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
	if (session.getAttribute("userID") != null) {
		userID = (String) session.getAttribute("userID");
	}

	String hostBankAccount = (String) request.getParameter("host");
	String targetBankAccount = (String) request.getParameter("target");
	String password = (String) request.getParameter("password");
	String showMessage = (String) request.getParameter("showMessage");
	int amount = Integer.parseInt(request.getParameter("amount"));

	DealDAO dealDAO = new DealDAO();
	BankAccount host = dealDAO.getBankAccount(hostBankAccount, password);
	System.out.print(password);
	if (host == null) {
		script.println("<script>");
		script.println("alert('비밀번호가 틀립니다.')");
		script.println("location.href='transfer.jsp'");
		script.println("</script>");
	}
	else if (host.getBalance() < amount) {
		script.println("<script>");
		script.println("alert('잔액이 부족합니다.')");
		script.println("location.href='transfer.jsp'");
		script.println("</script>");

	} else {
		BankAccount target = dealDAO.getBankAccount(targetBankAccount);

		if (target == null) {
			script.println("<script>");
			script.println("alert('존재하지 않는 계좌입니다.')");
			script.println("location.href='transfer.jsp'");
			script.println("</script>");

		} else {
			host.setBalance(host.getBalance() - amount);
			target.setBalance(target.getBalance() + amount);

			dealDAO.updateBalance(target);
			dealDAO.updateBalance(host);

			dealDAO.withdrawLog(host, target, amount, showMessage);
			dealDAO.depositLog(target, host, amount, showMessage);

			script.println("<script>");
			script.println("location.href='myAccounts.jsp'");
			script.println("</script>");
		}
	}
	%>
</body>
</html>