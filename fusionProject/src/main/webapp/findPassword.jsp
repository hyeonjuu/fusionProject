<%@page import="java.io.PrintWriter"%>
<%@page import="source.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
 <% request.setCharacterEncoding("UTF-8"); %>
<jsp:useBean id="Member" class="source.Member" scope="page" />
<jsp:setProperty name="Member" property="id"/>
<jsp:setProperty name="Member" property="email"/>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	PrintWriter script = response.getWriter();
	UserDAO userDAO = new UserDAO();
	String name = userDAO.findPassword(Member.getId(),Member.getEmail());
	
	if(name == null){
		script.println("<script>");
		script.println("alert('해당하는 계정이 없습니다.')");
		script.println("location.href='findAccount.jsp'");
		script.println("</script>");
	}else{
		script.println("<script>");
		script.println("alert(' 고객님의 비밀번호는 "+name+" 입니다.')");
		script.println("location.href='findAccount.jsp'");
		script.println("</script>");
	}
	%>
</body>
</html>