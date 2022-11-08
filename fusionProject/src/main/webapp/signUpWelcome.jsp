<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입 완료 페이지</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="/css/SignUpWelcome.css">
</head>
<body>
<!--header-->
    <div class="main">
        <%@ include file="nav.jsp"%>

    <!--main-->
    <div class="signupwelcome">
        <fieldset>
            <form action="#" method="post" name="member">
                <div class="top">
                    <span id="t_top">개혁은행 회원이 되신 것을</span> <br>
                    <span id="t_bottom">환영합니다!</span>
                </div>
                <div class="middle">
                    <span id="m">안녕하세요. ??? 회원님</span>
                </div>
                <div class="bottom">
                    <span id="b">개혁은행에 가입해 주셔서 감사합니다. <br> 회원님의 정보는 철저한 보안 아래 안전하게 유지됩니다.</span>
                </div>
                <div class="btn">
                    <button class="mainBtn">메인화면으로</button>
                    <button class="loginBtn">로그인하기</button>
                </div>
            </form>
        </fieldset>
    </div>

	<%@ include file="footer.jsp" %>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>

</body>
</html>