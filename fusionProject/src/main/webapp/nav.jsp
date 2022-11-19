<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
</head>
<body>
	<%
	String userID = null;
	if(session.getAttribute("userID") != null){
		userID = (String) session.getAttribute("userID");
	}
	%>
	<nav class="navbar navbar-expand navbar-light" id="nav">
			<div class="container-fluid" id="navbarLogo">
				<a class="navbar-brand" href="main.jsp">KH개혁</a>
				<button class="navbar-toggler" type="button"
					data-bs-toggle="collapse" data-bs-target="#navbarNav"
					aria-controls="navbarNav" aria-expanded="false"
					aria-label="Toggle navigation">
					<span class="navbar-toggler-icon"></span>
				</button>
				<div class="collapse navbar-collapse" id="navbar">
					<ul class="navbar-nav">
						<li class="nav-item"><a class="nav-link" aria-current="page"
							href="#" id="navMoeny">계좌</a></li>
						<div class="line"></div>
						<li class="nav-item"><a class="nav-link" href="bankAccountSignUp.jsp"
							id="navGive">이체</a></li>
						<div class="line"></div>
						<li class="nav-item"><a class="nav-link" href="#"
							id="navInfo">정보</a></li>
					</ul>
				</div>
				<div class="collapse navbar-collapse justify-content-end"
					id="navbarSign">
					<ul class="navbar-nav">
						<%
							if (userID == null){
						%>
						<li class="nav-item"><a class="nav-link" href="login.jsp"
							id="logIn">로그인</a></li>
						<div class="line"></div>
						<li class="nav-item"><a class="nav-link" href="signUpTerms.jsp"
							id="signIn">회원가입</a></li>
							<%} else{
								%>
						<li class="nav-item"><a class="nav-link" href="changeInfo.jsp"
							id="logIn"><%=session.getAttribute("userID") %>님 어서오세요.</a></li>
						<div class="line"></div>
						<li class="nav-item"><a class="nav-link" href="logout.jsp"
							id="signIn">로그아웃</a></li>
								<%
							}
						%>
					</ul>
				</div>
			</div>
		</nav>
</body>
</html>