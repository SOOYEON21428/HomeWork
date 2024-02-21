<%@page import="java.lang.reflect.Member"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>  
<%@ page import="member.dao.MemberDAO"  %>    
<%
	String id =	request.getParameter("id");

	//DB
	MemberDAO memberDAO = MemberDAO.getInstance();//생성
	boolean exist = memberDAO.isExistId(id);// 호출
	
%>   

<%if(exist){ %>
	exist


<%}else{ %>
	non_exist

<%} %>


