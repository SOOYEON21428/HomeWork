<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="member.dao.MemberDAO"%>
<%@ page import="member.bean.MemberDTO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="name" value="${param.name}" />
<c:set var="id" value="${param.id}" />
<c:set var="pwd" value="${param.pwd}" />
<c:set var="gender" value="${param.gender}" />
<c:set var="email1" value="${param.email1}" />
<c:set var="email2" value="${param.email2}" />
<c:set var="tel1" value="${param.tel1}" />
<c:set var="tel2" value="${param.tel2}" />
<c:set var="tel3" value="${param.tel3}" />
<c:set var="zipcode" value="${param.zipcode}" />
<c:set var="addr1" value="${param.addr1}" />
<c:set var="addr2" value="${param.addr2}" />

<c:set var="memberDTO" scope="request">
    <c:new className="member.bean.MemberDTO" />
</c:set>

<c:set target="${memberDTO}" property="name" value="${name}" />
<c:set target="${memberDTO}" property="id" value="${id}" />
<c:set target="${memberDTO}" property="pwd" value="${pwd}" />
<c:set target="${memberDTO}" property="gender" value="${gender}" />
<c:set target="${memberDTO}" property="email1" value="${email1}" />
<c:set target="${memberDTO}" property="email2" value="${email2}" />
<c:set target="${memberDTO}" property="tel1" value="${tel1}" />
<c:set target="${memberDTO}" property="tel2" value="${tel2}" />
<c:set target="${memberDTO}" property="tel3" value="${tel3}" />
<c:set target="${memberDTO}" property="zipcode" value="${zipcode}" />
<c:set target="${memberDTO}" property="addr1" value="${addr1}" />
<c:set target="${memberDTO}" property="addr2" value="${addr2}" />

<%@ page import="java.io.IOException" %>
<%@ page import="javax.servlet.RequestDispatcher" %>

<%
    MemberDAO memberDAO = MemberDAO.getInstance();
    boolean su = memberDAO.insert(memberDTO);
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>
    <c:choose>
        <c:when test="${su}">
            회원가입을 축하합니다.
        </c:when>
        <c:otherwise>
            회원가입 안되었습니다. <br> 다시 작성하세요
        </c:otherwise>
    </c:choose>
</body>
</html>
