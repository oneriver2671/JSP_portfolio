<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.lang.*" %>
	
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title>회원가입</title>
  <link rel="stylesheet" type="text/css" href="style/join.css">
  <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
  <!-- Font Awesome CDN -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css" integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">
  
  <!-- jQuery -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <script src="js/join.js"></script>
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
          <li class="header_level1">이용 안내
            <ul class="header_level2">
              <li>이용안내</li>
              <li>홈페이지 소개</li>
              <li>서비스 소개</li>
            </ul>
          </li>
          <li class="header_level1">커뮤니티
            <ul class="header_level2">
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
      <h1>회원가입</h1>
      <div class="header_info_text_detail">회원가입 페이지입니다.</div>
    </div>
    <div class="header_info_image">
      <img src="images/main_piano1.jpg" width="800" height="200">
    </div>
  </div>
</header>    <!-- header 끝 -->
 

<section>
  <form name = "joinForm" method="POST" action="join_dbInput.jsp">		<!-- 조건을 만족해야 action이 실행된다. (js 함수 참고) -->
  <table class="inputTable" border="1" cellspacing="0">
    <tr>
      <td colspan="2" class="table_top">회원정보 입력</td>
    </tr>
    <tr>
      <td> 이름 *</td>
      <td><input type="text" name="nameInput" size="40" maxlength="20" placeholder="한글 또는 영문으로 입력해주세요."> </td>
    </tr>
    <tr>
      <td>아이디 *</td>
      <td class='same_check'>
        <input type="text" name="idInput" id="id_input" size="40" maxlength="20" placeholder="6자 이상, 15자 이하 입력">
        <input type="button" name="mail_check" id="checkId_btn" class="submit_class" value="중복확인" onclick="checkId_ajax()">
       	<div id="id_ok"></div>
      </td>
    </tr>
    <tr>
      <td>비밀번호 *</td>
      <td><input type="password" name="pwdInput" size="40" maxlength="30" value="" placeholder="영문자, 숫자, 특수문자 조합의 9자 이상"></td>
    </tr>
    <tr>
      <td>비밀번호 확인 *</td>
      <td><input type="password" name="pwdCheck" size="40" maxlength="30"></td>
    </tr>
    <tr>
      <td>생년월일 *</td>
      <td>
        <select class="birth_1" name="birth_1">
          <option value="1930">1930</option>
          <option value="1931">1931</option>
          <option value="1932">1932</option>
          <option value="1933">1933</option>
          <option value="1934">1934</option>
          <option value="1935">1935</option>
          <option value="1936">1936</option>
          <option value="1937">1937</option>
          <option value="1938">1938</option>
          <option value="1939">1939</option>
          <option value="1940">1940</option>
          <option value="1941">1941</option>
          <option value="1942">1942</option>
          <option value="1943">1943</option>
          <option value="1944">1944</option>
          <option value="1945">1945</option>
          <option value="1946">1946</option>
          <option value="1947">1947</option>
          <option value="1948">1948</option>
          <option value="1949">1949</option>
          <option value="1950">1950</option>
          <option value="1951">1951</option>
          <option value="1952">1952</option>
          <option value="1953">1953</option>
          <option value="1954">1954</option>
          <option value="1955">1955</option>
          <option value="1956">1956</option>
          <option value="1957">1957</option>
          <option value="1958">1958</option>
          <option value="1959">1959</option>
          <option value="1960">1960</option>
          <option value="1961">1961</option>
          <option value="1962">1962</option>
          <option value="1963">1963</option>
          <option value="1964">1964</option>
          <option value="1965">1965</option>
          <option value="1966">1966</option>
          <option value="1967">1967</option>
          <option value="1968">1968</option>
          <option value="1969">1969</option>
          <option value="1970">1970</option>
          <option value="1971">1971</option>
          <option value="1972">1972</option>
          <option value="1973">1973</option>
          <option value="1974">1974</option>
          <option value="1975">1975</option>
          <option value="1976">1976</option>
          <option value="1977">1977</option>
          <option value="1978">1978</option>
          <option value="1979">1979</option>
          <option value="1980">1980</option>
          <option value="1981">1981</option>
          <option value="1982">1982</option>
          <option value="1983">1983</option>
          <option value="1984">1984</option>
          <option value="1985">1985</option>
          <option value="1986">1986</option>
          <option value="1987">1987</option>
          <option value="1988">1988</option>
          <option value="1989">1989</option>
          <option value="1990">1990</option>
          <option value="1991">1991</option>
          <option value="1992">1992</option>
          <option value="1993">1993</option>
          <option value="1994">1994</option>
          <option value="1995">1995</option>
          <option value="1996">1996</option>
          <option value="1997">1997</option>
          <option value="1998">1998</option>
          <option value="1999">1999</option>
          <option value="2000">2000</option>
          <option value="2001">2001</option>
          <option value="2002">2002</option>
          <option value="2003">2003</option>
          <option value="2004">2004</option>
          <option value="2005">2005</option>
          <option value="2006">2006</option>
          <option value="2007">2007</option>
          <option value="2008">2008</option>
          <option value="2009">2009</option>
          <option value="2010">2010</option>
          <option value="2011">2011</option>
          <option value="2012">2012</option>
          <option value="2013">2013</option>
          <option value="2014">2014</option>
          <option value="2015">2015</option>
          <option value="2016">2016</option>
          <option value="2017">2017</option>
          <option value="2018">2018</option>
          <option value="2019">2019</option>
          <option value="2020">2020</option>
        </select>
        년
        <select class="birth_2" name="birth_2_1">
          <option value="1">1</option>
          <option value="2">2</option>
          <option value="3">3</option>
          <option value="4">4</option>
          <option value="5">5</option>
          <option value="6">6</option>
          <option value="7">7</option>
          <option value="8">8</option>
          <option value="9">9</option>
          <option value="10">10</option>
          <option value="11">11</option>
          <option value="12">12</option>
        </select>
        월
        <select class="birth_2" name="birth_2_2">
          <option value="1">1</option>
          <option value="2">2</option>
          <option value="3">3</option>
          <option value="4">4</option>
          <option value="5">5</option>
          <option value="6">6</option>
          <option value="7">7</option>
          <option value="8">8</option>
          <option value="9">9</option>
          <option value="10">10</option>
          <option value="11">11</option>
          <option value="12">12</option>
          <option value="13">13</option>
          <option value="14">14</option>
          <option value="15">15</option>
          <option value="16">16</option>
          <option value="17">17</option>
          <option value="18">18</option>
          <option value="19">19</option>
          <option value="20">20</option>
          <option value="21">21</option>
          <option value="22">22</option>
          <option value="23">23</option>
          <option value="24">24</option>
          <option value="25">25</option>
          <option value="26">26</option>
          <option value="27">27</option>
          <option value="28">28</option>
          <option value="29">29</option>
          <option value="30">30</option>
          <option value="31">31</option>
        </select>
        일
      </td>
    </tr>
    <tr>
      <td>성별 *</td>
      <td>
        <input type="radio" name="gender" value="m" checked="on"> 남
        <input type="radio" name="gender" value="f"> 여
      </td>
    </tr>
    <tr>
      <td>연락처 *</td>
      <td class='same_check'> 
        <select name="tel_sort" class="tel_sort">
          <option value="SKT">SKT</option>
          <option value="KT">KT</option>
          <option value="LGU+">LGU+</option>
          <option value="SKT알뜰폰">SKT알뜰폰</option>
          <option value="KT알뜰폰">KT알뜰폰</option>
          <option value="LGU+알뜰폰">LGU+알뜰폰</option>
        </select>
        <select name="tel_01" class="tel_first">
          <option value="010">010</option>
          <option value="011">011</option>
          <option value="016">016</option>
          <option value="017">017</option>
          <option value="018">018</option>
          <option value="019">019</option>
        </select>
        -
        <input type="text" name="tel_02" size="8" maxlength="4">
        -
        <input type="text" name="tel_03" size="8" maxlength="4">
         <input type="button" name="tel_check" id="checkTel_btn" class="submit_class" value="중복확인" onclick="checkTel_ajax()">
        <div id="tel_ok"></div>
      </td>
    </tr>
    <tr>
      <td>이메일 주소 *</td>
      <td>  
        <input type="text" name="mail_front" id="mail_front" size="18">
        @
        <input type="text" name="mail_back" id="mail_back" size="18">
        <select name="mail_choice" onchange="mailSelect_02()">
          <option value="직접 입력">직접 입력</option>
          <option value="naver.com">naver.com</option>
          <option value="hanmail.net">hanmail.net</option>
          <option value="google.com">google.com</option>
          <option value="nate.com">nate.com</option>
        </select>
        <input type="button" name="mail_check" class="submit_class"  id="checkEmail_btn" value="중복확인" onclick="checkEmail_ajax()">
        <div id="email_ok"></div>
      </td>
    </tr>
  
    <tr class="add_tr">
      <td>주소</td>
      <td>
        <input type="text" id="sample6_postcode" name="add_input_1" size="20" placeholder="우편번호">
        <input type="button" class="find_add" name="find_add" onclick="sample6_execDaumPostcode()" value="우편번호 찾기">
        <input type="text" id="sample6_address" name="add_input_2" size="75" placeholder="주소"> <br>
        <input type="text" id="sample6_detailAddress" name="addr_detail" size="45" placeholder="상세주소">
        <input type="text" id="sample6_extraAddress" size="25" placeholder="참고항목">
      </td>
    </tr>

    <tr>
      <td>이메일 수신여부</td>
      <td>
        <input type="radio" name="mailOK" value="1" checked="on"> 예
        <input type="radio" name="mailOK" value="0"> 아니오
      </td>
    </tr>
    <tr>
      <td>SMS 수신여부</td>
      <td>
        <input type="radio" name="sms_ok" value="1" checked="on"> 예
        <input type="radio" name="sms_ok" value="0"> 아니오
        <div>
          <div class="sms_check_head">개인정보보호법 제22조 제3항에 따른 <마케팅 활용에 관한 동의>
          </div>
          <div class="sms_check">
          1. 수집목적 : 공연, 이벤트, 할인안내 등의 다양한 정보 제공 <br> 
          2. 보유기간 : 개인정보 보유기간 만료시까지, 동의 유지기간 공안 <br>
          3. 이용항목 : 휴대폰 번호, 이메일 주소 (동의사항에 한함) <br> 
          4. 동의거부시 불이익 : 고객은 동의를 거부할 권리가 있으며, 동의하지 않으실 경우 수집목적에 따른 이벤트 할인안내 등의 정보를 제공받을 수 없습니다.
          </div>
        </div>
      </td>
    </tr>

  </table>
  <br>
  <div class="buttons_bottom">
    <a href="index.jsp">
      <input type="button" class="cancel_button" name="cancel_button" value="취소">
    </a>
    <!-- submit 대신 button을 쓰니, 초기화되버리진 않음. 하지만 form의 정보를 넘겨야하는데. -> script에서 해결. -->
    <input type="button" class="join_button" name="join_button" value="가입하기" onclick="join()">	<!-- 클릭 시, form을 매개변수로. -->
  </div>
  </form>
</section>
<!-- footer 담겨있음 -->
<jsp:include page="footer.jsp"></jsp:include>	
</div>
</body>
</html>