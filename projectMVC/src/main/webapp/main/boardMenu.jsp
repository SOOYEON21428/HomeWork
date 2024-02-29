<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
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

<div id="nav">
	seq = <input type="text" id="seq" value="${seq }"><br>
	pg = <input type="text" id="pg" value="${pg }">
	<h3>
		<c:if test="${memId != null }">
			<p><a href="/projectMVC/board/boardWriteForm.do">글쓰기</a></p>
			
			<c:if test="${seq != null }">
				<p><a href="/projectMVC/board/boardUpdateForm.do?seq=${seq }&pg=${pg}">글수정</a></p>
			</c:if>
			
		</c:if>
		<p><a href="/projectMVC/board/boardList.do?pg=1">목록</a></p>
	</h3>
</div>











<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<style>
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

<div id="nav">
	seq = <input type="text" id="seq" value="${seq }"><br>
	pg = <input type="text" id="pg" value="${pg }">
	<h3>
		<c:if test="${memId != null }">
			<p><a href="/projectMVC/board/boardWriteForm.do">글쓰기</a></p>
			
			<c:if test="${seq != null }">
				<p><a href="/projectMVC/board/boardUpdateForm.do?seq=${seq }&pg=${pg}">글수정</a></p>
			</c:if>
			
		</c:if>
		<p><a href="/projectMVC/board/boardList.do?pg=1">목록</a></p>
	</h3>
</div>











