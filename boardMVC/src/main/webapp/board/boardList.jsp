<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>
        div{
            margin: 15px;
        }
        #currentPaging{
            color: red;
            cusor: pointer;
           	font-size:15px;
           	border: 1px solid red;
        }
        #Paging{
        	color: black;
        }
        #Paging:hover, #currentPaging:hover{
            text-decoration: underline;
        }
        span{
        	margin: 5px;
        	padding: 5px 10px 5px 10px;
        }
    </style>
</head>
<body>
<table border="1" cellpadding="7" frame="hsides" rules="rows">
	<tr>
		<th width="100">글번호</th>
		<th width="300">제목</th>
		<th width="150">작성자</th>
		<th width="150">작성일</th>
		<th width="100">조회수</th>
	</tr>
	<c:if test="${list != null}">
		<c:forEach var="boardDTO" items="${list}">
			<tr>
				<td align="center">${boardDTO.seq}</td>
				<td>
				<c:forEach var="i" begin="1" end="${(boardDTO.lev)}">
					&emsp;
				</c:forEach>
				<c:if test="${boardDTO.lev != 0}">
					<img src="../image/reply.gif">
				</c:if>
				${boardDTO.subject}
				</td>
				<td>${data.name}</td>
				<td><fmt:formatDate value="${boardDTO.logtime}" pattern="YYY.MM.dd." type="date"/></td>
				<td>${boardDTO.hit}</td>
			</tr>
		</c:forEach>
	</c:if>
</table>
<div style="text-align: center; width: 870px;">
<c:forEach var="i" begin="1" end="${totalP}">
    <c:choose>
        <c:when test="${pg == i}">
            <span id="currentPaging" onclick='location.href="boardList.do?pg=${i}"'>${i}</span>
        </c:when>
        <c:otherwise>
            <span id="Paging" onclick='location.href="boardList.do?pg=${i}"'>${i}</span>
        </c:otherwise>
    </c:choose>
</c:forEach>
</div>
</body>
</html>