<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
	
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>아이디 / 비밀번호 찾기</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="css/basic.css?after">
    <link rel="stylesheet" href="css/FindAccount.css?after">
</head>

<body>
<!--header-->
    <div class="main">
        <%@ include file="nav.jsp"%>

    <!--main-->
    <div class="findaccount">
        <fieldset class="main_field">
            <!--아이디 찾기-->
            <fieldset class="find_id">
                <legend class="fIdPw">아이디 찾기</legend>
                <form action="findId.jsp" method="post" name="member" id="find_Id">
                    <div>
                        <div id="flexId">
                            <div id="flex_input">         
                                <input type="text" id="fText" placeholder="이름" name = "name">
                            </div>
                            <div id="flex_input">
                                <input type="text" id="fText" placeholder="E-mail" name="email">
                            </div>
                        </div>
                    </div>
                    <div class="btn_area">
                        <input type="submit" id="btnFind" value = "찾기">
                    </div>
                </form>
            </fieldset>
            <!--비밀번호 찾기-->
            <fieldset class="find_pw">
                <legend class="fIdPw">비밀번호 찾기</legend>
                <form action="findPassword.jsp" method="post" name="member" id="find_Pw">
                    <div>
                        <div id="flexPw">
                            <div id="flex_input">
                                <input type="text" id="fText" placeholder="아이디" name="id">
                            </div>
                            <div id="flex_input">
                                <input type="text" id="fText" placeholder="E-mail" name="email">
                            </div>
                        </div>
                    </div>
                    <div class="btn_area">
                        <input type="submit" id="btnFind" value = "찾기">
                    </div>
                </form>
            </fieldset>
        </fieldset>
    </div>
    
    <%@ include file="footer.jsp" %>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>

</body>
</html>