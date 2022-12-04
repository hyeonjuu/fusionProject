<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>이용약관 페이지</title>
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css"
	rel="stylesheet"
	integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
	crossorigin="anonymous">
<link rel="stylesheet" href="css/SignUpTerms.css?after">
<link rel="stylesheet" href="css/basic.css?after">
<script
	src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script>

$(document).ready(function(){
	$("#chkAll").click(function(){

	    if($(this).is(":checked")){ //대상이 체크 되어 있을 때
	    
	    	//모든 체크박스 체크
	        $(".chk").attr("checked", true);
	        
	    }else{ //대상이 체크 해제 되어 있을 때
	    
	    	//모든 체크박스 체크해제
	        $(".chk").attr("checked", false);
	        
	    }
	});
	
	$("#go").click(function(){    
        if($("#chk1").is(":checked") == false){
            alert("모든 약관에 동의하셔야합니다.");
            return;
        }else if($("#chk2").is(":checked") == false){
            alert("모든 약관에 동의하셔야합니다.");
            return;
        }else{
            $("#joinForm").submit();
        }
    });


	
 });

    
</script>
</head>



<body>
	<!--header-->
	<div class="main">
		<%@ include file="nav.jsp"%>

		<!--main-->
		<div class="signupterms">
			<fieldset>
				<legend>회원가입 이용약</legend>
				<form action="signUp.jsp" method="post" name="member" id="joinForm">
					<ul class="join_box">
						<li class="checkBox check01">
							<ul class="clearfix">
								<li class="checkBtn"><input type="checkbox" id="chk1"class="chk" name="chk">
								</li>
								<li>[필수] 개혁은행 이용약관 동의</li>
							</ul> <textarea readonly name="" id="">
여러분을 환영합니다.
개혁은행 서비스를 이용해 주셔서 감사합니다. 본 약관은 다양한 개혁은행 서비스의 이용과 관련하여 개혁은행 서비스를 제공하는 개혁은행 주식회사(이하 '개혁은행')와 이를 이용하는 개혁은행 서비스 회원(이하 '회원') 또는 비회원과의 관계를 설명하며, 아울러 여러분의 개혁은행 서비스 이용에 도움이 될 수 잇는 융익한 정보를 포함하고 있습니다.
                        </textarea>
						</li>
						<li class="checkBox check02">
							<ul class="clearfix">
								<li class="checkBtn"><input type="checkbox" id="chk2" class="chk" name="chk">
								</li>
								<li>[필수] 개인정보 수집 및 이용 동의</li>
							</ul> <textarea readonly name="" id="">
개인정보보호법에 따라 개혁은행에 회원가입 신청하시는 분께 수집하는 개인정보의 항목, 개인정보의 수집 및 이용목적, 개인정보의 보유 및 이용기간, 동의 거부권 및 동의 거부 시 불이익에 관한 사항을 안내드리오니 자세히 읽은 후 동의하여 주시기 바랍니다.
                        </textarea>
						</li>
						<li class="checkBox check03">
							<ul class="clearfix">
								<li class="checkAllBtn"><input type="checkbox" id="chkAll" class="chk" name="chk">
								</li>
								<li>개혁은행 이용약관, 개인정보 수집 및 이용에 모두 동의합니다.</li>
							</ul>
						</li>
					</ul>
					<ul class="footBtwrap clearfix">
						<li><button type="button" class="fpmgBt1" onclick="location.href='main.jsp'">취소</button></li>
						<li><button type="button" class="fpmgBt2" id="go" >확인</button></li>
					</ul>
				</form>
			</fieldset>
		</div>

		<%@ include file="footer.jsp"%>

		<script
			src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
			integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
			crossorigin="anonymous"></script>
</body>
</html>