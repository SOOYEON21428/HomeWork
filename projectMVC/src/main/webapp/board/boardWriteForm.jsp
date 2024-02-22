<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
	<style type="text/css">
		table{
		border-collapse:collapse;
		}
	#boardWriteForm div{
	color:red;
	font-size:8pt;
	font-weight:bold;
	}
	</style>
</head>
<body>
<form id="boardWriteForm" method="post" name="boardWriteForm" action="/boardMVC/board/boardWrite.do">
	<h3>글쓰기</h3>
	<table border="1" cellpadding="7">
		<tr>
			<th width="100">제목</th>
			<td>
				<input type="text" name="subject" id="subject" size="45" >
			<div id="subjectDiv"></div>
			</td>
		</tr>
		
		<tr>
			<th>내용</th>
			<td >
				<textarea rows="5" cols="50" name="content" id="content"></textarea>
			<div id="contentDiv"></div>
		</tr>
	
		<tr>
		<td align="center" colspan="2" >
			<input type="button" value="글쓰기" id="boardWriteBtn">
			<input type="reset" value="다시작성">
		 </td>
		</tr>
	</table>

</form>

<script src="http://code.jquery.com/jquery-3.7.1.min.js"></script>
<script type="text/javascript">
$('#boardWriteBtn').click(function(){
    $("#subjectDiv").empty();
    $("#contentDiv").empty();

    if($('#subject').val() == '')
        $("#subjectDiv").html('제목 입력');
    else if($('#content').val() == '')
        $("#contentDiv").html('내용 입력');
    else 
        $('#boardWriteForm').submit();
});
</script>
<!-- <script>
function checkBoardWrite() {
	document.getElementById("subjectDiv").innerText = "";
	document.getElementById("contentDiv").innerText = "";

	if (document.getElementById("subject").value == "") {
		document.getElementById("subjectDiv").innerText = "제목 입력";
		
	} else if (document.getElementById("content").value == "") { 
		document.getElementById("contentDiv").innerText = "내용 입력"	
		
	}else {
	document.getElementById("boardWriteForm").submit();
}
        
}


</script> -->
</body>
</html>