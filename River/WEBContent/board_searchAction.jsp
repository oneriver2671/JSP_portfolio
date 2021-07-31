<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="board.BoardDAO" %>
<%@ page import="board.BoardDTO" %>
<%@ page import="java.util.ArrayList" %>
<% request.setCharacterEncoding("utf-8"); %>

<%
	String day = request.getParameter("search_by_day");
	String content_sort = request.getParameter("search_by_content");
	String search_value = request.getParameter("search_value");
	
	BoardDAO dao = new BoardDAO();
  ArrayList<BoardDTO> list = dao.search(day, content_sort, search_value);		// dao의 search()메소드 호출.
  
  // ArrayList를 넘겨주고 싶음.
  request.setAttribute("arrayList", list);
  
  // 이렇게하면 request에 있는 값 유지된채 넘어가려나? -> ㅇㅇ
  RequestDispatcher dispatcher = request.getRequestDispatcher("searchView.jsp");
	dispatcher.forward(request, response);
%>
