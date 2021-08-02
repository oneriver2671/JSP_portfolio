/* 게시글, 댓글 삭제 */
function deleteArticle(){
	if(confirm("게시글을 삭제하시겠습니까?") == true){
		return true;
	} else{		// 취소 버튼
		return false;
	}
}
function deleteComment(){
	if(confirm("댓글을 삭제하시겠습니까?") == true){
		return true;
	} else{		// 취소 버튼
		return false;
	}
}


$(document).ready(function(){
	// 좋아요 클릭 시, 좋아요버튼 색깔 바뀜
	$('.post_btn_like').click(function(){		  
		var test = $('.post_btn_like i').attr('class');
		var _orders = $('#board_num').val();			// hidden으로 가져옴.
		var _member_id = $('#member_id').val();		// hidden으로 가져옴. 다른 방법이 있을까??
		
		// 로그인한 회원만 누를 수 있게.	
		if(_member_id == 'null'){
			alert('로그인 후 누르실 수 있습니다.');
		} 
		else{
			// 안눌린 상태 -> 눌린 상태
			if($('.post_btn_like i').attr('class')=='far fa-thumbs-up'){		
					$('.post_btn_like i').attr('class', 'fas fa-thumbs-up');
					
					$.ajax({
						type: "post",
						async: true,
						url: "boardLikeNum.bo?temp=0",	// temp==0 : like 증가
						data: {orders: _orders, member_id: _member_id},
						dataType: "text",
						error : function(request, error){
							alert("ajax 연결 실패"); 
							alert("code:"+ request.status + "\n" + "message:"+request.responseText+"\n"+"error:"+error);
						}
					})
					
			} 
			// 눌린 상태 -> 좋아요 해제
			else{		
				$('.post_btn_like i').attr('class', 'far fa-thumbs-up');
				
				$.ajax({
					type: "post",
					async: true,
					url: "boardLikeNum.bo?temp=1",	// temp==1 : like 감소
					data: {orders: _orders, member_id: _member_id},
					dataType: "text",
					error : function(request, error){
						alert("ajax 연결 실패"); 
						alert("code:"+ request.status + "\n" + "message:"+request.responseText+"\n"+"error:"+error);
					}
				})
			}
		}
	});
	
	/* 댓글 달기 클릭 시 */
	$('.post_btn_comment').click(function(){
		var _member_id = $('#member_id').val();  	// hidden으로 가져옴.
		
		if(_member_id == 'null'){
			alert('로그인 후 작성 가능합니다.');
		} else{
			$('#comment_write input').focus();
		}
	});
	
	
	/* 대댓글 기능 */
	$('.comment_write_new').hide();		// 기본 세팅.
	
	// 댓글 '답글달기' 클릭 시. (대댓글)
	$('.comment_reply_btn').click(function(){	
		$(this).parent().parent().children('.comment_write_new').show();
	
		
		if($(this).hasClass('comment_write_new')){
		$('.comment_write_new').hide();			
		}
	});
	
	// 대댓글 취소 클릭 시.
	$('.comment_new_cancel').click(function(){
		$('.comment_new_input').val('');		// textbox 초기화
		$(this).parent().hide();
	});
	

	/* 대댓글 작성 ajax */
	 $('.comment_new_action').click(function(){
		$('.comment_write_new').hide();
		var _board_num = $('#board_num').val();
		var _board_sort = $('#board_sort').val();
		var _member_id = $('#member_id').val();
		/* var _comment_re = $('.comment_new_input').val(); */
		var _comment_re = $(this).parent().children('.comment_new_input').val();
		var _comment_num = $(this).parent().children('.comment_num_hidden').val();
	
		$.ajax({
			type: "post",
			async: true,
			url: "boardCommentWrite.bo",
			data: {orders: _board_num, sort: _board_sort, id: _member_id, comment_re: _comment_re, comment_num: _comment_num},
			dataType: "text",
			error : function(request, error){
				alert("ajax 연결 실패"); 
				alert("code:"+ request.status + "\n" + "message:"+request.responseText+"\n"+"error:"+error);
			},
			success : function(){
				location.reload();		// 페이지 새로고침 없이 비동기식으로 해결하고 싶은데...
			}
		})
		
	}); 
	
	/* 댓글 수정 기능 */
	$('.comment_modify_form').hide();		// 기본 세팅.
	$('.comment_modify').click(function(){
		$(this).parent().children('.comment_modify_form').show();
	});
	
	$('.comment_modify_cancel').click(function(){
		$(this).parent().hide();
	});
	
	
	

});  // ------ jquery 끝 ------