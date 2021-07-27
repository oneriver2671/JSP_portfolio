<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  // 로그인 성공 후, 정보 가져오기
  request.setCharacterEncoding("utf-8");
  String id = (String)session.getAttribute("id");			
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>header부분</title>
  <!-- CSS 파일 -->
  <link rel="stylesheet" type="text/css" href="header_style.css" media="screen" />
  <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
  
   <!-- jQuery -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

  <!-- Font Awesome CDN -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css" integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">
</head>
<script>
$(document).ready(function(){
	 $('.header_level2, #header_box').hide();

	  $('#navbar').mouseover(function(){
	    $('.header_level2, #header_box').fadeIn(500);
	  });
	  $('#navbar, #header_box').mouseleave(function(){
	    $('.header_level2, #header_box').fadeOut(500);
	  });

	  $('#searchbar').hide();
	 
});

// 로그아웃 기능.
function logout(){
	  alert('로그아웃 되었습니다.');
  location.href="../River_Index/logout.jsp";
  // session.invalidate();				// session 삭제가 되질 않는다... 무엇이 문제인가.. -> 해결 : jsp문법인데 script안에 썼기 때문. 아래와 같이 써야함.
  <% // session.removeAttribute("id"); %>   // but, 자동 새로고침이 필요하니 다른 페이지로 이동 후 다시 돌아오는 방법을 사용.
}
</script>
<body>
 
  <!-- header 부분 -->
  <header id="header">
    <div class="headerbar">
      <div class="headerbar_logo">    <!-- logo 클릭 시, session 정보가 초기화되지 않게 해야함 -> 엥? 지금은 괜찮네. -->
      <!-- 지금은 괜찮은 이유 : 맨 위에서 session.setAttribute를 다른 페이지에서 해줬기 때문. -->
        <a href="../River_Index/index.jsp"><img src="../River_Index/images/art_logo.png" width="220" height="80"/> </a>
      </div>
      <div class="headerbar_main">
        <nav id="headerbar_info">
        <% if(id != null){
          out.println("<div>\"" + id + "\"님, 환영합니다! </div>");
        } %>
          <ul>
          <% if(id == null){
            out.println("<li class='headerbar_info_login'><a href='../River_Login/login.html'>로그인</a></li>");
            out.println("<li class='headerbar_info_join'><a href='../River_Join/join.jsp'>회원가입</a></li>");
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
                <li><a href="../River_Board/freeBoard.jsp">자유게시판</a></li>
                <li><a href="boardList.bo?sort=음악이야기">음악이야기</a></li>
                <li><a href="boardList.bo?sort=악기정보">악기정보</a></li>
                <li><a href="boardList.bo?sort=공연정보">공연정보</a></li>
               
              </ul>
            </li>
            <li class="header_level1_3">마이페이지
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
  </header>   <!-- header 종료 -->
</body>
</html>