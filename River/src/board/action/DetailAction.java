package board.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDTO;
import board.CommentDTO;
import board.svc.CommentService;
import board.svc.DetailService;
import board.svc.LikeNumService;
import vo.ActionForward;

public class DetailAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		boolean isLike = false;		// 게시물 좋아요 눌렀던 회원인지 확인용
		
		// board_list.jsp 에서 넘어온 값들.
		int board_num = Integer.parseInt(request.getParameter("orders"));
		String sort = request.getParameter("sort");
		String page = request.getParameter("page");		// 이거 굳이 필요함? 어떻게 쓰이는지 추적해보자.
		String member_id = request.getParameter("id");		// 현재 로그인한 회원 정보
		
		// 게시글 출력용 model 객체 생성
		DetailService detailService = new DetailService();
		BoardDTO article = detailService.getArticle(board_num);
		
		// 댓글 출력용 model 객체 생성
		CommentService commentService = new CommentService();
		ArrayList<CommentDTO> commentList = commentService.getComment(board_num);
		
		// 회원이 누른 좋아요 확인용 model 객체 생성
		if(!member_id.equals("")) {		// board_list.jsp에서 id가 null일 시 "" 처리함.
			LikeNumService likeNumService = new LikeNumService();
			isLike = likeNumService.getLikeNum(member_id, board_num);			
		}
		
		
		 // 이전글, 다음글 표시를 위한. (이거 너무 돌아왔나..?)
		int[] articleNum = detailService.checkArticleNum(sort);  
		int maxNum = articleNum[0];
		int minNum = articleNum[1];
		
		
		ActionForward forward = new ActionForward();
		request.setAttribute("page", page);		 // 필요하려나..
	   	request.setAttribute("article", article);
	   	request.setAttribute("maxNum", maxNum);
	   	request.setAttribute("minNum", minNum);
	   	request.setAttribute("comment", commentList);
	   	request.setAttribute("isLike", isLike);   // 게시물 좋아요 정보 (boolean 반환)
   		forward.setPath("../River_Board/board_view.jsp");
   		return forward;
	}

}
