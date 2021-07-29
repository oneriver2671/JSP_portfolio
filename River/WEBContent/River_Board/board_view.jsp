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
	boolean isLike = (Boolean)request.getAttribute("isLike");		// 게시글 좋아요 누른 회원인지 확인용
	
	String attachedName = dto.getAttached();
	if(attachedName == null){		// 널값 오류 방지용
		attachedName = "null";
	}	
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

$(document).ready(function(){
	
	// 댓글 달기 클릭 시.
	$('.post_btn_comment').click(function(){
		var _member_id = $('#member_id').val();  	// hidden으로 가져옴.
		
		if(_member_id == 'null'){
			alert('로그인 후 작성 가능합니다.');
		} else{
			$('#comment_write input').focus();
		}
	});
	
	// 좋아요 클릭 시, 좋아요버튼 색깔 바뀜
	$('.post_btn_like').click(function(){		  
		var test = $('.post_btn_like i').attr('class');
		var _orders = $('#board_num').val();			// hidden으로 가져옴.
		var _member_id = $('#member_id').val();		// hidden으로 가져옴. 다른 방법이 있을까??
		
		// 로그인한 회원만 누를 수 있게.	
		if(_member_id == 'null'){
			alert('로그인 후 누르실 수 있습니다.');
		} 
		else{
			// 안눌린 상태 -> 눌린 상태
			if($('.post_btn_like i').attr('class')=='far fa-thumbs-up'){		
					$('.post_btn_like i').attr('class', 'fas fa-thumbs-up');
					
					$.ajax({
						type: "post",
						async: true,
						url: "boardLikeNum.bo?temp=0",	// temp==0 : like 증가
						data: {orders: _orders, member_id: _member_id},
						dataType: "text",
						error : function(request, error){
							alert("ajax 연결 실패"); 
							alert("code:"+ request.status + "\n" + "message:"+request.responseText+"\n"+"error:"+error);
						}
					})
					
			} 
			// 눌린 상태 -> 좋아요 해제
			else{		
				$('.post_btn_like i').attr('class', 'far fa-thumbs-up');
				
				$.ajax({
					type: "post",
					async: true,
					url: "boardLikeNum.bo?temp=1",	// temp==1 : like 감소
					data: {orders: _orders, member_id: _member_id},
					dataType: "text",
					error : function(request, error){
						alert("ajax 연결 실패"); 
						alert("code:"+ request.status + "\n" + "message:"+request.responseText+"\n"+"error:"+error);
					}
				})
			}
		}
	});
	
	
	
	// 댓글 '답글달기' 클릭 시.
	$('.comment_reply_btn').one("click",function(){		  // one()을 통해 1번만 실행되게 설정.
		var input = "<input type='text' class='comment_new_input' name='content' placeholder='댓글을 남겨보세요'>";
		var btn1 = "<input type='button' class='comment_new_cancel' value='취소' onclick='comment_cancel()'>";
		var btn2 = "<input type='button' class='comment_new_action' value='등록'>";
	
		var styleObj = {
				'display' : 'flex',
				'width' : '780px',
				'height' : '30px',
				'padding' : '10px',
		};
			$('#comment_write_new').css(styleObj);
			$('#comment_write_new').append(input);
			$('#comment_write_new').append(btn1);
			$('#comment_write_new').append(btn2);
	});
	

});  // ------ jquery 끝 ------

