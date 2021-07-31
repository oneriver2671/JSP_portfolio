<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>

<style>
footer {
  /* margin-top: 100px; */
  margin-left: auto;
  margin-right: auto;
  height: 100px;
  background-color: #1d2335;
  color: whitesmoke;
  position: relative;
}
#footer_bar {
  width: 1200px;
  height: 100px;
  margin-left: auto;
  margin-right: auto;
  /* border: solid 2px gray; */
  display: flex;
  justify-content: space-between;
  align-items: center;
}
.footer_linkBox {
  padding: 0;
  width: 400px;
  height: 40px;
  /* float: left; */
  display: flex;
  justify-content: space-evenly;
  align-items: center;
  /* border: solid 2px green; */
}

.footer_snsBox {
  padding: 0;
  width: 200px;
  height: 40px;
  /* float: right; */
  display: flex;
  justify-content: space-evenly;
  align-items: center;
  /* border: solid 2px green; */
}
</style>

<!-- footer -->
  <footer>
    <div id="footer_bar">
      <ul class="footer_linkBox">
        <li>사이트맵</li>
        <li>개인정보처리방침</li>
        <li>이용약관</li>
      </ul>
      <ul class="footer_snsBox">
        <li><img src="images/footer/footer-icon01.gif"></li>
        <li><img src="images/footer/footer-icon03.gif"></li>
        <li><img src="images/footer/footer-icon04.gif"></li>
        <li><img src="images/footer/footer-icon07.gif"></li>
      </ul>
    </div>
     <!-- 불라불라
      ::after 라는 태그를 사용해 nav li 사이에 작대기 표시를 했네.
      background : #3d4252; 사용. width: 2px, height: 10px 이런 식으로.
      content="" 로 했음. -->
  </footer>		<!-- footer 끝 -->

</body>
</html>