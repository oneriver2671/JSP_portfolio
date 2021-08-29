<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "board.BoardDTO" %>
<%
  // 로그인 성공 후, 정보 가져오기
  request.setCharacterEncoding("utf-8");
  String id = (String)session.getAttribute("id");
  ArrayList<BoardDTO> board_list = (ArrayList)request.getAttribute("arrayList");
  BoardDTO dto = null;
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>자유 게시판</title>
  <!-- CSS 파일 -->
  <link rel="stylesheet" type="text/css" href="style/board_free.css" media="screen" />
  <link rel="stylesheet" type="text/css" href="style/header.css" media="screen" />
  <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">

  <!-- Font Awesome CDN -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css" integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">

  <!-- jQuery -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="js/board_m1_list.js"></script>
</head>


<body>
<jsp:include page="searchBar.jsp"></jsp:include>		<!-- 검색창 담겨있음 -->
<jsp:include page="header.jsp"></jsp:include>		<!-- header 담겨있음 -->

<div id="wrap">
  <section>
  	<div id="main_section">	  	
				<h2>자유게시판</h2> 
	  		<table class="main_table">
	  			<thead>
	  				<tr>
	  					<th>말머리</th>
	  					<th>제목</th>
	  					<th class="mainT_writer">작성자</th>
	  					<th class="mainT_date">작성일</th>
	  					<th class="mainT_num">조회</th>
	  					<th class="mainT_num">좋아요</th>
	  				</tr>
	  			</thead>
	  			<tbody>
	  				<% 
							for(int i=0; i<board_list.size(); i++){
								dto = board_list.get(i);
						%>
						<tr>
							<td><%= dto.getOrders() %></td>
							<td><a href="board_m1_content.jsp?orders=<%= dto.getOrders() %>"><%= dto.getTitle()%></a></td>
							<td><%= dto.getWriter_id() %></td>
							<td><%= dto.getWrited_date().substring(0, 4)%>.<%=dto.getWrited_date().substring(5, 7)%>.<%=dto.getWrited_date().substring(8, 10)%></td>
							<td><%= dto.getCheck_num() %></td>
							<td><%= dto.getLike_num() %></td>
							<% } %>	<!-- for문 종료 -->
							
	  			</tbody>
	  		</table>
		
  		<div class="write_blank">
  			<div id="write_btn" onclick="loginCheck('<%= id %>')">글쓰기</div>
  		</div>
  		<div id="bot_section">
  
  			<div>(페이지 순서 들어갈 예정)</div>
  			<div>
  				<form name="board_search" class="board_search" action="board_m1_searchAction.jsp">
  					<select name="search_by_day">
  						<option>전체기간</option>
  						<option>1일</option>
  						<option>1주</option>
  						<option>1개월</option>
  						<option>6개월</option>
  						<option>1년</option>
  						<!-- 밑에 기간 입력 칸도 만들고 싶음. -->
  					</select>
  					<select name="search_by_content">
  						<option>제목+내용</option>
  						<option>제목만</option>
  						<option>글 작성자</option>
  						<option>댓글 내용</option>
  						<option>댓글 작성자</option>
  					</select>
  					<!-- 2글자 이상부터 검색되게 제한하기. -->
  					<input type="text" name="search_value" placeholder="검색어를 입력해주세요" class="searchBar">
  					<input type="submit" value="검색" class="search_btn">
  				</form>
  			</div>
  		</div>
  	</div>
  </section>

<!-- footer 담겨있음 -->
<jsp:include page="footer.jsp"></jsp:include>	

</div> 	<!-- wrap 끝 -->

</body>
</html>