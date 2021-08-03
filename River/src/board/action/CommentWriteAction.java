package board.action;

import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.CommentDTO;
import board.svc.CommentService;
import vo.ActionForward;

public class CommentWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		CommentDTO commentDTO = null;
		
		// board_view.jsp에서 넘어온 값들
		int board_num = Integer.parseInt(request.getParameter("orders"));
		String board_sort = request.getParameter("sort");   // 이거 detailAction에 안넘겨주면, 이전글/다음글 기능 문제생김.
		String member_id = request.getParameter("id");		// 현재 로그인한 회원
		String first_comment = request.getParameter("comment_write");		// 댓글 submit 클릭
		String second_comment = request.getParameter("comment_re");			// 대댓글 값 (ajax로 들어옴)
		String commentNum_temp = request.getParameter("comment_num");		// 부모 댓글의 번호 ★
		int comment_num = 0;
		if(commentNum_temp != null) {
			comment_num = Integer.parseInt(commentNum_temp);
			
		}
		
		
		// 댓글 입력
		if(first_comment != null) {
			commentDTO = new CommentDTO();
			commentDTO.setWriter_id(member_id);		   	 // 작성자
			commentDTO.setContent(request.getParameter("content"));		// 작성 내용
			commentDTO.setBoard_num(board_num);			 // 게시판 번호
			commentDTO.setBoard_sort(board_sort);		 // 게시판 종류
			commentDTO.setRef_comment_num(0);		// 어차피 db
			commentDTO.setRef_comment_lev(0);
			
			// model 객체 호출
			CommentService commentWriteService = new CommentService();
			commentWriteService.registArticle(commentDTO);
			
			forward = new ActionForward();
			forward.setRedirect(true);
			// 보낼 것 : sort, 게시판 번호
			String encoded_sort = URLEncoder.encode(board_sort, "utf-8");
			forward.setPath("boardDetail.bo?orders="+board_num+"&sort="+encoded_sort+"&id="+member_id);	 // Controller -> DetailAction으로 이동
		}
		
		// 대댓글 입력
		if(second_comment != null) {
			commentDTO = new CommentDTO();
			commentDTO.setWriter_id(member_id);		  	// 작성자
			commentDTO.setContent(second_comment);		// 작성 내용
			commentDTO.setBoard_num(board_num);			// 게시판 번호
			commentDTO.setBoard_sort(board_sort);		// 게시판 종류
			commentDTO.setRef_comment_num(comment_num);      // 부모 댓글 번호 ★
			commentDTO.setRef_comment_lev(1);  		    // 일단 대댓글은 1회만 가능하게.  
			
			CommentService commentWriteService = new CommentService();
			commentWriteService.registArticle(commentDTO);
			// 비동기식 처리라 페이지 이동 X
		}
		
		
		return forward;
	}

}
