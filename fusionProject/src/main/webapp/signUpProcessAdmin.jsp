<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="source.UserDAO" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="Account" class="source.Account" scope="page"/>
<jsp:setProperty name="Account" property="id"/>
<jsp:setProperty name="Account" property="password"/>
<jsp:setProperty name="Account" property="code"/>
<jsp:useBean id="Member" class="source.Member" scope="page"/>
<jsp:setProperty name="Member" property="name"/>
<jsp:setProperty name="Member" property="birth"/>
<jsp:setProperty name="Member" property="gender"/>
<jsp:setProperty name="Member" property="email"/>
<jsp:setProperty name="Member" property="addr"/>
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
	if(Account.getId() == null || Account.getPassword() == null){
		script.println("<script>");
		script.println("alert('빈 칸 존재')");
		script.println("history.back()");
		script.println("</script>");
	}else{
	UserDAO userDAO = new UserDAO();
	int result = userDAO.signUp(Account,Member);
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
	}
%>
</body>
</html>