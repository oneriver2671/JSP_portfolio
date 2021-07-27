<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "board.BoardDTO" %>
<%@ page import = "board.BoardDAO" %>
<%@ page import = "board.CommentDTO" %>
<%
  request.setCharacterEncoding("utf-8");
  String id = (String)session.getAttribute("id");			// 로그인 상태 회원 정보.		

	/* DetailAction에서 넘어온 것들 */
  String page_temp = (String)request.getAttribute("page");   // 일단 가져옴. 
  BoardDTO dto = (BoardDTO)request.getAttribute("article");
  int maxNum = (Integer)request.getAttribute("maxNum");	  // 게시글 번호 최대값
	int minNum = (Integer)request.getAttribute("minNum");	  // 게시글 번호 최솟값
	ArrayList<CommentDTO> commentList = (ArrayList<CommentDTO>)request.getAttribute("comment");
	
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세부 게시판</title>
  <!-- CSS 파일 -->
  <link rel="stylesheet" type="text/css" href="../River_Board/content_style.css" media="screen" />
  <link rel="stylesheet" type="text/css" href="../River_Index/header_style.css" media="screen" />
  <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
  <!-- Font Awesome CDN -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css" integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">

  <!-- jQuery -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="freeBoard.js"></script>		<!-- script는 파일 하나로 써도 무방할 듯. 다른 것만 몇개 이 파일에 추가. -->
</head>
<script>
/*----  ajax 사용해야할 듯. ----*/
function delete01(){
	if(confirm("정말 삭제하시겠습니까?") == true){		// 확인      
	  <% // dao.delete(orders); %>		
	  // 이런식으로 쓰는건 안됨. jsp:서버사이드에서 실행, js:클라이어언트사이드에서 실행. 그리고, '보안'의 문제. script안에 sql문을?? 놉.     
	
		location.href='deleteAction.jsp';				// orders 들고가야함.
																			
	} else{		// 취소
		return;
	}
	
}

