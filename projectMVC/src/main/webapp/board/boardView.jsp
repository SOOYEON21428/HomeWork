<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

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
	
	<div id="section">
		<input type="text" id="seq" value="${seq }" />
		<input type="text" id="pg" value="${pg }" />
		
		<table border="1" cellpadding="7" frame="hsides" rules="rows">
			<tr>
				<td height="100" colspan="3">
					<font size="7"><span id="subjectSpan"></span></font>
				</td>
			</tr>
			
			<tr>
				<td align="center" width="200">글번호 : <span id="seqSpan"></span></td>
				<td align="center" width="200">작성자 : <span id="idSpan"></span></td>
				<td align="center" width="200">조회수 : <span id="hitSpan"></span></td>
			</tr>
			
			<tr>
				<td height="300" valign="top" colspan="3">
					<span id="contentSpan"></span>
				</td>
			</tr>
		</table>
		<input type="button" value="목록" 
			   onclick="location.href='/projectMVC/board/boardList.do?pg=${pg}'">
		<span id="boardViewSpan">
			<input type="button" value="글수정" id="boardUpdateFormBtn">
			<input type="button" value="글삭제">
		</span>	  
	</div>
</div>

<script src="http://code.jQuery.com/jquery-3.7.1.min.js"></script>
<script src="../js/boardView.js"></script>












