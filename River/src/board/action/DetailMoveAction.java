package board.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDTO;
import board.CommentDTO;
import board.svc.CommentService;
import board.svc.DetailMoveService;
import board.svc.LikeNumService;
import vo.ActionForward;

public class DetailMoveAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		boolean isLike = false;
		
		// board_view.jsp 에서 쿼리스트링으로 넘어온 값들
		String sort = request.getParameter("sort");
		int orders = Integer.parseInt(request.getParameter("orders"));
		int temp = Integer.parseInt(request.getParameter("temp"));
		String member_id = request.getParameter("id");
		
		// 게시글 출력용 model 객체 생성
		DetailMoveService moveService = new DetailMoveService();
		int board_num = moveService.getNextArticleNum(sort, orders, temp);	// 이동할 게시물 번호
		BoardDTO article = moveService.getNextArticle(board_num);
		
		// 댓글 출력용 model 객체 생성
		CommentService commentService = new CommentService();
		ArrayList<CommentDTO> commentList = commentService.getComment(board_num);
		
		// 회원이 누른 좋아요 확인용 model 객체 생성
		if(!member_id.equals("null")) {		// board_view.jsp에서 "null"로 넘어옴
			LikeNumService likeNumService = new LikeNumService();
			isLike = likeNumService.getLikeNum(member_id, board_num);			
		}
		
	
		 // 이전글, 다음글 표시를 위한 작업
		int[] articleNum = moveService.checkArticleNum(sort);  
		int maxNum = articleNum[0];
		int minNum = articleNum[1];
		
		
		ActionForward forward = new ActionForward();
	   	request.setAttribute("article", article);
	 	request.setAttribute("maxNum", maxNum);
	   	request.setAttribute("minNum", minNum);
	 	request.setAttribute("comment", commentList);
		request.setAttribute("isLike", isLike);   // 게시물 좋아요 정보 (boolean 반환)
   		forward.setPath("../River_Board/board_view.jsp");
   		return forward;
	}

}
