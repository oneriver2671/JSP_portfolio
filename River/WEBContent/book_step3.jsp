<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "perform.PerformDTO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<% request.setCharacterEncoding("utf-8"); %>  

<%
 // step2.jsp의 좌석정보
 String selectedSeatGrade = request.getParameter("selectedSeatGrade");
 String selectedSeatVal = request.getParameter("selectedSeatVal");
 
 // 콤마로 구분되어 넘어오네. 순서대로 처리하자. 배열에 담아야함.
 String[] seatGradeArr = selectedSeatGrade.split(",");		// 콤마 단위로 끊어 배열에 넣을 수 있는 split() 메소드
 String[] seatValArr = selectedSeatVal.split(",");
 
 int seatNumber_R = 0;
 int seatNumber_S = 0;
 for(int i=0; i<seatGradeArr.length; i++){
	 if(seatGradeArr[i].equals("R석")){
		 seatNumber_R++;
	 } else if(seatGradeArr[i].equals("S석")){
		 seatNumber_S++;
	 }
 }
%>

<!-- session에 담긴 공연정보 dto -->
<c:set var="performTitle" value="${performDTO.perform_title }" />
<c:set var="location" value="${performDTO.location }" />
<c:set var="runningTime" value="${performDTO.running_time }" />
<c:set var="intermission" value="${performDTO.intermission }" />
<c:set var="performDate" value="${performDTO.perform_date }" />
<c:set var="performDay" value="${performDTO.perform_day }" />
<c:set var="limitAge" value="${performDTO.limit_age }" />
<c:set var="mainImg" value="${performDTO.main_img }" />
<c:set var="priceR" value="${performDTO.price_R }" />
<c:set var="priceS" value="${performDTO.price_S }" />
<c:set var="seatGradeArr" value="<%=seatGradeArr %>" />			<!-- 이렇게도 넣어줄 수 있음. -->
<c:set var="seatValArr" value="<%=seatValArr %>" />
<c:set var="seatNum_R" value="<%=seatNumber_R %>" />
<c:set var="seatNum_S" value="<%=seatNumber_S %>" />


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공연예매 - 티켓예매</title>
<link rel="stylesheet" type="text/css" href="style/book_step3.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>

<script>
$(document).ready(function(){
	
	// 좌석갯수 선택 시.
	$(".table_td4 select").change(function(){	
		var _selectedNum = $(this).children('option:selected').val();

		var _seatPrice = $(this).parent().parent().children('.table_td3').text();
		
		var selectedNum = _selectedNum.split('매');
		var seatPrice = _seatPrice.split('원');
		
		var _totalPrice = selectedNum[0] * seatPrice[0];
		var _ticketPrice = $('#ticket_price').text();

		var totalPrice = Number(_totalPrice);			// 덧셈을 위해 String -> int 형변환
		var ticketPrice = Number(_ticketPrice);
		var sumPrice = totalPrice + ticketPrice;
		
		$('#ticket_price').text(sumPrice);
		$('#total_amount').text(sumPrice.toLocaleString());
	});
});

	function goNext(){
	
		var totalPrice = $('#total_amount').text();		// 총 결제금액
		var seatGradeArr = new Array();   // '좌석등급' 배열 (from step2.jsp)
		var seatValArr = new Array();     // '좌석정보' 배열 (from step2.jsp)
		
		// jstl의 값을 배열에 담아, 쿼리스트링으로 넘기기위한 작업.
		<c:forEach var="item" items="${seatGradeArr }" >		
			seatGradeArr.push('${item}');
		</c:forEach>
		<c:forEach var="item" items="${seatValArr }" >		
			seatValArr.push('${item}');
		</c:forEach>
		
		location.href = "book_step4.jsp?selectedSeatGrade="+seatGradeArr+"&selectedSeatVal="+seatValArr+"&totalPrice="+totalPrice;
	}
</script>

