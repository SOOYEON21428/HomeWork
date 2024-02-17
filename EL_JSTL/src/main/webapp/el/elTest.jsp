<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>
    <table border="1" width="50%">

        <tr align="center">
            <th width="50%">표현식</th>
            <th width="50%">값</th>
        </tr>

        <tr align="center">
            <td>${25+3}</td>
            <td>${25+3}</td>
        </tr>

        <tr align="center">
            <td>${25/3}</td>
            <td>${25/3}</td>
        </tr>

        <tr align="center">
            <td>\${25 div 3}</td>
            <td>\${25 / 3}</td>
        </tr>

        <tr align="center">
            <td>${25 % 3}</td>
            <td>${25 % 3}</td>
        </tr>

        <tr align="center">
            <td>${25 mod 3}</td>
            <td>${25 mod 3}</td>
        </tr>

        <tr align="center">
            <td>${25<3}</td>
            <td>${25<3}</td>
        </tr>

        <tr align="center">
            <td>\${25 != 3}</td>
            <td>${25 != 3}</td>
        </tr>

        <tr align="center">
            <td>${#request.getHeader('host')}</td>
            <td>${#request.getHeader('host')}</td>
        </tr>

        <tr align="center">
            <td>${#httpServletRequest.getHeader('host')}</td>
            <td>${#httpServletRequest.getHeader('host')}</td>
        </tr>

    </table>
</body>
</html>
