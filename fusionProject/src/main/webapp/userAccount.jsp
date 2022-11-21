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
<link rel="stylesheet" href="/css/PostList.css">
<link rel="stylesheet" href="css/basic.css?after">
</head>

<body>
	<!--header-->
	<div class="main">
		<%@ include file="nav.jsp"%>

		<!--main-->
		<div class="findaccount">
			<fieldset id="main_field">
                <form action="#" method="post" name="member">
                    <div class="account">
                        <legend>User님의 계좌</legend>
                        <div class="row">
                            <table class="table"
                                style="text-align: center; border: 1px solid #dddddd;">
                                <thead>
                                    <tr style="background-color: #eeeeee;">
                                        <th>번호</th>
                                        <th>계좌번호</th>
                                        <th>잔고</th>
                                        <th>이율</th>
                                        <th>날짜</th>
                                        <th>상태</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>0000-00-0000000</td>
                                        <td>5,000,000</td>
                                        <td>3.7%</td>
                                        <td>2009.03.05</td>
                                        <td>
                                            <select>
                                                <option value="거래가능">거래가능</option>
                                                <option value="거래중지">거래중지</option>
                                            </select>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="saveBtn">
                            <button type="submit">
                                <span> 저장 </span>
                            </button>
                        </div>
                    </div>
                </form>
			</fieldset>
		</div>

		<%@ include file="footer.jsp" %>

		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
			crossorigin="anonymous"></script>
</body>
</html>