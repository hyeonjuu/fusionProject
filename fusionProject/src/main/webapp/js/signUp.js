


function check(){
    var form = document.mSignUp;

    if(form.id.value == ""){
        alert("아이디를 입력하세요.");
        form.id.focus();
        return false;

    }
    var idlength = /^[a-zA-z0-9]{8,20}$/;  //정규식

    if(!idlength.test(form.id.value)){
        alert("아이디는 영문 대/소문자 8~20글자만 가능합니다.");
        form.id.focus();
        return false;
    }
    if (form.password.value == ""){
        alert("비밀번호를 입력하세요.");
        form.password.focus();
        return false;
    }
    if(form.password.value != form.pwcheck.value){
        alert("비밀번호가 틀립니다.");
        return false;
    }
    if (form.name.value == ""){
        alert("이름을 입력하세요.");
        form.name.focus();
        return false;
    }
    if (form.birth.value == ""){
        alert("생년월일을 입력하세요.");
        form.birth.focus();
        return false;
    }
    if (form.gender.value == ""){
        alert("성별을 선택하세요.");
        form.gender.focus();
        return false;
    }
    if (form.email.value == ""){
        alert("이메일을 입력하세요.");
        form.email.focus();
        return false;
    }
    if (form.tel.value == ""){
        alert("전화번호를 입력하세요.");
        form.tel.focus();
        return false;
    }
    return true;
}
