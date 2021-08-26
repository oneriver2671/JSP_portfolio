<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	session.removeAttribute("id");
	session.removeAttribute("memberName");
	session.removeAttribute("memberBirth");
	session.removeAttribute("memberTel");
	session.removeAttribute("memberEmail");
	response.sendRedirect("index.jsp");

%>