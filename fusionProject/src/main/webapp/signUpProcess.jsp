<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="source.UserDAO" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="Account" class="source.Account" scope="page"/>
<jsp:setProperty name="Account" property="ID"/>
<jsp:setProperty name="Account" property="PASSWORD"/>
<jsp:setProperty name="Account" property="code"/>
<jsp:useBean id="Bank" class="source.Bank" scope="page"/>
<jsp:setProperty name="Bank" property="name"/>
<jsp:setProperty name="Bank" property="rate"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%
	PrintWriter script = response.getWriter();
	if(Account.getID() == null || Account.getPASSWORD() == null){
		script.println("<script>");
		script.println("alert('빈 칸 존재')");
		script.println("history.back()");
		script.println("</script>");
	}else{
	UserDAO userDAO = new UserDAO();
	int result = userDAO.join(Account);
	if(result == -1){
		script.println("<script>");
		script.println("alert('아이디의 길이가 짧습니다.')");
		script.println("history.back()");
		script.println("</script>");
	}else{
		script.println("<script>");
		script.println("alert('가입 성공')");
		script.println("location.href='login.jsp'");
		script.println("</script>");
			
		
		}
	}
%>
</body>
</html>