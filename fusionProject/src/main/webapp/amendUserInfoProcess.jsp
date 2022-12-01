<%@page import="source.AdminDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="source.UserDAO" %>
<% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="Member" class="source.Member" scope="page"/>
<jsp:setProperty name="Member" property="id"/>
<jsp:setProperty name="Member" property="name"/>
<jsp:setProperty name="Member" property="gender"/>
<jsp:setProperty name="Member" property="email"/> 
<jsp:setProperty name="Member" property="tel"/> 
<jsp:setProperty name="Member" property="rank"/> 
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
	<%
	
	
	AdminDAO adminDAO = new AdminDAO();
	int result = adminDAO.updateInfo(Member);
	System.out.print(result);
	PrintWriter script = response.getWriter();
	
	if (result == -1){
		script.println("<script>");
		script.println("alert('오류가 발생하였습니다.')");
		script.println("location.href='users.jsp'");
		script.println("</script>");
	} else{
		script.println("<script>");
		script.println("alert('수정되었습니다.')");
		script.println("location.href='users.jsp'");
		script.println("</script>");
	}
	
	
	
	%>
<body>
    
</body>