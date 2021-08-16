/*
*
*/
$(document).ready(function(){
	/* header 부분 */
  $('.header_level2, #header_box').hide();

  $('#navbar').mouseover(function(){
    $('.header_level2, #header_box').fadeIn(500);
  });
  $('#navbar, #header_box').mouseleave(function(){
    $('.header_level2, #header_box').fadeOut(500);
  });
  
  /*----- 일정 분류 부분 ------*/
  
  $('#calendar_choice_btn_year').hide();		// 기본 세팅. (월간일정이 기본 세팅이라 숨겨줌)
  
  // '연간 일정' 클릭
  $('#cal_year').click(function(){
	  $(this).css({'color':'#CC0000', 'background-color':'whitesmoke'});
	  $('#cal_month').css({'color':'#3e3e3e', 'background-color':'#eeeeee'});
	  $('.month_choice').hide();
	  $('#calendar_choice').css({'height':'70px'});
	  $('#section_top').css({'height':'170px'});
	  $('#selected_month').hide();			// 값 자체를 사라지게 하려 했으나, 다시 '월간 일정' 클릭 시 번거로워져 hide() 쓰기로.
	  $('#calendar_choice_btn_month').hide();		// 월간일정용 검색하기 버튼
	  $('#calendar_choice_btn_year').show();		// 연간일정용 검색하기 버튼
  });
  // '월간 일정' 클릭
  $('#cal_month').click(function(){
	  $(this).css({'color':'#CC0000', 'background-color':'whitesmoke'});
	  $('#cal_year').css({'color':'#3e3e3e', 'background-color':'#eeeeee'});
	  $('.month_choice').show();
	  $('#calendar_choice').css({'height':'150px'});
	  $('#section_top').css({'height':'250px'});
	  $('#selected_month').show();
	  $('#calendar_choice_btn_year').hide();
	  $('#calendar_choice_btn_month').show();
  });
  
  
  // '연간일정'으로 검색 시.
	if($('#selected_month').text() == ""){
	  $('#cal_year').css({'color':'#CC0000', 'background-color':'whitesmoke'});
	  $('#cal_month').css({'color':'#3e3e3e', 'background-color':'#eeeeee'});
	  $('.month_choice').hide();
	  $('#calendar_choice').css({'height':'70px'});
	  $('#section_top').css({'height':'170px'});
	  $('#selected_month').hide();		
	  $('#calendar_choice_btn_month').hide();		// 월간일정용 검색하기 버튼
	  $('#calendar_choice_btn_year').show();		// 연간일정용 검색하기 버튼
	}
  
  
  // 연도 최초 세팅 (현재 날짜 기준 연도 가져오기)
  var year_now = $('#selected_year').text();		// Controller에서 넘어온 현재 연도.
  $('#year_choice').val(year_now);
  
  var month_now = $('#selected_month').text();	// Controller에서 넘어온 현재 월.
 
  $('.month_choice_list').each(function(){		// 반복문. 1~12월의 값을 가져오며 '현재 월'과 비교.
	  if($(this).val() == month_now){
		  $(this).css({'color':'whitesmoke', 'background-color':'#CC0000'});
	  }
  });
  
  
  // 연도 선택 시.
  $('#year_choice').change(function(){
	  var year_selected = $('#year_choice option:selected').val();
  	$('#selected_year').text(year_selected);
	  
  });
  
  // 월 선택 시.
  $('.month_choice_list').click(function(){
	  $('.month_choice_list').css({'color':'#3e3e3e', 'background-color':'#eeeeee'});
	  $(this).css({'color':'whitesmoke', 'background-color':'#CC0000'});
	  
	  var selected_month = $(this).val();
	  $('#selected_month').text(selected_month);			// html 태그 안의 text 값을 change.
  
  });
  
  // 월간일정 '검색하기' 버튼 클릭 시. (Controller로 이동)
  $('#calendar_choice_btn_month').click(function(){
	  var selected_year = $('#selected_year').text();    	// 이렇게 쓰면 html 태그 안에 있는 text를 가져옴.
	  var selected_month = $('#selected_month').text();
		var selected_location = $('#location_choice').val();
		location.href = "performListByDate.pe?year="+selected_year+"&month="+selected_month+"&location="+selected_location;
  });
  // 연간일정 '검색하기' 버튼 클릭 시. (Controller로 이동)
  $('#calendar_choice_btn_year').click(function(){
	  var selected_year = $('#selected_year').text();
		var selected_location = $('#location_choice').val();    
	  // var selected_month = $('#selected_month').text();
		location.href = "performListByDate.pe?year="+selected_year+"&month=null&location="+selected_location;			// month: Controller에서 기본값이 '현재 달'이라, 넘겨주긴 해야함.
  });
  
});

function logout(){
	  alert('로그아웃 되었습니다.');
location.href="logout.jsp";
}
