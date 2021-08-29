<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "board.BoardDAO" %>
<%
  request.setCharacterEncoding("utf-8");
  String id = (String)session.getAttribute("id");			// 로그인한 회원의 id
%>

<!-- 게시판DTO 객체 생성해 입력된 값 넣기 -->
<jsp:useBean id="dto" class="board.BoardDTO" scope="page" />	<!-- scope : 현재 page 안에서만 사용 가능하게. -->
<!-- BoardDTO dto = new BoardDTO();와 같은 의미. -->
<jsp:setProperty name="dto" property="sort" />		<!-- sort가 문제!  -->
<jsp:setProperty name="dto" property="title" />
<jsp:setProperty name="dto" property="content" />

<%
	dto.setWriter_id(id);		// 로그인한 회원 id
	BoardDAO dao = new BoardDAO();
	int result = dao.insert(dto);		// dto 객체를 매개변수로 보내기.
	if(result == 0){
		out.println("<script>alert('게시글 입력 실패!');</script>");
		out.println("<script>history.back();</script>");
	} else{		
		out.println("<script>alert('게시글 작성이 완료되었습니다.');</script>");
		out.println("<script>location.href='board_m1_list.jsp';</script>");
	}
%>