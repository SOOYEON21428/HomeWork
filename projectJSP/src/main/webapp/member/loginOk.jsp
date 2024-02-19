<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="name" value="${sessionScope.memName}" />
<c:set var="id" value="${sessionScope.memId}" />
<c:set var="email1" value="${sessionScope.email1}" />

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>
    <h3>
        <img src="../image/1.jpg" width="60" height="60" alt="kakao" onclick="location.href='../index.jsp'">
        ${name}님 로그인<br><br>
        <input type="button" id="update" value="회원정보수정" onclick="location.href='updateForm.jsp'">
        <input type="button" value="로그아웃" onclick="location.href='logout.jsp'">
    </h3>
</body>
</html>
