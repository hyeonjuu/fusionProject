<%@page import="java.text.DecimalFormat"%>
<%@page import="source.Deal"%>
<%@page import="java.util.ArrayList"%>
<%@page import="source.DealDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>이체내역</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/transferList.css?after">
<link rel="stylesheet" href="css/basic.css?after">
</head>

<body>
	<!--header-->
	<div class="main">
		<%@ include file="nav.jsp"%>
		<!--main-->
		<div class="transfer_list">
			<fieldset id="main_field">
				<legend>이체 내역</legend>
				<!--총 계좌 목록-->
				<fieldset id="transfer_list_field">
					<div class="transfer_list_money">
						<h3 id="transfer_list_h3 left_list">계좌번호</h3>
						<h1 id="transfer_money">잔액</h1>
					</div>
				</fieldset>
				<!--이체내역1-->
				<%
					String bankNumber = (String)request.getParameter("bankNumber");
				
					DecimalFormat decFormat = new DecimalFormat("#,###");
					
					DealDAO dealDAO = new DealDAO();
					ArrayList<Deal> list = dealDAO.getDealList(bankNumber);
					for(int i = 0; i<list.size();i++){
						Deal deal = list.get(i);
						String amount = decFormat.format(deal.getAmount());
						String balance = decFormat.format(deal.getBalance());
				%>
				<fieldset id="mytransfer">
					<div id="user_transfer">
						<div id="left_list">
							<h3 id="mytransfer_h3"><%=deal.getShowMessage() %></h3>
							<h3 id="mytransfer_h3"></h3>
						</div>
						<div id="dropdownmenu"></div>
					</div>
					<div id="transfer_money">
						<div id="left_list">
							<h4><%=deal.getType() %></h4>
							<h4><%=deal.getTransfertime() %></h4>
						</div>
						<div id="money">
							<p id="mybank_money"> 금액 : <%=amount %></h1>
							<p id="mybank_money"> 잔액 : <%=balance %></h1>
						</div>
					</div>
				</fieldset>

				<%} %>

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