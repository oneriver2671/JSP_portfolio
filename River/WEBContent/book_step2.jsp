<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공연예매 - 티켓예매</title>
<link rel="stylesheet" type="text/css" href="style/book_step2.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>

<script>
$(document).ready(function(){
	
	/*---- 좌석 클릭 이벤트 ----*/
	
	// 좌석 클릭 시.
	$('#section_main button').click(function(){
		var seatVal = $(this).val();		// 클릭한 좌석 번호 가져오기.
		var position = $(this).attr('style');		// 클릭한 좌석 위치 가져오기.
		
		var seatGrade = $(this).attr('class');
		
		if(seatGrade == "seat_R"){
			$('#seatChoice_show_grade').append('<button value="'+seatVal+'">R석</button>');
		} else if(seatGrade == "seat_S"){
			$('#seatChoice_show_grade').append('<button value="'+seatVal+'">S석</button>');	
		}
		$('#seatChoice_show_num').append('<input type="text" value="'+seatVal+'">');
		$('#section_main').append('<button class="seat_choice_imgBtn" value="'+seatVal+'" style="'+position+'"><img src="images/ticketing/seat_choice.gif"style="width: 10px; height:10px;"></button>');	
	});
	
	// 좌석 클릭 후, 다시 좌석 위 이미지 클릭 시.
	$('#section_main').on("click",".seat_choice_imgBtn", function(){		// 이렇게 써야 위 append를 통해 동적으로 생성된 img에 이벤트를 줄 수 있다!!
		var seatVal = $(this).val();		// 좌석 번호
		$(this).remove();		  // seat_choice_imgBtn 제거 (좌석선택 이미지)
		
		$('#seatChoice_show_grade button[value="'+seatVal+'"]').remove();		// 좌석등급 제거
		$('#seatChoice_show_num input[value="'+seatVal+'"]').remove();			// 좌석번호 제거
	});
	
	

	// '좌석 다시 선택' 버튼 클릭 시.
	$('#section_right_again').click(function(){
		$('#seatChoice_show_grade button').remove();
		$('#seatChoice_show_num input').remove();
		$('.seat_choice_imgBtn').remove();
	});
	

});

</script>


<body>
<div id="wrap">
<header>
	<img src="images/ticketing/step_02_on.gif" id="step02">	
	<div id="header_info">
		<div id="header_info_title">손정범 피아노 리사이틀</div>
		<div id="header_info_location">| 예술의전당 IBK챔버홀</div>
	</div>
</header>

<div id="section_right">
	<div id="section_right_img1"><div><img src="images/ticketing/seat_noimg.gif"></div></div>
	<img src="images/ticketing/stit_seat_01.gif" id="section_right_img2">
	<div id="section_right_remainSeat">
		<div><div><div id="seat_R_remain"></div>R석<span>149석</span></div><div class="seat_remain_price">60,000원</div></div>
		<div><div><div id="seat_S_remain"></div>S석<span>117석</span></div><div class="seat_remain_price">40,000원</div></div>
	</div>
	<img src="images/ticketing/stit_seat_02.gif" id="section_right_img3">
	<table id="section_right_choiceSeat">
		<tr>
			<td>좌석등급</td>
			<td>좌석번호</td>
		</tr>
		<tr id="seatChoice_show">
			<td><div id="seatChoice_show_grade"></div></td>
			<td><div id="seatChoice_show_num"></div></td>		<!-- overflow 추가를 위해 div태그 추가 -->
		</tr>
	</table>
	<img src="images/ticketing/btn_seat_confirm_on.gif" id="section_right_confirm">		<!-- '좌석선택완료' 버튼 -->
	<img src="images/ticketing/btn_seat_prev.gif" id="section_right_prev" onclick="history.back()">			<!-- '이전 단계' 버튼 -->
	<img src="images/ticketing/btn_seat_again.gif" id="section_right_again">		<!-- '좌석 다시 선택' 버튼 -->
	<!-- 왜 여기 img들 cursor, script이벤트 다 안먹히냐... -->
</div>

