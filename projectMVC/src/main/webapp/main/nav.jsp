<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<input type="button" value="로그인"><br><br>
	<input type="button" value="회원가입"><br><br>
<%

    boolean loggedIn = true;
%>

<div id="user-info">
    <%
        if (loggedIn) {
    %>
        <%= "xxx님 로그인" %>
        <a href="logout.jsp">로그아웃</a>
    <%
        } else {
    %>
        <a href="login.jsp">로그인</a>
        <a href="signup.jsp">회원가입</a>
    <%
        }
    %>
</div>
	
</body>
</html>