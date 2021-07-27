package board.action;

import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDTO;
import board.CommentDTO;
import board.svc.CommentService;
import vo.ActionForward;

public class CommentWriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		BoardDTO boardDTO = null;
		CommentDTO commentDTO = null;
		
		// board_view.jsp에서 넘어온 값들
		int board_num = Integer.parseInt(request.getParameter("orders"));
		String board_sort = request.getParameter("sort");
		
		commentDTO = new CommentDTO();
		commentDTO.setWriter_id( request.getParameter("id"));		// 작성자
		commentDTO.setContent(request.getParameter("content"));		// 작성 내용
		commentDTO.setBoard_num(board_num);	// 게시판 번호
		commentDTO.setBoard_sort(board_sort);		// 게시판 종류
		
		// model 객체 호출
		CommentService commentWriteService = new CommentService();
		boolean isWriteSuccess = commentWriteService.registArticle(commentDTO);
		
	
		forward = new ActionForward();
		forward.setRedirect(true);
		// 보낼 것 : sort, 게시판 번호
		String encoded_sort = URLEncoder.encode(board_sort, "utf-8");
		forward.setPath("boardDetail.bo?orders="+board_num+"&sort="+encoded_sort);	 // Controller -> DetailAction으로 이동
		return forward;
	}

}
