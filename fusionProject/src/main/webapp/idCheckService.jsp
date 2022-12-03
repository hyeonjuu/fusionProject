<%@page import="source.UserDAO"%>
<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
	request.setCharacterEncoding("UTF-8");
	// ajax로 값을 받기 때문에 UTF-8로 인코딩해준다
	response.setCharacterEncoding("EUC-KR");
				
	String userId = request.getParameter("userId");
	// join.jsp에서 받아온 key값이 userId이고
	// value값은 유저가 실제로 적은 값, String userId에는 value값이 들어간다.
	PrintWriter print = response.getWriter();
			
	UserDAO userdao = new UserDAO();
			
	int idChcek = userdao.checkId(userId);

	// 성공여부 확인 : 개발자용
	if (idChcek == 0) {
		System.out.println("이미 존재하는 아이디입니다.");
	} else if (idChcek == 1) {
		System.out.println("사용 가능한 아이디입니다.");
	}
			
	print.write(idChcek + ""); // --> ajax 결과값인 result가 됨
			// --> String으로 값을 내보낼 수 있도록 + "" 를 해준다
	
	%>
</body>
</html>