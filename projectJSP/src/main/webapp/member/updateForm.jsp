<%@ page language="java" contentType="text/html;charset=UTF-8"
         pageEncoding="UTF-8" %>
<%@ page import="member.dao.MemberDAO"%>
<%@ page import="member.bean.MemberDTO"%>
<%


String id =  (String) session.getAttribute("memId");
MemberDAO memberDAO = MemberDAO.getInstance();
MemberDTO memberDTO = new MemberDTO();




%>
<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
    <style>
        .table{
            border-collapse: collapse;
            margin: 20px 20px;
        }
        th {
            width: 100px;
        }

        tr.telephone>td>#tel2,#tel3 {
            width: 2.8em;
        }
        #addr1, #addr2 {
            width: 30em;
        }

    </style>
</head>
<body>
<form action="update.jsp" method="post" name="updateForm">
    <table class="table" border="1px">
        <tbody>
        <tr class="name">
            <th>이름</th>

            <<%-- td><input type="text" name="name" id="name" value="<%=ic %>"></td> --%>
        </tr>
        <tr class="id">
            <th>아이디</th>
            <td><input type="text" name="id" id="id" value="<%=id %>" disabled></td>
        </tr>
        <tr class="pwd">
            <th>비밀번호</th>
            <td><input type="password" name="pwd" id="pwd" placeholder="비밀번호 입력"/></td>
        </tr>
        <tr class="repwd">
            <th>재확인</th>
            <td><input type="password" name="repwd" id="repwd" placeholder="비밀번호 입력"></td>
        </tr>
        <tr class="gender">
            <th>성별</th>
            <td>
                <label><input type="radio" name="gender" id="0" checked="true">남자</label>
                <label><input type="radio" name="gender" id="1">여자</label>
            </td>
        </tr>
        <tr class="email">
            <th>이메일</th>
            <td>
                <label><input type="text" name="email1" id="email1"></label>
                @
                <label><input type="email" name="email2" id="email2"></label>
                <label><input type="email" name="email3" id="email3"></label>
            </td>
        </tr>
        <tr class="telephone">
            <th>휴대전화</th>
            <td><select name="tel1" id="tel1">
                <option value="010">010</option>
                <option value="011">011</option>
                <option value="019">019</option>
            </select>
                -
                <input type="text" name="tel2" id="tel2">
                -
                <input type="text" name="tel3" id="tel3">
            </td>
        </tr>
        <tr class="address">
            <th>주소</th>
            <td>
                <label><input type="text" name="zipcode" id="zipcode" disabled></label>
                <input type="button" value="우편번호검색" placeholder="우편번호" onclick="checkPost()"/>
                <br>
                <label><input type="text" name="addr1" id="addr1" placeholder="주소" readonly></label>
                <br>
                <label><input type="text" name="addr2" id="addr2" placeholder="상세주소"></label>
            </td>
        </tr>
        </tbody>
        <tfoot>
        <tr>
            <td colspan="2" align="center">
                <input type="button" value="회원정보수정" onclick="checkUpdate()">
                <input type="reset" value="다시입력" class="myButton">
            </td>
        </tr>
        </tfoot>
    </table>
</form>
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script type="text/javascript" src="../js/member.js"></script>
</body>
</html>