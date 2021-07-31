
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

  $('.imgCover div').mouseout(function(){
    $(this).css({'z-index':'-1'});
  });


  /* ---- 이미지 슬라이더1 ---- */  
  $('.flexslider').flexslider({
    animation: "slide"
  });


  /* ---- 레슨 찾기, 연습실 찾기 ----  */

  $('#content_room_search').hide();
  $('.room_search').click(function(){
    $(this).css({'color':'whitesmoke', 'background-color':'#2a2a31'});
    $('.lesson_search').css({'color':'gray', 'background-color':'#41414c'});
    $('#slider').fadeOut(500);
    $('#content_room_search').fadeIn(500);
    $('.scrollButtons').css({'top':'170px'});
    $('.scrollButtons').hide();
    $('.scrollButtons').fadeIn(500);

  });
  $('.lesson_search').click(function(){
    $(this).css({'color':'whitesmoke', 'background-color':'#2a2a31'});
    $('.room_search').css({'color':'gray', 'background-color':'#41414c'});
    $('#slider').fadeIn(500);
    $('#content_room_search').fadeOut(500);
    $('.scrollButtons').css({'top':'230px'});
    $('.scrollButtons').hide();
    $('.scrollButtons').fadeIn(500);
  });

  /* '연습실 찾기' 클릭 시, 맨처음 '신촌'에 background 되어있게. */
  // $('ul.navigation li:first-child a').css({
  //   'background-color':'#2a2a31'
  // });
  // $('ul.navigation li:not(:first-child)').click(function(){
  //   $('ul.navigation li:first-child a').css({'background-color':'#41414c'});
  // });
  // $('ul.navigation li:first-child a').hover(function(){
  //   $(this).css({'background-color':'#373741'});
  // });
  // $('ul.navigation li:first-child a').click(function(){
  //   $(this).css({'background-color':'#2a2a31'});
  // });

});


/* 이미지 슬라이더1 */
// Can also be used with $(document).ready()
// $(window).load(function() {
//   $('.flexslider').flexslider({
//     animation: "slide"
//   });
// });


// 이걸 그냥 jsp 페이지에 옮기니까 그때야 되네?? why???
 function logout(){
    
  }

