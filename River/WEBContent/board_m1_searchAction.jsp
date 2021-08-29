<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="board.BoardDAO" %>
<%@ page import="board.BoardDTO" %>
<%@ page import="java.util.ArrayList" %>
<% request.setCharacterEncoding("utf-8"); %>

<%
	String board_sort = "자유게시판";		// 자유게시판만 model 1 적용함.
	String day = request.getParameter("search_by_day");
	String content_sort = request.getParameter("search_by_content");
	String search_value = request.getParameter("search_value");
	int initPage = 1;	    	// 페이지 기본설정
	int limit = 15;			// 한페이지 최대 글 수.
	
	BoardDAO dao = new BoardDAO();
  ArrayList<BoardDTO> list = dao.search(board_sort, day, content_sort, search_value, initPage, limit);		// dao의 search()메소드 호출.
  
  // ArrayList를 넘겨주고 싶음.
  request.setAttribute("arrayList", list);
  
  // 이렇게하면 request에 있는 값 유지된채 넘어가려나? -> ㅇㅇ
  RequestDispatcher dispatcher = request.getRequestDispatcher("board_m1_searchView.jsp");
	dispatcher.forward(request, response);
%>
