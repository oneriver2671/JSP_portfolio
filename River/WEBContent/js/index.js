
/* jQuery */
$(document).ready(function(){
  $('.header_level2, #header_box').hide();

  $('#navbar').mouseover(function(){
    $('.header_level2, #header_box').fadeIn(500);
  });
  $('#navbar, #header_box').mouseleave(function(){
    $('.header_level2, #header_box').fadeOut(500);
  });


  // 작은 사진들 위에 커서 뒀을 때. (이거 조금 개선 희망. 빠르게 움직이면 안사라질 때가 있음)
  $('.small_1').mouseover(function(){
    $('.imgCover_1').css({'z-index':'1'});
  });
  $('.small_2').mouseover(function(){
    $('.imgCover_2').css({'z-index':'1'});
  });
  $('.small_3').mouseover(function(){
    $('.imgCover_3').css({'z-index':'1'});
  });
  $('.small_4').mouseover(function(){
    $('.imgCover_4').css({'z-index':'1'});
  });
  $('.small_5').mouseover(function(){
    $('.imgCover_5').css({'z-index':'1'});
  });
  $('.small_6').mouseover(function(){
    $('.imgCover_6').css({'z-index':'1'});
  });

  $('.imgCover a').mouseout(function(){
    $(this).css({'z-index':'-1'});
  });


  /* ---- 이미지 슬라이더1 ---- */  
  $('.flexslider').flexslider({
    animation: "slide"
  });


});



// 이걸 그냥 jsp 페이지에 옮기니까 그때야 되네?? why???
 function logout(){
    
  }

