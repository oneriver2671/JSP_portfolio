<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
	request.setCharacterEncoding("utf-8");
	String id = (String)session.getAttribute("id");			// 로그인 상태 회원 정보.		
%>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
              <li><a href="perform_list.jsp">공연 예매</a></li>
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
	<article>
		<img src="images/article/main1_444x618.jpg" class="article_img">
		<h3 class="article_title">여기는 제목</h3>
		<div class="article_outline">
			<div><span>일자</span><span>2021-08-07 (토)</span></div>
			<div><span>시간</span><span>18:00</span></div>
			<div><span>장소</span><span>예술의전당 콘서트홀</span></div>
			<div><span>가격</span><span>R석 10만원, S석 7만원, A석 5만원, B석 3만원</span></div>
			<div><span>출연</span><span>바이올린 | 김수연 Suyoen Kim, Violin 피아노ㅣ이진상, Jinsang Lee, Piano</span></div>
		</div>
		<!-- 예매가 불가능할 시, '예매불가'처리 -->
		<a href="" class="article_btn">예매하기</a>
	</article>
	<article>
		<img src="images/article/main2_(444x618).jpg" class="article_img">
		<h3 class="article_title">여기는 제목</h3>
		<div class="article_outline">
			<div><span>일자</span><span>2021-08-07 (토)</span></div>
			<div><span>시간</span><span>18:00</span></div>
			<div><span>장소</span><span>예술의전당 콘서트홀</span></div>
			<div><span>가격</span><span>R석 10만원, S석 7만원, A석 5만원, B석 3만원</span></div>
			<div><span>출연</span><span>바이올린 | 김수연 Suyoen Kim, Violin 피아노ㅣ이진상, Jinsang Lee, Piano</span></div>
		</div>
		<!-- 예매가 불가능할 시, '예매불가'처리 -->
		<a href="" class="article_btn">예매하기</a>
	</article>
</div>


</section>


</div> <!-- wrap 끝 -->

<!-- footer 담겨있음 -->
<jsp:include page="footer.jsp"></jsp:include>	

</body>
</html>