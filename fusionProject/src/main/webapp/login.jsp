<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<form action="loginProcess.jsp" method="post" name ="info">
		<p> 아이디 : <input type="text" name = "ID" placeholder="아이디">
		<p> 비밀번호 : <input type ="password" name ="PASSWORD" placeholder="비밀번호">
		
		<input type="submit" value="전송">
		<input type="reset" value ="리셋">
	 </form>
	
</body>
