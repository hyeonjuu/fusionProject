<%@page import="source.Admin"%>
<%@page import="source.AdminDAO"%>
<%@page import="source.UserDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<style type="text/css">
#sub {
	position:absolute;
	background: #ffffff;
	opacity:0;
	visibility:hidden;
}
.navbar-nav li:hover #sub{
	opacity:1;
	visibility: visible;
}
</style>
</head>
<body>
	<%
	String userID = null;
	String userName = null;
	String adminID = null;
	if(session.getAttribute("userID") != null){
			userID = (String) session.getAttribute("userID");
			UserDAO userDAO = new UserDAO();
			userName = userDAO.getUserName(userID);
	}
	if(session.getAttribute("adminID") != null){
		adminID = (String) session.getAttribute("adminID");
		AdminDAO adminDAO = new AdminDAO();
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
						href="#" id="navMoeny">계좌</a>
					  <ul id="sub">
            			<li><a class="" href="myAccounts.jsp">내 계좌</a></li>
            			<li><a class="" href="bankAccountTerms.jsp">계좌 생성하기</a></li>
          				</ul>
						</li>
					<div class="line"></div>
					<li class="nav-item"><a class="nav-link"
						href="transfer.jsp" id="navGive">이체</a>
						<ul id="sub">
            			<li><a class="" href="transfer.jsp">이체하기</a></li>
            			<li><a class="" href="myAccounts.jsp">이체 내역 조회</a></li>
          				</ul></li>
					<div class="line"></div>
					<li class="nav-item"><a class="nav-link" href="news.jsp" id="navInfo">정보</a>
					<ul id="sub">
            			<li><a class="" href="news.jsp">새소식</a></li>
            			<li><a class="" href="notice.jsp">공지사항</a></li>
            			<li><a class="" href="qna.jsp">자주 묻는 질문</a></li>
          				</ul></li>
					<div class="line"></div>
					<li class="nav-item"><a class="nav-link" href="users.jsp" id="navInfo">관리자</a>
					<ul id="sub">
            			<li><a class="" href="users.jsp">고객 목록</a></li>
          				</ul></li>
				</ul>
			</div>
			<div class="collapse navbar-collapse justify-content-end"
				id="navbarSign">
				<ul class="navbar-nav">
					<%
					if(userID==null)
						{
					%>
					<li class="nav-item"><a class="nav-link" href="login.jsp"
						id="logIn">로그인</a></li>
					<div class="line"></div>
					<li class="nav-item"><a class="nav-link"
						href="signUpTerms.jsp" id="signIn">회원가입</a></li>
					<%
					}else if(adminID != null){
						%>
						<li class="nav-item"><a class="nav-link" href="changeInfo.jsp"
						id="logIn">님 어서오세요</a></li>
					<div class="line"></div>
					<li class="nav-item"><a class="nav-link" href="logout.jsp"
						id="signIn">로그아웃</a></li>
						
						<% 
					}else
					{
					%>
					<li class="nav-item"><a class="nav-link" href="changeInfo.jsp"
						id="logIn"><span class="navName"><%=userName%></span>님 어서오세요</a></li>
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