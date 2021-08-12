<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.List" %>
<%@ page import = "java.util.Date" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import = "perform.PerformDTO" %>
<%@ page import = "vo.PageInfo" %>

<%
	request.setCharacterEncoding("utf-8");
	String id = (String)session.getAttribute("id");			// 로그인 상태 회원 정보.		
%>
<%
	/* PerformListAction에서 넘어온 paging처리 객체 */
	PageInfo pageInfo = (PageInfo)request.getAttribute("pageInfo");
	int listCount = pageInfo.getListCount();
	int nowPage = pageInfo.getPage();
	int maxPage = pageInfo.getMaxPage();
	int startPage = pageInfo.getStartPage();
	int endPage = pageInfo.getEndPage();
	
	/* 날짜 비교를 위한 Java코드 */
	 SimpleDateFormat dataFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
	 Date today_date = (Date)request.getAttribute("today_date");		// Controller에서 넘어온 '오늘 날짜'
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공연안내</title>
  <!-- CSS 파일 -->
  <link rel="stylesheet" type="text/css" href="style/perform_list.css" media="screen" />
 
  <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
  <!-- Font Awesome CDN -->
	 <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css" integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">
  <!-- jQuery -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>

<script>
/* header 부분 */
$(document).ready(function(){
  $('.header_level2, #header_box').hide();

  $('#navbar').mouseover(function(){
    $('.header_level2, #header_box').fadeIn(500);
  });
  $('#navbar, #header_box').mouseleave(function(){
    $('.header_level2, #header_box').fadeOut(500);
  });
});

function logout(){
	  alert('로그아웃 되었습니다.');
location.href="logout.jsp";
}

</script>


<body>
<jsp:include page="searchBar.jsp"></jsp:include>		<!-- 검색창 담겨있음 -->

<div id="wrap">
<!-- header 부분 -->
<header id="header">
  <div class="headerbar">
    <div class="headerbar_logo">
      <a href="index.jsp"><img src="images/art_logo.png" width="220" height="80"/> </a>
    </div>
    <div class="headerbar_main">
      <nav id="headerbar_info">
        <% if(id != null){
          out.println("<div>\"" + id + "\"님, 환영합니다! </div>");
        } %>
          <ul>
          <% if(id == null){
            out.println("<li class='headerbar_info_login'><a href='login.jsp'>로그인</a></li>");
            out.println("<li class='headerbar_info_join'><a href='join.jsp'>회원가입</a></li>");
            } else{
              out.println("<li class='headerbar_info_join' onclick='logout()'>로그아웃</a></li>");
            }
          %>
            <li class="headerbar_info_search">검색 <i class="fas fa-search"></i></li>
          </ul>
      </nav>
      <nav id="navbar">
        <ul>
          <li class="header_level1_1">공연안내/예매
            <ul class="header_level2">
              <li><a href="performList.pe">공연 예매</a></li>
              <li>예매 안내</li>
              <li>패키지 예매</li>
              <li>예매 확인/취소</li>
              <li>공연관람 예절</li>
            </ul>
          </li>
            <li class="header_level1_2">연습실/악보
              <ul class="header_level2">
                <li>연습실 추천</li>
                <li>연습곡 추천</li>
                <li>악보 찾기</li>
              </ul>
            </li>
          <li class="header_level1">레슨 모집
            <ul class="header_level2">
              <li>강사 찾기</li>
              <li>수강생 찾기</li>
              <li>강사 신청</li>
            </ul>
          </li>
          <li class="header_level1">이용 안내
            <ul class="header_level2">
              <li>이용안내</li>
              <li>홈페이지 소개</li>
              <li>서비스 소개</li>
            </ul>
          </li>
          <li class="header_level1">커뮤니티
            <ul class="header_level2">
              <li>공지사항</li>
               <li><a href="board_free_m1.jsp">자유게시판</a></li>
               <li><a href="boardList.bo?sort=음악이야기">음악이야기</a></li>
               <li><a href="boardList.bo?sort=악기정보">악기정보</a></li>
               <li><a href="boardList.bo?sort=공연정보">공연정보</a></li>
            </ul>
          </li>
          <li class="header_level1_1">마이페이지
            <ul class="header_level2">
              <li>예매확인/취소</li>
              <li>나의 관심공연</li>
              <li>회원정보 변경</li>
              <li>아이디 찾기</li>
              <li>비밀번호 찾기</li> 
            </ul>
          </li>
        </ul>
      </nav>
    </div>
  </div>
  <p id="header_box"></p>
  <div class="header_info">
    <div class="header_info_text">
      <h1>공연예매</h1>
      <div class="header_info_text_detail">공연예매 페이지입니다.</div>
    </div>
    <div class="header_info_image">
      <img src="images/main_piano1.jpg" width="800" height="200">
    </div>
  </div>
</header>   <!-- header 끝 -->

