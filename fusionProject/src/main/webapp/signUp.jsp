<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	
	<form action="signUpProcess.jsp" method="post" name ="info">
		<p> 아이디 : <input type="text" name = "ID">
		<p> 비밀번호 : <input type ="password" name ="PASSWORD">
		<p>코드: <input type="text" name = "code">
<!-- 		<p>은행명: <input type="text" name = "name"> 테스트코드
		<p>이율: <input type="text" name = "rate"> -->
		<input type="submit" value="전송">
		<input type="reset" value ="리셋">
	 </form>
	
</body>
