<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="member.dao.MemberDAO"%>
<%@ page import="member.bean.MemberDTO"%>
<%@ page import="board.dao.BoardDAO"%>
<%@ page import="board.bean.BoardDTO"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
 
<%
    // 데이터
    String subject = request.getParameter("subject");
    String content = request.getParameter("content");

    // pg 파라미터를 가져오고, null일 경우 1로 설정
    int pg = (request.getParameter("pg") == null) ? 1 : Integer.parseInt(request.getParameter("pg"));

    // 페이징 처리
    int endNum = pg * 5;
    int startNum = endNum - 4;

    String id = (String) session.getAttribute("memId");
    String name = (String) session.getAttribute("memName");
    String email1 = (String) session.getAttribute("email1");

    BoardDAO boardDAO = BoardDAO.getInstance();
    boardDAO.boardWrite(id, name, email1, subject, content);

    ArrayList<BoardDTO> boardDTOList = boardDAO.loadContents(startNum, endNum);

    int totalA = boardDAO.getTotalA(); // 총 글 수
    int totalP = (totalA + 4) / 5; // 총 페이지 수
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Board Page</title>
</head>
<body>

    <h2><img src="../image/1.jpg" width="60" height="60" alt="kakao" onclick="location.href='../index.jsp'"></h2>

    <table border="1" cellpadding="7" frame="hsides" rules="rows">
        <thead>
            <tr>
                <th>글번호</th>
                <th>id</th>
                <th>이름</th>
                <th>e-mail</th>
                <th>제목</th>
                <th>내용</th>
                <th>날짜</th>
                <th>조회수</th>
            </tr>
        </thead>

        <tbody>
            <c:forEach var="board" items="${boardDTOList}">
                <tr>
                    <th>
                        <c:forEach begin="1" end="${board.lev}">
                            &emsp;
                        </c:forEach>
                        <c:if test="${board.pseq ne 0}">
                            <img src="../image/reply.gif" alt="reply">
                        </c:if>
                        ${board.seq}
                    </th>
                    <th>${board.id}</th>
                    <th>${board.name}</th>
                    <th>${board.email}</th>
                    <th>${board.subject}</th>
                    <td>${board.content}</td>
                    <td>${board.logtime}</td>
                    <td>${board.hit}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <div style="text-align:center; width:700px;">
        <c:forEach begin="1" end="${totalP}" varStatus="loop">
            <a href="board.jsp?pg=${loop.index}">${loop.index}</a>
        </c:forEach>
    </div>

</body>
</html>
