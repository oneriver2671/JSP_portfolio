<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>티켓예매</title>
<link rel="stylesheet" type="text/css" href="style/book_step2.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<script src="https://code.jquery.com/jquery-1.12.4.js"></script>
</head>

<script>
$(document).ready(function(){
	
	$('#L1_A1_1').click(function(){
		var test = $(this).val();
		alert(test);
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
	<div id="section_right_remainSeat">R석</div>
	<img src="images/ticketing/stit_seat_02.gif" id="section_right_img3">
	<table id="section_right_choiceSeat">
		<tr>
			<td>좌석등급</td>
			<td>좌석번호</td>
		</tr>
		<tr>
			<td></td>
			<td></td>
		</tr>
	</table>
	<img src="images/ticketing/btn_seat_confirm_on.gif" id="section_right_img4">
	<img src="images/ticketing/btn_seat_prev.gif" id="section_right_img5">
	<img src="images/ticketing/btn_seat_again.gif" id="section_right_img6">
</div>

<div id="section_main">
	<img src="images/ticketing/artCenter_IBK_seatAll.gif">
	
	
	<button class="seat_R" id="L1_A1_1" style="top: 230px; left: 268px;" value="1층 A블록 1열 1"></button>
	<div class="seat_R" id="L1_A1_2" style="top: 230px; left: 283px;"></div>
	<div class="seat_R" id="L1_B1_1" style="top: 230px; left: 330px;"></div>
	<div class="seat_R" id="L1_B1_2" style="top: 230px; left: 344px;"></div>
	<div class="seat_R" id="L1_B1_3" style="top: 230px; left: 359px;"></div>
	<div class="seat_R" id="L1_B1_4" style="top: 230px; left: 373px;"></div>
	<div class="seat_R" id="L1_B1_5" style="top: 230px; left: 388px;"></div>
	<div class="seat_R" id="L1_B1_6" style="top: 230px; left: 402px;"></div>
	<div class="seat_R" id="L1_B1_7" style="top: 230px; left: 417px;"></div>
	<div class="seat_R" id="L1_B1_8" style="top: 230px; left: 431px;"></div>
	<div class="seat_R" id="L1_B1_9" style="top: 230px; left: 446px;"></div>
	<div class="seat_R" id="L1_B1_10" style="top: 230px; left: 460px;"></div>
	<div class="seat_R" id="L1_B1_11" style="top: 230px; left: 475px;"></div>
	<div class="seat_R" id="L1_B1_12" style="top: 230px; left: 489px;"></div>
	<div class="seat_R" id="L1_B1_13" style="top: 230px; left: 504px;"></div>
	<div class="seat_R" id="L1_B1_14" style="top: 230px; left: 518px;"></div>
	<div class="seat_R" id="L1_B1_15" style="top: 230px; left: 533px;"></div>
	<div class="seat_R" id="L1_B1_16" style="top: 230px; left: 547px;"></div>
	<div class="seat_R" id="L1_C1_1" style="top: 230px; left: 594px;"></div>
	<div class="seat_R" id="L1_C1_2" style="top: 230px; left: 608px;"></div>
	
	<div class="seat_R" id="L1_A2_1" style="top: 245px; left: 254px;"></div>
	<div class="seat_R" id="L1_A2_2" style="top: 245px; left: 268px;"></div>
	<div class="seat_R" id="L1_A2_3" style="top: 245px; left: 283px;"></div>
	<div class="seat_R" id="L1_B2_1" style="top: 245px; left: 330px;"></div>
	<div class="seat_R" id="L1_B2_2" style="top: 245px; left: 344px;"></div>
	<div class="seat_R" id="L1_B2_3" style="top: 245px; left: 359px;"></div>
	<div class="seat_R" id="L1_B2_4" style="top: 245px; left: 373px;"></div>
	<div class="seat_R" id="L1_B2_5" style="top: 245px; left: 388px;"></div>
	<div class="seat_R" id="L1_B2_6" style="top: 245px; left: 402px;"></div>
	<div class="seat_R" id="L1_B2_7" style="top: 245px; left: 417px;"></div>
	<div class="seat_R" id="L1_B2_8" style="top: 245px; left: 431px;"></div>
	<div class="seat_R" id="L1_B2_9" style="top: 245px; left: 446px;"></div>
	<div class="seat_R" id="L1_B2_10" style="top: 245px; left: 460px;"></div>
	<div class="seat_R" id="L1_B2_11" style="top: 245px; left: 475px;"></div>
	<div class="seat_R" id="L1_B2_12" style="top: 245px; left: 489px;"></div>
	<div class="seat_R" id="L1_B2_13" style="top: 245px; left: 504px;"></div>
	<div class="seat_R" id="L1_B2_14" style="top: 245px; left: 518px;"></div>
	<div class="seat_R" id="L1_B2_15" style="top: 245px; left: 533px;"></div>
	<div class="seat_R" id="L1_B2_16" style="top: 245px; left: 547px;"></div>
	<div class="seat_R" id="L1_C2_1" style="top: 245px; left: 594px;"></div>
	<div class="seat_R" id="L1_C2_2" style="top: 245px; left: 608px;"></div>
	<div class="seat_R" id="L1_C2_3" style="top: 245px; left: 622px;"></div>
  
  <div class="seat_R" id="L1_A2_1" style="top: 259px; left: 254px;"></div>
	<div class="seat_R" id="L1_A2_2" style="top: 259px; left: 268px;"></div>
	<div class="seat_R" id="L1_A2_3" style="top: 259px; left: 283px;"></div> 
  <div class="seat_R" id="L1_B3_1" style="top: 259px; left: 330px;"></div>
	<div class="seat_R" id="L1_B3_2" style="top: 259px; left: 344px;"></div>
	<div class="seat_R" id="L1_B3_3" style="top: 259px; left: 359px;"></div>
	<div class="seat_R" id="L1_B3_4" style="top: 259px; left: 373px;"></div>
	<div class="seat_R" id="L1_B3_5" style="top: 259px; left: 388px;"></div>
	<div class="seat_R" id="L1_B3_6" style="top: 259px; left: 402px;"></div>
	<div class="seat_R" id="L1_B3_7" style="top: 259px; left: 417px;"></div>
	<div class="seat_R" id="L1_B3_8" style="top: 259px; left: 431px;"></div>
	<div class="seat_R" id="L1_B3_9" style="top: 259px; left: 446px;"></div>
	<div class="seat_R" id="L1_B3_10" style="top: 259px; left: 460px;"></div>
	<div class="seat_R" id="L1_B3_11" style="top: 259px; left: 475px;"></div>
	<div class="seat_R" id="L1_B3_12" style="top: 259px; left: 489px;"></div>
	<div class="seat_R" id="L1_B3_13" style="top: 259px; left: 504px;"></div>
	<div class="seat_R" id="L1_B3_14" style="top: 259px; left: 518px;"></div>
	<div class="seat_R" id="L1_B3_15" style="top: 259px; left: 533px;"></div>
	<div class="seat_R" id="L1_B3_16" style="top: 259px; left: 547px;"></div>
	<div class="seat_R" id="L1_C3_1" style="top: 259px; left: 594px;"></div>
	<div class="seat_R" id="L1_C3_2" style="top: 259px; left: 608px;"></div>                           
	<div class="seat_R" id="L1_C3_3" style="top: 259px; left: 622px;"></div>                           

	<div class="seat_R" id="L1_A4_1" style="top: 273px; left: 254px;"></div>
	<div class="seat_R" id="L1_A4_2" style="top: 273px; left: 268px;"></div>
	<div class="seat_R" id="L1_A4_3" style="top: 273px; left: 283px;"></div> 
  <div class="seat_R" id="L1_B4_1" style="top: 273px; left: 330px;"></div>
	<div class="seat_R" id="L1_B4_2" style="top: 273px; left: 344px;"></div>
	<div class="seat_R" id="L1_B4_3" style="top: 273px; left: 359px;"></div>
	<div class="seat_R" id="L1_B4_4" style="top: 273px; left: 373px;"></div>
	<div class="seat_R" id="L1_B4_5" style="top: 273px; left: 388px;"></div>
	<div class="seat_R" id="L1_B4_6" style="top: 273px; left: 402px;"></div>
	<div class="seat_R" id="L1_B4_7" style="top: 273px; left: 417px;"></div>
	<div class="seat_R" id="L1_B4_8" style="top: 273px; left: 431px;"></div>
	<div class="seat_R" id="L1_B4_9" style="top: 273px; left: 446px;"></div>
	<div class="seat_R" id="L1_B4_10" style="top: 273px; left: 460px;"></div>
	<div class="seat_R" id="L1_B4_11" style="top: 273px; left: 475px;"></div>
	<div class="seat_R" id="L1_B4_12" style="top: 273px; left: 489px;"></div>
	<div class="seat_R" id="L1_B4_13" style="top: 273px; left: 504px;"></div>
	<div class="seat_R" id="L1_B4_14" style="top: 273px; left: 518px;"></div>
	<div class="seat_R" id="L1_B4_15" style="top: 273px; left: 533px;"></div>
	<div class="seat_R" id="L1_B4_16" style="top: 273px; left: 547px;"></div> 
	<div class="seat_R" id="L1_C4_1" style="top: 273px; left: 594px;"></div>
	<div class="seat_R" id="L1_C4_2" style="top: 273px; left: 608px;"></div>                           
	<div class="seat_R" id="L1_C4_3" style="top: 273px; left: 622px;"></div>   
	
	<div class="seat_R" id="L1_A5_1" style="top: 288px; left: 254px;"></div>
	<div class="seat_R" id="L1_A5_2" style="top: 288px; left: 268px;"></div>
	<div class="seat_R" id="L1_A5_3" style="top: 288px; left: 283px;"></div> 
	<div class="seat_R" id="L1_B5_1" style="top: 288px; left: 330px;"></div>
	<div class="seat_R" id="L1_B5_2" style="top: 288px; left: 344px;"></div>
	<div class="seat_R" id="L1_B5_3" style="top: 288px; left: 359px;"></div>
	<div class="seat_R" id="L1_B5_4" style="top: 288px; left: 373px;"></div>
	<div class="seat_R" id="L1_B5_5" style="top: 288px; left: 388px;"></div>
	<div class="seat_R" id="L1_B5_6" style="top: 288px; left: 402px;"></div>
	<div class="seat_R" id="L1_B5_7" style="top: 288px; left: 417px;"></div>
	<div class="seat_R" id="L1_B5_8" style="top: 288px; left: 431px;"></div>
	<div class="seat_R" id="L1_B5_9" style="top: 288px; left: 446px;"></div>
	<div class="seat_R" id="L1_B5_10" style="top: 288px; left: 460px;"></div>
	<div class="seat_R" id="L1_B5_11" style="top: 288px; left: 475px;"></div>
	<div class="seat_R" id="L1_B5_12" style="top: 288px; left: 489px;"></div>
	<div class="seat_R" id="L1_B5_13" style="top: 288px; left: 504px;"></div>
	<div class="seat_R" id="L1_B5_14" style="top: 288px; left: 518px;"></div>
	<div class="seat_R" id="L1_B5_15" style="top: 288px; left: 533px;"></div>
	<div class="seat_R" id="L1_B5_16" style="top: 288px; left: 547px;"></div>
	<div class="seat_R" id="L1_C5_1" style="top: 288px; left: 594px;"></div>
	<div class="seat_R" id="L1_C5_2" style="top: 288px; left: 608px;"></div>                           
	<div class="seat_R" id="L1_C5_3" style="top: 288px; left: 622px;"></div>    

	<div class="seat_R" id="L1_A6_1" style="top: 302px; left: 254px;"></div>
	<div class="seat_R" id="L1_A6_2" style="top: 302px; left: 268px;"></div>
	<div class="seat_R" id="L1_A6_3" style="top: 302px; left: 283px;"></div> 
	<div class="seat_R" id="L1_B6_1" style="top: 302px; left: 330px;"></div>
	<div class="seat_R" id="L1_B6_2" style="top: 302px; left: 344px;"></div>
	<div class="seat_R" id="L1_B6_3" style="top: 302px; left: 359px;"></div>
	<div class="seat_R" id="L1_B6_4" style="top: 302px; left: 373px;"></div>
	<div class="seat_R" id="L1_B6_5" style="top: 302px; left: 388px;"></div>
	<div class="seat_R" id="L1_B6_6" style="top: 302px; left: 402px;"></div>
	<div class="seat_R" id="L1_B6_7" style="top: 302px; left: 417px;"></div>
	<div class="seat_R" id="L1_B6_8" style="top: 302px; left: 431px;"></div>
	<div class="seat_R" id="L1_B6_9" style="top: 302px; left: 446px;"></div>
	<div class="seat_R" id="L1_B6_10" style="top: 302px; left: 460px;"></div>
	<div class="seat_R" id="L1_B6_11" style="top: 302px; left: 475px;"></div>
	<div class="seat_R" id="L1_B6_12" style="top: 302px; left: 489px;"></div>
	<div class="seat_R" id="L1_B6_13" style="top: 302px; left: 504px;"></div>
	<div class="seat_R" id="L1_B6_14" style="top: 302px; left: 518px;"></div>
	<div class="seat_R" id="L1_B6_15" style="top: 302px; left: 533px;"></div>
	<div class="seat_R" id="L1_B6_16" style="top: 302px; left: 547px;"></div> 
	<div class="seat_R" id="L1_C6_1" style="top: 302px; left: 594px;"></div>
	<div class="seat_R" id="L1_C6_2" style="top: 302px; left: 608px;"></div>                           
	<div class="seat_R" id="L1_C6_3" style="top: 302px; left: 622px;"></div>   
	
	<div class="seat_R" id="L1_A7_1" style="top: 316px; left: 254px;"></div>
	<div class="seat_R" id="L1_A7_2" style="top: 316px; left: 268px;"></div>
	<div class="seat_R" id="L1_A7_3" style="top: 316px; left: 283px;"></div> 
	<div class="seat_R" id="L1_B7_1" style="top: 316px; left: 330px;"></div>
	<div class="seat_R" id="L1_B7_2" style="top: 316px; left: 344px;"></div>
	<div class="seat_R" id="L1_B7_3" style="top: 316px; left: 359px;"></div>
	<div class="seat_R" id="L1_B7_4" style="top: 316px; left: 373px;"></div>
	<div class="seat_R" id="L1_B7_5" style="top: 316px; left: 388px;"></div>
	<div class="seat_R" id="L1_B7_6" style="top: 316px; left: 402px;"></div>
	<div class="seat_R" id="L1_B7_7" style="top: 316px; left: 417px;"></div>
	<div class="seat_R" id="L1_B7_8" style="top: 316px; left: 431px;"></div>
	<div class="seat_R" id="L1_B7_9" style="top: 316px; left: 446px;"></div>
	<div class="seat_R" id="L1_B7_10" style="top: 316px; left: 460px;"></div>
	<div class="seat_R" id="L1_B7_11" style="top: 316px; left: 475px;"></div>
	<div class="seat_R" id="L1_B7_12" style="top: 316px; left: 489px;"></div>
	<div class="seat_R" id="L1_B7_13" style="top: 316px; left: 504px;"></div>
	<div class="seat_R" id="L1_B7_14" style="top: 316px; left: 518px;"></div>
	<div class="seat_R" id="L1_B7_15" style="top: 316px; left: 533px;"></div>
	<div class="seat_R" id="L1_B7_16" style="top: 316px; left: 547px;"></div> 
	<div class="seat_R" id="L1_C7_1" style="top: 316px; left: 594px;"></div>
	<div class="seat_R" id="L1_C7_2" style="top: 316px; left: 608px;"></div>                           
	<div class="seat_R" id="L1_C7_3" style="top: 316px; left: 622px;"></div>   
	
	<div class="seat_R" id="L1_A8_1" style="top: 330px; left: 254px;"></div>
	<div class="seat_R" id="L1_A8_2" style="top: 330px; left: 268px;"></div>
	<div class="seat_R" id="L1_A8_3" style="top: 330px; left: 283px;"></div> 
	<div class="seat_R" id="L1_B8_1" style="top: 330px; left: 330px;"></div>
	<div class="seat_R" id="L1_B8_2" style="top: 330px; left: 344px;"></div>
	<div class="seat_R" id="L1_B8_3" style="top: 330px; left: 359px;"></div>
	<div class="seat_R" id="L1_B8_4" style="top: 330px; left: 373px;"></div>
	<div class="seat_R" id="L1_B8_5" style="top: 330px; left: 388px;"></div>
	<div class="seat_R" id="L1_B8_6" style="top: 330px; left: 402px;"></div>
	<div class="seat_R" id="L1_B8_7" style="top: 330px; left: 417px;"></div>
	<div class="seat_R" id="L1_B8_8" style="top: 330px; left: 431px;"></div>
	<div class="seat_R" id="L1_B8_9" style="top: 330px; left: 446px;"></div>
	<div class="seat_R" id="L1_B8_10" style="top: 330px; left: 460px;"></div>
	<div class="seat_R" id="L1_B8_11" style="top: 330px; left: 475px;"></div>
	<div class="seat_R" id="L1_B8_12" style="top: 330px; left: 489px;"></div>
	<div class="seat_R" id="L1_B8_13" style="top: 330px; left: 504px;"></div>
	<div class="seat_R" id="L1_B8_14" style="top: 330px; left: 518px;"></div>
	<div class="seat_R" id="L1_B8_15" style="top: 330px; left: 533px;"></div>
	<div class="seat_R" id="L1_B8_16" style="top: 330px; left: 547px;"></div>
	<div class="seat_R" id="L1_C8_1" style="top: 330px; left: 594px;"></div>
	<div class="seat_R" id="L1_C8_2" style="top: 330px; left: 608px;"></div>                           
	<div class="seat_R" id="L1_C8_3" style="top: 330px; left: 622px;"></div>   
	
	<div class="seat_R" id="L1_A9_1" style="top: 344px; left: 254px;"></div>
	<div class="seat_R" id="L1_A9_2" style="top: 344px; left: 268px;"></div>
	<div class="seat_R" id="L1_A9_3" style="top: 344px; left: 283px;"></div> 
	<div class="seat_R" id="L1_B9_1" style="top: 344px; left: 330px;"></div>
	<div class="seat_R" id="L1_B9_2" style="top: 344px; left: 344px;"></div>
	<div class="seat_R" id="L1_B9_3" style="top: 344px; left: 359px;"></div>
	<div class="seat_R" id="L1_B9_4" style="top: 344px; left: 373px;"></div>
	<div class="seat_R" id="L1_B9_5" style="top: 344px; left: 388px;"></div>
	<div class="seat_R" id="L1_B9_6" style="top: 344px; left: 402px;"></div>
	<div class="seat_R" id="L1_B9_7" style="top: 344px; left: 417px;"></div>
	<div class="seat_R" id="L1_B9_8" style="top: 344px; left: 431px;"></div>
	<div class="seat_R" id="L1_B9_9" style="top: 344px; left: 446px;"></div>
	<div class="seat_R" id="L1_B9_10" style="top: 344px; left: 460px;"></div>
	<div class="seat_R" id="L1_B9_11" style="top: 344px; left: 475px;"></div>
	<div class="seat_R" id="L1_B9_12" style="top: 344px; left: 489px;"></div>
	<div class="seat_R" id="L1_B9_13" style="top: 344px; left: 504px;"></div>
	<div class="seat_R" id="L1_B9_14" style="top: 344px; left: 518px;"></div>
	<div class="seat_R" id="L1_B9_15" style="top: 344px; left: 533px;"></div>
	<div class="seat_R" id="L1_B9_16" style="top: 344px; left: 547px;"></div>
	<div class="seat_R" id="L1_C9_1" style="top: 344px; left: 594px;"></div>
	<div class="seat_R" id="L1_C9_2" style="top: 344px; left: 608px;"></div>                           
	<div class="seat_R" id="L1_C9_3" style="top: 344px; left: 622px;"></div>   

	<div class="seat_R" id="L1_A10_1" style="top: 359px; left: 254px;"></div>
	<div class="seat_R" id="L1_A10_2" style="top: 359px; left: 268px;"></div>
	<div class="seat_R" id="L1_A10_3" style="top: 359px; left: 283px;"></div> 
	<div class="seat_R" id="L1_B10_1" style="top: 359px; left: 330px;"></div>
	<div class="seat_R" id="L1_B10_2" style="top: 359px; left: 344px;"></div>
	<div class="seat_R" id="L1_B10_3" style="top: 359px; left: 359px;"></div>
	<div class="seat_R" id="L1_B10_4" style="top: 359px; left: 373px;"></div>
	<div class="seat_R" id="L1_B10_5" style="top: 359px; left: 388px;"></div>
	<div class="seat_R" id="L1_B10_6" style="top: 359px; left: 402px;"></div>
	<div class="seat_R" id="L1_B10_7" style="top: 359px; left: 417px;"></div>
	<div class="seat_R" id="L1_B10_8" style="top: 359px; left: 431px;"></div>
	<div class="seat_R" id="L1_B10_9" style="top: 359px; left: 446px;"></div>
	<div class="seat_R" id="L1_B10_10" style="top: 359px; left: 460px;"></div>
	<div class="seat_R" id="L1_B10_11" style="top: 359px; left: 475px;"></div>
	<div class="seat_R" id="L1_B10_12" style="top: 359px; left: 489px;"></div>
	<div class="seat_R" id="L1_B10_13" style="top: 359px; left: 504px;"></div>
	<div class="seat_R" id="L1_B10_14" style="top: 359px; left: 518px;"></div>
	<div class="seat_R" id="L1_B10_15" style="top: 359px; left: 533px;"></div>
	<div class="seat_R" id="L1_B10_16" style="top: 359px; left: 547px;"></div>	
	<div class="seat_R" id="L1_C10_1" style="top: 359px; left: 594px;"></div>
	<div class="seat_R" id="L1_C10_2" style="top: 359px; left: 608px;"></div>                           
	<div class="seat_R" id="L1_C10_3" style="top: 359px; left: 622px;"></div>   

	<div class="seat_R" id="L1_A11_1" style="top: 373px; left: 254px;"></div>
	<div class="seat_R" id="L1_A11_2" style="top: 373px; left: 268px;"></div>
	<div class="seat_R" id="L1_A11_3" style="top: 373px; left: 283px;"></div> 
	<div class="seat_R" id="L1_B11_1" style="top: 373px; left: 330px;"></div>
	<div class="seat_R" id="L1_B11_2" style="top: 373px; left: 344px;"></div>
	<div class="seat_R" id="L1_B11_3" style="top: 373px; left: 359px;"></div>
	<div class="seat_R" id="L1_B11_4" style="top: 373px; left: 373px;"></div>
	<div class="seat_R" id="L1_B11_5" style="top: 373px; left: 388px;"></div>
	<div class="seat_R" id="L1_B11_6" style="top: 373px; left: 402px;"></div>
	<div class="seat_R" id="L1_B11_7" style="top: 373px; left: 417px;"></div>
	<div class="seat_R" id="L1_B11_8" style="top: 373px; left: 431px;"></div>
	<div class="seat_R" id="L1_B11_9" style="top: 373px; left: 446px;"></div>
	<div class="seat_R" id="L1_B11_10" style="top: 373px; left: 460px;"></div>
	<div class="seat_R" id="L1_B11_11" style="top: 373px; left: 475px;"></div>
	<div class="seat_R" id="L1_B11_12" style="top: 373px; left: 489px;"></div>
	<div class="seat_R" id="L1_B11_13" style="top: 373px; left: 504px;"></div>
	<div class="seat_R" id="L1_B11_14" style="top: 373px; left: 518px;"></div>
	<div class="seat_R" id="L1_B11_15" style="top: 373px; left: 533px;"></div>
	<div class="seat_R" id="L1_B11_16" style="top: 373px; left: 547px;"></div>
	<div class="seat_R" id="L1_C11_1" style="top: 373px; left: 594px;"></div>
	<div class="seat_R" id="L1_C11_2" style="top: 373px; left: 608px;"></div>                           
	<div class="seat_R" id="L1_C11_3" style="top: 373px; left: 622px;"></div>   
	
	<div class="seat_R" id="L1_A12_1" style="top: 387px; left: 254px;"></div>
	<div class="seat_R" id="L1_A12_2" style="top: 387px; left: 268px;"></div>
	<div class="seat_R" id="L1_A12_3" style="top: 387px; left: 283px;"></div> 
	<div class="seat_R" id="L1_B12_1" style="top: 387px; left: 330px;"></div>
	<div class="seat_R" id="L1_B12_2" style="top: 387px; left: 344px;"></div>
	<div class="seat_R" id="L1_B12_3" style="top: 387px; left: 359px;"></div>
	<div class="seat_R" id="L1_B12_4" style="top: 387px; left: 373px;"></div>
	<div class="seat_R" id="L1_B12_5" style="top: 387px; left: 388px;"></div>
	<div class="seat_R" id="L1_B12_6" style="top: 387px; left: 402px;"></div>
	<div class="seat_R" id="L1_B12_7" style="top: 387px; left: 417px;"></div>
	<div class="seat_R" id="L1_B12_8" style="top: 387px; left: 431px;"></div>
	<div class="seat_R" id="L1_B12_9" style="top: 387px; left: 446px;"></div>
	<div class="seat_R" id="L1_B12_10" style="top: 387px; left: 460px;"></div>
	<div class="seat_R" id="L1_B12_11" style="top: 387px; left: 475px;"></div>
	<div class="seat_R" id="L1_B12_12" style="top: 387px; left: 489px;"></div>
	<div class="seat_R" id="L1_B12_13" style="top: 387px; left: 504px;"></div>
	<div class="seat_R" id="L1_B12_14" style="top: 387px; left: 518px;"></div>
	<div class="seat_R" id="L1_B12_15" style="top: 387px; left: 533px;"></div>
	<div class="seat_R" id="L1_B12_16" style="top: 387px; left: 547px;"></div>
	<div class="seat_R" id="L1_C12_1" style="top: 387px; left: 594px;"></div>
	<div class="seat_R" id="L1_C12_2" style="top: 387px; left: 608px;"></div>                           
	<div class="seat_R" id="L1_C12_3" style="top: 387px; left: 622px;"></div>   	
	
	<div class="seat_R" id="L1_A13_1" style="top: 402px; left: 254px;"></div>
	<div class="seat_R" id="L1_A13_2" style="top: 402px; left: 268px;"></div>
	<div class="seat_R" id="L1_A13_3" style="top: 402px; left: 283px;"></div> 
	<div class="seat_R" id="L1_B13_1" style="top: 402px; left: 330px;"></div>
	<div class="seat_R" id="L1_B13_2" style="top: 402px; left: 344px;"></div>
	<div class="seat_R" id="L1_B13_3" style="top: 402px; left: 359px;"></div>
	<div class="seat_R" id="L1_B13_4" style="top: 402px; left: 373px;"></div>
	<div class="seat_R" id="L1_B13_5" style="top: 402px; left: 388px;"></div>
	<div class="seat_R" id="L1_B13_6" style="top: 402px; left: 402px;"></div>
	<div class="seat_R" id="L1_B13_7" style="top: 402px; left: 417px;"></div>
	<div class="seat_R" id="L1_B13_8" style="top: 402px; left: 431px;"></div>
	<div class="seat_R" id="L1_B13_9" style="top: 402px; left: 446px;"></div>
	<div class="seat_R" id="L1_B13_10" style="top: 402px; left: 460px;"></div>
	<div class="seat_R" id="L1_B13_11" style="top: 402px; left: 475px;"></div>
	<div class="seat_R" id="L1_B13_12" style="top: 402px; left: 489px;"></div>
	<div class="seat_R" id="L1_B13_13" style="top: 402px; left: 504px;"></div>
	<div class="seat_R" id="L1_B13_14" style="top: 402px; left: 518px;"></div>
	<div class="seat_R" id="L1_B13_15" style="top: 402px; left: 533px;"></div>
	<div class="seat_R" id="L1_B13_16" style="top: 402px; left: 547px;"></div>
	<div class="seat_R" id="L1_C13_1" style="top: 402px; left: 594px;"></div>
	<div class="seat_R" id="L1_C13_2" style="top: 402px; left: 608px;"></div>                           
	<div class="seat_R" id="L1_C13_3" style="top: 402px; left: 622px;"></div>   	
	
	<div class="seat_R" id="L1_A14_1" style="top: 416px; left: 254px;"></div>
	<div class="seat_R" id="L1_A14_2" style="top: 416px; left: 268px;"></div>
	<div class="seat_R" id="L1_A14_3" style="top: 416px; left: 283px;"></div> 
	<div class="seat_R" id="L1_B14_1" style="top: 416px; left: 330px;"></div>
	<div class="seat_R" id="L1_B14_2" style="top: 416px; left: 344px;"></div>
	<div class="seat_R" id="L1_B14_3" style="top: 416px; left: 359px;"></div>
	<div class="seat_R" id="L1_B14_4" style="top: 416px; left: 373px;"></div>
	<div class="seat_R" id="L1_B14_5" style="top: 416px; left: 388px;"></div>
	<div class="seat_R" id="L1_B14_6" style="top: 416px; left: 402px;"></div>
	<div class="seat_R" id="L1_B14_7" style="top: 416px; left: 417px;"></div>
	<div class="seat_R" id="L1_B14_8" style="top: 416px; left: 431px;"></div>
	<div class="seat_R" id="L1_B14_9" style="top: 416px; left: 446px;"></div>
	<div class="seat_R" id="L1_B14_10" style="top: 416px; left: 460px;"></div>
	<div class="seat_R" id="L1_B14_11" style="top: 416px; left: 475px;"></div>
	<div class="seat_R" id="L1_B14_12" style="top: 416px; left: 489px;"></div>
	<div class="seat_R" id="L1_B14_13" style="top: 416px; left: 504px;"></div>
	<div class="seat_R" id="L1_B14_14" style="top: 416px; left: 518px;"></div>
	<div class="seat_R" id="L1_B14_15" style="top: 416px; left: 533px;"></div>
	<div class="seat_R" id="L1_B14_16" style="top: 416px; left: 547px;"></div>	
	<div class="seat_R" id="L1_C14_1" style="top: 416px; left: 594px;"></div>
	<div class="seat_R" id="L1_C14_2" style="top: 416px; left: 608px;"></div>                           
	<div class="seat_R" id="L1_C14_3" style="top: 416px; left: 622px;"></div>   

	<div class="seat_R" id="L1_A15_1" style="top: 430px; left: 254px;"></div>
	<div class="seat_R" id="L1_A15_2" style="top: 430px; left: 268px;"></div>
	<div class="seat_R" id="L1_A15_3" style="top: 430px; left: 283px;"></div> 	
	<div class="seat_R" id="L1_B15_1" style="top: 430px; left: 330px;"></div>
	<div class="seat_R" id="L1_B15_2" style="top: 430px; left: 344px;"></div>
	<div class="seat_R" id="L1_B15_3" style="top: 430px; left: 359px;"></div>
	<div class="seat_R" id="L1_B15_4" style="top: 430px; left: 373px;"></div>
	<div class="seat_R" id="L1_B15_5" style="top: 430px; left: 388px;"></div>
	<div class="seat_R" id="L1_B15_6" style="top: 430px; left: 402px;"></div>
	<div class="seat_R" id="L1_B15_7" style="top: 430px; left: 417px;"></div>
	<div class="seat_R" id="L1_B15_8" style="top: 430px; left: 431px;"></div>
	<div class="seat_R" id="L1_B15_9" style="top: 430px; left: 446px;"></div>
	<div class="seat_R" id="L1_B15_10" style="top: 430px; left: 460px;"></div>
	<div class="seat_R" id="L1_B15_11" style="top: 430px; left: 475px;"></div>
	<div class="seat_R" id="L1_B15_12" style="top: 430px; left: 489px;"></div>
	<div class="seat_R" id="L1_B15_13" style="top: 430px; left: 504px;"></div>
	<div class="seat_R" id="L1_B15_14" style="top: 430px; left: 518px;"></div>
	<div class="seat_R" id="L1_B15_15" style="top: 430px; left: 533px;"></div>
	<div class="seat_R" id="L1_B15_16" style="top: 430px; left: 547px;"></div>
	<div class="seat_R" id="L1_C15_1" style="top: 430px; left: 594px;"></div>
	<div class="seat_R" id="L1_C15_2" style="top: 430px; left: 608px;"></div>                           
	<div class="seat_R" id="L1_C15_3" style="top: 430px; left: 622px;"></div>   
	
	<div class="seat_R" id="L1_A16_1" style="top: 445px; left: 254px;"></div>
	<div class="seat_R" id="L1_A16_2" style="top: 445px; left: 268px;"></div>
	<div class="seat_R" id="L1_A16_3" style="top: 445px; left: 283px;"></div> 
	<div class="seat_R" id="L1_B16_1" style="top: 445px; left: 330px;"></div>
	<div class="seat_R" id="L1_B16_2" style="top: 445px; left: 344px;"></div>
	<div class="seat_R" id="L1_B16_3" style="top: 445px; left: 359px;"></div>
	<div class="seat_R" id="L1_B16_4" style="top: 445px; left: 373px;"></div>
	<div class="seat_R" id="L1_B16_5" style="top: 445px; left: 388px;"></div>
	<div class="seat_R" id="L1_B16_6" style="top: 445px; left: 402px;"></div>
	<div class="seat_R" id="L1_B16_7" style="top: 445px; left: 417px;"></div>
	<div class="seat_R" id="L1_B16_8" style="top: 445px; left: 431px;"></div>
	<div class="seat_R" id="L1_B16_9" style="top: 445px; left: 446px;"></div>
	<div class="seat_R" id="L1_B16_10" style="top: 445px; left: 460px;"></div>
	<div class="seat_R" id="L1_B16_11" style="top: 445px; left: 475px;"></div>
	<div class="seat_R" id="L1_B16_12" style="top: 445px; left: 489px;"></div>
	<div class="seat_R" id="L1_B16_13" style="top: 445px; left: 504px;"></div>
	<div class="seat_R" id="L1_B16_14" style="top: 445px; left: 518px;"></div>
	<div class="seat_R" id="L1_B16_15" style="top: 445px; left: 533px;"></div>
	<div class="seat_R" id="L1_B16_16" style="top: 445px; left: 547px;"></div>
	<div class="seat_R" id="L1_C16_1" style="top: 445px; left: 594px;"></div>
	<div class="seat_R" id="L1_C16_2" style="top: 445px; left: 608px;"></div>                           
	<div class="seat_R" id="L1_C16_3" style="top: 445px; left: 622px;"></div>   
	
	<div class="seat_R" id="L1_B17_1" style="top: 459px; left: 330px;"></div>
	<div class="seat_R" id="L1_B17_2" style="top: 459px; left: 344px;"></div>
	<div class="seat_R" id="L1_B17_3" style="top: 459px; left: 359px;"></div>
	<div class="seat_R" id="L1_B17_4" style="top: 459px; left: 373px;"></div>
	<div class="seat_R" id="L1_B17_5" style="top: 459px; left: 388px;"></div>
	<div class="seat_R" id="L1_B17_6" style="top: 459px; left: 402px;"></div>
	<div class="seat_R" id="L1_B17_7" style="top: 459px; left: 417px;"></div>
	<div class="seat_R" id="L1_B17_8" style="top: 459px; left: 431px;"></div>
	<div class="seat_R" id="L1_B17_9" style="top: 459px; left: 446px;"></div>
	<div class="seat_R" id="L1_B17_10" style="top: 459px; left: 460px;"></div>
	<div class="seat_R" id="L1_B17_11" style="top: 459px; left: 475px;"></div>
	<div class="seat_R" id="L1_B17_12" style="top: 459px; left: 489px;"></div>
	<div class="seat_R" id="L1_B17_13" style="top: 459px; left: 504px;"></div>
	<div class="seat_R" id="L1_B17_14" style="top: 459px; left: 518px;"></div>
	<div class="seat_R" id="L1_B17_15" style="top: 459px; left: 533px;"></div>
	<div class="seat_R" id="L1_B17_16" style="top: 459px; left: 547px;"></div>			

</div>





</div> <!-- wrap // -->


</body>
</html>