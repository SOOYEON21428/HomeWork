<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.bean.MemberDTO" %>    
<%@ page import="member.dao.MemberDAO"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<c:if test="${su ==1 }">
	<h3>회원가입을 축하합니다.</h3>
	</c:if>
<c:if test="${su !=1 }">
	<h3>회원가입 안되었습니다.
	다시작성하세요</h3>
	</c:if>

</body>
</html>











