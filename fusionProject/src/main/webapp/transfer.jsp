<%@page import="java.text.DecimalFormat"%>
<%@page import="source.BankAccountDAO"%>
<%@page import="source.BankAccount"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>이체</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/basic.css?after">
<link rel="stylesheet" href="css/Transfer.css?after">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	var pwdReg = RegExp(/^[0-9]{4}$/);
	$("#sendpasswd").change(function(){
		if(!pwdReg.test($("#sendpasswd").val())){
        	alert("비밀번호는 숫자로만 4글자 입력하세요.");
        	$("#sendpasswd").val("");
            $("#sendpasswd").focus();
            
        }
	})
	
	
	$("#btn").click(function(){    
        
        if($("#sendpasswd").val() == ""){
        	alert("비밀번호를 입력하세요.");
            $("#sendpasswd").focus();
            return;
        }
       	else{
            $("#bankaccountwelcome").submit();
        }
    });


	
 });
 </script>
</head>

<body>
	<!--header-->
	<div class="main">
		<%@ include file="nav.jsp"%>
		<%
		BankAccountDAO baDAO = new BankAccountDAO();
		%>
		<!--main-->
		<div class="transfer">
			<fieldset class="main_field">
				<legend>이체</legend>
				<form action="transferProcess.jsp" method="post" name="member"
					id="bankaccountwelcome">
					<!-- 보낼계좌 -->
					<div class="sendAccount">
						<h3 class="title">
							<label>보낼계좌</label>
						</h3>
						<span class="sendAccount_main"> <select id="myaccount"
							name="host">
								<%
								ArrayList<BankAccount> list = baDAO.getUserAccountList(userID);
								DecimalFormat decFormat = new DecimalFormat("#,###");
								for (int i = 0; i < list.size(); i++) {
									
									BankAccount ba = list.get(i);
									String balance = decFormat.format(ba.getBalance());
									String disabled = null;
									if (!ba.getStatus().equals("거래가능")) {
										disabled = "disabled";

									}
								%>
								<option value="<%=ba.getBankNumber()%>" <%=disabled%>><%=baDAO.replace(ba.getBankNumber())%>
									(잔액 :
									<%=balance%>)
									<%=ba.getStatus()%>
								</option>
								<%
								}
								%>
						</select>

						</span>
					</div>
					<!-- 비밀번호 입력 -->
					<div class="send_passwd">
						<h3>
							<label>비밀번호 입력</label>
						</h3>
						<span> <input type="password" id="sendpasswd" maxlength="4" name="password">
						</span>
						<!-- 받는 은행 및 받는 분 표기 -->
						<div class="middle">
							<div class="middle1">
								<h3 class="title">
									<label>받는 은행</label>
								</h3>
								<span class="product_name"> <select name="bank">
										<option value="개혁은행">개혁은행
								</select>
								</span>
							</div>
							<!-- 받는 분 계좌번호 -->
							<div class="openingDate">
								<h3 class="title">
									<label>받는 분 계좌번호</label>
								</h3>
								<span class="openingDate_main"> <input type="text"
									name="target">
								</span>
							</div>
							<div class="middle2">
								<h3 class="title">
									<label>받는 분 표기</label>
								</h3>
								<span class="accountNum"> <input type="text"
									id="accountNum" name="showMessage" value="<%=userName%>">
								</span>
							</div>
						</div>

						<!-- 보낼 금액 -->
						<div class="send_money">
							<h3>
								<label>보낼 금액</label>
							</h3>
							<span> <input type="text" id="sendmoney" name="amount">
							</span>
						</div>
						<div class="btn">
							<input type="button" id="btn" class="mainBtn" value="이체하기">
						</div>
						</div>
					<!-- 이체하기 버튼 -->
						
				</form>
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