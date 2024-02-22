<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    

<style>
.mainnav{
	background-color: #483D8B;
	list-style: none;
	color: #ffffff;
}

.mainnav:after{ /*container-snb,content  바로 붙지 않게 하기 위해서 clear 함 */
	content: '';
	display: block;
	clear: both;
}

.mainnav li{
	display: inline-block;
	justify-content: space-between;
}

.mainnav li a {
	display: block;
	padding: 0 13px; /*  위아래, 좌우 */
	background-color: #483D8B;
	color: #ffffff;
	font: bold 16px/40px 'Nanum Gothic', sans-serif; 
		/폰트의 굵기 | 글자의 크기 | /line-height 줄간격 |  글꼴  , 앞에 글꼴없으면 다음 글꼴/
	text-transform: uppercase;
	text-decoration: none;
}
.mainnav li a:hover {
	color: #660000;
	background-color: #ffcc00;
}
</style>

	<ul class="mainnav">
		<li><a href="#">글쓰기</a></li>
		<li><a href="#">목록</a></li>
		<li><a href="index.jsp"><input type="button" value="메인화면"></a></li>
		<li></li>
		<li></li>
		<li></li>
	</ul>

<a href="index.jsp"><input type="button" value="메인화면"></a>
<a href="login.jsp"><input type="button" value="로그인"></a>
<a href="signup.jsp"><input type="button" value="회원가입"></a>

<%
    // Assuming 'loggedIn' is a boolean indicating whether the user is logged in or not.
    boolean loggedIn = true; // Change this based on your login status.
%>

<%
    if (loggedIn) {
%>
    <a href="write.jsp"><input type="button" value="글쓰기"></a>
<%
    }
%>

	