// 좋아요 클릭 시, 따봉버튼 바뀜.
$(document).ready(function(){
	$('.post_btn_like').click(function(){		// #.로그인한 사람만 클릭할 수 있게 하자. 
		var test = $('.post_btn_like i').attr('class');
		if($('.post_btn_like i').attr('class')=='far fa-thumbs-up'){		// 안눌린 상태에서 클릭.
				$('.post_btn_like i').attr('class', 'fas fa-thumbs-up');
				
		} else{		// 좋아요 눌린 상태에서 다시 클릭.
			$('.post_btn_like i').attr('class', 'far fa-thumbs-up');
		}
	
});
</script>

<body>
<jsp:include page="../River_Index/searchBar.jsp"></jsp:include>		<!-- 검색창 담겨있음 -->
<jsp:include page="../River_Index/header.jsp"></jsp:include>		<!-- header 담겨있음 -->
<div id="wrap">
  <section>
  	<div id="main_section">
  		<div id="top_btns">
  			<div class="top_btns_left">		<!-- 이 영역은 해당글 작성자만 보이도록 처리. -->
  			<%
					if(id!=null && id.equals(dto.getWriter_id())){
			   %>
			   	<!-- 이 수정, 삭제 페이지도 MVC2로 새로 만들어야겠지.. 후..! -->
			   		<a href="boardModifyForm.bo?orders=<%=dto.getOrders() %>">수정</a>
  				  <a href="boardDelete.bo?orders=<%=dto.getOrders() %>&sort=<%=dto.getSort() %>">삭제</a>
			  <% } %>
  			</div>
  			<div class="top_btns_right">
  				<!-- 이전글, 다음글도 onclick시 이동되어야 함. -->
  				<% int temp=0; %>
  				<% if(dto.getOrders()!=minNum){ %>
  					<a href="boardDetailMove.bo?sort=<%= dto.getSort() %>&orders=<%= dto.getOrders() %>&temp=0" >이전글</a>
  				<% }%>
  				<% if(dto.getOrders()!=maxNum){ %>
  					<a href="boardDetailMove.bo?sort=<%= dto.getSort() %>&orders=<%= dto.getOrders() %>&temp=1" >다음글</a>
  				<% }%>
  				<a href="boardList.bo?sort=<%= dto.getSort() %>">목록</a>
  			</div>
  		</div>
  		<div class="post">
  			<div class="post_categori"><%= dto.getSort() %></div>
  			<h2 class="post_title"><%= dto.getTitle() %></h2>
  			<div class="post_etc">
  				<div class="post_etc_left">
	  				<div class="post_etc_left_id"><b><%= dto.getWriter_id() %></b></div>
	  				<div class="post_etc_left_date"><%= dto.getWrited_date().substring(0, 16) %></div>
	  				<div class="post_etc_left_num">조회수 <%= dto.getCheck_num() %></div>
  				</div>
  				<div class="post_etc_right">
  					<%if( dto.getAttached()!=null ){ %>
  						<div>첨부파일</div>
							<!-- ---- 이거 컨트롤러 거쳐가게 만들고 싶음. ---- -->
							<a href="../River_Board/file_down.jsp?downFile=<%= dto.getAttached() %>"> <%= dto.getAttached() %></a>
						<%} %>
  				</div>
  			</div>
 				<div class="post_content"><%= dto.getContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></div>
 				<form name="content_btns" action="boardCommentWrite.bo?id=<%=id %>&orders=<%=dto.getOrders() %>&sort=<%=dto.getSort() %>" method="POST">
	 				<div class="post_btn">
	 					<span class="rec_count"></span>		<!-- 좋아요 숫자 들어갈 곳. -->
	 					<div class="post_btn_like"><i class="far fa-thumbs-up"></i><span>좋아요</span></div>
	 					<div><i class="far fa-comment"></i><span>댓글 달기</span></div>
	 					<div><i class="far fa-share-square"></i><span>공유하기</span></div>
	 				</div>
	 			
	 				<h3 id="comment_intro">댓글</h3>
	 				<div id="comment_list">
	 				
	 				<% for(int i=0; i<commentList.size(); i++){ 
	 				 			CommentDTO commentDTO = commentList.get(i);
	 				 %>
	 					<div class="comment">
	 						<div class="comment_writer"><%=commentDTO.getWriter_id() %></div>
	 						<div class="comment_content"><%=commentDTO.getContent() %></div>
	 						<div class="comment_time"><%=commentDTO.getWrited_date().substring(0, 16) %></div>
	 					</div>
	 				<%} %>
	 				</div>
	 					<% if(id != null){ %>		<!-- 로그인한 회원만 댓글 작성칸 보이게. -->
		 				<div id="comment_write">
		 					<div><b><%= id %></b></div>
		 					<input type="text" name="content" placeholder="댓글을 남겨보세요" autocomplete='off'>
		 					<div class="comment_write_bot">
		 						<div class="comment_write_attach">(여기가 허전해)</div>
		 						<button>등록</button>   <!-- 근데 이거 submit 아니어도 action으로 넘어가네?? -->
		 					</div>
	 					</div>
	 				<% }%>
	 				
	 					
 				</form>
  		</div>
  	</div>
  </section>
   <!-- footer -->
  <footer>
    <div id="footer_bar">
      <ul class="footer_linkBox">
        <li>사이트맵</li>
        <li>개인정보처리방침</li>
        <li>이용약관</li>
      </ul>
      <ul class="footer_snsBox">
        <li><img src="../River_Index/images/footer/footer-icon01.gif"></li>
        <li><img src="../River_Index/images/footer/footer-icon03.gif"></li>
        <li><img src="../River_Index/images/footer/footer-icon04.gif"></li>
        <li><img src="../River_Index/images/footer/footer-icon07.gif"></li>
      </ul>
    </div>
  </footer>		<!-- footer 끝 -->
</div>	<!-- wrap 끝 -->
  
</body>
</html>