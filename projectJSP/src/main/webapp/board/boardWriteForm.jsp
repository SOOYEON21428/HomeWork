<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style>

	td {
		width:300px;
	}
	
	textarea {
		width: 280px;
	}
	
	.cont {
		height: 400px;
	}
	
	.cont > textarea {
		height: 380px;
	}

</style>

</head>
<body>
	<h1>글쓰기</h1>
	
	<form action="boardWrite.jsp?pg=1" method="post" name="inputForm">
		<table class="table" border="1px">
			
			<tr>
				<th>제목</th>
				<td class="sub"><textarea name="subject" id="subject" style="resize: none;"></textarea>
			</tr>
			
			<tr>
				<th>내용</th>
				<td class="cont"><textarea name="content" id="content" style="resize: none;"></textarea>
			</tr>
			
			<tr>
	            <td colspan="2" align="center">
	                <input type="button" value="글쓰기" onclick="checkWrite()">
	                <input type="reset" value="다시작성" class="myButton">
	            </td>
        	</tr>
			
		</table>
		
	</form>
	<script type="text/javascript" src="../js/board.js"></script>
	
</body>
</html>