<section>
<%if(id!=null && id.equals("manager")){ %>
<div class="for_manager">관리자용 입력 페이지 => <a href="perform_add.jsp">이동</a> </div>
<div class="for_manager">관리자용 수정/삭제 페이지 => <a href="performListManager.pe">이동</a> </div>
<%} %>
<div id="section_top">
	<div id="calendar_category">
		<div id="cal_month">월간 일정</div>
		<div id="cal_year">연간 일정</div>
	</div>
	<div id="calendar_choice">
		<select name="year_choice" id="year_choice">
			<option value="2020">2020년</option>
			<option value="2021" selected>2021년</option>	
			<option value="2022">2022년</option>
		</select>
		<div id="select_date">2021.8</div>
		<input type="submit" name="calendar_choice" id="calendar_choice_btn" value="선택">
		<div class="month_choice">
			<input type="button" class="month_choice_list" name="january" value="1월">
			<input type="button" class="month_choice_list" name="february" value="2월">
			<input type="button" class="month_choice_list" name="march" value="3월">
			<input type="button" class="month_choice_list" name="april" value="4월">
			<input type="button" class="month_choice_list" name="may" value="5월">
			<input type="button" class="month_choice_list" name="june" value="6월">
			<input type="button" class="month_choice_list" name="july" value="7월">
			<input type="button" class="month_choice_list" name="agust" value="8월">
			<input type="button" class="month_choice_list" name="september" value="9월">
			<input type="button" class="month_choice_list" name="october" value="10월">
			<input type="button" class="month_choice_list" name="november" value="11월">
			<input type="button" class="month_choice_list" name="december" value="12월">
		</div>
	</div>
</div>


<div id="section_main">
<!-- 15개씩 paging 처리 -->
<%
	List<PerformDTO> performList = (List)request.getAttribute("performList");
	for(int i=0; i<performList.size(); i++){
		PerformDTO performDTO = performList.get(i); 
		%>
		
		<article>
				<!-- 제목 input type에 value형태로 써주면 <aa> 이런거 다 표시 됨. why?? 무슨 차이로 인해??  -->
			<a href="performDetail.pe?perform_num=<%=performDTO.getPerform_num() %>"><img src="performUpload/<%=performDTO.getMain_img() %>" class="article_img"></a>
			<a href="performDetail.pe?perform_num=<%=performDTO.getPerform_num() %>" class="article_title"><%=performDTO.getPerform_title() %></a>
			<div class="article_outline">
				<div><span>일자</span><span><%=performDTO.getPerform_date().substring(0, 10) %> (<%=performDTO.getPerform_day() %>) </span></div>
				<div><span>시간</span><span><%=performDTO.getPerform_date().substring(11, 16) %></span></div>
				<div><span>장소</span><span><%=performDTO.getLocation() %></span></div>
				<!-- 가격 처리 필요 (0이면 표시x, 무료도 처리 필요함 -> R석에 1을 입력하면 무료로 처리하자.) ★ -->
				<div><span>가격</span>
				<%
					String format_priceR = String.format("%,d", performDTO.getPrice_R()); 
					String format_priceS = String.format("%,d", performDTO.getPrice_S()); 
					String format_priceA = String.format("%,d", performDTO.getPrice_A()); 
					String format_priceB = String.format("%,d", performDTO.getPrice_B()); 
					String format_priceAll = String.format("%,d", performDTO.getPrice_All()); 
				%>
				<span>
				 <!-- 전석 가격이 존재할 경우, 전석 이외의 가격은 보이지 않음  -->
					<% if(performDTO.getPrice_All()!=0){ %> 전석 <%=format_priceAll %> <%} else{ %> 
						<% if(performDTO.getPrice_R()!=0){ %> R석 <%=format_priceR %> | <%} %>
						<% if(performDTO.getPrice_S()!=0){ %> S석 <%=format_priceS %> | <%} %>
						<% if(performDTO.getPrice_A()!=0){ %> A석 <%=format_priceA %> | <%} %>
						<% if(performDTO.getPrice_B()!=0){ %> B석 <%=format_priceB %> <%} %>
					<%} %>
				</span></div>
				
				<div><span>출연</span><span><%=performDTO.getArtist_main() %></span></div>
			</div>
			<!-- 현재 날짜와 비교 후, 각 상황에 맞게 3가지로 분류 -->
			<% 
				Date open_date = dataFormat.parse(performDTO.getOpen_date());
				Date perform_date = dataFormat.parse(performDTO.getPerform_date());
				if(open_date.after(today_date)){ %>
					<div class="article_btn_prepare">티켓 오픈 준비중</div>	
				<%} else if(perform_date.after(today_date)) { %>	
					<a href="performDetail.pe?perform_num=<%=performDTO.getPerform_num() %>" class="article_btn">예매하기</a>	
				<%} else{ %>
			    <div class="article_btn_end">공연 종료</div>
				<%} %>
		</article>
	<%} %> <!-- for문 종료 -->
	
</div>
<div id="bot_section">
	<div>
		<%if(nowPage>1){ %>
		<a href="performList.pe?page=<%=nowPage-1 %>" class="page_num_left">＜</a>
	<%} %>

	<%for(int a=startPage; a<=endPage; a++){
			if(a==nowPage){%>
				<span class="page_num_now"><%=a %></span>
		<%} else{ %>
			<a href="performList.pe?page=<%=a %>" class="page_num"><%=a %></a>
			<%} %>
	<%} %>
	<%if(nowPage<maxPage){ %>
			<a href="performList.pe?page=<%=nowPage+1 %>" class="page_num_right">＞</a>
		<%} %> 
	</div>
</div>

</section>


</div> <!-- wrap 끝 -->

<!-- footer 담겨있음 -->
<jsp:include page="footer.jsp"></jsp:include>	

</body>
</html>