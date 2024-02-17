<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
   table {
      border-collapse: collapse;
   }
   #writeForm div {
      font-size: 8pt;
      font-weight: bold;
      color: red;
   }
</style>
</head>
<body>
<form id="writeForm" method="post" action="http://www.naver.com">
   <table border="1" cellpadding="5">
      <tr>
         <th width="100">이름</th>
         <td>
            <input type="text" name="name" id="name" placeholder="이름 입력"/>
            <div id="nameDiv"></div>
         </td>
      </tr>
      
      <tr>
         <th>아이디</th>
         <td>
            <input type="text" name="id" id="id" size="25" placeholder="아이디 입력"/>
            <button type="button" onclick="checkId(); return false;">중복체크</button>
            <div id="idDiv"></div>
         </td>
      </tr>
      
      <tr>
         <th>비밀번호</th>
         <td>
            <input type="password" name="pwd" id="pwd" size="30" placeholder="비밀번호 입력"/>
            <div id="pwdDiv"></div>
         </td>
      </tr>
      
      <tr>
         <th>재확인</th>
         <td>
            <input type="password" name="repwd" id="repwd" size="30" placeholder="비밀번호 입력"/>
         </td>
      </tr>
      
      <tr>
         <th>성별</th>
         <td>
            <input type="radio" name="gender" id="mail" value="0" checked/>
            <label for="male">남자</label>
            <input type="radio" name="gender" id="femail" value="1"/>
            <label for="female">여자</label>
         </td>
      </tr>
      
      <tr>
         <th>이메일</th>
         <td>
            <input type="text" name="email1"/>
            @
            <input type="text" name="email2" id="email2"/>
            
            <input type="email" name="email3" id="email3" list="email3_list" oninput="change()" >
            <datalist id="email3_list">
               <option value="직접입력"  />
               <option value="naver.com"  />
                   <option value="hanmail.com"/>
                   <option value="gmail.com"/>
            </datalist>
         </td>
      </tr>
      
      <tr>
         <th>휴대전화</th>
         <td>
            <select name="tel1">
               <option value="010">010</option>
               <option value="011">011</option>
               <option value="019">019</option>
            </select>
            -
            <input type="text" name="tel2" size="4" maxlength="4"/>
            -
            <input type="text" name="tel3" size="4" maxlength="4"/>
         </td>
      </tr>
      
      <tr>
         <th>주소</th>
         <td>
            <input type="text" name="zipcode" id="zipcode" placeholder="우편번호" readonly>
            <button type="button" onclick="checkPost(); return false;">우편번호 검색</button><br>
            <input type="text" name="addr1" id="addr1" size="60" placeholder="주소" readonly><br>
            <input type="text" name="addr2" id="addr2" size="60" placeholder="상세주소" >
         </td>
      </tr>
      
      <tr>
         <td colspan="2" align="center">
            <input type="button" onclick="javascript:checkWrite()" value="회원가입">
            <input type="reset" value="다시입력">
         </td>
      </tr>
   </table>
</form>

<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>

//유효성 검사
function checkWrite() {
   document.getElementById("nameDiv").innerText="";
   document.getElementById("idDiv").innerText="";
   document.getElementById("pwdDiv").innerText="";
   
   if(document.getElementById("name").value == "")
      document.getElementById("nameDiv").innerHTML="이름 입력";
   else if(document.getElementById("id").value == "")
      document.getElementById("idDiv").innerHTML="아이디 입력";
   else if(document.getElementById("pwd").value == "")
      document.getElementById("pwdDiv").innerHTML="비밀번호 입력";
   else if(document.getElementById("pwd").value != document.getElementById("repwd").value)
      document.getElementById("pwdDiv").innerHTML="비밀번호가 일치하지 않습니다.";
   else
      document.getElementById("writeForm").submit();
      
   
}
//이메일
function change(){
   document.getElementById("email2").value = document.getElementById("email3").value;

}

//우편번호
function checkPost(){
   new daum.Postcode({
            oncomplete: function(data) {
                // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

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
                document.getElementById('zipcode').value = data.zonecode;
                document.getElementById("addr1").value = addr;
                // 커서를 상세주소 필드로 이동한다.
                document.getElementById("addr2").focus();
            }
        }).open();
}

//중복체크
function checkId(){
   var id = document.getElementById("id").value
   if( id == "")
      alert("먼저 아이디를 입력하세요.")
   else
      window.open("http://localhost:8080/projectJSP/member/checkId.jsp?id="+id, 
               "checkId", 
               "width=450 height=150 left=300 top=150");
}
 </script>

</body>
</html>