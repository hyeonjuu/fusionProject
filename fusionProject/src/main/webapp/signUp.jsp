<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>메인페이지</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="css/Login.css">
</head>

<body>
<!--header-->
    <div class="main">
        <nav class="navbar navbar-expand navbar-light" id="nav">
            <div class="container-fluid" id="navbarLogo">
                <a class="navbar-brand" href="#">KH개혁</a>
                <button class="navbar-toggler" type="button" data-bs-toggle="collapse" data-bs-target="#navbarNav"
                    aria-controls="navbarNav" aria-expanded="false" aria-label="Toggle navigation">
                    <span class="navbar-toggler-icon"></span>
                </button>
                <div class="collapse navbar-collapse" id="navbar">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link active" aria-current="page" href="#" id="navMoeny">계좌</a>
                        </li>
                        <div class="line"></div>
                        <li class="nav-item">
                            <a class="nav-link" href="#" id="navGive">이체</a>
                        </li>
                        <div class="line"></div>
                        <li class="nav-item">
                            <a class="nav-link" href="#" id="navInfo">정보</a>
                        </li>
                    </ul>
                </div>
                <div class="collapse navbar-collapse justify-content-end" id="navbarSIgn">
                    <ul class="navbar-nav">
                        <li class="nav-item">
                            <a class="nav-link ac" href="#" id="logIn">로그인</a>
                        </li>
                        <div class="line"></div>
                        <li class="nav-item">
                            <a class="nav-link" href="#" id="signIn">회원가입</a>
                        </li>
                    </ul>
                </div>
            </div>
        </nav>

    <!--main-->
    <div class="signup">
        <fieldset>
            <legend>회원가입</legend>
            <form action="#" method="post" name="member">
                <p>아이디</p>
                <input type="text" class="form-control" name="id" maxlength="15" size="20" style="width: 50%; margin-left: 10%">
                <br>
                <p>비밀번호</p>
                <input type="password" class="form-control" name="pw" maxlength="15" size="20" style="width: 50%; margin-left: 10%">
                <br>
                <p>비밀번호 확인</p>
                <input type="password" class="form-control" name="pwcheck" maxlength="15" size="20" style="width: 50%; margin-left: 10%">
                <br>
                <p>이름</p>
                <input type="text" class="form-control" name="name" maxlength="15" size="20" style="width: 50%; margin-left: 10%">
                <br>
                <p>생년월일</p>
                <input type="text" class="form-control" name="year" maxlength="4" size="20" style="width: 5%; margin-left: 10%;"> 년
                <select class="form-control" name="month" style="width: 5%; margin-left: 10%">
                    <option value="1">1월</option>
                    <option value="2">2월</option>
                    <option value="3">3월</option>
                    <option value="4">4월</option>
                    <option value="5">5월</option>
                    <option value="6">6월</option>
                    <option value="7">7월</option>
                    <option value="8">8월</option>
                    <option value="9">9월</option>
                    <option value="10">10월</option>
                    <option value="11">11월</option>
                    <option value="12">12월</option>
                </select> 월
                <select class="form-control" name="day" style="width: 5%; margin-left: 10%">
                    <option value="1">1일</option>
                    <option value="2">2일</option>
                    <option value="3">3일</option>
                    <option value="4">4일</option>
                    <option value="5">5일</option>
                    <option value="6">6일</option>
                    <option value="7">7일</option>
                    <option value="8">8일</option>
                    <option value="9">9일</option>
                    <option value="10">10일</option>
                    <option value="11">11일</option>
                    <option value="12">12일</option>
                    <option value="13">13일</option>
                    <option value="14">14일</option>
                    <option value="15">15일</option>
                    <option value="16">16일</option>
                    <option value="17">17일</option>
                    <option value="18">18일</option>
                    <option value="19">19일</option>
                    <option value="20">20일</option>
                    <option value="21">21일</option>
                    <option value="22">22일</option>
                    <option value="23">23일</option>
                    <option value="24">24일</option>
                    <option value="25">25일</option>
                    <option value="26">26일</option>
                    <option value="27">27일</option>
                    <option value="28">28일</option>
                    <option value="29">29일</option>
                    <option value="30">30일</option>
                    <option value="31">31일</option>
                </select> 일
                <br>
                <p>성별</p>
                남자 <input type="radio" name="male"> 여자 <input type="radio" name="female">
                <br>
                <p>이메일</p>
                <input type="text" class="form-control" name="email" maxlength="50" size="20" style="width: 50%; margin-left: 10%">
                <br>
                <p>주소</p>
                <input type="text" class="form-control" name="address" maxlength="100" size="20" style="width: 50%; margin-left: 10%">
                <br>
                <p>핸드폰 번호</p>
                <input type="tel" class="form-control" name="tel" maxlength="20" size="20" style="width: 50%; margin-left: 10%">
                <br>
                <p>관리자 번호</p>
                <input type="text" class="form-control" name="admin_num" maxlength="15" size="20" style="width: 10%; margin-left: 10%">
                <br>
                <input type="submit" class="btn btn-primary form-control" value="회원가입" style="width: 50%;">
            </form>
        </fieldset>
    </div>

<!--footer-->
    <footer class="bottom">
        <div id="footer_logo">
            <img src="./footer_logo.PNG" alt="아무튼 이미지임">
        </div>
        <p>
            <span> 회사 주소 : 암튼 어딘가에 있어요. </span> <br>
            <span> 회사 번호 : 032 - 987 - 6543 </span> <span> 대표 번호 : 010 - 1234 - 5678 </span> <br>
            <span> Copyright KH Kaehyeok Bank. All Rights Reserved. </span>
        </p>
    </footer>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>

</body>
</html>