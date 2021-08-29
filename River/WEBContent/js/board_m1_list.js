/* jQuery */
$(document).ready(function(){
  $('.header_level2, #header_box').hide();

  $('#navbar').mouseover(function(){
    $('.header_level2, #header_box').fadeIn(500);
  });
  $('#navbar, #header_box').mouseleave(function(){
    $('.header_level2, #header_box').fadeOut(500);
  });

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

function loginCheck(id){
	var id;
	if(id == ""){		
		alert('로그인 후 작성할 수 있습니다.');
	} else{
		location.href='board_m1_write.jsp';
	}
	
}