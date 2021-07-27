<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "board.BoardDAO" %>
<%
  request.setCharacterEncoding("utf-8");
 %>
 
  <!-- 게시판DTO 객체 생성해 입력된 값 넣기 -->
  <jsp:useBean id="dto" class="board.BoardDTO" scope="page" />	
  <jsp:setProperty name="dto" property="orders" />
  <jsp:setProperty name="dto" property="sort" />	
  <jsp:setProperty name="dto" property="title" />
  <jsp:setProperty name="dto" property="content" />
  
  
  <%
  BoardDAO dao = new BoardDAO();
  int result = dao.update(dto);
  if(result == 0){
		out.println("<script>alert('수정 실패!');</script>");
		out.println("<script>history.back();</script>");
	} else{		
		out.println("<script>alert('수정이 완료되었습니다.');</script>");
		out.println("<script>location.href='freeBoard.jsp';</script>");  	// 이 위치는 수정이 좀 필요.
	}
  

  %>

 