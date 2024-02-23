<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>

<style type="text/css">
#currentPaging {
	border: 1px solid black;
	color: red;
	cursor: pointer;
	font-size: 15pt;
	margin: 5px;
	padding: 5px 8px;
}
#paging {
	color: black;
	cursor: pointer;
	font-size: 15pt;
	margin: 5px;
	padding: 5px;
}
span:hover {
	text-decoration: underline;
}

.boardListDiv {
	display: flex;
	flex-direction: column;
	align-items: center;
	margin: 30px auto;
	text-align: left;
}

#container {
	margin: auto;
	width: 1100px;
	height: 500px;
}

#container:after {
	content: '';
	display: block;
	clear: both;
	float: none;
}

#nav {
	margin-left: 10px;
	width: 25%;
	height: 100%;
	float: left;
}

#section {
	width: 70%;
	height: 100%;
	float: left;
}
</style>

<div id="header" style="text-align: center;">
	<h1>
		<a href="/projectMVC/index.jsp">
			<img alt="사과" src="/projectMVC/image/apple.png" width="50" height="50"></a>
		MVC를 활용한 미니 프로젝트
	</h1>
</div>
<hr style="border-color: yellowgreen;">

<div id="container">
	
	<jsp:include page="../main/boardMenu.jsp" />
	
	<div id="section" class="boardListDiv">
		<table border="1" cellpadding="7" frame="hsides" rules="rows">
			<tr>
				<th width="100">글번호</th>
				<th width="300">제목</th>
				<th width="150">작성자</th>
				<th width="150">작성일</th>
				<th width="100">조회수</th>
			</tr>
			
			<c:if test="${requestScope.list != null }">
			
				<c:forEach var="boardDTO" items="${list }">
					<tr>
						<td align="center">${boardDTO.seq }</td>
						
						<td>
							<c:forEach var="i" begin="1" end="${boardDTO.lev }" step="1">
								&emsp;
							</c:forEach>
							
							<c:if test="${boardDTO.pseq != 0 }">
								<img src="../image/reply.gif" alt="reply">
							</c:if>
							${boardDTO.subject }
						</td>
						<td align="center">
							${boardDTO.id }
						</td>
						<td align="center">
							<fmt:formatDate value="${boardDTO.logtime }" pattern="YYYY.MM.dd."/>
						</td>
						<td align="center">
							${boardDTO.hit }
						</td>
					</tr>
				</c:forEach>
			
			</c:if>
		</table>
		<div style="text-align: center; width: 870px; margin-top: 15px;">
			<c:forEach var="i" begin="1" end="${totalP }" step="1">
				<c:if test="${i == pg }">
					<span id="currentPaging" onclick="boardPaging(${i })">${i }</span>
				</c:if>
				<c:if test="${i != pg }">
					<span id="paging" onclick="boardPaging(${i })">${i }</span>
				</c:if>
			</c:forEach>
		</div>
	</div>
</div>	

<script type="text/javascript">
function boardPaging(pg) {
	location.href = "/projectMVC/board/boardList.do?pg=" + pg;
}
</script>











