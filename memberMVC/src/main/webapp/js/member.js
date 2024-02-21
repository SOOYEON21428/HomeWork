let isIdChecked = document.getElementById("checkedId");

function checkWrite() {
    //유효성 검사1
    if (document.inputForm.name.value == "") {
        alert("이름을 입력하세요.");
        document.inputForm.name.focus();
    } else if (document.inputForm.id.value == "") {
        alert("아이디를 입력하세요.");
        document.inputForm.id.focus();
    }else if (isIdChecked.value==0) {
        alert("아이디 중복체크를 확인해주세요.")
    }else if (document.inputForm.pwd.value == "") {
        alert("비밀번호를 입력하세요.");
        document.inputForm.pwd.focus();
    } else if (document.inputForm.pwd.value != document.inputForm.repwd.value) {
        alert("비밀번호가 일치하지 않습니다.");
        document.inputForm.repwd.focus();
    } else {
        document.inputForm.submit();
    }
    return false;
}
function idChange(){
	isIdChecked.value=0;
}

function change() {
    //유효성 검사2
    if (!document.inputForm.email3[0].selected) {
        document.inputForm.email2.value = document.inputForm.email3.value;
    }
    return false;
}

function checkPost() {
    new daum.Postcode({
        oncomplete: function (data) {
            // 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

            // 각 주소의 노출 규칙에 따라 주소를 조합한다.
            // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
            var addr = ''; // 주소 변수

            //사용자가 선택한 주소 타입에 따라 해당 주소 값을 가져온다.
            if (data.userSelectedType === 'R') { // 사용자가 도로명 주소를 선택했을 경우
                addr = data.roadAddress;
            } else { // 사용자가 지번 주소를 선택했을 경우(J)
                addr = data.jibunAddress;
            }
            // 우편번호와 주소 정보를 해당 필드에 넣는다.
            document.inputForm.zipcode.value = data.zonecode;
            document.inputForm.addr1.value = addr;
            // 커서를 상세주소 필드로 이동한다.
            document.inputForm.addr2.focus();
        },
        width: '100%',
        height: '100%',
        maxSuggestItems: 5
    }).open();
}

function checkId() {
    if (!document.inputForm.id.value) {
        alert("먼저 아이디를 입력하세요.")
    } else {
        window.open("../member/checkId.jsp?id=" + document.inputForm.id.value,
            "checkId"
            , "width=450 height=300 left=600 top=150")
    }
}
function checkLogin() {
    if (!document.loginForm.id.value) {
        alert("아이디를 입력하세요.");
        document.loginForm.id.focus();
    } else if (!document.loginForm.pwd.value) {
        alert("비밀번호를 입력하세요.");
        document.loginForm.pwd.focus();
    }else {
        document.loginForm.submit();
    }
}

function checkUpdate(){
    if (document.updateForm.pwd.value == "") {
        alert("비밀번호를 입력하세요.");
        document.updateForm.pwd.focus();
    } else if (document.updateForm.pwd.value != document.updateForm.repwd.value) {
        alert("비밀번호가 일치하지 않습니다.");
        document.updateForm.repwd.focus();
    } else {
        document.updateForm.submit();
    }
    checkId();
    return false;
}



