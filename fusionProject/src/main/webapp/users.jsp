<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>고객 목록</title>
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
		<div class="users">
			<fieldset id="main_field">
                <form action="#" method="post" name="member">
                    <div class="account">
                        <legend>고객 목록</legend>
                        <div class="row">
                            <table class="table"
                                style="text-align: center; border: 1px solid #dddddd;">
                                <thead>
                                    <tr style="background-color: #eeeeee;">
                                        <th>번호</th>
                                        <th>아이디</th>
                                        <th>고객명</th>
                                        <th>생년월일</th>
                                        <th>전화번호</th>
                                        <th>고객등급</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>1</td>
                                        <td>jwd123</td>
                                        <td>정원동</td>
                                        <td>2000.06.09</td>
                                        <td>010-5664-6814</td>
                                        <td>1</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                        <div class="saveBtn">
                            <input type="text" placeholder="이름">
                            <input type="button" value="검색">
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