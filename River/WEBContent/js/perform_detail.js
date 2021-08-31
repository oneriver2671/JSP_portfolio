
/* header 부분 */
$(document).ready(function(){
  $('.header_level2, #header_box').hide();

  $('#navbar').mouseover(function(){
    $('.header_level2, #header_box').fadeIn(500);
  });
  $('#navbar, #header_box').mouseleave(function(){
    $('.header_level2, #header_box').fadeOut(500);
  });
  
  

	/*---- 좋아요 기능 (비동기식 구현) ----*/
	// 좋아요 클릭 시, 좋아요버튼 색깔 바뀜
	$('.like_btn').click(function(){		  
		var _perform_num = $('#perform_num').val();			// hidden으로 가져옴.
		var _member_id = $('#member_id').val();		// hidden으로 가져옴.
		
		// 로그인한 회원만 누를 수 있게.	
		if(_member_id == 'null'){
			alert('로그인 후 누르실 수 있습니다.');
		} 
		else{
			// 안눌린 상태 -> 눌린 상태
			if($('.like_btn i').attr('class')=='far fa-thumbs-up'){		
					$('.like_btn i').attr('class', 'fas fa-thumbs-up');
					
					$.ajax({
						type: "post",
						async: true,
						url: "performLikeAdd.pe",				// 좋아요 증가 기능
						data: {perform_num: _perform_num, member_id: _member_id},
						dataType: "text",
						error : function(request, error){
							alert("ajax 연결 실패"); 
							alert("code:"+ request.status + "\n" + "message:"+request.responseText+"\n"+"error:"+error);
						}
					})
					
			} 
			// 눌린 상태 -> 좋아요 해제
			else{		
				$('.like_btn i').attr('class', 'far fa-thumbs-up');
				
				$.ajax({
					type: "post",
					async: true,
					url: "performLikeReduce.pe",			// 좋아요 감소 기능
					data: {perform_num: _perform_num, member_id: _member_id},
					dataType: "text",
					error : function(request, error){
						alert("ajax 연결 실패"); 
						alert("code:"+ request.status + "\n" + "message:"+request.responseText+"\n"+"error:"+error);
					}
				})
			}
		}
	});
  

});

function logout(){
	  alert('로그아웃 되었습니다.');
location.href="logout.jsp";
}

function idNull(){
	alert('로그인 후 이용하실 수 있습니다.');
}
