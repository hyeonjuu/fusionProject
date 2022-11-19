<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>회원가입</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <link rel="stylesheet" href="./css/SignUp.css">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <!-- <script>
// 아이디 유효성 검사(1 = 중복 / 0 != 중복)
	$("#id").blur(function() {
		// id = "id_reg" / name = "userId"
		var user_id = $('#id').val();
		$.ajax({
			url : '${pageContext.request.contextPath}/user/idCheck?userId='+ user_id,
			type : 'get',
			success : function(data) {
				console.log("1 = 중복o / 0 = 중복x : "+ data);							
				
				if (data == 1) {
						// 1 : 아이디가 중복되는 문구
						$("#id_check").text("사용중인 아이디입니다 :p");
						$("#id_check").css("color", "red");
						$("#reg_submit").attr("disabled", true);
					} else {
						
						if(idJ.test(user_id)){
							// 0 : 아이디 길이 / 문자열 검사
							$("#id_check").text("");
							$("#reg_submit").attr("disabled", false);
				
						} else if(user_id == ""){
							
							$('#id_check').text('아이디를 입력해주세요 :)');
							$('#id_check').css('color', 'red');
							$("#reg_submit").attr("disabled", true);				
							
						} else {
							
							$('#id_check').text("아이디는 소문자와 숫자 4~12자리만 가능합니다 :) :)");
							$('#id_check').css('color', 'red');
							$("#reg_submit").attr("disabled", true);
						}
						
					}
				}, error : function() {
						console.log("실패");
				}
			});
		});
</script> -->
    
</head>

<body>
<!--header-->
    <div class="main">
        <%@ include file="nav.jsp"%>

    <!--main-->
    <div class="signup">
        <fieldset>
            <legend>회원가입</legend>
            <form action="#" method="post" name="member">
                <div class="join_content">
                    <div class="join_row_group">
                        <h3 class="join_title">
                            <label for="id">아이디</label>
                        </h3>
                        <span class="ps_box int_id">
                            <input type="text" id="id" name="id" class="int" title="ID" maxlength="20">
                            <div id="id_check"></div>
                        </span>
                        <div class="join_row">
                            <h3 class="join_title">
                                <label for="pswd1">비밀번호</label>
                            </h3>
                            <span class="ps_box int_pass" id="pswd1Img">
                                <input type="password" id="pswd1" name="pswd1" class="int" title="비밀번호 입력" aria-describedby="pswd1Msg" maxlength="20">
                            </span>
                            <h3 class="join_title">
                                <label for="pswd2">비밀번호 재확인</label>
                            </h3>
                            <span class="ps_box int_pass_check" id="pswd2Img">
                                <input type="password" id="pswd2" class="int" title="비밀번호 재확인" aria-describedby="pswd2Blind" maxlength="20">
                            </span> 
                        </div>
                    </div>
                    <div class="join_row_group">
                        <h3 class="join_title">
                            <label for="name">이름</label>
                        </h3>
                        <span class="ps_box box_right_space">
                            <input type="text" id="name" name="name" title="이름" class="int" maxlength="40">
                        </span>
                        <!--생년월일-->
                        <div class="join_row join_birthday">
                            <h3 class="join_title">
                                <label for="yy">생년월일</label>
                            </h3>
                            <div class="bir_wrap">
                                <div class="bir_yy">
                                    <span class="ps_box">
                                        <input type="text" id="yy" placeholder="생년월일 6자리" aria-label="생년월일 6자리" class="int" maxlength="4">
                                    </span>
                                </div>
                            </div>
                        </div>
                        <!--성별-->
                        <div class="join_row join_gender">
                            <h3 class="join_title">
                                <label for="gender">성별</label>
                            </h3>
                            <div class="ps_box gender_code">
                                <label><input type="radio" name="gender" value="male"> 남 </label>
                                <label><input type="radio" name="gender" value="female"> 여 </label>
                            </div>
                        </div>
                        <!--이메일-->
                        <div class="join_row join_email">
                            <h3 class="join_title">
                                <label for="email">이메일</label>
                            </h3>
                            <span class="ps_box int_email box_right_space">
                                <input type="text" id="email" name="email" class="int" maxlength="100">
                            </span> 
                        </div>
                        <!--전화번호-->
                        <div class="join_row join_tel">
                            <h3 class="join_title">
                                <label for="tel">전화번호</label>
                            </h3>
                            <span class="ps_box int_tel box_right_space">
                                <input type="tel" id="tel" name="tel" class="int" maxlength="13">
                            </span>
                        </div>
                        <div class="join_row join_admin_code">
                            <h3 class="join_title">
                                <label for="admin_code">관리자 번호</label>
                            </h3>
                            <span class="ps_box int_admin_code box_right_space">
                                <input type="text" id="admin_code" name="admin_code" class="int" maxlength="#">
                            </span>
                        </div>
                    </div>
                    <div class="join_row_group">
                        <!--버튼-->
                        <div class="btn_area">
                            <button type="submit" id="btnJoin" class="btn_type btn_primary">
                                <span>회원가입</span>
                            </button>
                        </div>
                    </div>
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