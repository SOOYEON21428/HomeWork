<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    <%@ page import="java.util.ArrayList" %>
    <%@ page import="java.util.List" %>
<%
List<String> list = new ArrayList<String>();
list.add("호랑이");
list.add("사자");
list.add("기린");
list.add("코끼리");
list.add("타조");
list.add("코알라");
list.add("여우");

//주소를 통해서 넘어가는 데이터는 문자열만 가능., 객체는 불가/
request.setAttribute("list", list);

response.sendRedirect("sendEnd.jsp?list=" + list);
%>