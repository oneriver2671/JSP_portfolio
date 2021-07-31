<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "board.BoardDAO" %>
<%
  request.setCharacterEncoding("utf-8");

  int orders = Integer.parseInt(request.getParameter("orders"));
  BoardDAO dao = new BoardDAO();
  int result = dao.delete(orders);		// dao에서 삭제메소드 호출.
  
  if(result == 0){
	  out.println("<script>");
	  out.println("alert('삭제에 실패하였습니다.');");
	  out.println("history.back();");
	  out.println("</script>");
  } else{
	  out.println("<script>");
	  out.println("alert('삭제되었습니다.');");
	  out.println("location.href='freeBoard.jsp';");
	  out.println("</script>");
  }

  %>

 