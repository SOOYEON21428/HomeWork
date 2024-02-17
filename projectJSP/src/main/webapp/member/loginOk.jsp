<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="member.dao.MemberDAO"%>
<%@ page import="member.bean.MemberDTO"%>
    <%
    	// 데이터
    	/* String name = request.getParameter("name");
    	String id = request.getParameter("id"); */
    	
    	// 쿠키 - 특정 쿠키만을 가져오지 못한다, 모든 쿠키들을 다 가져옴.
    	String name = null;
    	String id = null;
    	String email1 = null;
    	
    	/*
    	Cookie[] ar = request.getCookies();
    	if(ar != null) {
    		for(int i=0; i<ar.length; i++) {
    			String cookieName = ar[i].getName();   // 쿠키명
    			String cookieValue = ar[i].getValue();  // 쿠키값
    			
    			System.out.println("쿠키명 = " + cookieName);
    			System.out.println("쿠키값 = " + cookieValue);
    			System.out.println();
    			
    			if(cookieName.equals("memName")) {
    				name = cookieValue;
    			} // if
    			
    			if(cookieName.equals("memId")) {
    				id = cookieValue;
    			}  // if
    			
    		} // for
    		
    	} // if   */
    	
    	
    	// 세션
    	name = (String) session.getAttribute("memName");
    	id = (String) session.getAttribute("memId");
    	email1 = (String) session.getAttribute("email1");
    				
    %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<h3>
		<img src="../image/1.jpg" width="60" height="60" alt="kakao" onclick="location.href='../index.jsp'">
		<%= name %>님 로그인<br><br>
		<input type="button" id="update" value="회원정보수정" onclick="location.href='updateForm.jsp'">
		<input type="button" value="로그아웃" onclick="location.href='logout.jsp'">
		
	</h3>
</body>
</html>