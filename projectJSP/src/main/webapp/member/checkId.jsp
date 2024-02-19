<%@ page import="member.dao.MemberDAO" %>
<%@ page contentType="text/html;charset=UTF-8" language="java" pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<%
    String id = request.getParameter("id");
    MemberDAO memberDAO = MemberDAO.getInstance();
    boolean exist = memberDAO.isExistID(id);
%>

<!DOCTYPE html>
<html>
<head>
    <title>Title</title>
</head>
<body>

<c:choose>
    <c:when test="${exist}">
        <form action="checkId.jsp">
            <font color="red"><strong> 선택하신 아이디 ${id}은(는) 사용 불가능</strong></font>
            <br><br>
            아이디 <input type="text" name="id">
            <input type="submit" value="중복체크">
        </form>
    </c:when>
    <c:otherwise>
        <font color="blue"><strong>선택하신 아이디 ${id}은(는) 사용 가능</strong></font>
        <br><br>
        아이디 <input type="button" value="사용하기" onclick="checkIdClose('${id}')">
    </c:otherwise>
</c:choose>

<script type="text/javascript">
    function checkIdClose(id) {
        opener.document.getElementById("id").value = id;
        opener.document.getElementById("checkedId").value = 1;
        window.close();
        opener.document.getElementById("pwd").focus();
    }
</script>

</body>
</html>
