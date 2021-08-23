<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "perform.PerformDTO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("utf-8");	%>  

<!-- session에 담긴 공연정보 dto -->
<c:set var="performTitle" value="${performDTO.perform_title }"   />
<c:set var="location" value="${performDTO.location }" />
<c:set var="runningTime" value="${performDTO.running_time }" />
<c:set var="intermission" value="${performDTO.intermission }" />
<c:set var="performDate" value="${performDTO.perform_date }" />
<c:set var="performDay" value="${performDTO.perform_day }" />
<c:set var="limitAge" value="${performDTO.limit_age }" />
<c:set var="mainImg" value="${performDTO.main_img }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공연예매 - 티켓예매</title>
<link rel="stylesheet" type="text/css" href="style/book_main.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>

<script>
	$(function() {
	  $( "#datepicker" ).datepicker();
	});
	
	function moveNext(){
		location.href = 'book_step2.jsp';
	}
	
	
</script>

<body>
<div id="wrap">
<header>
<div>티켓예매</div>

<nav>
	<img src="images/ticketing/step_01_on.gif" id="step01">
	<img src="images/ticketing/step_02_off.gif" id="step02">
	<img src="images/ticketing/step_03_off.gif" id="step03">
	<img src="images/ticketing/step_04_off.gif" id="step04">
	<img src="images/ticketing/step_05_off.gif" id="step05">
</nav>
</header>

<!-- 관람일 선택 -->
<div id="section_calendar">
	<img src="images/ticketing/stit_date.gif">
	<div id="datepicker"></div>			<!-- jQuery 오픈소스 사용. 다른 오픈소스 찾아보기 -->
</div>

<!-- 회차(관람시간) -->
<div id="section_time">
	<div><img src="images/ticketing/stit_watch.gif"></div>
	<div class="section_time_text">${performDate.substring(11, 16) }</div>  <!-- session.getAttribute()를 대신해, 값을 받아옴  -->
</div>

<!-- 좌석등급 / 잔여석 -->
<div id="section_seat">
	<div><img src="images/ticketing/stit_seat.gif"></div>
	<div>R석 | 19석</div>
	<div>S석 | 47석</div>
</div>

<!-- 유의사항 -->
<div id="section_bot">
	<img src="images/ticketing/stit_note.gif">
	<div>
		- 장애인,국가유공자 할인권종을 선택하신경우 현장수령만 가능합니다. <br>
		  &nbsp;&nbsp;장애인등록증이나 복지카드, 유공자증 확인 후 티켓수령이 가능하며, 미지참시 할인혜택을 받을실 수 없습니다. <br>
		- ATM기기로 가상계좌 입금이 안되는 경우가 있으니 인터넷/폰 뱅킹이 어려우시면 다른 결제수단을 선택해 주시기 바랍니다. <br>
		- 관람일 이전 평일 18시 까지만 취소가능합니다. <br>
		- 공연 당일에는 티켓의 취소 및 변경이 불가합니다. <br>
		- 취소수수료와 취소가능일자가 공연별로 다른경우가 있으니, 예매완료 후 예매확인 페이지를 체크해주시기바랍니다. <br>
		- 예매티켓의 변경은 동일한 공연/등급/좌석수/할인종류/가격에 해당하는 다른 좌석으로 수수료 없이 가능합니다. <br>
		- 공연 시작 전 현장티켓박스가 혼잡하오니 되도록이면 30분전까지 공연장에 도착하여, 입장권을 수령하여주시기 바랍니다.
	</div>
</div>

<!-- //공연정보, 예매정보 -->
<div id="section_right">
	<img src="performUpload/${mainImg }" id="perform_mainImg">
	<div id="perform_title">${performTitle }</div>
	<div id="perform_info">
	${performDate.substring(0, 10) }(${performDay }) <br>
	${location } <br>
	만 ${limitAge }세 이상 입장 <br>
	관람시간: ${runningTime }분 (인터미션 ${intermission }분)
	</div>
	
	<table id="reser_info">
		<tr class="reser_info_row1" id="reser_info_firstTr">
			<td>관람일시</td>
			<td>${performDate.substring(0, 10) }(${performDay }) ${performDate.substring(11, 16) } </td>
		</tr>
		<tr class="reser_info_rowMulti">
			<td>선택좌석</td>
			<td></td>
		</tr>
		<tr class="reser_info_row1">
			<td>티켓금액</td>
			<td></td>
		</tr>
		<tr class="reser_info_row1">
			<td>수수료</td>
			<td></td>
		</tr>
		<tr class="reser_info_row1">
			<td>할인</td>
			<td></td>
		</tr>
		<tr class="reser_info_row1">
			<td>취소기한</td>
			<td></td>
		</tr>
		<tr class="reser_info_row1">
			<td>취소수수료</td>
			<td>티켓금액의 0~10%</td>
		</tr>
		<tr class="reser_info_total">
			<td>총 결제금액</td>
			<td><span class="total_amount">0</span><span class="total_text">원</span></td>
		</tr>
	</table>
	<img src="images/ticketing/btn_next_on.gif" id="next_btn" onclick="moveNext()">		<!-- 다음단계 버튼 -->
</div> <!-- 공연정보, 예매정보 // -->

</div>  <!-- wrap // -->

</body>
</html>








