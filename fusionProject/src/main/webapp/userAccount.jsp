<%@page import="java.io.PrintWriter"%>
<%@page import="java.util.ArrayList"%>
<%@page import="source.AdminDAO"%>
<%@page import="source.BankAccount"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>고객 계좌 목록</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/PostList.css?after">
<link rel="stylesheet" href="css/basic.css?after">
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
		
		
		%>
		<!--main-->
		<div class="findaccount">
			<fieldset id="main_field">
				<form action="#" method="post" name="member">
					<div class="account">
						<legend><%=id%>님의 계좌
						</legend>
						<div class="row">
							<table class="table">
								<thead>
									<tr>
										<th>번호</th>
										<th>계좌번호</th>
										<th>잔고</th>
										<th>이율</th>
										<th>날짜</th>
										<th>상태</th>
									</tr>
								</thead>
								<tbody style="border-top: none;">
								<%
                                AdminDAO adminDAO = new AdminDAO();
                            	ArrayList<BankAccount> list = adminDAO.getUserAccountList(id);
                            	for (int i = 0; i < list.size(); i++) {
    								BankAccount ba = list.get(i);
                                %>
								
									<tr onclick="window.open('bankAccountStatus.jsp?bankNumber=<%=ba.getBankNumber() %>','popup',
							            'width=400, height=300, top=200, left=50,status=no,resizable=no,location = no, scrollbars=0, toolbar=0, menubar=no');">
										<td><%=i+1 %></td>
										<td><%=adminDAO.replace(ba.getBankNumber())%></td>
										<td><%=adminDAO.comma(ba.getBalance()) %></td>
										<td><%=ba.getRate() %>%</td>
										<td><%=ba.getDate() %></td>
										<td><%=ba.getStatus() %></td>
									</tr>
								
								<%
								}
								%>
								</tbody>
							</table>
						</div>
						<div>
							<button class="saveBtn" type="submit">
								<span> 저장 </span>
							</button>
						</div>
					</div>
				</form>
			</fieldset>
		</div>

		<%@ include file="footer.jsp"%>

		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
			crossorigin="anonymous"></script>
</body>
</html>