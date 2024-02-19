<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="guestbook.dao.GuestbookDAO" %>
<%@ page import="guestbook.bean.GuestbookDTO" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    request.setCharacterEncoding("UTF-8");

    // 데이터
    String writer = request.getParameter("writer");
    String email = request.getParameter("email");
    String homepage = request.getParameter("homepage");
    String title = request.getParameter("title");
    String content = request.getParameter("content");

    // DTO 생성 및 데이터 설정
    GuestbookDTO guestbookDTO = new GuestbookDTO();
    guestbookDTO.setWriter(writer);
    guestbookDTO.setEmail(email);
    guestbookDTO.setHomepage(homepage);
    guestbookDTO.setTitle(title);
    guestbookDTO.setContent(content);

    // DB에 쓰기
    GuestbookDAO guestbookDAO = GuestbookDAO.getInstance();
    guestbookDAO.writeGuestbook(guestbookDTO);
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Guestbook Write</title>
    <c:if test="${not empty param.success}">
        <script>
            alert("방명록 등록하였습니다.");
            location.href = "guestbookList.jsp";
        </script>
    </c:if>
</head>
<body>
</body>
</html>
