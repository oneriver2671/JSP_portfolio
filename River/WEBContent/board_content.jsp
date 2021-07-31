<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "java.util.ArrayList" %>
<%@ page import = "board.BoardDTO" %>
<%@ page import = "board.BoardDAO" %>
<%
  request.setCharacterEncoding("utf-8");
  String id = (String)session.getAttribute("id");			// 로그인 상태 회원 정보.		
  BoardDAO dao = new BoardDAO();
  
  //a태그에서 ?를 활용해 넘긴 값도 이렇게 받을 수 있다. ★
  int orders = Integer.parseInt(request.getParameter("orders"));
  int orders_new = 0;
  if(request.getAttribute("orders_new")!=null){
  	orders = (Integer)request.getAttribute("orders_new");	  
  }
  
  BoardDTO dto = dao.content(orders);	
  
  // 조회수 증가 메소드. 문제는 새로고침해도 계속 조회수가 증가.. 다른곳을 거쳐서 와야하나? -> 거쳐와도 계속 증가...
	if(id!=null){
		if(!id.equals(dto.getWriter_id())){		  // 글쓴이라면 조회수 증가x.
		  	dao.hits(orders); 	  // ajax로 처리해야 할 듯?	  
		  }
	} else{						// 로그인 안한 상태에선 항상 조회수 증가하게.
		dao.hits(orders);				
	}

%>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>세부 게시판</title>
  <!-- CSS 파일 -->
  <link rel="stylesheet" type="text/css" href="style/board_content.css" media="screen" />
  <link rel="stylesheet" type="text/css" href="style/header_style.css" media="screen" />
  <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
  <!-- Font Awesome CDN -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css" integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">

  <!-- jQuery -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="js/board_free_m1.js"></script>		<!-- script는 파일 하나로 써도 무방할 듯. 다른 것만 몇개 이 파일에 추가. -->
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
<jsp:include page="searchBar.jsp"></jsp:include>		<!-- 검색창 담겨있음 -->
<jsp:include page="header.jsp"></jsp:include>		<!-- header 담겨있음 -->
<div id="wrap">
  <section>
  	<div id="main_section">
  		<div id="top_btns">
  			<div class="top_btns_left">		<!-- 이 영역은 해당글 작성자만 보이도록 처리. -->
  			<%
					if(id!=null && id.equals(dto.getWriter_id())){
			   %>
			   		<a href="update.jsp?orders=<%= dto.getOrders() %>">수정</a>
  				  <a href="deleteAction.jsp?orders=<%= dto.getOrders() %>">삭제</a>
			  <% } %>
  			</div>
  			<div class="top_btns_right">
  				<!-- 이전글, 다음글도 onclick시 이동되어야 함. -->
  				<% int temp=0; %>
  				<button><a href="contentAction.jsp?orders=<%= dto.getOrders() %>&temp=0" >이전글</a></button>
  				<button><a href="contentAction.jsp?orders=<%= dto.getOrders() %>&temp=1" >다음글</a></button>
  				<button onclick="location.href='freeBoard.jsp'">목록</button>
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
  			</div>
 				<div class="post_content"><%= dto.getContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></div>
 				<form name="content_btns">
	 				<div class="post_btn">
	 					<span class="rec_count"></span>		<!-- 좋아요 숫자 들어갈 곳. -->
	 					<div class="post_btn_like"><i class="far fa-thumbs-up"></i><span>좋아요</span></div>
	 					<div><i class="far fa-comment"></i><span>댓글 달기</span></div>
	 					<div><i class="far fa-share-square"></i><span>공유하기</span></div>
	 				</div>
	 				<% if(id != null){ %>		<!-- 로그인한 회원만 댓글 작성칸 보이게. -->
		 				<div id="comment_write">
		 					<div><b><%= id %></b></div>
		 					<input type="text" name="comment_write" placeholder="댓글을 남겨보세요" autocomplete='off'>
		 					<div class="comment_write_bot">
		 						<div class="comment_write_attach">사진, 이모티콘 등</div>
		 						<button>등록</button>
		 					</div>
	 					<% }%>
	 				
	 				</div>
 				</form>
  		</div>
  	</div>
  </section>
  
<!-- footer 담겨있음 -->
<jsp:include page="footer.jsp"></jsp:include>	

</div>	<!-- wrap 끝 -->
  
</body>
</html>