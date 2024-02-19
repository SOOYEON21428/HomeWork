<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="board.dao.BoardDAO"%>
<%@ page import="board.bean.BoardDTO"%>
<%@ prefix="c" taglib uri="http://java.sun.com/jsp/jstl/core" %>

<%
    int pg = (request.getParameter("pg") == null) ? 1 : Integer.parseInt(request.getParameter("pg"));

    // 페이징 처리
    int pageSize = 5; // 한 페이지에 보여질 게시글 수
    int startNum = (pg - 1) * pageSize + 1;
    int endNum = startNum + pageSize - 1;

    BoardDAO boardDAO = BoardDAO.getInstance();

    ArrayList<BoardDTO> boardDTOList = boardDAO.loadContents(startNum, endNum);

    int totalA = boardDAO.getTotalA(); // 총 글 수
    int totalP = (totalA + pageSize - 1) / pageSize; // 총 페이지 수
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Board Page</title>
    <style>
        #currentPaging {
            font-weight: bold;
            color: red;
            cursor: pointer;
        }

        #paging {
            color: black;
        }
        span {
        	border: 1px solid black;
        }
    </style>
</head>
<body>

    <h2><img src="../image/1.jpg" width="60" height="60" alt="kakao" onclick="location.href='../index.jsp'"></h2>

    <table border="1" cellpadding="7" frame="hsides" rules="rows">
        <thead>
            <tr>
                <th width="100">글번호</th>
                <th width="300">제목</th>
                <th width="150">작성자</th>
                <th width="150">작성일</th>
                <th width="100">조회수</th>
            </tr>
        </thead>

        <tbody>
            <c:forEach var="board" items="${boardDTOList}">
                <tr>
                    <td>
                        <c:forEach begin="1" end="${board.lev}">
                            &emsp;
                        </c:forEach>
                        <c:if test="${board.pseq ne 0}"><img src="../image/reply.gif" alt="reply"></c:if>
                        ${board.seq}
                    </td>
                    <td>${board.id}</td>
                    <td>${board.name}</td>
                    <td>${board.email}</td>
                    <td>${board.subject}</td>
                    <td>${board.content}</td>
                    <td>${board.logtime}</td>
                    <td>${board.hit}</td>
                </tr>
            </c:forEach>
        </tbody>
    </table>

    <div style="text-align:center; width:700px;">
        <c:forEach begin="1" end="${totalP}" varStatus="loop">
            <c:choose>
                <c:when test="${pg == loop.index}">
                    <a id="currentPaging" href="board.jsp?pg=${loop.index}">${loop.index}</a>
                </c:when>
                <c:otherwise>
                    <span><a id="paging" href="board.jsp?pg=${loop.index}">${loop.index}</a></span>
                </c:otherwise>
            </c:choose>
        </c:forEach>
    </div>

</body>
</html>
