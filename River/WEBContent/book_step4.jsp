<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "perform.PerformDTO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("utf-8"); %>  

<% 
	// 가격정보
	String totalPrice = request.getParameter("totalPrice");

	// step2 -> step3 거쳐온 좌석정보
	String selectedSeatGrade = request.getParameter("selectedSeatGrade");
	String selectedSeatVal = request.getParameter("selectedSeatVal");
	
	String[] seatGradeArr = selectedSeatGrade.split(",");	
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
<!-- 예매자가 선택한 값들 -->
<c:set var="seatGradeArr" value="<%=seatGradeArr %>" />	
<c:set var="seatValArr" value="<%=seatValArr %>" />
<c:set var="seatNum_R" value="<%=seatNumber_R %>" />
<c:set var="seatNum_S" value="<%=seatNumber_S %>" />
<c:set var="totalPrice" value="<%=totalPrice %>" />

<!-- session에 담긴 회원 정보 -->
<c:set var="memberName" value="${memberName }" />

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공연예매 - 티켓예매</title>
<link rel="stylesheet" type="text/css" href="style/book_step4.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>

<script>
function goNext(){
	var input_birth = $('input[name=input_birth]').val();
	var input_tel_front = $('input[name=input_tel_front]').val();
	var input_tel_middle = $('input[name=input_tel_middle]').val();
	var input_tel_back = $('input[name=input_tel_back]').val();
	var input_email = $('input[name=input_email]').val();
	

	if(input_birth=="" || input_tel_front=="" || input_tel_middle=="" || input_tel_back=="" || input_email==""){
		alert('정보를 빠짐없이 입력해주세요.');
	} else{
		var inputTel = input_tel_front + input_tel_middle + input_tel_back;		// 전화번호
		var totalPrice = $('#total_amount').text();		// 총 결제금액
		var seatGradeArr = new Array();   // '좌석등급' 배열 (from step2.jsp)
		var seatValArr = new Array();     // '좌석정보' 배열 (from step2.jsp)
		
		// jstl의 값을 배열에 담아, 쿼리스트링으로 넘기기위한 작업.
		<c:forEach var="item" items="${seatGradeArr }" >		
			seatGradeArr.push('${item}');			// push() 메소드 활용
		</c:forEach>
		<c:forEach var="item" items="${seatValArr }" >		
			seatValArr.push('${item}');
		</c:forEach>
		
		// 이렇게 GET방식으로 넘기는게 최선인가..
	  location.href = "book_step5.jsp?selectedSeatGrade="+seatGradeArr+"&selectedSeatVal="+seatValArr+"&totalPrice="+totalPrice+
			  "&inputTel="+inputTel+"&inputEmail="+input_email+"&inputBirth="+input_birth;
	}
}

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
	<form name="bookInfo" method="POST">
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
				<td class="table_td2"><input type="text" name="input_name" value="${memberName }" disabled></td>
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
	</form>
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
			<td>${totalPrice }원</td>
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
			<td id="reser_info_cancel01">2021년 8월 21일 23:59</td>   <!-- 이부분도 db처리 필요함. -->
		</tr>
		<tr class="reser_info_row1" class="reser_info_cancel">
			<td>취소수수료</td>
			<td id="reser_info_cancel02">티켓금액의 0~10%</td>
		</tr>
		<tr class="reser_info_total">
			<td>총 결제금액</td>
			<td><span id="total_amount">${totalPrice}</span><span class="total_text">원</span></td>
		</tr>
	</table>
	<img src="images/ticketing/btn_pre.gif" id="prev_btn" onclick="history.back()">		<!-- 이전단계 버튼 -->
	<img src="images/ticketing/btn_next_02.gif" id="next_btn" onclick="goNext()">		<!-- 다음단계 버튼 -->
</div> <!-- 공연정보, 예매정보 // -->

</div>  <!-- wrap // -->

</body>
</html>








