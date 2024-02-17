<%@ page language="java" contentType="text/xml; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@page trimDirectiveWhitespaces="true" %> 
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%--DB연동 => 만약에 아이디가 'hong' 이면 이미 DB에 저장된 아이디로 취급 --%>
<c:set var="result" value="false" />
<c:if test="${param.user_id == 'hong' }">
	<c:set var="result" value="true" />
</c:if>

<%-- XML 보내기 --%>

<?xml version="1.0" encoding="UTF-8"?>
<checkId>
<result>${result }</result>
</checkId>



