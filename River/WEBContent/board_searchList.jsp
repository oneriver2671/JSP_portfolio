<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "board.BoardDTO" %>
<%@ page import = "vo.PageInfo" %>
<%
  // 로그인 성공 후, 정보 가져오기
  request.setCharacterEncoding("utf-8");
  String id = (String)session.getAttribute("id");
  if(id == null){
	  id = "";		// 로그인 안했을 시, id값을 null 대신 공백으로 처리.
  }
%>

<%
	/* SearchAction에서 넘어온 것들 */
	ArrayList<BoardDTO> articleList = (ArrayList<BoardDTO>)request.getAttribute("articleList");
  PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	int listCount = pageInfo.getListCount();
	int nowPage = pageInfo.getPage();
	int maxPage = pageInfo.getMaxPage();
	int startPage = pageInfo.getStartPage();
	int endPage = pageInfo.getEndPage();
	
	// page 넘길 때 controller에 넘겨주기 위함. (paging처리 시엔 form태그를 쓰지 않기 때문)
	String searchDay = "";		  // 검색조건 중, 기간
	String searchSort = "";		  // 검색조건 중, 종류
	String searchContent = "";  // 검색조건 중, 검색어
	searchDay = (String)request.getAttribute("searchDay");	
	searchSort = (String)request.getAttribute("searchSort");
	searchContent = (String)request.getAttribute("searchContent");
	
	
%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title><%= request.getParameter("sort") %></title>
  <!-- CSS 파일 -->
  <link rel="stylesheet" type="text/css" href="style/board_list.css" media="screen" />
  <link rel="stylesheet" type="text/css" href="style/header.css" media="screen" />
  <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">

  <!-- Font Awesome CDN -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css" integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">

  <!-- jQuery -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <!-- <script src="js/music_list.js"></script>  -->		<!-- 이부분도 확인 필요함 -->
</head>
<script>
function loginCheck(id){
	var id;
	if(id == ""){		
		alert('로그인 후 작성할 수 있습니다.');
	} else{
		location.href='board_write.jsp';
	}
}
</script>

<body>
<jsp:include page="searchBar.jsp"></jsp:include>		<!-- 검색창 담겨있음 -->
<jsp:include page="header.jsp"></jsp:include>		<!-- header 담겨있음 -->
<div id="wrap">
  <section>
  	<div id="main_section">	  	
				<h2><%= request.getParameter("sort") %></h2> 
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
						for(int i=0; i<articleList.size(); i++){
							BoardDTO dto = articleList.get(i);
				%>
						<tr>
							<td><%= dto.getOrders() %></td>
							<td><a href="boardDetail.bo?orders=<%=dto.getOrders()%>&sort=<%=request.getParameter("sort")%>&id=<%=id%>"><%= dto.getTitle()%></a></td>
							<td><%= dto.getWriter_id() %></td>
							<td><%= dto.getWrited_date().substring(0, 4)%>.<%=dto.getWrited_date().substring(5, 7)%>.<%=dto.getWrited_date().substring(8, 10)%></td>
							<td><%= dto.getCheck_num() %></td>
							<td><%= dto.getLike_num() %></td>
						</tr>
						<% } %>	 <!-- for문 종료 -->
	  			</tbody>
	  		</table>
		
  		<div class="write_blank">
  			<div id="write_btn" onclick="loginCheck('<%= id %>')"  >글쓰기</div>
  		</div>
  		<div id="bot_section">
  			<div>
  			<!-- 5페이지 이상 넘어가면, >표시로 6~10페이지 출력되게. -->
 					<%if(nowPage>1){ %>
						<a href="boardSearch.bo?sort=<%=request.getParameter("sort")%>&page=<%=nowPage-1 %>&search_by_day=<%=searchDay %>&search_by_content=<%=searchSort %>&search_value=<%=searchContent%>">◀</a>&nbsp;
					<%} %>
				
					<%for(int a=startPage; a<=endPage; a++){
							if(a==nowPage){%>
								[<%=a %>]
						<%} else{ %>
							<a href="boardSearch.bo?sort=<%=request.getParameter("sort")%>&page=<%=a %>&search_by_day=<%=searchDay %>&search_by_content=<%=searchSort %>&search_value=<%=searchContent%>">[<%=a %>]
						</a>&nbsp;
							<%} %>
					<%} %>
					<%if(nowPage<maxPage){ %>
							<a href="boardSearch.bo?sort=<%=request.getParameter("sort")%>&page=<%=nowPage+1 %>&search_by_day=<%=searchDay %>&search_by_content=<%=searchSort %>&search_value=<%=searchContent%>">▶</a>
						<%} %> 
  			</div>
  			<div>
  				<!-- 검색 기능 -->
  				<form name="board_search" class="board_search" action="boardSearch.bo?sort=<%=request.getParameter("sort")%>" method="POST">
  					<select name="search_by_day">
  						<option>전체기간</option>
  						<option>1일</option>
  						<option>1주</option>
  						<option>1개월</option>
  						<!-- 밑에 기간 입력 칸도 만들고 싶음. -->
  					</select>
  					<select name="search_by_content">
  						<option>제목+내용</option>
  						<option>제목만</option>
  						<option>글 작성자</option>
  					</select>
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