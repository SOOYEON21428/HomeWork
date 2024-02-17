<%@page import="java.net.URLEncoder"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="member.dao.MemberDAO"%>
<%@ page import="member.bean.MemberDTO"%>

<%
    // 데이터
    String id = request.getParameter("id");
    String pwd = request.getParameter("pwd");

    MemberDTO memberDTO = new MemberDTO();

    // DB - Select
    MemberDAO memberDAO = MemberDAO.getInstance();
    memberDTO = memberDAO.login(id, pwd);
    
    // 널 체크
    if (memberDTO == null) { 
        response.sendRedirect("loginFail.jsp");
    } else {
        // 이메일 합치기
        String email1 = memberDTO.getEmail1();
        String email2 = memberDTO.getEmail2();
        String email = email1 + "@" + email2;

        // 세션 사용
        session.setAttribute("memName", memberDTO.getName());
        session.setAttribute("memId", id);
        session.setAttribute("email", email);

        response.sendRedirect("loginOk.jsp");
    }
%>
