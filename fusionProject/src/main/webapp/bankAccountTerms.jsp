<%@page import="java.io.PrintWriter"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>계좌개설 페이지</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="css/BankAccountTerms.css?after">
    <link rel="stylesheet" href="css/basic.css?after">
</head>
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">

$(document).ready(function(){
	
	$("#go").click(function(){    
        if($("#chk1").is(":checked") == false){
            alert("모든 약관에 동의하셔야합니다.");
            return;
        }else if($("#chk2").is(":checked") == false){
            alert("모든 약관에 동의하셔야합니다.");
            return;
        }else if($("#chk3").is(":checked") == false){
            alert("모든 약관에 동의하셔야합니다.");
            return;
        }else if($("#chk4").is(":checked") == false){
            alert("보이스 피싱이 의심됩니다. 다시 한 번 확인해 주세요.");
            return;
        }else if($("#chk5").is(":checked") == false){
            alert("보이스 피싱이 의심됩니다. 다시 한 번 확인해 주세요.");
            return;
        }else if($("#chk6").is(":checked") == false){
            alert("모든 약관에 동의하셔야합니다.");
            return;
        }else{
            $("#bankaccountterms").submit();
        }
    });


	
 });
</script>
<body>
<!--header-->
    <div class="main">
        <%@ include file="nav.jsp"%>
	<%
		PrintWriter script = response.getWriter();
		if(userID == null){
			script.println("<script>");
			script.println("alert('로그인 후 이용하세요.')");
			script.println("location.href='main.jsp'");
			script.println("</script>");
		}
	%>
    <!--main-->
    <div class="bankaccountterms">
        <fieldset>
            <legend>계좌개설</legend>
            <form action="bankAccountSignUp.jsp" method="post" name="member" id="bankaccountterms">
                <ul class="join_box">
                    <li class="checkBox check01">
                        <ul class="clearfix">
                            <li class="checkBtn">
                                <input type="checkbox" name="chk" id="chk1">
                            </li>
                            <li>약관 및 상품 설명서</li>
                        </ul>
                        <button class="textarea">[필수] 예금거래기본약관</button> <br>
                        <button class="textarea">[필수] 개혁예금 특약</button> <br>
                        <button class="textarea">[필수] 상품 설명서</button>
                        
                    </li>
                    <li class="checkBox check02">
                        <ul class="clearfix">
                            <li class="checkBtn">
                                <input type="checkbox" name="chk" id="chk2">
                            </li>
                            <li>불법 및 탈법 차명거래 금지 설명 확인</li>
                        </ul>
                        <textarea readonly name="" class="textarea_list">
금융실명거래 및 비밀보장에 관한법률 제 3조 제3항에 따라 누구든지 불법재산의 은닉, 자금세탁행위, 공중협박자금조달 행위 및 강제 집행의 면탈, 그 밖의 탈법행위를 목적으로 타인의 실명으로 금융거래를 해서는 아니되며, 이를 위반시 5년 이하의 징역 또는 5천만원 이하의 벌금에 처해질 수 있습니다.
                        </textarea>
                    </li>
                    <li class="checkBox check03">
                        <ul class="clearfix">
                            <li class="checkBtn">
                                <input type="checkbox" name="chk" id="chk3">
                            </li>
                            <li>[필수] 예금자 보호법</li>
                        </ul>
                        <textarea readonly name="" >
본인은 개혁은행으로부터 예금자 보호 여부 및 보호한도(원금과 소정의 이자를 합하여 1인당 5천만원)에 대하여 설명을 듣고 이해하였음을 확인합니다.
                        </textarea>
                    </li>
                    <li class="checkBox check04">
                        <ul class="clearfix">
                            <li>타인으로부터 통장대여 요청을 받은 적이 있습니까?</li>
                        </ul>
                        <div id="checkradio">
                            <label class="radio"><input type="radio" name="checkask" value="no" id="chk4">아니요</label>
                            <label class="radio"><input type="radio" name="checkask" value="yes">예</label>
                        </div>
                    </li>
                    <li class="checkBox check05">
                        <ul class="clearfix">
                            <li class="question">타인으로부터 신용등급 상향, 대출 등의 목적으로<br>통장개설 등 금융거래요청 받은 사실이 있습니까?</li>
                        </ul>
                        <div id="checkradio">
                            <label class="radio"><input type="radio" name="checkask2" value="no" id="chk5">아니요</label>
                            <label class="radio"><input type="radio" name="checkask2" value="yes">예</label>
                        </div>
                    </li>
                    <li class="checkBox check06">
                        <ul class="clearfix allCheckBtn">
                            <li class="checkAllBtn">
                                <input type="checkbox" name="chk" id="chk6">
                            </li>
                            <li class="question">약관 및 상품 설명서를 제공받고 그 내용을 충분히<br>이해하며 본 상품에 가입함을 확인합니다.</li>
                        </ul>
                    </li>
                </ul>         
                <ul class="footBtwrap clearfix">
                    <li><button type="button" id="go" class="fpmgBt1">다음</button></li>
                </ul>
            </form>
        </fieldset>
    </div>
    
	<%@ include file="footer.jsp" %>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>

</body>
</html>