// 대댓글 취소 버튼 클릭 시.
function comment_cancel(){
	var remove1 = document.querySelector(".comment_new_input");
	var remove2 = document.querySelector(".comment_new_cancel");
	var remove3 = document.querySelector(".comment_new_action");
	var cssRemove = document.querySelector("#comment_write_new");
	
	remove1.parentNode.removeChild(remove1);
	remove2.parentNode.removeChild(remove2);
	remove3.parentNode.removeChild(remove3);
	$('#comment_write_new').removeAttr("style");			// 일반 js function안에서도 jquery문법 쓸 수 있네??
}
	
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
			   		<a href="boardModifyForm.bo?orders=<%=dto.getOrders() %>">수정</a>
  				  <a href="boardDelete.bo?orders=<%=dto.getOrders() %>&sort=<%=dto.getSort() %>">삭제</a>
			  <% } %>
  			</div>
  			<div class="top_btns_right">
  				<!-- 이전글, 다음글도 onclick시 이동되어야 함. -->
  				<% int temp=0; %>
  				<% if(dto.getOrders()!=minNum){ %>
  					<a href="boardDetailMove.bo?sort=<%= dto.getSort() %>&orders=<%= dto.getOrders() %>&id=<%=id %>&temp=0" >이전글</a>
  				<% }%>
  				<% if(dto.getOrders()!=maxNum){ %>
  					<a href="boardDetailMove.bo?sort=<%= dto.getSort() %>&orders=<%= dto.getOrders() %>&id=<%=id %>&temp=1" >다음글</a>
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
  					<%if(!attachedName.equals("null")){ %>
  						<div>첨부파일</div>
							<!-- ---- 이거 컨트롤러 거쳐가게 만들고 싶음. ---- -->
							<a href="../River_Board/file_down.jsp?downFile=<%= attachedName %>"> <%= attachedName %></a>
						<%} %>
  				</div>
  			</div>
 				<div class="post_content"><%= dto.getContent().replaceAll(" ", "&nbsp;").replaceAll("<", "&lt;").replaceAll(">", "&gt;").replaceAll("\n", "<br>") %></div>
 				<form name="content_btns" action="boardCommentWrite.bo?id=<%=id %>&orders=<%=dto.getOrders() %>&sort=<%=dto.getSort() %>" method="POST">
	 				<input type="hidden" id="board_num" value=<%=dto.getOrders() %>>		<!-- 좋아요 ajax data송신을 위함 -->
	 				<input type="hidden" id="member_id" value=<%=id %>>
	 				<div class="post_btn">
	 					<span class="rec_count"></span>		<!-- 좋아요 숫자 들어갈 곳. -->
	 					<div class="post_btn_like">
	 					<%if(isLike == false){ %>
	 						<i class="far fa-thumbs-up"></i>		<!-- 색깔 없는 좋아요 -->
	 					<%} else{ %>
	 						<i class="fas fa-thumbs-up"></i>		<!-- 색깔 있는 좋아요 -->
	 					<%} %>
	 					<span>좋아요</span></div>
	 					<div class="post_btn_comment"><i class="far fa-comment"></i><span>댓글 달기</span></div>
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
	 						<span class="comment_time"><%=commentDTO.getWrited_date().substring(0, 16) %></span>
	 						<span class="comment_reply">
	 						<%if(id != null){ %>
	 							<span class="comment_reply_btn">답글달기</span>
	 						<%} %>
 							<%if(id!=null && id.equals(commentDTO.getWriter_id())){ %>
 								<!-- 수정 클릭 : 일단 view단에서의 변화필요 ->   -->
	 							<span>수정</span>
	 							<a href="boardCommentDelete.bo?orders=<%=dto.getOrders() %>&comment_num=<%=commentDTO.getComment_num() %>&sort=<%=dto.getSort() %>&id=<%=id %>">삭제</a>
 							<%} %>
 							</span>
 								<div id="comment_write_new"></div>
	 					</div>
	 				<%} %>
	 				</div>
	 					<% if(id != null){ %>		<!-- 로그인한 회원만 댓글 작성칸 보이게. -->
		 				<div id="comment_write">
		 					<div><b><%= id %></b></div>
		 					<input type="text" name="content" placeholder="댓글을 남겨보세요" autocomplete='off'>
		 					<div class="comment_write_bot">
		 						<div class="comment_write_attach">(여기가 허전해)</div>
		 						<button>등록</button>   <!-- 근데 이거 submit 아니어도 action으로 넘어가네? 참고로, input type='button'하면 안넘어감 -->
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