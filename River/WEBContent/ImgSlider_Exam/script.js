/* 이미지 슬라이더  오픈소스 */
$(window).load(function(){
  $('.flexslider').flexslider({
    animation: "slide",
    controlNav: "thumbnails",
    start: function(slider){
      $('body').removeClass('loading');
    }
  });
});