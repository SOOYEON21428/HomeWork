<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:remove var="memName" scope="session" />
<c:remove var="memId" scope="session" />
<c:invalidate />

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Insert title here</title>
</head>
<body>
    <script type="text/javascript">
        window.onload=function() {
            alert("로그아웃");
            location.href="../index.jsp";
        }
    </script>
</body>
</html>
