<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="member.dao.MemberDAO"%>
<%@ page import="member.bean.MemberDTO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:set var="id" value="${param.id}" />
<c:set var="pwd" value="${param.pwd}" />

<%
    MemberDTO memberDTO = new MemberDTO();
    MemberDAO memberDAO = MemberDAO.getInstance();
    memberDAO = memberDAO.login(id, pwd);
%>

<c:choose>
    <c:when test="${empty memberDTO}">
        <c:redirect url="loginFail.jsp" />
    </c:when>
    <c:otherwise>
        <c:set var="email1" value="${memberDTO.email1}" />
        <c:set var="email2" value="${memberDTO.email2}" />
        <c:set var="email" value="${email1 + '@' + email2}" />

        <c:set var="memName" value="${memberDTO.name}" />
        <c:set var="memId" value="${id}" />
        <c:set var="sessionEmail" value="${email}" />

        <c:redirect url="loginOk.jsp" />
    </c:otherwise>
</c:choose>