<body>
<div id="wrap">
<header>
<div>티켓예매</div>
<nav>
	<img src="images/ticketing/step_01_off.gif" id="step01">
	<img src="images/ticketing/step_02_off.gif" id="step02">
	<img src="images/ticketing/step_03_on.gif" id="step03">
	<img src="images/ticketing/step_04_off.gif" id="step04">
	<img src="images/ticketing/step_05_off.gif" id="step05">
</nav>
</header>

<div id="section_main">
<!-- //가격선택 테이블 -->
	<h4>가격</h4>
	
	<!-- R석 선택 시 -->
	<c:if test="${seatNum_R != 0 }">
		<div id="section_main_R">
			<div class="section_main_seatInfo"><span>R석</span> | <span>좌석 ${seatNum_R }매</span>를 선택하셨습니다.</div>
			<table>
				<tr>
					<td class="table_td1">기본가</td>
					<td class="table_td2">일반</td>
					<td class="table_td3">${priceR }원</td>
					<td class="table_td4">
						<select>
							<c:forEach var="i" begin="0" end="${seatNum_R }" step="1" > 
								<option value=${i }>${i }매</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td class="table_td1">기본할인</td>
					<td class="table_td2">장애인/국가유공자 할인 50%</td>
					<td class="table_td3">
					<fmt:parseNumber var="priceR_half" value="${priceR/2 }" integerOnly="true" />  <!-- jstl 소숫점 없애기 -->
					${priceR_half}원</td>  
					<td class="table_td4">
						<select>
							<c:forEach var="i" begin="0" end="${seatNum_R }" step="1" > 
								<option value=${i }>${i }매</option>
							</c:forEach>
						</select>
					</td>
				</tr>
			</table>
		</div>
	</c:if>
	
	<!-- S석 선택 시 -->
	<c:if test="${seatNum_S != 0 }">
		<div id="section_main_S">
			<div class="section_main_seatInfo"><span>S석</span> | <span>좌석 ${seatNum_S }매</span>를 선택하셨습니다.</div>
			<table>
				<tr>
					<td class="table_td1">기본가</td>
					<td class="table_td2">일반</td>
					<td class="table_td3">${priceS }원</td>
					<td class="table_td4">
						<select>
							<c:forEach var="i" begin="0" end="${seatNum_S }" step="1" > 
								<option value=${i }>${i }매</option>
							</c:forEach>
						</select>
					</td>
				</tr>
				<tr>
					<td class="table_td1">기본할인</td>
					<td class="table_td2">장애인/국가유공자 할인 50%</td>
					<td class="table_td3">
						<fmt:parseNumber var="priceS_half" value="${priceS/2 }" integerOnly="true" />  <!-- jstl 소숫점 없애기 -->
						${priceS_half}원  
					</td>
					<td class="table_td4">
						<select>
							<c:forEach var="i" begin="0" end="${seatNum_S }" step="1" > 
								<option value=${i }>${i }매</option>
							</c:forEach>
						</select>
					</td>
				</tr>
			</table>
		</div>
	</c:if>
	
</div>  <!-- 가격선택 테이블 // -->


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
			<td><div id="selected_seatBox">
				<div id="selected_seatBox_grade">
					<c:forEach var="grade" items="${seatGradeArr }" >
						<div>${grade }</div>
					</c:forEach>
				</div>
				<div id="selected_seatBox_val">
					<c:forEach var="val" items="${seatValArr }" >
						<div>${val }</div>
					</c:forEach>
				</div>
			</div></td>
		</tr>
		<tr class="reser_info_row1">
			<td>티켓금액</td>
			<td><span id="ticket_price">0</span>원</td>
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
			<td><span id="total_amount">0</span><span class="total_text">원</span></td>
		</tr>
	</table>
	<img src="images/ticketing/btn_pre.gif" id="prev_btn" onclick="history.back()">		<!-- 이전단계 버튼 -->
	<img src="images/ticketing/btn_next_02.gif" id="next_btn" onclick="goNext()">	  <!-- 다음단계 버튼 -->
</div> <!-- 공연정보, 예매정보 // -->

</div>  <!-- wrap // -->

</body>
</html>








