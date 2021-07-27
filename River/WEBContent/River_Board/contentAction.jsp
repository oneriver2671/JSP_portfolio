<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="board.BoardDTO" %>
<%@ page import = "java.util.ArrayList" %>
<% request.setCharacterEncoding("utf-8"); %>

<%
	int orders = Integer.parseInt(request.getParameter("orders"));
	int temp = Integer.parseInt(request.getParameter("temp"));		// temp=0 : 이전페이지 / temp=1 : 다음페이지
%>
	<jsp:useBean id="dao" class="board.BoardDAO" scope="page" />	
		
		<%
			ArrayList<BoardDTO> board_list = dao.select();		// 게시판 내용 모두 가져온 값.
			BoardDTO dto = null;
			
			
			// 맨앞, 맨뒤 게시글만 처리해주면 될 듯.
			
			// 이전페이지
			if(temp==0){
				for(int i=0; i<board_list.size(); i++){
				
					dto = new BoardDTO();
					dto = board_list.get(i);
					if(i!=(board_list.size()-1)){		// i가 마지막 인덱스가 아니라면. (마지막 인덱스엔 이전페이지가 없음)
						if(orders == dto.getOrders()){
							dto = board_list.get(i+1);
							break;
						}
					} else{		// i가 마지막 인덱스인 상황.
						dto = board_list.get(i);			// 그냥 페이지 그대로 새로고침됨. (문제점: 조회수도 그대로 증가해버림.)
						break;
					}
				}
			}
			
			// 다음페이지
			if(temp==1){
				for(int i=0; i<board_list.size(); i++){
					dto = new BoardDTO();
					dto = board_list.get(i);
					
					if(orders == dto.getOrders()){
						if(i != 0){		    	// i=0 : 맨 위의 게시물인 상황(다음 게시물이 없는 상황). 이외의 경우엔 모두 다음페이지 호출.
						dto = board_list.get(i-1);
						break;							
						} else{
							dto = board_list.get(i);
							break;
						}
					}
				}
			}
			
			int orders_new = dto.getOrders();
			request.setAttribute("orders_new", orders_new);
			
		  RequestDispatcher dispatcher = request.getRequestDispatcher("content.jsp");
			dispatcher.forward(request, response);
		%>
