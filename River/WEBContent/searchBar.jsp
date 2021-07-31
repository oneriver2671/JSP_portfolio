<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
 <!-- CSS 파일 -->
  <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
  
   <!-- jQuery -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>

  <!-- Font Awesome CDN -->
  <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css" integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">
</head>
<style>
* {
  font-family: "Nanum Gothic";
}
a {
  text-decoration: none;
}
a:visited {
  text-decoration: none;
}
li {
  list-style: none;
}
body {
  margin: 0;
  padding: 0;
}
#wrap {
  background-color: #41414c;
}

#searchbar {
  width: 300px;
  height: 100%;
  top: 0px;
  right: 0;
  position: fixed;
  background-color: #1d2335;
  z-index: 5;
  color: whitesmoke;
  /* display: flex;
  justify-content: center; */
}
#searchbar h3 {
  /* width: 180px; */
  height: 40px;
  text-align: center;
  margin-left: auto;
  margin-right: auto;
  margin-top: 0;
}
.searchbar_text {
  width: 200px;
  height: 30px;
  margin-left: auto;
  margin-right: auto;
  margin-top: 40px;
  padding: 0;
  /* display: block; */
}
.searchbar_input {
  width: 250px;
  height: 40px;
  border-bottom: solid 2px whitesmoke;
  margin-left: auto;
  margin-right: auto;
  margin-top: 5px;
  margin-bottom: 100px;
  padding: 0;
  display: flex;
  position: relative;
}
.searchbar_input input {
  margin-left: 5px;
  background-color: #1d2335;
  border: none;
  color: rgba(245, 245, 245, 0.801);
  font-size: 13pt;
}
.searchbar_input input:focus {
  outline: none;
}
.searchbar_input i {
  position: absolute;
  right: 12px;
  top: 12px;
}
.searchbar_rankBox {
  width: 250px;
  height: 400px;
  border: solid 2px gray;
  margin-top: 5px;
  margin-left: auto;
  margin-right: auto;
  display: flex;
  flex-direction: column;
  justify-content: space-evenly;
  padding-top: 5px;
  padding-bottom: 5px;
}
.searchbar_rankBox > div {
  margin-left: 10px;
}

</style>
<script>
$(document).ready(function(){
	$('#searchbar').hide();
	 // 검색창 생성
	  $('.headerbar_info_search').click(function(){
	    // $('#searchbar').show("slide",{direction: "right"}, '3000');
	    $('#searchbar').fadeIn(500);

	  });
	  $('#searchbar').mouseleave(function(){
	    $(this).fadeOut(500);
	  });
});
</script>

<body>
	<div id="searchbar">
    <div class="searchbar_text"><h3>검색어 입력</h3></div>
    <div class="searchbar_input">
      <input type="text" name="main_search" placeholder="국립발레단" size="28"/>
      <div><i class="fas fa-search"></i></div>
    </div>

    <div class="searchbar_text"><h3>실시간 인기 검색어</h3></div>
    <div class="searchbar_rankBox">
      <div>1. 국립발레단</div>
      <div>2. 오페라의 유령</div>
      <div>3. 치즈돈까스</div>
      <div>4. 원펀맨</div>
      <div>5. 배고픈데 뭐먹지</div>
      <div>6. 유기농 샐러리주스</div>
      <div>7. BBQ 황금올리브 치킨</div>
      <div>8. 매운갈비찜</div>
      <div>9. SG워너비</div>
      <div>10. 여행가고 싶다</div>
    </div>
    </div>
</body>
</html>