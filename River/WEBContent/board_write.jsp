<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import = "board.BoardDTO" %>
<%
  request.setCharacterEncoding("utf-8");
  String id = (String)session.getAttribute("id");			// 로그인 상태 회원 정보.
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>글쓰기</title>
  <!-- CSS 파일 -->
  <link rel="stylesheet" type="text/css" href="style/board_write.css" media="screen" />   <!-- 이거 그냥 model1과 통일 -->
  <link rel="stylesheet" type="text/css" href="style/header.css" media="screen" />
  <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
  <!-- Font Awesome CDN -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css" integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">

  <!-- jQuery -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
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
	} else{	
		writeForm.submit();			// form에서 다른 input의 name이 'submit'이면 오류남 ★
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
  			<form action="boardWrite.bo?writer_id=<%= id %>" name="updateAction" id="writeAction" enctype="multipart/form-data" method="post" >
  					<!-- enctype : 첨부파일 기능으로 인해 추가  -->
	  			<div class="post_categori"> 
  					<!-- 카테고리 선택값을 어떻게 넘겨줄 수 있을까. click되면 name을 부여하는건 어때? -->
  					<!-- 버튼으로 바꾸고 싶음. --> <!-- hidden은 회색으로 표시하고 싶음. -->
  					<select name="sort">
  						<option value="" disabled selected hidden class="sort_hidden">게시판을 선택하세요.</option>
  						<option value="자유게시판">자유게시판</option>
  						<option value="음악이야기">음악이야기</option>
  						<option value="악기정보">악기정보</option>
  						<option value="공연정보">공연정보</option>
  					</select>
  			
  				</div>
	  			<input type="text" class="post_title" name="title" placeholder="제목을 입력하세요." autocomplete='off'>
  				<textarea class="post_content" name="content" placeholder="내용을 입력하세요." maxlength="2048"></textarea>
  				<input type="file" id="post_file" name="post_file" required="required" />		<!-- required는 무슨뜻?? -->
  				<div class="post_btn">
  				  <input type="button" value="취소" onClick="goBack()">
  					<input type="button" name="writeBtn" value="작성" onclick="nullCheck()">
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