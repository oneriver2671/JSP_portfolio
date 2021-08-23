<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%
  // 로그인 성공 후, 정보 가져오기
  request.setCharacterEncoding("utf-8");
  // String id_input = request.getParameter("id_input");
  String id = (String)session.getAttribute("id");					// session은 톰캣서버를 다시 실행시켜도 남아있네??
%>

<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>메인 페이지</title>
  <!-- CSS 파일 -->
  <link rel="stylesheet" type="text/css" href="style/index.css" media="screen" />
  <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">

  <!-- Font Awesome CDN -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css" integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">

  <!-- jQuery -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="js/index.js"></script>

  <!-- 이미지 슬라이더 1 -->
      <!-- Demo CSS -->
<link rel="stylesheet" href="FlexSlider_01/flexslider.css" type="text/css" media="screen" />
      <!-- Modernizr -->
  <script src="FlexSlider_01/demo/js/modernizr.js"></script>
  <script>window.jQuery || document.write('<script src="js/libs/jquery-1.7.min.js">\x3C/script>')</script>
      <!-- FlexSlider -->
  <script defer src="FlexSlider_01/jquery.flexslider.js"></script>

  <!-- 슬라이더(레슨 찾기) -->
  <script src="jquery-1.2.6.js" type="text/javascript"></script>
  <script src="coda-slider/jquery.scrollTo-1.3.3.js" type="text/javascript"></script>
  <script src="coda-slider/jquery.localscroll-1.2.5.js" type="text/javascript" charset="utf-8"></script>
  <script src="coda-slider/jquery.serialScroll-1.2.1.js" type="text/javascript" charset="utf-8"></script>
  <script src="coda-slider/coda-slider.js" type="text/javascript" charset="utf-8"></script>

</head>

<body>

