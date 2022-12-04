<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="source.BankAccount"%>
<%@page import="source.AdminDAO"%>
<%@page import="source.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>

<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>고객정보수정</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/basic.css">

</head>

<body>

	<!--header-->
	<div class="main">
		<%@ include file="nav.jsp"%>
		
		<%
		PrintWriter script = response.getWriter();
		if(adminID == null){
			script.println("<script>");
			script.println("alert('관리자만 접근 가능합니다.')");
			script.println("location.href='main.jsp'");
			script.println("</script>");
		}
		
		String id = null;
		if(request.getParameter("id") != null){
			id = (String)request.getParameter("id");
		}
		AdminDAO adminDAO = new AdminDAO();
		Member member = adminDAO.getInfo(id);
		%>

		<!--main-->	
		<div class="amenduseraccount">
			<fieldset>
				<legend><%=id %>님의 정보</legend>
				<form action="amendUserInfoProcess.jsp" method="post" name="modify">
					<p>ID</p>
					<input type="text" class="form-control" name="id" maxlength="15"
						size="10" style="width: 70%;" value ="<%=member.getId()%>">

					<p>이메일</p>
					<input type="email" class="form-control" name="email" size="10"
						style="width: 70%; border-top: 0px; border-left: 0px; border-right: 0px; border-radius: 0;"value="<%=member.getEmail() %>" >

					<p>전화번호</p>
					<input type="tel" class="form-control" name="tel"
						size="10"
						style="width: 70%; border-top: 0px; border-left: 0px; border-right: 0px; border-radius: 0;" value="<%=member.getTel()%>">

                    <p>신용도</p>
                    <select class="form-control" name="rank">
                        <option value="1"<%=member.getRank()==1?"selected":"" %>>1</option>
                        <option value="2"<%=member.getRank()==2?"selected":"" %>>2</option>
                        <option value="3"<%=member.getRank()==3?"selected":"" %>>3</option>
                        <option value="4"<%=member.getRank()==4?"selected":"" %>>4</option>
                        <option value="5"<%=member.getRank()==5?"selected":"" %>>5</option>
                    </select>

                    <p>은행 계좌</p>
                     
                	
                    <select class="form-control" name="bankAccount">
                    <%
                    ArrayList<BankAccount> list = adminDAO.getUserAccountList(id);
                	for (int i = 0; i < list.size(); i++) {
						BankAccount ba = list.get(i); %>
                        <option value="<%=ba.getBankNumber()%>"><%=adminDAO.replace(ba.getBankNumber())%></option>
                        <%} %>
                    </select>
					
                    <input type="submit" class="btn form-control" value="계좌 조회"
                        style="width: 20%; margin-left: 25%; margin-bottom: 5%; background-color: #ff7979; color: #ffffff;"
                        formaction="userAccount.jsp">
					
					<br> <br> <input type="submit"
						class="btn btn-primary form-control" value="변경"
						style="width: 20%; margin-left: 25%; margin-bottom: 5%;">
				</form>
			</fieldset>
		</div>
	</div>
	<%@ include file="footer.jsp" %>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>

</body>

</html>