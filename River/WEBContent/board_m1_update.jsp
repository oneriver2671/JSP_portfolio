<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "board.BoardDTO" %>
<%@ page import = "board.BoardDAO" %>
<%
  request.setCharacterEncoding("utf-8");
  String id = (String)session.getAttribute("id");			// 로그인 상태 회원 정보.		
  int orders = Integer.parseInt(request.getParameter("orders"));
  BoardDAO dao = new BoardDAO();
  BoardDTO dto = dao.content(orders);
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글 수정</title>
  <!-- CSS 파일 -->
  <link rel="stylesheet" type="text/css" href="style/board_write.css" media="screen" />
  <link rel="stylesheet" type="text/css" href="style/header.css" media="screen" />
  <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
  <!-- Font Awesome CDN -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css" integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">

  <!-- jQuery -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="js/board_m1_list.js"></script>		<!-- script는 파일 하나로 써도 무방할 듯. -->
</head>
<script>
function nullCheck(){
	var writeForm = document.getElementById('writeAction');
	var sort = document.getElementsByName('sort')[0].value;
	var title = document.getElementsByName('title')[0].value;
	var content = document.getElementsByName('content')[0].value;
	
	if(sort==""){
		alert('카테고리를 선택해주세요.');
	} else if(title=="" || content==""){
		alert('제목과 내용을 입력해주세요.');
	} else{		// 이때 정상적으로 submit 되게.
		writeForm.submit();	
	}
}

</script>


<body>
<jsp:include page="searchBar.jsp"></jsp:include>		<!-- 검색창 담겨있음 -->
<jsp:include page="header.jsp"></jsp:include>		<!-- header 담겨있음 -->
<div id="wrap">
  
  <section>
  	<div id="main_section">
  		<div class="post">
  			<form action="board_m1_updateAction.jsp" name="writeAction" id="writeAction" method="post" >
  				<input type="hidden" name="orders" value=<%= orders %>>
	  			<div class="post_categori"> 
  					<!-- 카테고리 선택값을 어떻게 넘겨줄 수 있을까. click되면 name을 부여하는건 어때? -->
  					<!-- 버튼으로 바꾸고 싶음. --> <!-- hidden은 회색으로 표시하고 싶음. -->
  					<select name="sort" id="sort_choice">
  						<option value="" disabled selected hidden class="sort_hidden">게시판을 선택하세요.</option>
  						<option value="자유게시판">자유게시판</option>
  						<option value="음악이야기">음악이야기</option>
  						<option value="악기정보">악기정보</option>
  						<option value="공연정보">공연정보</option>
  					</select>
  			
  				</div>
	  			<input type="text" class="post_title" name="title" value="<%= dto.getTitle() %>" autocomplete='off'>
  				<textarea class="post_content" name="content" maxlength="2048"><%= dto.getContent() %></textarea>
  				<div class="post_btn">
  				  <input type="button" value="취소" onClick="location.href='board_m1_list.jsp'">
  					<input type="button" name="writeBtn" value="수정" onclick="nullCheck()">
  							<!-- 위에 submit 아닌 것에 name="submit"하면 에러남. 참고!! -->
  				</div>
  			</form>
  		</div>
  	</div>
  </section>
  
<!-- footer 담겨있음 -->
<jsp:include page="footer.jsp"></jsp:include>	

</div>		<!-- wrap 끝 -->
</body>
</html>