<div id="section_main">
	<img src="images/ticketing/artCenter_IBK_seatAll.gif">
	
	<!-- //좌석 위치 -->
	<!-- //1층 일반좌석 -->
	<button class="seat_R" id="L1_A1_1" style="top: 230px; left: 268px;" value="1층 A블록 1열 1"></button>
	<button class="seat_R" id="L1_A1_2" style="top: 230px; left: 283px;" value="1층 A블록 1열 2"></button>
	<button class="seat_R" id="L1_B1_1" style="top: 230px; left: 330px;" value="1층 B블록 1열 1"></button>
	<button class="seat_R" id="L1_B1_2" style="top: 230px; left: 344px;" value="1층 B블록 1열 2"></button>
	<button class="seat_R" id="L1_B1_3" style="top: 230px; left: 359px;" value="1층 B블록 1열 3"></button>
	<button class="seat_R" id="L1_B1_4" style="top: 230px; left: 373px;" value="1층 B블록 1열 4"></button>
	<button class="seat_R" id="L1_B1_5" style="top: 230px; left: 388px;" value="1층 B블록 1열 5"></button>
	<button class="seat_R" id="L1_B1_6" style="top: 230px; left: 402px;" value="1층 B블록 1열 6"></button>
	<button class="seat_R" id="L1_B1_7" style="top: 230px; left: 417px;" value="1층 B블록 1열 7"></button>
	<button class="seat_R" id="L1_B1_8" style="top: 230px; left: 431px;" value="1층 B블록 1열 8"></button>
	<button class="seat_R" id="L1_B1_9" style="top: 230px; left: 446px;" value="1층 B블록 1열 9"></button>
	<button class="seat_R" id="L1_B1_10" style="top: 230px; left: 460px;" value="1층 B블록 1열 10"></button>
	<button class="seat_R" id="L1_B1_11" style="top: 230px; left: 475px;" value="1층 B블록 1열 11"></button>
	<button class="seat_R" id="L1_B1_12" style="top: 230px; left: 489px;" value="1층 B블록 1열 12"></button>
	<button class="seat_R" id="L1_B1_13" style="top: 230px; left: 504px;" value="1층 B블록 1열 13"></button>
	<button class="seat_R" id="L1_B1_14" style="top: 230px; left: 518px;" value="1층 B블록 1열 14"></button>
	<button class="seat_R" id="L1_B1_15" style="top: 230px; left: 533px;" value="1층 B블록 1열 15"></button>
	<button class="seat_R" id="L1_B1_16" style="top: 230px; left: 547px;" value="1층 B블록 1열 16"></button>
	<button class="seat_R" id="L1_C1_1" style="top: 230px; left: 594px;" value="1층 C블록 1열 1"></button>
	<button class="seat_R" id="L1_C1_2" style="top: 230px; left: 608px;" value="1층 C블록 1열 2"></button>
	
	<button class="seat_R" id="L1_A2_1" style="top: 245px; left: 254px;" value="1층 A블록 2열 1"></button>
	<button class="seat_R" id="L1_A2_2" style="top: 245px; left: 268px;" value="1층 A블록 2열 2"></button>
	<button class="seat_R" id="L1_A2_3" style="top: 245px; left: 283px;" value="1층 A블록 2열 3"></button>
	<button class="seat_R" id="L1_B2_1" style="top: 245px; left: 330px;" value="1층 B블록 2열 1"></button>
	<button class="seat_R" id="L1_B2_2" style="top: 245px; left: 344px;" value="1층 B블록 2열 2"></button>
	<button class="seat_R" id="L1_B2_3" style="top: 245px; left: 359px;" value="1층 B블록 2열 3"></button>
	<button class="seat_R" id="L1_B2_4" style="top: 245px; left: 373px;" value="1층 B블록 2열 4"></button>
	<button class="seat_R" id="L1_B2_5" style="top: 245px; left: 388px;" value="1층 B블록 2열 5"></button>
	<button class="seat_R" id="L1_B2_6" style="top: 245px; left: 402px;" value="1층 B블록 2열 6"></button>
	<button class="seat_R" id="L1_B2_7" style="top: 245px; left: 417px;" value="1층 B블록 2열 7"></button>
	<button class="seat_R" id="L1_B2_8" style="top: 245px; left: 431px;" value="1층 B블록 2열 8"></button>
	<button class="seat_R" id="L1_B2_9" style="top: 245px; left: 446px;" value="1층 B블록 2열 9"></button>
	<button class="seat_R" id="L1_B2_10" style="top: 245px; left: 460px;" value="1층 B블록 2열 10"></button>
	<button class="seat_R" id="L1_B2_11" style="top: 245px; left: 475px;" value="1층 B블록 2열 11"></button>
	<button class="seat_R" id="L1_B2_12" style="top: 245px; left: 489px;" value="1층 B블록 2열 12"></button>
	<button class="seat_R" id="L1_B2_13" style="top: 245px; left: 504px;" value="1층 B블록 2열 13"></button>
	<button class="seat_R" id="L1_B2_14" style="top: 245px; left: 518px;" value="1층 B블록 2열 14"></button>
	<button class="seat_R" id="L1_B2_15" style="top: 245px; left: 533px;" value="1층 B블록 2열 15"></button>
	<button class="seat_R" id="L1_B2_16" style="top: 245px; left: 547px;" value="1층 B블록 2열 16"></button>
	<button class="seat_R" id="L1_C2_1" style="top: 245px; left: 594px;" value="1층 C블록 2열 1"></button>
	<button class="seat_R" id="L1_C2_2" style="top: 245px; left: 608px;" value="1층 C블록 2열 2"></button>
	<button class="seat_R" id="L1_C2_3" style="top: 245px; left: 622px;" value="1층 C블록 2열 3"></button>
  
  <button class="seat_S" id="L1_A3_1" style="top: 259px; left: 226px;" value="1층 A블록 3열 1"></button>
  <button class="seat_S" id="L1_A3_2" style="top: 259px; left: 240px;" value="1층 A블록 3열 2"></button>
  <button class="seat_R" id="L1_A3_3" style="top: 259px; left: 254px;" value="1층 A블록 3열 3"></button>
	<button class="seat_R" id="L1_A3_4" style="top: 259px; left: 268px;" value="1층 A블록 3열 4"></button>
	<button class="seat_R" id="L1_A3_5" style="top: 259px; left: 283px;" value="1층 A블록 3열 5"></button> 
  <button class="seat_R" id="L1_B3_1" style="top: 259px; left: 330px;" value="1층 B블록 3열 1"></button>
	<button class="seat_R" id="L1_B3_2" style="top: 259px; left: 344px;" value="1층 B블록 3열 2"></button>
	<button class="seat_R" id="L1_B3_3" style="top: 259px; left: 359px;" value="1층 B블록 3열 3"></button>
	<button class="seat_R" id="L1_B3_4" style="top: 259px; left: 373px;" value="1층 B블록 3열 4"></button>
	<button class="seat_R" id="L1_B3_5" style="top: 259px; left: 388px;" value="1층 B블록 3열 5"></button>
	<button class="seat_R" id="L1_B3_6" style="top: 259px; left: 402px;" value="1층 B블록 3열 6"></button>
	<button class="seat_R" id="L1_B3_7" style="top: 259px; left: 417px;" value="1층 B블록 3열 7"></button>
	<button class="seat_R" id="L1_B3_8" style="top: 259px; left: 431px;" value="1층 B블록 3열 8"></button>
	<button class="seat_R" id="L1_B3_9" style="top: 259px; left: 446px;" value="1층 B블록 3열 9"></button>
	<button class="seat_R" id="L1_B3_10" style="top: 259px; left: 460px;" value="1층 B블록 3열 10"></button>
	<button class="seat_R" id="L1_B3_11" style="top: 259px; left: 475px;" value="1층 B블록 3열 11"></button>
	<button class="seat_R" id="L1_B3_12" style="top: 259px; left: 489px;" value="1층 B블록 3열 12"></button>
	<button class="seat_R" id="L1_B3_13" style="top: 259px; left: 504px;" value="1층 B블록 3열 13"></button>
	<button class="seat_R" id="L1_B3_14" style="top: 259px; left: 518px;" value="1층 B블록 3열 14"></button>
	<button class="seat_R" id="L1_B3_15" style="top: 259px; left: 533px;" value="1층 B블록 3열 15"></button>
	<button class="seat_R" id="L1_B3_16" style="top: 259px; left: 547px;" value="1층 B블록 3열 16"></button>
	<button class="seat_R" id="L1_C3_1" style="top: 259px; left: 594px;" value="1층 C블록 3열 1"></button>
	<button class="seat_R" id="L1_C3_2" style="top: 259px; left: 608px;" value="1층 C블록 3열 2"></button>                           
	<button class="seat_R" id="L1_C3_3" style="top: 259px; left: 622px;" value="1층 C블록 3열 3"></button>                           
	<button class="seat_S" id="L1_C3_4" style="top: 259px; left: 637px;" value="1층 C블록 3열 4"></button>                           
	<button class="seat_S" id="L1_C3_5" style="top: 259px; left: 651px;" value="1층 C블록 3열 5"></button>                    

	<button class="seat_S" id="L1_A4_1" style="top: 273px; left: 211px;" value="1층 A블록 4열 1"></button>
	<button class="seat_S" id="L1_A4_2" style="top: 273px; left: 226px;" value="1층 A블록 4열 2"></button>
  <button class="seat_S" id="L1_A4_3" style="top: 273px; left: 240px;" value="1층 A블록 4열 3"></button>
	<button class="seat_R" id="L1_A4_4" style="top: 273px; left: 254px;" value="1층 A블록 4열 4"></button>
	<button class="seat_R" id="L1_A4_5" style="top: 273px; left: 268px;" value="1층 A블록 4열 5"></button>
	<button class="seat_R" id="L1_A4_6" style="top: 273px; left: 283px;" value="1층 A블록 4열 6"></button> 
  <button class="seat_R" id="L1_B4_1" style="top: 273px; left: 330px;" value="1층 B블록 4열 1"></button>
	<button class="seat_R" id="L1_B4_2" style="top: 273px; left: 344px;" value="1층 B블록 4열 2"></button>
	<button class="seat_R" id="L1_B4_3" style="top: 273px; left: 359px;" value="1층 B블록 4열 3"></button>
	<button class="seat_R" id="L1_B4_4" style="top: 273px; left: 373px;" value="1층 B블록 4열 4"></button>
	<button class="seat_R" id="L1_B4_5" style="top: 273px; left: 388px;" value="1층 B블록 4열 5"></button>
	<button class="seat_R" id="L1_B4_6" style="top: 273px; left: 402px;" value="1층 B블록 4열 6"></button>
	<button class="seat_R" id="L1_B4_7" style="top: 273px; left: 417px;" value="1층 B블록 4열 7"></button>
	<button class="seat_R" id="L1_B4_8" style="top: 273px; left: 431px;" value="1층 B블록 4열 8"></button>
	<button class="seat_R" id="L1_B4_9" style="top: 273px; left: 446px;" value="1층 B블록 4열 9"></button>
	<button class="seat_R" id="L1_B4_10" style="top: 273px; left: 460px;" value="1층 B블록 4열 10"></button>
	<button class="seat_R" id="L1_B4_11" style="top: 273px; left: 475px;" value="1층 B블록 4열 11"></button>
	<button class="seat_R" id="L1_B4_12" style="top: 273px; left: 489px;" value="1층 B블록 4열 12"></button>
	<button class="seat_R" id="L1_B4_13" style="top: 273px; left: 504px;" value="1층 B블록 4열 13"></button>
	<button class="seat_R" id="L1_B4_14" style="top: 273px; left: 518px;" value="1층 B블록 4열 14"></button>
	<button class="seat_R" id="L1_B4_15" style="top: 273px; left: 533px;" value="1층 B블록 4열 15"></button>
	<button class="seat_R" id="L1_B4_16" style="top: 273px; left: 547px;" value="1층 B블록 4열 16"></button> 
	<button class="seat_R" id="L1_C4_1" style="top: 273px; left: 594px;" value="1층 C블록 4열 1"></button>
	<button class="seat_R" id="L1_C4_2" style="top: 273px; left: 608px;" value="1층 C블록 4열 2"></button>                           
	<button class="seat_R" id="L1_C4_3" style="top: 273px; left: 622px;" value="1층 C블록 4열 3"></button>   
	<button class="seat_S" id="L1_C4_4" style="top: 273px; left: 637px;" value="1층 C블록 4열 4"></button>                           
	<button class="seat_S" id="L1_C4_5" style="top: 273px; left: 651px;" value="1층 C블록 4열 5"></button>
	<button class="seat_S" id="L1_C4_6" style="top: 273px; left: 666px;" value="1층 C블록 4열 6"></button>
	
	<button class="seat_S" id="L1_A5_1" style="top: 288px; left: 211px;" value="1층 A블록 5열 1"></button>
	<button class="seat_S" id="L1_A5_2" style="top: 288px; left: 226px;" value="1층 A블록 5열 2"></button>
  <button class="seat_S" id="L1_A5_3" style="top: 288px; left: 240px;" value="1층 A블록 5열 3"></button>
	<button class="seat_R" id="L1_A5_4" style="top: 288px; left: 254px;" value="1층 A블록 5열 4"></button>
	<button class="seat_R" id="L1_A5_5" style="top: 288px; left: 268px;" value="1층 A블록 5열 5"></button>
	<button class="seat_R" id="L1_A5_6" style="top: 288px; left: 283px;" value="1층 A블록 5열 6"></button> 
	<button class="seat_R" id="L1_B5_1" style="top: 288px; left: 330px;" value="1층 B블록 5열 1"></button>
	<button class="seat_R" id="L1_B5_2" style="top: 288px; left: 344px;" value="1층 B블록 5열 2"></button>
	<button class="seat_R" id="L1_B5_3" style="top: 288px; left: 359px;" value="1층 B블록 5열 3"></button>
	<button class="seat_R" id="L1_B5_4" style="top: 288px; left: 373px;" value="1층 B블록 5열 4"></button>
	<button class="seat_R" id="L1_B5_5" style="top: 288px; left: 388px;" value="1층 B블록 5열 5"></button>
	<button class="seat_R" id="L1_B5_6" style="top: 288px; left: 402px;" value="1층 B블록 5열 6"></button>
	<button class="seat_R" id="L1_B5_7" style="top: 288px; left: 417px;" value="1층 B블록 5열 7"></button>
	<button class="seat_R" id="L1_B5_8" style="top: 288px; left: 431px;" value="1층 B블록 5열 8"></button>
	<button class="seat_R" id="L1_B5_9" style="top: 288px; left: 446px;" value="1층 B블록 5열 9"></button>
	<button class="seat_R" id="L1_B5_10" style="top: 288px; left: 460px;" value="1층 B블록 5열 10"></button>
	<button class="seat_R" id="L1_B5_11" style="top: 288px; left: 475px;" value="1층 B블록 5열 11"></button>
	<button class="seat_R" id="L1_B5_12" style="top: 288px; left: 489px;" value="1층 B블록 5열 12"></button>
	<button class="seat_R" id="L1_B5_13" style="top: 288px; left: 504px;" value="1층 B블록 5열 13"></button>
	<button class="seat_R" id="L1_B5_14" style="top: 288px; left: 518px;" value="1층 B블록 5열 14"></button>
	<button class="seat_R" id="L1_B5_15" style="top: 288px; left: 533px;" value="1층 B블록 5열 15"></button>
	<button class="seat_R" id="L1_B5_16" style="top: 288px; left: 547px;" value="1층 B블록 5열 16"></button>
	<button class="seat_R" id="L1_C5_1" style="top: 288px; left: 594px;" value="1층 C블록 5열 1"></button>
	<button class="seat_R" id="L1_C5_2" style="top: 288px; left: 608px;" value="1층 C블록 5열 2"></button>                           
	<button class="seat_R" id="L1_C5_3" style="top: 288px; left: 622px;" value="1층 C블록 5열 3"></button>    
	<button class="seat_S" id="L1_C5_4" style="top: 288px; left: 637px;" value="1층 C블록 5열 4"></button>                           
	<button class="seat_S" id="L1_C5_5" style="top: 288px; left: 651px;" value="1층 C블록 5열 5"></button>
	<button class="seat_S" id="L1_C5_6" style="top: 288px; left: 666px;" value="1층 C블록 5열 6"></button>

	<button class="seat_S" id="L1_A6_1" style="top: 302px; left: 211px;" value="1층 A블록 6열 1"></button>
	<button class="seat_S" id="L1_A6_2" style="top: 302px; left: 226px;" value="1층 A블록 6열 2"></button>
  <button class="seat_S" id="L1_A6_3" style="top: 302px; left: 240px;" value="1층 A블록 6열 3"></button>
	<button class="seat_R" id="L1_A6_4" style="top: 302px; left: 254px;" value="1층 A블록 6열 4"></button>
	<button class="seat_R" id="L1_A6_5" style="top: 302px; left: 268px;" value="1층 A블록 6열 5"></button>
	<button class="seat_R" id="L1_A6_6" style="top: 302px; left: 283px;" value="1층 A블록 6열 6"></button> 
	<button class="seat_R" id="L1_B6_1" style="top: 302px; left: 330px;" value="1층 B블록 6열 1"></button>
	<button class="seat_R" id="L1_B6_2" style="top: 302px; left: 344px;" value="1층 B블록 6열 2"></button>
	<button class="seat_R" id="L1_B6_3" style="top: 302px; left: 359px;" value="1층 B블록 6열 3"></button>
	<button class="seat_R" id="L1_B6_4" style="top: 302px; left: 373px;" value="1층 B블록 6열 4"></button>
	<button class="seat_R" id="L1_B6_5" style="top: 302px; left: 388px;" value="1층 B블록 6열 5"></button>
	<button class="seat_R" id="L1_B6_6" style="top: 302px; left: 402px;" value="1층 B블록 6열 6"></button>
	<button class="seat_R" id="L1_B6_7" style="top: 302px; left: 417px;" value="1층 B블록 6열 7"></button>
	<button class="seat_R" id="L1_B6_8" style="top: 302px; left: 431px;" value="1층 B블록 6열 8"></button>
	<button class="seat_R" id="L1_B6_9" style="top: 302px; left: 446px;" value="1층 B블록 6열 9"></button>
	<button class="seat_R" id="L1_B6_10" style="top: 302px; left: 460px;" value="1층 B블록 6열 10"></button>
	<button class="seat_R" id="L1_B6_11" style="top: 302px; left: 475px;" value="1층 B블록 6열 11"></button>
	<button class="seat_R" id="L1_B6_12" style="top: 302px; left: 489px;" value="1층 B블록 6열 12"></button>
	<button class="seat_R" id="L1_B6_13" style="top: 302px; left: 504px;" value="1층 B블록 6열 13"></button>
	<button class="seat_R" id="L1_B6_14" style="top: 302px; left: 518px;" value="1층 B블록 6열 14"></button>
	<button class="seat_R" id="L1_B6_15" style="top: 302px; left: 533px;" value="1층 B블록 6열 15"></button>
	<button class="seat_R" id="L1_B6_16" style="top: 302px; left: 547px;" value="1층 B블록 6열 16"></button> 
	<button class="seat_R" id="L1_C6_1" style="top: 302px; left: 594px;" value="1층 C블록 6열 1"></button>
	<button class="seat_R" id="L1_C6_2" style="top: 302px; left: 608px;" value="1층 C블록 6열 2"></button>                           
	<button class="seat_R" id="L1_C6_3" style="top: 302px; left: 622px;" value="1층 C블록 6열 3"></button>   
	<button class="seat_S" id="L1_C6_4" style="top: 302px; left: 637px;" value="1층 C블록 6열 4"></button>                           
	<button class="seat_S" id="L1_C6_5" style="top: 302px; left: 651px;" value="1층 C블록 6열 5"></button>
	<button class="seat_S" id="L1_C6_6" style="top: 302px; left: 666px;" value="1층 C블록 6열 6"></button>
	
	<button class="seat_S" id="L1_A7_1" style="top: 316px; left: 211px;" value="1층 A블록 7열 1"></button>
	<button class="seat_S" id="L1_A7_2" style="top: 316px; left: 226px;" value="1층 A블록 7열 2"></button>
  <button class="seat_S" id="L1_A7_3" style="top: 316px; left: 240px;" value="1층 A블록 7열 3"></button>
	<button class="seat_R" id="L1_A7_4" style="top: 316px; left: 254px;" value="1층 A블록 7열 4"></button>
	<button class="seat_R" id="L1_A7_5" style="top: 316px; left: 268px;" value="1층 A블록 7열 5"></button>
	<button class="seat_R" id="L1_A7_6" style="top: 316px; left: 283px;" value="1층 A블록 7열 6"></button> 
	<button class="seat_R" id="L1_B7_1" style="top: 316px; left: 330px;" value="1층 B블록 7열 1"></button>
	<button class="seat_R" id="L1_B7_2" style="top: 316px; left: 344px;" value="1층 B블록 7열 2"></button>
	<button class="seat_R" id="L1_B7_3" style="top: 316px; left: 359px;" value="1층 B블록 7열 3"></button>
	<button class="seat_R" id="L1_B7_4" style="top: 316px; left: 373px;" value="1층 B블록 7열 4"></button>
	<button class="seat_R" id="L1_B7_5" style="top: 316px; left: 388px;" value="1층 B블록 7열 5"></button>
	<button class="seat_R" id="L1_B7_6" style="top: 316px; left: 402px;" value="1층 B블록 7열 6"></button>
	<button class="seat_R" id="L1_B7_7" style="top: 316px; left: 417px;" value="1층 B블록 7열 7"></button>
	<button class="seat_R" id="L1_B7_8" style="top: 316px; left: 431px;" value="1층 B블록 7열 8"></button>
	<button class="seat_R" id="L1_B7_9" style="top: 316px; left: 446px;" value="1층 B블록 7열 9"></button>
	<button class="seat_R" id="L1_B7_10" style="top: 316px; left: 460px;" value="1층 B블록 7열 10"></button>
	<button class="seat_R" id="L1_B7_11" style="top: 316px; left: 475px;" value="1층 B블록 7열 11"></button>
	<button class="seat_R" id="L1_B7_12" style="top: 316px; left: 489px;" value="1층 B블록 7열 12"></button>
	<button class="seat_R" id="L1_B7_13" style="top: 316px; left: 504px;" value="1층 B블록 7열 13"></button>
	<button class="seat_R" id="L1_B7_14" style="top: 316px; left: 518px;" value="1층 B블록 7열 14"></button>
	<button class="seat_R" id="L1_B7_15" style="top: 316px; left: 533px;" value="1층 B블록 7열 15"></button>
	<button class="seat_R" id="L1_B7_16" style="top: 316px; left: 547px;" value="1층 B블록 7열 16"></button> 
	<button class="seat_R" id="L1_C7_1" style="top: 316px; left: 594px;" value="1층 C블록 7열 1"></button>
	<button class="seat_R" id="L1_C7_2" style="top: 316px; left: 608px;" value="1층 C블록 7열 2"></button>                           
	<button class="seat_R" id="L1_C7_3" style="top: 316px; left: 622px;" value="1층 C블록 7열 3"></button>
	<button class="seat_S" id="L1_C7_4" style="top: 316px; left: 637px;" value="1층 C블록 7열 4"></button>                           
	<button class="seat_S" id="L1_C7_5" style="top: 316px; left: 651px;" value="1층 C블록 7열 5"></button>
	<button class="seat_S" id="L1_C7_6" style="top: 316px; left: 666px;" value="1층 C블록 7열 6"></button>   
	
	<button class="seat_S" id="L1_A8_1" style="top: 330px; left: 211px;" value="1층 A블록 8열 1"></button>
	<button class="seat_S" id="L1_A8_2" style="top: 330px; left: 226px;" value="1층 A블록 8열 2"></button>
  <button class="seat_S" id="L1_A8_3" style="top: 330px; left: 240px;" value="1층 A블록 8열 3"></button>
	<button class="seat_R" id="L1_A8_4" style="top: 330px; left: 254px;" value="1층 A블록 8열 4"></button>
	<button class="seat_R" id="L1_A8_5" style="top: 330px; left: 268px;" value="1층 A블록 8열 5"></button>
	<button class="seat_R" id="L1_A8_6" style="top: 330px; left: 283px;" value="1층 A블록 8열 6"></button> 
	<button class="seat_R" id="L1_B8_1" style="top: 330px; left: 330px;" value="1층 B블록 8열 1"></button>
	<button class="seat_R" id="L1_B8_2" style="top: 330px; left: 344px;" value="1층 B블록 8열 2"></button>
	<button class="seat_R" id="L1_B8_3" style="top: 330px; left: 359px;" value="1층 B블록 8열 3"></button>
	<button class="seat_R" id="L1_B8_4" style="top: 330px; left: 373px;" value="1층 B블록 8열 4"></button>
	<button class="seat_R" id="L1_B8_5" style="top: 330px; left: 388px;" value="1층 B블록 8열 5"></button>
	<button class="seat_R" id="L1_B8_6" style="top: 330px; left: 402px;" value="1층 B블록 8열 6"></button>
	<button class="seat_R" id="L1_B8_7" style="top: 330px; left: 417px;" value="1층 B블록 8열 7"></button>
	<button class="seat_R" id="L1_B8_8" style="top: 330px; left: 431px;" value="1층 B블록 8열 8"></button>
	<button class="seat_R" id="L1_B8_9" style="top: 330px; left: 446px;" value="1층 B블록 8열 9"></button>
	<button class="seat_R" id="L1_B8_10" style="top: 330px; left: 460px;" value="1층 B블록 8열 10"></button>
	<button class="seat_R" id="L1_B8_11" style="top: 330px; left: 475px;" value="1층 B블록 8열 11"></button>
	<button class="seat_R" id="L1_B8_12" style="top: 330px; left: 489px;" value="1층 B블록 8열 12"></button>
	<button class="seat_R" id="L1_B8_13" style="top: 330px; left: 504px;" value="1층 B블록 8열 13"></button>
	<button class="seat_R" id="L1_B8_14" style="top: 330px; left: 518px;" value="1층 B블록 8열 14"></button>
	<button class="seat_R" id="L1_B8_15" style="top: 330px; left: 533px;" value="1층 B블록 8열 15"></button>
	<button class="seat_R" id="L1_B8_16" style="top: 330px; left: 547px;" value="1층 B블록 8열 16"></button>
	<button class="seat_R" id="L1_C8_1" style="top: 330px; left: 594px;" value="1층 C블록 8열 1"></button>
	<button class="seat_R" id="L1_C8_2" style="top: 330px; left: 608px;" value="1층 C블록 8열 2"></button>                           
	<button class="seat_R" id="L1_C8_3" style="top: 330px; left: 622px;" value="1층 C블록 8열 3"></button>
	<button class="seat_S" id="L1_C8_4" style="top: 330px; left: 637px;" value="1층 C블록 8열 4"></button>                           
	<button class="seat_S" id="L1_C8_5" style="top: 330px; left: 651px;" value="1층 C블록 8열 5"></button>
	<button class="seat_S" id="L1_C8_6" style="top: 330px; left: 666px;" value="1층 C블록 8열 6"></button>   
	
	<button class="seat_S" id="L1_A9_1" style="top: 344px; left: 211px;" value="1층 A블록 9열 1"></button>
	<button class="seat_S" id="L1_A9_2" style="top: 344px; left: 226px;" value="1층 A블록 9열 2"></button>
  <button class="seat_S" id="L1_A9_3" style="top: 344px; left: 240px;" value="1층 A블록 9열 3"></button>
	<button class="seat_R" id="L1_A9_4" style="top: 344px; left: 254px;" value="1층 A블록 9열 4"></button>
	<button class="seat_R" id="L1_A9_5" style="top: 344px; left: 268px;" value="1층 A블록 9열 5"></button>
	<button class="seat_R" id="L1_A9_6" style="top: 344px; left: 283px;" value="1층 A블록 9열 6"></button> 
	<button class="seat_R" id="L1_B9_1" style="top: 344px; left: 330px;" value="1층 B블록 9열 1"></button>
	<button class="seat_R" id="L1_B9_2" style="top: 344px; left: 344px;" value="1층 B블록 9열 2"></button>
	<button class="seat_R" id="L1_B9_3" style="top: 344px; left: 359px;" value="1층 B블록 9열 3"></button>
	<button class="seat_R" id="L1_B9_4" style="top: 344px; left: 373px;" value="1층 B블록 9열 4"></button>
	<button class="seat_R" id="L1_B9_5" style="top: 344px; left: 388px;" value="1층 B블록 9열 5"></button>
	<button class="seat_R" id="L1_B9_6" style="top: 344px; left: 402px;" value="1층 B블록 9열 6"></button>
	<button class="seat_R" id="L1_B9_7" style="top: 344px; left: 417px;" value="1층 B블록 9열 7"></button>
	<button class="seat_R" id="L1_B9_8" style="top: 344px; left: 431px;" value="1층 B블록 9열 8"></button>
	<button class="seat_R" id="L1_B9_9" style="top: 344px; left: 446px;" value="1층 B블록 9열 9"></button>
	<button class="seat_R" id="L1_B9_10" style="top: 344px; left: 460px;" value="1층 B블록 9열 10"></button>
	<button class="seat_R" id="L1_B9_11" style="top: 344px; left: 475px;" value="1층 B블록 9열 11"></button>
	<button class="seat_R" id="L1_B9_12" style="top: 344px; left: 489px;" value="1층 B블록 9열 12"></button>
	<button class="seat_R" id="L1_B9_13" style="top: 344px; left: 504px;" value="1층 B블록 9열 13"></button>
	<button class="seat_R" id="L1_B9_14" style="top: 344px; left: 518px;" value="1층 B블록 9열 14"></button>
	<button class="seat_R" id="L1_B9_15" style="top: 344px; left: 533px;" value="1층 B블록 9열 15"></button>
	<button class="seat_R" id="L1_B9_16" style="top: 344px; left: 547px;" value="1층 B블록 9열 16"></button>
	<button class="seat_R" id="L1_C9_1" style="top: 344px; left: 594px;" value="1층 C블록 9열 1"></button>
	<button class="seat_R" id="L1_C9_2" style="top: 344px; left: 608px;" value="1층 C블록 9열 2"></button>                           
	<button class="seat_R" id="L1_C9_3" style="top: 344px; left: 622px;" value="1층 C블록 9열 3"></button>
	<button class="seat_S" id="L1_C9_4" style="top: 344px; left: 637px;" value="1층 C블록 9열 4"></button>                           
	<button class="seat_S" id="L1_C9_5" style="top: 344px; left: 651px;" value="1층 C블록 9열 5"></button>
	<button class="seat_S" id="L1_C9_6" style="top: 344px; left: 666px;" value="1층 C블록 9열 6"></button>      

	<button class="seat_S" id="L1_A10_1" style="top: 359px; left: 211px;" value="1층 A블록 10열 1"></button>
	<button class="seat_S" id="L1_A10_2" style="top: 359px; left: 226px;" value="1층 A블록 10열 2"></button>
  <button class="seat_S" id="L1_A10_3" style="top: 359px; left: 240px;" value="1층 A블록 10열 3"></button>
	<button class="seat_R" id="L1_A10_4" style="top: 359px; left: 254px;" value="1층 A블록 10열 4"></button>
	<button class="seat_R" id="L1_A10_5" style="top: 359px; left: 268px;" value="1층 A블록 10열 5"></button>
	<button class="seat_R" id="L1_A10_6" style="top: 359px; left: 283px;" value="1층 A블록 10열 6"></button> 
	<button class="seat_R" id="L1_B10_1" style="top: 359px; left: 330px;" value="1층 B블록 10열 1"></button>
	<button class="seat_R" id="L1_B10_2" style="top: 359px; left: 344px;" value="1층 B블록 10열 2"></button>
	<button class="seat_R" id="L1_B10_3" style="top: 359px; left: 359px;" value="1층 B블록 10열 3"></button>
	<button class="seat_R" id="L1_B10_4" style="top: 359px; left: 373px;" value="1층 B블록 10열 4"></button>
	<button class="seat_R" id="L1_B10_5" style="top: 359px; left: 388px;" value="1층 B블록 10열 5"></button>
	<button class="seat_R" id="L1_B10_6" style="top: 359px; left: 402px;" value="1층 B블록 10열 6"></button>
	<button class="seat_R" id="L1_B10_7" style="top: 359px; left: 417px;" value="1층 B블록 10열 7"></button>
	<button class="seat_R" id="L1_B10_8" style="top: 359px; left: 431px;" value="1층 B블록 10열 8"></button>
	<button class="seat_R" id="L1_B10_9" style="top: 359px; left: 446px;" value="1층 B블록 10열 9"></button>
	<button class="seat_R" id="L1_B10_10" style="top: 359px; left: 460px;" value="1층 B블록 10열 10"></button>
	<button class="seat_R" id="L1_B10_11" style="top: 359px; left: 475px;" value="1층 B블록 10열 11"></button>
	<button class="seat_R" id="L1_B10_12" style="top: 359px; left: 489px;" value="1층 B블록 10열 12"></button>
	<button class="seat_R" id="L1_B10_13" style="top: 359px; left: 504px;" value="1층 B블록 10열 13"></button>
	<button class="seat_R" id="L1_B10_14" style="top: 359px; left: 518px;" value="1층 B블록 10열 14"></button>
	<button class="seat_R" id="L1_B10_15" style="top: 359px; left: 533px;" value="1층 B블록 10열 15"></button>
	<button class="seat_R" id="L1_B10_16" style="top: 359px; left: 547px;" value="1층 B블록 10열 16"></button>	
	<button class="seat_R" id="L1_C10_1" style="top: 359px; left: 594px;" value="1층 C블록 10열 1"></button>
	<button class="seat_R" id="L1_C10_2" style="top: 359px; left: 608px;" value="1층 C블록 10열 2"></button>                           
	<button class="seat_R" id="L1_C10_3" style="top: 359px; left: 622px;" value="1층 C블록 10열 3"></button> 
	<button class="seat_S" id="L1_C10_4" style="top: 359px; left: 637px;" value="1층 C블록 10열 4"></button>                           
	<button class="seat_S" id="L1_C10_5" style="top: 359px; left: 651px;" value="1층 C블록 10열 5"></button>
	<button class="seat_S" id="L1_C10_6" style="top: 359px; left: 666px;" value="1층 C블록 10열 6"></button>     

	<button class="seat_S" id="L1_A11_1" style="top: 373px; left: 211px;" value="1층 A블록 11열 1"></button>
	<button class="seat_S" id="L1_A11_2" style="top: 373px; left: 226px;" value="1층 A블록 11열 2"></button>
  <button class="seat_S" id="L1_A11_3" style="top: 373px; left: 240px;" value="1층 A블록 11열 3"></button>
	<button class="seat_R" id="L1_A11_4" style="top: 373px; left: 254px;" value="1층 A블록 11열 4"></button>
	<button class="seat_R" id="L1_A11_5" style="top: 373px; left: 268px;" value="1층 A블록 11열 5"></button>
	<button class="seat_R" id="L1_A11_6" style="top: 373px; left: 283px;" value="1층 A블록 11열 6"></button> 
	<button class="seat_R" id="L1_B11_1" style="top: 373px; left: 330px;" value="1층 B블록 11열 1"></button>
	<button class="seat_R" id="L1_B11_2" style="top: 373px; left: 344px;" value="1층 B블록 11열 2"></button>
	<button class="seat_R" id="L1_B11_3" style="top: 373px; left: 359px;" value="1층 B블록 11열 3"></button>
	<button class="seat_R" id="L1_B11_4" style="top: 373px; left: 373px;" value="1층 B블록 11열 4"></button>
	<button class="seat_R" id="L1_B11_5" style="top: 373px; left: 388px;" value="1층 B블록 11열 5"></button>
	<button class="seat_R" id="L1_B11_6" style="top: 373px; left: 402px;" value="1층 B블록 11열 6"></button>
	<button class="seat_R" id="L1_B11_7" style="top: 373px; left: 417px;" value="1층 B블록 11열 7"></button>
	<button class="seat_R" id="L1_B11_8" style="top: 373px; left: 431px;" value="1층 B블록 11열 8"></button>
	<button class="seat_R" id="L1_B11_9" style="top: 373px; left: 446px;" value="1층 B블록 11열 9"></button>
	<button class="seat_R" id="L1_B11_10" style="top: 373px; left: 460px;" value="1층 B블록 11열 10"></button>
	<button class="seat_R" id="L1_B11_11" style="top: 373px; left: 475px;" value="1층 B블록 11열 11"></button>
	<button class="seat_R" id="L1_B11_12" style="top: 373px; left: 489px;" value="1층 B블록 11열 12"></button>
	<button class="seat_R" id="L1_B11_13" style="top: 373px; left: 504px;" value="1층 B블록 11열 13"></button>
	<button class="seat_R" id="L1_B11_14" style="top: 373px; left: 518px;" value="1층 B블록 11열 14"></button>
	<button class="seat_R" id="L1_B11_15" style="top: 373px; left: 533px;" value="1층 B블록 11열 15"></button>
	<button class="seat_R" id="L1_B11_16" style="top: 373px; left: 547px;" value="1층 B블록 11열 16"></button>
	<button class="seat_R" id="L1_C11_1" style="top: 373px; left: 594px;" value="1층 C블록 11열 1"></button>
	<button class="seat_R" id="L1_C11_2" style="top: 373px; left: 608px;" value="1층 C블록 11열 2"></button>                           
	<button class="seat_R" id="L1_C11_3" style="top: 373px; left: 622px;" value="1층 C블록 11열 3"></button>
	<button class="seat_S" id="L1_C11_4" style="top: 373px; left: 637px;" value="1층 C블록 11열 4"></button>                           
	<button class="seat_S" id="L1_C11_5" style="top: 373px; left: 651px;" value="1층 C블록 11열 5"></button>
	<button class="seat_S" id="L1_C11_6" style="top: 373px; left: 666px;" value="1층 C블록 11열 6"></button>      
	
	<button class="seat_S" id="L1_A12_1" style="top: 387px; left: 211px;" value="1층 A블록 12열 1"></button>
	<button class="seat_S" id="L1_A12_2" style="top: 387px; left: 226px;" value="1층 A블록 12열 2"></button>
  <button class="seat_S" id="L1_A12_3" style="top: 387px; left: 240px;" value="1층 A블록 12열 3"></button>
	<button class="seat_R" id="L1_A12_4" style="top: 387px; left: 254px;" value="1층 A블록 12열 4"></button>
	<button class="seat_R" id="L1_A12_5" style="top: 387px; left: 268px;" value="1층 A블록 12열 5"></button>
	<button class="seat_R" id="L1_A12_6" style="top: 387px; left: 283px;" value="1층 A블록 12열 6"></button> 
	<button class="seat_R" id="L1_B12_1" style="top: 387px; left: 330px;" value="1층 B블록 12열 1"></button>
	<button class="seat_R" id="L1_B12_2" style="top: 387px; left: 344px;" value="1층 B블록 12열 2"></button>
	<button class="seat_R" id="L1_B12_3" style="top: 387px; left: 359px;" value="1층 B블록 12열 3"></button>
	<button class="seat_R" id="L1_B12_4" style="top: 387px; left: 373px;" value="1층 B블록 12열 4"></button>
	<button class="seat_R" id="L1_B12_5" style="top: 387px; left: 388px;" value="1층 B블록 12열 5"></button>
	<button class="seat_R" id="L1_B12_6" style="top: 387px; left: 402px;" value="1층 B블록 12열 6"></button>
	<button class="seat_R" id="L1_B12_7" style="top: 387px; left: 417px;" value="1층 B블록 12열 7"></button>
	<button class="seat_R" id="L1_B12_8" style="top: 387px; left: 431px;" value="1층 B블록 12열 8"></button>
	<button class="seat_R" id="L1_B12_9" style="top: 387px; left: 446px;" value="1층 B블록 12열 9"></button>
	<button class="seat_R" id="L1_B12_10" style="top: 387px; left: 460px;" value="1층 B블록 12열 10"></button>
	<button class="seat_R" id="L1_B12_11" style="top: 387px; left: 475px;" value="1층 B블록 12열 11"></button>
	<button class="seat_R" id="L1_B12_12" style="top: 387px; left: 489px;" value="1층 B블록 12열 12"></button>
	<button class="seat_R" id="L1_B12_13" style="top: 387px; left: 504px;" value="1층 B블록 12열 13"></button>
	<button class="seat_R" id="L1_B12_14" style="top: 387px; left: 518px;" value="1층 B블록 12열 14"></button>
	<button class="seat_R" id="L1_B12_15" style="top: 387px; left: 533px;" value="1층 B블록 12열 15"></button>
	<button class="seat_R" id="L1_B12_16" style="top: 387px; left: 547px;" value="1층 B블록 12열 16"></button>
	<button class="seat_R" id="L1_C12_1" style="top: 387px; left: 594px;" value="1층 C블록 12열 1"></button>
	<button class="seat_R" id="L1_C12_2" style="top: 387px; left: 608px;" value="1층 C블록 12열 2"></button>                           
	<button class="seat_R" id="L1_C12_3" style="top: 387px; left: 622px;" value="1층 C블록 12열 3"></button> 
	<button class="seat_S" id="L1_C12_4" style="top: 387px; left: 637px;" value="1층 C블록 12열 4"></button>                           
	<button class="seat_S" id="L1_C12_5" style="top: 387px; left: 651px;" value="1층 C블록 12열 5"></button>
	<button class="seat_S" id="L1_C12_6" style="top: 387px; left: 666px;" value="1층 C블록 12열 6"></button>     	
	
	<button class="seat_S" id="L1_A13_1" style="top: 402px; left: 211px;" value="1층 A블록 13열 1"></button>
	<button class="seat_S" id="L1_A13_2" style="top: 402px; left: 226px;" value="1층 A블록 13열 2"></button>
  <button class="seat_S" id="L1_A13_3" style="top: 402px; left: 240px;" value="1층 A블록 13열 3"></button>
	<button class="seat_R" id="L1_A13_4" style="top: 402px; left: 254px;" value="1층 A블록 13열 4"></button>
	<button class="seat_R" id="L1_A13_5" style="top: 402px; left: 268px;" value="1층 A블록 13열 5"></button>
	<button class="seat_R" id="L1_A13_6" style="top: 402px; left: 283px;" value="1층 A블록 13열 6"></button> 
	<button class="seat_R" id="L1_B13_1" style="top: 402px; left: 330px;" value="1층 B블록 13열 1"></button>
	<button class="seat_R" id="L1_B13_2" style="top: 402px; left: 344px;" value="1층 B블록 13열 2"></button>
	<button class="seat_R" id="L1_B13_3" style="top: 402px; left: 359px;" value="1층 B블록 13열 3"></button>
	<button class="seat_R" id="L1_B13_4" style="top: 402px; left: 373px;" value="1층 B블록 13열 4"></button>
	<button class="seat_R" id="L1_B13_5" style="top: 402px; left: 388px;" value="1층 B블록 13열 5"></button>
	<button class="seat_R" id="L1_B13_6" style="top: 402px; left: 402px;" value="1층 B블록 13열 6"></button>
	<button class="seat_R" id="L1_B13_7" style="top: 402px; left: 417px;" value="1층 B블록 13열 7"></button>
	<button class="seat_R" id="L1_B13_8" style="top: 402px; left: 431px;" value="1층 B블록 13열 8"></button>
	<button class="seat_R" id="L1_B13_9" style="top: 402px; left: 446px;" value="1층 B블록 13열 9"></button>
	<button class="seat_R" id="L1_B13_10" style="top: 402px; left: 460px;" value="1층 B블록 13열 10"></button>
	<button class="seat_R" id="L1_B13_11" style="top: 402px; left: 475px;" value="1층 B블록 13열 11"></button>
	<button class="seat_R" id="L1_B13_12" style="top: 402px; left: 489px;" value="1층 B블록 13열 12"></button>
	<button class="seat_R" id="L1_B13_13" style="top: 402px; left: 504px;" value="1층 B블록 13열 13"></button>
	<button class="seat_R" id="L1_B13_14" style="top: 402px; left: 518px;" value="1층 B블록 13열 14"></button>
	<button class="seat_R" id="L1_B13_15" style="top: 402px; left: 533px;" value="1층 B블록 13열 15"></button>
	<button class="seat_R" id="L1_B13_16" style="top: 402px; left: 547px;" value="1층 B블록 13열 16"></button>
	<button class="seat_R" id="L1_C13_1" style="top: 402px; left: 594px;" value="1층 C블록 13열 1"></button>
	<button class="seat_R" id="L1_C13_2" style="top: 402px; left: 608px;" value="1층 C블록 13열 2"></button>                           
	<button class="seat_R" id="L1_C13_3" style="top: 402px; left: 622px;" value="1층 C블록 13열 3"></button> 
	<button class="seat_S" id="L1_C13_4" style="top: 402px; left: 637px;" value="1층 C블록 13열 4"></button>                           
	<button class="seat_S" id="L1_C13_5" style="top: 402px; left: 651px;" value="1층 C블록 13열 5"></button>
	<button class="seat_S" id="L1_C13_6" style="top: 402px; left: 666px;" value="1층 C블록 13열 6"></button>  	
	
	<button class="seat_S" id="L1_A14_1" style="top: 416px; left: 211px;" value="1층 A블록 14열 1"></button>
	<button class="seat_S" id="L1_A14_2" style="top: 416px; left: 226px;" value="1층 A블록 14열 2"></button>
  <button class="seat_S" id="L1_A14_3" style="top: 416px; left: 240px;" value="1층 A블록 14열 3"></button>
	<button class="seat_R" id="L1_A14_4" style="top: 416px; left: 254px;" value="1층 A블록 14열 4"></button>
	<button class="seat_R" id="L1_A14_5" style="top: 416px; left: 268px;" value="1층 A블록 14열 5"></button>
	<button class="seat_R" id="L1_A14_6" style="top: 416px; left: 283px;" value="1층 A블록 14열 6"></button> 
	<button class="seat_R" id="L1_B14_1" style="top: 416px; left: 330px;" value="1층 B블록 14열 1"></button>
	<button class="seat_R" id="L1_B14_2" style="top: 416px; left: 344px;" value="1층 B블록 14열 2"></button>
	<button class="seat_R" id="L1_B14_3" style="top: 416px; left: 359px;" value="1층 B블록 14열 3"></button>
	<button class="seat_R" id="L1_B14_4" style="top: 416px; left: 373px;" value="1층 B블록 14열 4"></button>
	<button class="seat_R" id="L1_B14_5" style="top: 416px; left: 388px;" value="1층 B블록 14열 5"></button>
	<button class="seat_R" id="L1_B14_6" style="top: 416px; left: 402px;" value="1층 B블록 14열 6"></button>
	<button class="seat_R" id="L1_B14_7" style="top: 416px; left: 417px;" value="1층 B블록 14열 7"></button>
	<button class="seat_R" id="L1_B14_8" style="top: 416px; left: 431px;" value="1층 B블록 14열 8"></button>
	<button class="seat_R" id="L1_B14_9" style="top: 416px; left: 446px;" value="1층 B블록 14열 9"></button>
	<button class="seat_R" id="L1_B14_10" style="top: 416px; left: 460px;" value="1층 B블록 14열 10"></button>
	<button class="seat_R" id="L1_B14_11" style="top: 416px; left: 475px;" value="1층 B블록 14열 11"></button>
	<button class="seat_R" id="L1_B14_12" style="top: 416px; left: 489px;" value="1층 B블록 14열 12"></button>
	<button class="seat_R" id="L1_B14_13" style="top: 416px; left: 504px;" value="1층 B블록 14열 13"></button>
	<button class="seat_R" id="L1_B14_14" style="top: 416px; left: 518px;" value="1층 B블록 14열 14"></button>
	<button class="seat_R" id="L1_B14_15" style="top: 416px; left: 533px;" value="1층 B블록 14열 15"></button>
	<button class="seat_R" id="L1_B14_16" style="top: 416px; left: 547px;" value="1층 B블록 14열 16"></button>	
	<button class="seat_R" id="L1_C14_1" style="top: 416px; left: 594px;" value="1층 C블록 14열 1"></button>
	<button class="seat_R" id="L1_C14_2" style="top: 416px; left: 608px;" value="1층 C블록 14열 2"></button>                           
	<button class="seat_R" id="L1_C14_3" style="top: 416px; left: 622px;" value="1층 C블록 14열 3"></button> 
	<button class="seat_S" id="L1_C14_4" style="top: 416px; left: 637px;" value="1층 C블록 14열 4"></button>                           
	<button class="seat_S" id="L1_C14_5" style="top: 416px; left: 651px;" value="1층 C블록 14열 5"></button>
	<button class="seat_S" id="L1_C14_6" style="top: 416px; left: 666px;" value="1층 C블록 14열 6"></button>  

	<button class="seat_S" id="L1_A15_1" style="top: 430px; left: 211px;" value="1층 A블록 15열 1"></button>
	<button class="seat_S" id="L1_A15_2" style="top: 430px; left: 226px;" value="1층 A블록 15열 2"></button>
  <button class="seat_S" id="L1_A15_3" style="top: 430px; left: 240px;" value="1층 A블록 15열 3"></button>
	<button class="seat_R" id="L1_A15_4" style="top: 430px; left: 254px;" value="1층 A블록 15열 4"></button>
	<button class="seat_R" id="L1_A15_5" style="top: 430px; left: 268px;" value="1층 A블록 15열 5"></button>
	<button class="seat_R" id="L1_A15_6" style="top: 430px; left: 283px;" value="1층 A블록 15열 6"></button> 	
	<button class="seat_R" id="L1_B15_1" style="top: 430px; left: 330px;" value="1층 B블록 15열 1"></button>
	<button class="seat_R" id="L1_B15_2" style="top: 430px; left: 344px;" value="1층 B블록 15열 2"></button>
	<button class="seat_R" id="L1_B15_3" style="top: 430px; left: 359px;" value="1층 B블록 15열 3"></button>
	<button class="seat_R" id="L1_B15_4" style="top: 430px; left: 373px;" value="1층 B블록 15열 4"></button>
	<button class="seat_R" id="L1_B15_5" style="top: 430px; left: 388px;" value="1층 B블록 15열 5"></button>
	<button class="seat_R" id="L1_B15_6" style="top: 430px; left: 402px;" value="1층 B블록 15열 6"></button>
	<button class="seat_R" id="L1_B15_7" style="top: 430px; left: 417px;" value="1층 B블록 15열 7"></button>
	<button class="seat_R" id="L1_B15_8" style="top: 430px; left: 431px;" value="1층 B블록 15열 8"></button>
	<button class="seat_R" id="L1_B15_9" style="top: 430px; left: 446px;" value="1층 B블록 15열 9"></button>
	<button class="seat_R" id="L1_B15_10" style="top: 430px; left: 460px;" value="1층 B블록 15열 10"></button>
	<button class="seat_R" id="L1_B15_11" style="top: 430px; left: 475px;" value="1층 B블록 15열 11"></button>
	<button class="seat_R" id="L1_B15_12" style="top: 430px; left: 489px;" value="1층 B블록 15열 12"></button>
	<button class="seat_R" id="L1_B15_13" style="top: 430px; left: 504px;" value="1층 B블록 15열 13"></button>
	<button class="seat_R" id="L1_B15_14" style="top: 430px; left: 518px;" value="1층 B블록 15열 14"></button>
	<button class="seat_R" id="L1_B15_15" style="top: 430px; left: 533px;" value="1층 B블록 15열 15"></button>
	<button class="seat_R" id="L1_B15_16" style="top: 430px; left: 547px;" value="1층 B블록 15열 16"></button>
	<button class="seat_R" id="L1_C15_1" style="top: 430px; left: 594px;" value="1층 C블록 15열 1"></button>
	<button class="seat_R" id="L1_C15_2" style="top: 430px; left: 608px;" value="1층 C블록 15열 2"></button>                           
	<button class="seat_R" id="L1_C15_3" style="top: 430px; left: 622px;" value="1층 C블록 15열 3"></button> 
	<button class="seat_S" id="L1_C15_4" style="top: 430px; left: 637px;" value="1층 C블록 15열 4"></button>                           
	<button class="seat_S" id="L1_C15_5" style="top: 430px; left: 651px;" value="1층 C블록 15열 5"></button>
	<button class="seat_S" id="L1_C15_6" style="top: 430px; left: 666px;" value="1층 C블록 15열 6"></button>    
	
	<button class="seat_S" id="L1_A16_1" style="top: 445px; left: 211px;" value="1층 A블록 16열 1"></button>
	<button class="seat_S" id="L1_A16_2" style="top: 445px; left: 226px;" value="1층 A블록 16열 2"></button>
  <button class="seat_S" id="L1_A16_3" style="top: 445px; left: 240px;" value="1층 A블록 16열 3"></button>
	<button class="seat_R" id="L1_A16_4" style="top: 445px; left: 254px;" value="1층 A블록 16열 4"></button>
	<button class="seat_R" id="L1_A16_5" style="top: 445px; left: 268px;" value="1층 A블록 16열 5"></button>
	<button class="seat_R" id="L1_A16_6" style="top: 445px; left: 283px;" value="1층 A블록 16열 6"></button> 
	<button class="seat_R" id="L1_B16_1" style="top: 445px; left: 330px;" value="1층 B블록 16열 1"></button>
	<button class="seat_R" id="L1_B16_2" style="top: 445px; left: 344px;" value="1층 B블록 16열 2"></button>
	<button class="seat_R" id="L1_B16_3" style="top: 445px; left: 359px;" value="1층 B블록 16열 3"></button>
	<button class="seat_R" id="L1_B16_4" style="top: 445px; left: 373px;" value="1층 B블록 16열 4"></button>
	<button class="seat_R" id="L1_B16_5" style="top: 445px; left: 388px;" value="1층 B블록 16열 5"></button>
	<button class="seat_R" id="L1_B16_6" style="top: 445px; left: 402px;" value="1층 B블록 16열 6"></button>
	<button class="seat_R" id="L1_B16_7" style="top: 445px; left: 417px;" value="1층 B블록 16열 7"></button>
	<button class="seat_R" id="L1_B16_8" style="top: 445px; left: 431px;" value="1층 B블록 16열 8"></button>
	<button class="seat_R" id="L1_B16_9" style="top: 445px; left: 446px;" value="1층 B블록 16열 9"></button>
	<button class="seat_R" id="L1_B16_10" style="top: 445px; left: 460px;" value="1층 B블록 16열 10"></button>
	<button class="seat_R" id="L1_B16_11" style="top: 445px; left: 475px;" value="1층 B블록 16열 11"></button>
	<button class="seat_R" id="L1_B16_12" style="top: 445px; left: 489px;" value="1층 B블록 16열 12"></button>
	<button class="seat_R" id="L1_B16_13" style="top: 445px; left: 504px;" value="1층 B블록 16열 13"></button>
	<button class="seat_R" id="L1_B16_14" style="top: 445px; left: 518px;" value="1층 B블록 16열 14"></button>
	<button class="seat_R" id="L1_B16_15" style="top: 445px; left: 533px;" value="1층 B블록 16열 15"></button>
	<button class="seat_R" id="L1_B16_16" style="top: 445px; left: 547px;" value="1층 B블록 16열 16"></button>
	<button class="seat_R" id="L1_C16_1" style="top: 445px; left: 594px;" value="1층 C블록 16열 1"></button>
	<button class="seat_R" id="L1_C16_2" style="top: 445px; left: 608px;" value="1층 C블록 16열 2"></button>                           
	<button class="seat_R" id="L1_C16_3" style="top: 445px; left: 622px;" value="1층 C블록 16열 3"></button>
	<button class="seat_S" id="L1_C16_4" style="top: 445px; left: 637px;" value="1층 C블록 16열 4"></button>                           
	<button class="seat_S" id="L1_C16_5" style="top: 445px; left: 651px;" value="1층 C블록 16열 5"></button>
	<button class="seat_S" id="L1_C16_6" style="top: 445px; left: 666px;" value="1층 C블록 16열 6"></button>    
	
	<button class="seat_S" id="L1_A17_1" style="top: 459px; left: 211px;" value="1층 A블록 17열 1"></button>
	<button class="seat_S" id="L1_A17_2" style="top: 459px; left: 226px;" value="1층 A블록 17열 2"></button>
  <button class="seat_S" id="L1_A17_3" style="top: 459px; left: 240px;" value="1층 A블록 17열 3"></button>
	<button class="seat_R" id="L1_B17_1" style="top: 459px; left: 330px;" value="1층 B블록 17열 1"></button>
	<button class="seat_R" id="L1_B17_2" style="top: 459px; left: 344px;" value="1층 B블록 17열 2"></button>
	<button class="seat_R" id="L1_B17_3" style="top: 459px; left: 359px;" value="1층 B블록 17열 3"></button>
	<button class="seat_R" id="L1_B17_4" style="top: 459px; left: 373px;" value="1층 B블록 17열 4"></button>
	<button class="seat_R" id="L1_B17_5" style="top: 459px; left: 388px;" value="1층 B블록 17열 5"></button>
	<button class="seat_R" id="L1_B17_6" style="top: 459px; left: 402px;" value="1층 B블록 17열 6"></button>
	<button class="seat_R" id="L1_B17_7" style="top: 459px; left: 417px;" value="1층 B블록 17열 7"></button>
	<button class="seat_R" id="L1_B17_8" style="top: 459px; left: 431px;" value="1층 B블록 17열 8"></button>
	<button class="seat_R" id="L1_B17_9" style="top: 459px; left: 446px;" value="1층 B블록 17열 9"></button>
	<button class="seat_R" id="L1_B17_10" style="top: 459px; left: 460px;" value="1층 B블록 17열 10"></button>
	<button class="seat_R" id="L1_B17_11" style="top: 459px; left: 475px;" value="1층 B블록 17열 11"></button>
	<button class="seat_R" id="L1_B17_12" style="top: 459px; left: 489px;" value="1층 B블록 17열 12"></button>
	<button class="seat_R" id="L1_B17_13" style="top: 459px; left: 504px;" value="1층 B블록 17열 13"></button>
	<button class="seat_R" id="L1_B17_14" style="top: 459px; left: 518px;" value="1층 B블록 17열 14"></button>
	<button class="seat_R" id="L1_B17_15" style="top: 459px; left: 533px;" value="1층 B블록 17열 15"></button>
	<button class="seat_R" id="L1_B17_16" style="top: 459px; left: 547px;" value="1층 B블록 17열 16"></button>
  <button class="seat_S" id="L1_C17_1" style="top: 459px; left: 594px;" value="1층 C블록 17열 1"></button>
	<button class="seat_S" id="L1_C17_2" style="top: 459px; left: 608px;" value="1층 C블록 17열 2"></button>                           
	<button class="seat_S" id="L1_C17_3" style="top: 459px; left: 622px;" value="1층 C블록 17열 3"></button>
	<!-- 1층 일반좌석 // -->
	
	<!-- //2층 일반좌석 -->
	<button class="seat_R" id="L2_A1_1" style="top: 565px; left: 240px;" value="2층 A블록 1열 1"></button>
	<button class="seat_R" id="L2_A1_2" style="top: 565px; left: 254px;" value="2층 A블록 1열 2"></button>
	<button class="seat_R" id="L2_A1_3" style="top: 565px; left: 268px;" value="2층 A블록 1열 3"></button>
	<button class="seat_R" id="L2_A1_4" style="top: 565px; left: 283px;" value="2층 A블록 1열 4"></button> 	
	<button class="seat_R" id="L2_A1_5" style="top: 565px; left: 297px;" value="2층 A블록 1열 5"></button> 	
	<button class="seat_R" id="L2_A1_6" style="top: 565px; left: 312px;" value="2층 A블록 1열 6"></button> 	
	<button class="seat_R" id="L2_A1_7" style="top: 565px; left: 326px;" value="2층 A블록 1열 7"></button> 	
	<button class="seat_R" id="L2_A1_8" style="top: 565px; left: 340px;" value="2층 A블록 1열 8"></button> 	
	<button class="seat_R" id="L2_A1_9" style="top: 565px; left: 355px;" value="2층 A블록 1열 9"></button> 	
	<button class="seat_R" id="L2_A1_10" style="top: 565px; left: 369px;" value="2층 A블록 1열 10"></button> 	
	<button class="seat_R" id="L2_A1_11" style="top: 565px; left: 383px;" value="2층 A블록 1열 11"></button> 	
	<button class="seat_R" id="L2_A1_12" style="top: 565px; left: 397px;" value="2층 A블록 1열 12"></button> 	
	<button class="seat_R" id="L2_A1_13" style="top: 565px; left: 412px;" value="2층 A블록 1열 13"></button> 
	
	<button class="seat_R" id="L2_B1_1" style="top: 565px; left: 465px;" value="2층 B블록 1열 1"></button>
	<button class="seat_R" id="L2_B1_2" style="top: 565px; left: 479px;" value="2층 B블록 1열 2"></button>
	<button class="seat_R" id="L2_B1_3" style="top: 565px; left: 494px;" value="2층 B블록 1열 3"></button>
	<button class="seat_R" id="L2_B1_4" style="top: 565px; left: 508px;" value="2층 B블록 1열 4"></button> 	
	<button class="seat_R" id="L2_B1_5" style="top: 565px; left: 522px;" value="2층 B블록 1열 5"></button> 	
	<button class="seat_R" id="L2_B1_6" style="top: 565px; left: 537px;" value="2층 B블록 1열 6"></button> 	
	<button class="seat_R" id="L2_B1_7" style="top: 565px; left: 551px;" value="2층 B블록 1열 7"></button> 	
	<button class="seat_R" id="L2_B1_8" style="top: 565px; left: 565px;" value="2층 B블록 1열 8"></button> 	
	<button class="seat_R" id="L2_B1_9" style="top: 565px; left: 579px;" value="2층 B블록 1열 9"></button> 	
	<button class="seat_R" id="L2_B1_10" style="top: 565px; left: 594px;" value="2층 B블록 1열 10"></button> 	
	<button class="seat_R" id="L2_B1_11" style="top: 565px; left: 608px;" value="2층 B블록 1열 11"></button> 	
	<button class="seat_R" id="L2_B1_12" style="top: 565px; left: 623px;" value="2층 B블록 1열 12"></button> 	
	<button class="seat_R" id="L2_B1_13" style="top: 565px; left: 637px;" value="2층 B블록 1열 13"></button>
	
	<button class="seat_S" id="L2_A2_1" style="top: 579px; left: 240px;" value="2층 A블록 2열 1"></button>
	<button class="seat_S" id="L2_A2_2" style="top: 579px; left: 254px;" value="2층 A블록 2열 2"></button>
	<button class="seat_S" id="L2_A2_3" style="top: 579px; left: 268px;" value="2층 A블록 2열 3"></button>
	<button class="seat_S" id="L2_A2_4" style="top: 579px; left: 283px;" value="2층 A블록 2열 4"></button> 	
	<button class="seat_S" id="L2_A2_5" style="top: 579px; left: 297px;" value="2층 A블록 2열 5"></button> 	
	<button class="seat_S" id="L2_A2_6" style="top: 579px; left: 312px;" value="2층 A블록 2열 6"></button> 	
	<button class="seat_S" id="L2_A2_7" style="top: 579px; left: 326px;" value="2층 A블록 2열 7"></button> 	
	<button class="seat_S" id="L2_A2_8" style="top: 579px; left: 340px;" value="2층 A블록 2열 8"></button> 	
	<button class="seat_S" id="L2_A2_9" style="top: 579px; left: 355px;" value="2층 A블록 2열 9"></button> 	
	<button class="seat_S" id="L2_A2_10" style="top: 579px; left: 369px;" value="2층 A블록 2열 10"></button> 	
	<button class="seat_S" id="L2_A2_11" style="top: 579px; left: 383px;" value="2층 A블록 2열 11"></button> 	
	<button class="seat_S" id="L2_A2_12" style="top: 579px; left: 397px;" value="2층 A블록 2열 12"></button> 	
	<button class="seat_S" id="L2_A2_13" style="top: 579px; left: 412px;" value="2층 A블록 2열 13"></button> 
	                              
	<button class="seat_S" id="L2_B2_1" style="top: 579px; left: 465px;" value="2층 B블록 2열 1"></button>
	<button class="seat_S" id="L2_B2_2" style="top: 579px; left: 479px;" value="2층 B블록 2열 2"></button>
	<button class="seat_S" id="L2_B2_3" style="top: 579px; left: 494px;" value="2층 B블록 2열 3"></button>
	<button class="seat_S" id="L2_B2_4" style="top: 579px; left: 508px;" value="2층 B블록 2열 4"></button> 	
	<button class="seat_S" id="L2_B2_5" style="top: 579px; left: 522px;" value="2층 B블록 2열 5"></button> 	
	<button class="seat_S" id="L2_B2_6" style="top: 579px; left: 537px;" value="2층 B블록 2열 6"></button> 	
	<button class="seat_S" id="L2_B2_7" style="top: 579px; left: 551px;" value="2층 B블록 2열 7"></button> 	
	<button class="seat_S" id="L2_B2_8" style="top: 579px; left: 565px;" value="2층 B블록 2열 8"></button> 	
	<button class="seat_S" id="L2_B2_9" style="top: 579px; left: 579px;" value="2층 B블록 2열 9"></button> 	
	<button class="seat_S" id="L2_B2_10" style="top: 579px; left: 594px;" value="2층 B블록 2열 10"></button> 	
	<button class="seat_S" id="L2_B2_11" style="top: 579px; left: 608px;" value="2층 B블록 2열 11"></button> 	
	<button class="seat_S" id="L2_B2_12" style="top: 579px; left: 623px;" value="2층 B블록 2열 12"></button> 	
	<button class="seat_S" id="L2_B2_13" style="top: 579px; left: 637px;" value="2층 B블록 2열 13"></button> 
	
	<button class="seat_S" id="L2_A3_1" style="top: 593px; left: 240px;" value="2층 A블록 3열 1"></button>
	<button class="seat_S" id="L2_A3_2" style="top: 593px; left: 254px;" value="2층 A블록 3열 2"></button>
	<button class="seat_S" id="L2_A3_3" style="top: 593px; left: 268px;" value="2층 A블록 3열 3"></button>
	<button class="seat_S" id="L2_A3_4" style="top: 593px; left: 283px;" value="2층 A블록 3열 4"></button> 	
	<button class="seat_S" id="L2_A3_5" style="top: 593px; left: 297px;" value="2층 A블록 3열 5"></button> 	
	<button class="seat_S" id="L2_A3_6" style="top: 593px; left: 312px;" value="2층 A블록 3열 6"></button> 	
	<button class="seat_S" id="L2_A3_7" style="top: 593px; left: 326px;" value="2층 A블록 3열 7"></button> 	
	<button class="seat_S" id="L2_A3_8" style="top: 593px; left: 340px;" value="2층 A블록 3열 8"></button> 	
	<button class="seat_S" id="L2_A3_9" style="top: 593px; left: 355px;" value="2층 A블록 3열 9"></button> 	
	<button class="seat_S" id="L2_A3_10" style="top: 593px; left: 369px;" value="2층 A블록 3열 10"></button> 	
	<button class="seat_S" id="L2_A3_11" style="top: 593px; left: 383px;" value="2층 A블록 3열 11"></button> 	
	<button class="seat_S" id="L2_A3_12" style="top: 593px; left: 397px;" value="2층 A블록 3열 12"></button> 	
	<button class="seat_S" id="L2_A3_13" style="top: 593px; left: 412px;" value="2층 A블록 3열 13"></button> 
	                               
	<button class="seat_S" id="L2_B3_1" style="top: 593px; left: 465px;" value="2층 B블록 3열 1"></button>
	<button class="seat_S" id="L2_B3_2" style="top: 593px; left: 479px;" value="2층 B블록 3열 2"></button>
	<button class="seat_S" id="L2_B3_3" style="top: 593px; left: 494px;" value="2층 B블록 3열 3"></button>
	<button class="seat_S" id="L2_B3_4" style="top: 593px; left: 508px;" value="2층 B블록 3열 4"></button> 	
	<button class="seat_S" id="L2_B3_5" style="top: 593px; left: 522px;" value="2층 B블록 3열 5"></button> 	
	<button class="seat_S" id="L2_B3_6" style="top: 593px; left: 537px;" value="2층 B블록 3열 6"></button> 	
	<button class="seat_S" id="L2_B3_7" style="top: 593px; left: 551px;" value="2층 B블록 3열 7"></button> 	
	<button class="seat_S" id="L2_B3_8" style="top: 593px; left: 565px;" value="2층 B블록 3열 8"></button> 	
	<button class="seat_S" id="L2_B3_9" style="top: 593px; left: 579px;" value="2층 B블록 3열 9"></button> 	
	<button class="seat_S" id="L2_B3_10" style="top: 593px; left: 594px;" value="2층 B블록 3열 10"></button> 	
	<button class="seat_S" id="L2_B3_11" style="top: 593px; left: 608px;" value="2층 B블록 3열 11"></button> 	
	<button class="seat_S" id="L2_B3_12" style="top: 593px; left: 623px;" value="2층 B블록 3열 12"></button> 	
	<button class="seat_S" id="L2_B3_13" style="top: 593px; left: 637px;" value="2층 B블록 3열 13"></button>		

	<button class="seat_S" id="L2_A4_1" style="top: 607px; left: 226px;" value="2층 A블록 4열 1"></button>
	<button class="seat_S" id="L2_A4_2" style="top: 607px; left: 240px;" value="2층 A블록 4열 2"></button>
	<button class="seat_S" id="L2_A4_3" style="top: 607px; left: 254px;" value="2층 A블록 4열 3"></button>
	<button class="seat_S" id="L2_A4_4" style="top: 607px; left: 268px;" value="2층 A블록 4열 4"></button>
	<button class="seat_S" id="L2_A4_5" style="top: 607px; left: 283px;" value="2층 A블록 4열 5"></button> 	
	<button class="seat_S" id="L2_A4_6" style="top: 607px; left: 297px;" value="2층 A블록 4열 6"></button> 	
	<button class="seat_S" id="L2_A4_7" style="top: 607px; left: 312px;" value="2층 A블록 4열 7"></button> 	
	<button class="seat_S" id="L2_A4_8" style="top: 607px; left: 326px;" value="2층 A블록 4열 8"></button> 	
	<button class="seat_S" id="L2_A4_9" style="top: 607px; left: 340px;" value="2층 A블록 4열 9"></button> 	
	<button class="seat_S" id="L2_A4_10" style="top: 607px; left: 355px;" value="2층 A블록 4열 10"></button> 	
	<button class="seat_S" id="L2_A4_11" style="top: 607px; left: 369px;" value="2층 A블록 4열 11"></button> 	
	<button class="seat_S" id="L2_A4_12" style="top: 607px; left: 383px;" value="2층 A블록 4열 12"></button> 	
	<button class="seat_S" id="L2_A4_13" style="top: 607px; left: 397px;" value="2층 A블록 4열 13"></button> 	
	<button class="seat_S" id="L2_A4_14" style="top: 607px; left: 412px;" value="2층 A블록 4열 14"></button> 
	                               
	<button class="seat_S" id="L2_B4_1" style="top: 607px; left: 465px;" value="2층 B블록 4열 1"></button>
	<button class="seat_S" id="L2_B4_2" style="top: 607px; left: 479px;" value="2층 B블록 4열 2"></button>
	<button class="seat_S" id="L2_B4_3" style="top: 607px; left: 494px;" value="2층 B블록 4열 3"></button>
	<button class="seat_S" id="L2_B4_4" style="top: 607px; left: 508px;" value="2층 B블록 4열 4"></button> 	
	<button class="seat_S" id="L2_B4_5" style="top: 607px; left: 522px;" value="2층 B블록 4열 5"></button> 	
	<button class="seat_S" id="L2_B4_6" style="top: 607px; left: 537px;" value="2층 B블록 4열 6"></button> 	
	<button class="seat_S" id="L2_B4_7" style="top: 607px; left: 551px;" value="2층 B블록 4열 7"></button> 	
	<button class="seat_S" id="L2_B4_8" style="top: 607px; left: 565px;" value="2층 B블록 4열 8"></button> 	
	<button class="seat_S" id="L2_B4_9" style="top: 607px; left: 579px;" value="2층 B블록 4열 9"></button> 	
	<button class="seat_S" id="L2_B4_10" style="top: 607px; left: 594px;" value="2층 B블록 4열 10"></button> 	
	<button class="seat_S" id="L2_B4_11" style="top: 607px; left: 608px;" value="2층 B블록 4열 11"></button> 	
	<button class="seat_S" id="L2_B4_12" style="top: 607px; left: 623px;" value="2층 B블록 4열 12"></button> 	
	<button class="seat_S" id="L2_B4_13" style="top: 607px; left: 637px;" value="2층 B블록 4열 13"></button>
	<button class="seat_S" id="L2_B4_14" style="top: 607px; left: 651px;" value="2층 B블록 4열 14"></button>
	
	<button class="seat_S" id="L2_A5_1" style="top: 622px; left: 226px;" value="2층 A블록 5열 1"></button>
	<button class="seat_S" id="L2_A5_2" style="top: 622px; left: 240px;" value="2층 A블록 5열 2"></button>
	<button class="seat_S" id="L2_A5_3" style="top: 622px; left: 254px;" value="2층 A블록 5열 3"></button>
	<button class="seat_S" id="L2_A5_4" style="top: 622px; left: 268px;" value="2층 A블록 5열 4"></button>
	<button class="seat_S" id="L2_A5_5" style="top: 622px; left: 283px;" value="2층 A블록 5열 5"></button>
	
	<button class="seat_S" id="L2_B5_1" style="top: 622px; left: 594px;" value="2층 B블록 5열 1"></button> 	
	<button class="seat_S" id="L2_B5_2" style="top: 622px; left: 608px;" value="2층 B블록 5열 2"></button> 	
	<button class="seat_S" id="L2_B5_3" style="top: 622px; left: 623px;" value="2층 B블록 5열 3"></button> 	
	<button class="seat_S" id="L2_B5_4" style="top: 622px; left: 637px;" value="2층 B블록 5열 4"></button>
	<button class="seat_S" id="L2_B5_5" style="top: 622px; left: 651px;" value="2층 B블록 5열 5"></button>
	
	<button class="seat_S" id="L2_A6_1" style="top: 637px; left: 226px;" value="2층 A블록 6열 1"></button>
	<button class="seat_S" id="L2_A6_2" style="top: 637px; left: 240px;" value="2층 A블록 6열 2"></button>
	<button class="seat_S" id="L2_A6_3" style="top: 637px; left: 254px;" value="2층 A블록 6열 3"></button>
	<button class="seat_S" id="L2_A6_4" style="top: 637px; left: 268px;" value="2층 A블록 6열 4"></button>
	<button class="seat_S" id="L2_A6_5" style="top: 637px; left: 283px;" value="2층 A블록 6열 5"></button>
	
	<button class="seat_S" id="L2_B6_1" style="top: 637px; left: 594px;" value="2층 B블록 6열 1"></button> 	
	<button class="seat_S" id="L2_B6_2" style="top: 637px; left: 608px;" value="2층 B블록 6열 2"></button> 	
	<button class="seat_S" id="L2_B6_3" style="top: 637px; left: 623px;" value="2층 B블록 6열 3"></button> 	
	<button class="seat_S" id="L2_B6_4" style="top: 637px; left: 637px;" value="2층 B블록 6열 4"></button>
	<button class="seat_S" id="L2_B6_5" style="top: 637px; left: 651px;" value="2층 B블록 6열 5"></button>
	<!-- 2층 일반좌석 // -->
	
	<!-- //2층 BOX석 -->
	<button class="seat_S" id="L2_BOX1_1" style="top: 302px; left: 135px;" value="2층 BOX1 1"></button>
	<button class="seat_S" id="L2_BOX1_2" style="top: 316px; left: 135px;" value="2층 BOX1 2"></button>
	<button class="seat_S" id="L2_BOX1_3" style="top: 330px; left: 135px;" value="2층 BOX1 3"></button>
	<button class="seat_S" id="L2_BOX1_4" style="top: 344px; left: 135px;" value="2층 BOX1 4"></button>
	<button class="seat_S" id="L2_BOX1_5" style="top: 373px; left: 135px;" value="2층 BOX1 5"></button>
	<button class="seat_S" id="L2_BOX1_6" style="top: 387px; left: 135px;" value="2층 BOX1 6"></button>
	<button class="seat_S" id="L2_BOX1_7" style="top: 402px; left: 135px;" value="2층 BOX1 7"></button>
	<button class="seat_S" id="L2_BOX1_8" style="top: 416px; left: 135px;" value="2층 BOX1 8"></button>
	<button class="seat_S" id="L2_BOX1_9" style="top: 430px; left: 135px;" value="2층 BOX1 9"></button>
	<button class="seat_S" id="L2_BOX1_10" style="top: 445px; left: 135px;" value="2층 BOX1 10"></button>
	
	<button class="seat_S" id="L2_BOX2_1" style="top: 302px; left: 741px;" value="2층 BOX2 1"></button>
	<button class="seat_S" id="L2_BOX2_2" style="top: 316px; left: 741px;" value="2층 BOX2 2"></button>
	<button class="seat_S" id="L2_BOX2_3" style="top: 330px; left: 741px;" value="2층 BOX2 3"></button>
	<button class="seat_S" id="L2_BOX2_4" style="top: 344px; left: 741px;" value="2층 BOX2 4"></button>
	<button class="seat_S" id="L2_BOX2_5" style="top: 373px; left: 741px;" value="2층 BOX2 5"></button>
	<button class="seat_S" id="L2_BOX2_6" style="top: 387px; left: 741px;" value="2층 BOX2 6"></button>
	<button class="seat_S" id="L2_BOX2_7" style="top: 402px; left: 741px;" value="2층 BOX2 7"></button>
	<button class="seat_S" id="L2_BOX2_8" style="top: 416px; left: 741px;" value="2층 BOX2 8"></button>
	<button class="seat_S" id="L2_BOX2_9" style="top: 430px; left: 741px;" value="2층 BOX2 9"></button>
	<button class="seat_S" id="L2_BOX2_10" style="top: 445px; left: 741px;" value="2층 BOX2 10"></button>
	<!-- 2층 BOX석 // -->
	<!-- 좌석 위치 // -->
</div>  <!-- section_main // -->





</div> <!-- wrap // -->


</body>
</html>