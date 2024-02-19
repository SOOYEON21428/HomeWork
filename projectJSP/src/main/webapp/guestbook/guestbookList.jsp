<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<%
    Connection conn = null;
    PreparedStatement pstmt = null;
    ResultSet rs = null;

    try {
        // JDBC 드라이버 로드
        Class.forName("oracle.jdbc.driver.OracleDriver");

        // 데이터베이스 연결 정보 설정
        String url = "jdbc:oracle:thin:@//localhost:1521/xe";
        String user = "C##JAVA";
        String password = "1234";

        // 데이터베이스 연결
        conn = DriverManager.getConnection(url, user, password);

        // SQL 쿼리 작성
        String sql = "SELECT * FROM guestbook ORDER BY logtime DESC";
        pstmt = conn.prepareStatement(sql);
        rs = pstmt.executeQuery();

        // JSTL로 변경된 부분
        pageContext.setAttribute("guestbookList", rs);
    } catch (Exception e) {
        e.printStackTrace();
    } finally {
        // 리소스 해제
        try { if (rs != null) rs.close(); } catch (SQLException e) {}
        try { if (pstmt != null) pstmt.close(); } catch (SQLException e) {}
        try { if (conn != null) conn.close(); } catch (SQLException e) {}
    }
%>

<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Guestbook List</title>
</head>
<body>

    <h2>Guestbook List</h2>

    <table border="1">
        <tr>
            <th>작성자</th>
            <th>작성일</th>
            <th>이메일</th>
            <th>홈페이지</th>
            <th>제목</th>
            <th>내용</th>
        </tr>

        <c:forEach var="entry" items="${guestbookList}">
            <tr>
                <td>${entry.name}</td>
                <td>${entry.logtime}</td>
                <td>${entry.email}</td>
                <td>${entry.homepage}</td>
                <td>${entry.subject}</td>
                <td>${entry.content}</td>
            </tr>
        </c:forEach>
    </table>

</body>
</html>
