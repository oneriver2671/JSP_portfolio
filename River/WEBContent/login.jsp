<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>로그인</title>
  <link rel="stylesheet" type="text/css" href="style/login.css">
  <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
  <!-- Font Awesome CDN -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css" integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">
  
  <!-- jQuery -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="js/login.js"></script>
  <!-- 다음 우편번호 검색 기능 -->
  <script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
</head>
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
        <ul>
          <li><a href="login.jsp">로그인</a></li>
          <li class="headerbar_info_join"><a href="join.jsp">회원가입</a></li>
          <li class="headerbar_info_search">검색 <i class="fas fa-search"></i></li>
        </ul>
      </nav>
      <nav id="navbar">
        <ul>
          <li class="header_level1_1">공연안내/예매
            <ul class="header_level2">
              <li>공연 예매</li>
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
      <h1>로그인</h1>
      <div class="header_info_text_detail">로그인 페이지입니다.</div>
    </div>
    <div class="header_info_image">
      <img src="images/main_piano1.jpg" width="800" height="200">
    </div>
  </div>
</header>   <!-- header 끝 -->

<section>
  <form name = "loginForm" method="POST" action="loginAction.jsp">
    <!-- 해결필요 : 취소 눌러도 action됨 -->
    <div id="login">
      <div id="login_main">
        <h3>홈페이지 로그인</h3>
        <div class="login_input">
          <input type="text" name="id_input" placeholder="아이디를 입력하세요.">
        </div>
        <div class="login_input">
          <input type="password" name="pwd_input" placeholder="비밀번호를 입력하세요.">
        </div>
        <div class="login_btn">
          <input type="submit" class="login_button" name="login_button" value="로그인">
        </div>
        <div id="login_main_bot">
          <div class="id_preserve">
            <input type="checkbox" name="id_preserve"> 아이디 저장
          </div>
          <ul class="login_main_list">
            <li><a href="../River_Join/join.html">회원가입</a></li>
            <li>아이디 찾기</li>
            <li>비밀번호 찾기</li>
          </ul>
        </div>
      </div>
      <div id="login_sns">
        <h3>SNS 계정 로그인</h3>
        <div class="sns_bar" id="sns_naver"><img src="images/naver_logo.png">네이버 계정 로그인</div>
        <div class="sns_bar" id="sns_kakao"><img src="images/kakao_logo.png">카카오 계정 로그인</div>
        <div class="sns_bar" id="sns_facebook"><img src="images/facebook_logo.png">페이스북 계정 로그인</div>

      </div>
  </div>

  <br>
  </form>
</section>
  <!-- footer 담겨있음 -->
<jsp:include page="footer.jsp"></jsp:include>	
</div>
</body>
</html>