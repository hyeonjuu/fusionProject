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

</head>

<body>
<!--header-->
    <div>
        <%@ include file="nav.jsp"%>

        <!--main-->
        <div class="transfer">
            <fieldset class="main_field">
                <legend>이체</legend>
                <form action="#" method="post" name="member" id="bankaccountwelcome">
                    <!-- 보낼계좌 -->
                    <div class="sendAccount">
                         <h3 class="title">
                             <label>보낼계좌</label>
                        </h3>
                        <span class="sendAccount_main">
                            <select id="myaccount">
                                <option value="xxxx-xx-xxxxxxx">xxxx-xx-xxxxxxx</option>
                                <option value="oooo-oo-ooooooo">oooo-oo-ooooooo</option>
                            </select>
                         </span>
                     </div>
                  <!-- 받는 은행 및 받는 분 표기 -->
                  <div class="middle">
                      <div class="middle1"> 
                          <h3 class="title">
                              <label>받는 은행</label>
                          </h3>
                          <span class="product_name">
                          	<select name="bank">
                          		<option value="개혁은행"> 개혁은행
                          	</select>
                          </span>
                      </div>
                      <div class="middle2">
                          <h3 class="title">
                              <label>받는 분 표기</label>
                          </h3>
                          <span class="accountNum">
                              <input type="text" id="accountNum">
                          </span>
                      </div>
                  </div>
                  <!-- 받는 분 계좌번호 -->
                  <div class="openingDate">
                      <h3 class="title">
                          <label>받는 분 계좌번호</label>
                      </h3>
                      <span class="openingDate_main">
                          <input type="text">
                      </span>
                  </div>
                  <!-- 보낼 금액 -->
                  <div class="send_money">
                     <h3>
                         <label>보낼 금액</label>
                     </h3>
                     <span>
                         <input type="text" id="sendmoney">
                     </span>
                  </div>
                  <!-- 비밀번호 입력 -->
                  <div class="send_passwd">
                      <h3>
                          <label>비밀번호 입력</label>
                      </h3>
                      <span>
                          <input type="text" id="sendpasswd">
                      </span> 
                  </div>
                 <!-- 이체하기 버튼 -->
                 <div class="btn">
                     <button type="button" class="mainBtn">
                         <span>이체하기</span>
                     </button>
                 </div>
             </form>
            </fieldset>
        </div>
    </div>

    <%@ include file="footer.jsp" %>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
		crossorigin="anonymous"></script>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>

</body>
</html>