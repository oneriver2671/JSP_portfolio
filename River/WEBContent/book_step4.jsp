<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "perform.PerformDTO" %>
<%
  request.setCharacterEncoding("utf-8");
  String id = (String)session.getAttribute("id");			// 로그인 상태 회원 정보.		
%>  

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공연예매 - 티켓예매</title>
<link rel="stylesheet" type="text/css" href="style/book_step4.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
</head>

<script>

</script>

<body>
<div id="wrap">
<header>
<div>티켓예매</div>
<nav>
	<img src="images/ticketing/step_01_off.gif" id="step01">
	<img src="images/ticketing/step_02_off.gif" id="step02">
	<img src="images/ticketing/step_03_off.gif" id="step03">
	<img src="images/ticketing/step_04_on.gif" id="step04">
	<img src="images/ticketing/step_05_off.gif" id="step05">
</nav>
</header>

<div id="section_main">
	<div id="section_main_recieve">
		<h4>티켓수령방법</h4>
		<div><input type="radio" name="ticketReceive" value="현장수령" checked>현장수령</div>
		<div><input type="radio" name="ticketReceive" value="배송" disabled>배송 (2,800원)</div>
	</div>
	<div id="section_main_infoCheck">
		<h4>예매자 확인</h4>
		<table>
			<tr id="table_tr1">
				<td class="table_td1">이름</td>
				<td class="table_td2"><input type="text" name="input_name" value="장한강" disabled></td>
			</tr>
			<tr>
				<td class="table_td1">생년월일</td>
				<td class="table_td2"><input type="text" name="input_birth" placeholder="YYMMDD" id="input_birth"> 예) 850101</td>
			</tr>
			<tr>
				<td class="table_td1">휴대폰</td>
				<td class="table_td2"><input type="text" name="input_tel_front" class="input_tel"> - <input type="text" name="input_tel_middle" class="input_tel"> - <input type="text" name="input_tel_back" class="input_tel"></td>
			</tr>
			<tr>
				<td class="table_td1">이메일</td>
				<td class="table_td2"><input type="text" name="input_email" id="input_email" placeholder="abc@gmail.com"></td>
			</tr>
		</table>
	</div>


</div>

<!-- //공연정보, 예매정보 -->
<div id="section_right">
	<img src="images/main1_444x618.jpg" id="perform_mainImg">
	<div id="perform_title">손정범 피아노 리사이틀</div>
	<div id="perform_info">
	2021.08.24 <br>
	롯데콘서트홀 <br>
	만 7세 이상 입장 <br>
	관람시간: 130분 (인터미션 20분)
	</div>
	
	<table id="reser_info">
		<tr class="reser_info_row1" id="reser_info_firstTr">
			<td>관람일시</td>
			<td>2021.08.24 (화) 20:00</td>
		</tr>
		<tr class="reser_info_rowMulti">
			<td>선택좌석</td>
			<td><div id="selected_seatBox">
				<div>R석 1층 C블록 9열 1</div>
				<div>R석 1층 C블록 9열 2</div>
			</div></td>
		</tr>
		<tr class="reser_info_row1">
			<td>티켓금액</td>
			<td>70,000원</td>
		</tr>
		<tr class="reser_info_row1">
			<td>수수료</td>
			<td>0원</td>
		</tr>
		<tr class="reser_info_row1">
			<td>할인</td>
			<td>0원</td>
		</tr>
		<tr class="reser_info_row1">
			<td>취소기한</td>
			<td id="reser_info_cancel01">2021년 8월 21일 23:59</td>
		</tr>
		<tr class="reser_info_row1" class="reser_info_cancel">
			<td>취소수수료</td>
			<td id="reser_info_cancel02">티켓금액의 0~10%</td>
		</tr>
		<tr class="reser_info_total">
			<td>총 결제금액</td>
			<td><span class="total_amount">70,000</span><span class="total_text">원</span></td>
		</tr>
	</table>
	<img src="images/ticketing/btn_pre.gif" id="prev_btn" onclick="history.back()">		<!-- 이전단계 버튼 -->
	<img src="images/ticketing/btn_next_02.gif" id="next_btn" onclick="moveNext()">		<!-- 다음단계 버튼 -->
</div> <!-- 공연정보, 예매정보 // -->

</div>  <!-- wrap // -->

</body>
</html>








