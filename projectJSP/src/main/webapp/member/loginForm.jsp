<%@ page contentType="text/html;charset=UTF-8" language="java"
    pageEncoding="UTF-8" %>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
    <style>
        .table {
            border-collapse: collapse;
            margin: 20px 20px;
        }
        tbody>tr {
            height: 35px;
        }
        tbody>tr>th {
            text-align: left;
            width: 100px;
        }
        tfoot {
            height: 50px;
        }
        tfoot>tr>td>input {
            margin-right: 40px;
            background-color: white;
            color : red;
            border: 1px solid red;
        }
        tfoot>tr>td>input:hover {
            background-color: lightpink;
        }
    </style>
</head>
<body>
<form action="login.jsp" method="post" name="loginForm">
    <table class="table">
        <tbody>
        <tr class="id">
            <th>아이디</th>
            <td align><input type="text" name="id" id="id"/></td>
        </tr>
        <tr class="pwd">
            <th>비밀번호</th>
            <td><input type="password" name="pwd" id="pwd"/></td>
        </tr>
        </tbody>
        <tfoot>
        <tr>
            <td colspan="2">
                <input type="button" value="로그인"  onclick="checkLogin()"/>
                <input type="button" value="회원가입" onclick="location.href='writeForm.jsp'"/>
            </td>
        </tr>
        </tfoot>
    </table>
</form>
<script type="text/javascript" src="../js/member.js"></script>

</body>
</html>