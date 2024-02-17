<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.util.ArrayList"%>
<%@ page import="board.dao.BoardDAO"%>
<%@ page import="board.bean.BoardDTO"%>

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
            <% for (BoardDTO board : boardDTOList) { %>
                <tr>
                    <td>
                        <% for (int i = 0; i < board.getLev(); i++) { %>
                            &emsp;
                        <% } // for %>
                        <% if (board.getPseq() != 0) { %><img src="../image/reply.gif" alt="reply"> <% } // if %>
                        <%= board.getSeq() %>
                    </td>
                    <td><%= board.getId() %> </td>
                    <td><%= board.getName() %> </td>
                    <td><%= board.getEmail() %> </td>
                    <td><%= board.getSubject() %> </td>
                    <td><%= board.getContent() %> </td>
                    <td><%= board.getLogtime() %> </td>
                    <td><%= board.getHit() %> </td>
                </tr>
            <% } // enhanced for %>
        </tbody>
    </table>

    <div style="text-align:center; width:700px;">
        <% for (int i = 1; i <= totalP; i++) { %>
            <% if (pg == i) { %>
                <a id="currentPaging" href="board.jsp?pg=<%=i %>"><%=i %></a>
            <% } else { %>
                <span><a id="paging" href="board.jsp?pg=<%=i %>"><%=i %></a></span>
            <% } // if-else %>
        <% } // for %>
    </div>

</body>
</html>
