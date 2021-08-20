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
<link rel="stylesheet" type="text/css" href="style/book_step5.css">
<link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>

<script>
	$(document).ready(function(){
		$('#selectPay_phone').hide();		// 초깃값 설정
		$('#selectPay_noBank').hide();	// 초깃값 설정
		
		$("input[name='payment']").change(function(){
			// 휴대폰 결제 선택 시.
			if($("input[name='payment']:checked").val() == '휴대폰결제'){
				$('#selectPay_card').hide();
				$('#selectPay_noBank').hide();
				$('#selectPay_phone').show();
			}	
			// 무통장입금 결제 선택 시.
			else if($("input[name='payment']:checked").val() == '무통장입금'){
				$('#selectPay_card').hide();
				$('#selectPay_phone').hide();
				$('#selectPay_noBank').show();
			}
			// 신용카드 결제 선택 시.
			else if($("input[name='payment']:checked").val() == '신용카드'){
				$('#selectPay_phone').hide();
				$('#selectPay_noBank').hide();
				$('#selectPay_card').show();
			}
		});
		
	});
</script>

<body>
<div id="wrap">
<header>
<div>티켓예매</div>
<nav>
	<img src="images/ticketing/step_01_off.gif" id="step01">
	<img src="images/ticketing/step_02_off.gif" id="step02">
	<img src="images/ticketing/step_03_off.gif" id="step03">
	<img src="images/ticketing/step_04_off.gif" id="step04">
	<img src="images/ticketing/step_05_on.gif" id="step05">
</nav>
</header>

<div id="section_main">
	<div id="section_main_choice">
		<h4>결제방식선택</h4>
		<div><input type="radio" name="payment" value="신용카드" checked>신용카드</div>
		<div><input type="radio" name="payment" value="무통장입금">무통장입금</div>
		<div><input type="radio" name="payment" value="휴대폰결제">휴대폰결제</div>
	</div>
	<div id="section_main_insert">
		<h4>결제수단입력</h4>
		<!-- //신용카드 -->
		<div id="selectPay_card">
			<div class="section_main_insertTop">신용카드정보</div>
			<div>
				<input type="radio" value="일반신용카드" name="cardSort" checked>일반신용카드
				<select>
					<option>카드 종류를 선택하세요.</option>
					<option>KB국민카드</option>
					<option>BC카드</option>
					<option>삼성카드</option>
					<option>현대카드</option>
					<option>신한카드</option>
					<option>롯데카드</option>
					<option>하나카드</option>
				</select>
			</div>
			<div class="select_main_insert_card"><span>결제금액 : 70,000원</span></div>
			<div class="select_main_insert_card"><span>할부선택 : </span>
				<select name="installment">
					<option>일시불</option>
					<option>2개월</option>
					<option>3개월</option>
					<option>4개월</option>
					<option>5개월</option>
					<option>6개월</option>
					<option>7개월</option>
					<option>8개월</option>
					<option>9개월</option>
					<option>10개월</option>
					<option>11개월</option>
					<option>12개월</option>
				</select>
			</div> 
		</div> <!-- 신용카드 // -->
		
		<!-- //무통장입금 -->
		<div id="selectPay_noBank">
			<div class="section_main_insertTop">무통장입금</div>
			<table>
				<tr id="table_firstTr" class="table_tr">
					<td class="table_td1">입금액</td>
					<td>70,000원</td>
				</tr>
				<tr class="table_tr">
					<td class="table_td1">입금하실은행</td>
					<td>
						<select>
							<option>입금하실 은행을 선택하세요.</option>
							<option>농협(중앙)</option>
							<option>국민은행</option>
							<option>우리은행</option>
							<option>기업은행</option>
							<option>신한은행</option>
							<option>우체국</option>
						</select>	
					</td>
				</tr>
				<tr class="table_tr">
					<td class="table_td1">입금마감시간</td>
					<td>2021년 08월 21일 23:59</td>
				</tr>
				<tr id="table_lastTr">
					<td class="table_td1">예금주명</td>
					<td>(주)인터파크</td>
				</tr>
			</table>
		</div> <!-- 무통장입금 // -->
		
		<!-- //휴대폰결제 -->
		<div id="selectPay_phone">
			<div class="section_main_insertTop">휴대폰 결제 시 유의사항을 확인 하신 후 <br>[다음단계] 버튼으로 이동해주세요.</div>
			<h5 id="phonePay_notice_title">※ 휴대폰 결제 시 유의사항</h5>
			<div id="phonePay_notice_text">
				- 휴대폰 결제 시 전체 취소만 가능 <br>
				- 통신사 별로 한도 금액 내에서 최대 20만원까지 결제 가능 <br>
				- 당월 관람일 예매 시에만 결제 가능 <br>
				- 미성년자 명의,법인명의,요금연체,선불요금제 가입,사용정지 휴대폰은 사용 불가
			</div>
		</div>  <!-- 휴대폰결제 // -->
		
		
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









