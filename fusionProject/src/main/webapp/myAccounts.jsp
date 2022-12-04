<%@page import="java.text.DecimalFormat"%>
<%@page import="java.io.PrintWriter"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="source.BankAccountDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>내 계좌</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/MyBankAccounts.css?after">
<link rel="stylesheet" href="css/basic.css?after">
</head>

<body>
	<!--header-->
	<div class="main">
		<%@ include file="nav.jsp"%>
		<%
			BankAccountDAO baDAO = new BankAccountDAO();
			
			
			ResultSet rs = baDAO.getMyAccounts(userID);
			int total = baDAO.totalBalance(userID);
			String totalBalance = baDAO.comma(total);
			int accounts = baDAO.countRow(userID);
			if(rs == null){
				PrintWriter script = response.getWriter();
				script.println("<script>");
				script.println("alert('오류')");
				script.println("location.href='main.jsp'");
				script.println("</script>");
			}
			
			
		%>
		<!--main-->
		<div class="mybankaccounts">
			<fieldset id="main_field">
				<legend>내 계좌</legend>
				<!--총 계좌 목록-->
				<fieldset id="bank_list_field">
					<div id="bank_list_money">
						<h3 id="bank_list_h3">총 <%= accounts %>개</h3>
						<h1 id="mybank_money"><%=totalBalance %> 원</h1>
					</div>
				</fieldset>
				<!--계좌1-->
				<% while(rs.next()){
					String bankNumber = rs.getString("banknumber");
					String balance = baDAO.comma(rs.getInt("balance"));
					%>
				<fieldset id="mybank" onclick="location.href='transferList.jsp?bankNumber=<%=rs.getString("banknumber") %>'">
					<div id="user_bank">
						<div>
							<h3 id="mybank_h3"><%=userName %></h3>
							<h3 id="mybank_h3"><%=baDAO.replace(bankNumber)%></h3>
						</div>
						<div id="dropdownmenu"></div>
					</div>
					<div id="bank_money">
						<div>
							<h4><%=rs.getString("name") %></h4>
							<h4><%=rs.getString("creationDate") %></h4>
						</div>
						<div>
							<h1 id="mybank_money"><%=balance %>원</h1>
						</div>
					</div>
				</fieldset>

				<%}
					
				%>
				<!--계좌2-->
				
			</fieldset>
		</div>
	</div>

	<%@ include file="footer.jsp"%>

	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>
</body>
</html>