<script>
/* jQuery */
$(document).ready(function(){
  $('.header_level2, #header_box').hide();

  $('#navbar').mouseover(function(){
    $('.header_level2, #header_box').fadeIn(500);
  });
  $('#navbar, #header_box').mouseleave(fu nction(){
    $('.header_level2, #header_box').fadeOut(500);
  });
</script>

<div id="wrap">
<jsp:include page="header.jsp"></jsp:include>		<!-- header 담겨있음 -->
<jsp:include page="searchBar.jsp"></jsp:include>		<!-- 검색창 담겨있음 -->

  <section>
    <div id="main_section">
      <img src="images/background.jpg" class="background">
    <!-- 이미지 슬라이더 -->
      <div class="flexslider">
        <ul class="slides">
          <li>
            <img src="images/main1_444x618.jpg" />
          </li>
          <li>
            <img src="images/main2_(444x618).jpg" />
          </li>
          <li>
            <img src="images/main3_444x618px.jpg" />
          </li>
          <li>
            <img src="images/main4(444x618).jpg"/>
          </li>
          <li>
            <img src="images/main5(444x618).jpg" />
          </li>
          <li>
            <img src="images/main6(444x618).jpg" />
          </li>
        </ul>
      </div>

      <div class="imgCover">
        <div class="imgCover_1"><i class="fas fa-search"></i></div>
        <div class="imgCover_2"><i class="fas fa-search"></i></div>
        <div class="imgCover_3"><i class="fas fa-search"></i></div>
        <div class="imgCover_4"><i class="fas fa-search"></i></div>
        <div class="imgCover_5"><i class="fas fa-search"></i></div>
        <div class="imgCover_6"><i class="fas fa-search"></i></div>
      </div>
      <div class="small_images">
        <img src="images/small1_228x304px.jpg" class="small_1">
        <img src="images/small2.jpg" class="small_2">
        <img src="images/small3.jpg" class="small_3">
        <img src="images/small4.gif" class="small_4">
        <img src="images/small5.gif" class="small_5">
        <img src="images/small6.gif" class="small_6">
      </div>
    </div>
  </section>      <!-- main section 종료 -->
    
  <section id="mid_section">
    <div class="lessonInfo">
      <div class="lessonInfo_top">
        <div class="lesson_search"><h2>레슨 찾기</h2></div>
        <div class="room_search"><h2>연습실 찾기</h2></div>
      </div>
    
      <div id="slider" class="slider">    
        <ul class="navigation">
          <li><a href="#piano">피아노</a></li>
          <li><a href="#sing_man">성악(남)</a></li>
          <li><a href="#sing_woman">성악(여)</a></li>
          <li><a href="#violin">바이올린</a></li>
          <li><a href="#viola">비올라</a></li>
          <li><a href="#cello">첼로</a></li>
          <li><a href="#oboe">오보에&클라리넷</a></li>
          <li><a href="#flute">플룻</a></li>
          <li><a href="#bassoon">바순&호른</a></li>
          <li><a href="#percussion">타악기</a></li>
        </ul>
        <span class="searchBox">
          <input type="text" name="lessonSearch" placeholder="빠른 찾기" size="26"/>
          <div><i class="fas fa-search"></i></div>
        </span>
    
        <div class="scroll">
          <div class="scrollContainer">
            <div class="panel" id="piano">
              <img src="images/brunch1.png">
              <img src="images/brunch2.png">
              <img src="images/brunch3.png">
              <img src="images/brunch4.png">
            </div>
            <div class="panel" id="sing_man">
              <img src="images/brunch5.png">
              <img src="images/brunch6.png">
              <img src="images/brunch7.png">
            </div>
            <div class="panel" id="sing_woman">
              <img src="images/brunch6.png">
            </div>
            <div class="panel" id="violin">
              <img src="images/brunch8.png">
              <img src="images/brunch9.png">
            </div>
            <div class="panel" id="viola"></div>
            <div class="panel" id="cello"></div>
            <div class="panel" id="oboe"></div>
            <div class="panel" id="flute"></div>
            <div class="panel" id="bassoon"></div>
            <div class="panel" id="percussion"></div>
          </div>
        </div>
      </div>

      <div id="content_room_search" class="slider">    
        <ul class="navigation">
          <li><a href="#sinchon">신촌</a></li>
          <li><a href="#hongdae">홍대</a></li>
          <li><a href="#hapjeong">합정</a></li>
          <li><a href="#mapo">공덕/마포</a></li>
          <li><a href="#jongno">광화문/종로</a></li>
          <li><a href="#gangnam">강남</a></li>
          <li><a href="#sadang">사당</a></li>
          <li><a href="#seocho">교대/서초</a></li>
          <li><a href="#ilsan">일산</a></li>
        </ul>
        <span class="searchBox">
          <input type="text" name="lessonSearch" placeholder="빠른 찾기" size="26"/>
          <div><i class="fas fa-search"></i></div>
        </span>
    
        <div class="scroll">
          <div class="scrollContainer">
            <div class="panel2" id="sinchon">
              <img src="images/room1.png">
              <img src="images/room2.png">
              <img src="images/room1.png">
              <img src="images/room2.png">
            </div>
            <div class="panel2" id="hongdae">
              <img src="images/room2.png">
              <img src="images/room2.png">
              <img src="images/room2.png">         
            </div>
            <div class="panel2" id="hapjeong">
              <img src="images/room1.png">
              <img src="images/room1.png">
              <img src="images/room1.png">         
            </div>
            <div class="panel2" id="mapo">
              <img src="images/room1.png">          
            </div>
            <div class="panel2" id="jongno">
              <img src="images/room1.png">          
            </div>
            <div class="panel2" id="gangnam">
              <img src="images/room2.png">          
            </div>
            <div class="panel2" id="sadang">
              <img src="images/room1.png">          
            </div>
            <div class="panel2" id="seocho">
              <img src="images/room1.png">          
            </div>
            <div class="panel2" id="ilsan">
              <img src="images/room1.png">          
            </div>
          </div>
        </div>
      </div>
  
    </div>
  
    
  <!-- <div class="practiceInfo">
    <div class="lessonInfo_top">
      <h2>악보 찾기 & 연습곡 추천</h2>
    </div>
    
    <div class="practiceInfo_select">
      <img src="images/singing_white.png" width="40" height="40">
      <img src="images/violin.png" width="40" height="40">
      <img src="images/basoon_white.png" width="40" height="40">
      <img src="images/piano_white.png" width="40" height="40">
      <img src="images/snaredrum_white.png" width="40" height="40">
    </div> -->
      <!-- Place somewhere in the <body> of your page -->
    <!-- <div class="flexslider_2">
      <img src="images/scores/Elise.png">
      <img src="images/scores/prelude23_5_1.png">
      <img src="images/scores/Elise.png">
    </div>
  </div> -->

  </section>    <!-- mid_section 종료 -->

  <div id="bottom_wrap">
    <section id="bottom_section">
      <div class="notice">
        <div class="notice_top">
          <h2>공지사항</h2>
          <img src="images/btn_more.png">
        </div>
        <div class="notice_list">
          <div><div>공지1</div><span>2021.06.03</span></div>
          <div><div>공지2</div><span>2021.06.01</span></div>
          <div><div>공지3</div><span>2021.05.24</span></div>
          <div><div>공지4</div><span>2021.05.22</span></div>
          <div><div>공지5</div><span>2021.05.11</span></div>
          <div><div>공지6</div><span>2021.05.06</span></div>
        </div>
      </div>

      <div class="board">
        <div class="board_top">
          <h2>커뮤니티</h2>
          <ul>
            <li>자유게시판</li>
            <li>음악이야기</li>
            <li>악기정보</li>
            <li>공연정보</li>
          </ul>
          <img src="images/btn_more.png">
        </div>
        <!-- 이 부분 실제 DB 가져와서 넣기(최신글 6개만) -->
        <div class="notice_list">
          <div><div>안녕하세요 피아노 잘치고 싶어요!</div><span>2021.06.01</span></div>
          <div><div>레슨선생님 구합니다~</div><span>2021.06.01</span></div>
          <div><div>올해는 코로나 때문에...</div><span>2021.05.28</span></div>
          <div><div>예당 vs 롯데콘홀 음향 어디가 더 좋은가요?</div><span>2021.05.27</span></div>
          <div><div>야마하 디지털피아노 추천 부탁드립니다.</div><span>2021.05.27</span></div>
          <div><div>이건 작곡가 거의 사이코패스 아닙니까ㅜㅜ</div><span>2021.05.26</span></div>
        </div>
      </div>
    </section>   <!-- bottom_section 종료 -->
  </div>
<!-- footer 담겨있음 -->
<jsp:include page="footer.jsp"></jsp:include>	
</div>   <!-- wrap 종료 -->
</body>
</html>