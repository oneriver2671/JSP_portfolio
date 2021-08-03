package board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.svc.CommentModifyService;
import vo.ActionForward;

public class CommentModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		
		int comment_num = Integer.parseInt(request.getParameter("comment_num"));	// 수정할 댓글 번호
		String content = request.getParameter("content");    	// 수정된 내용
		
	
		CommentModifyService commentModifyService = new CommentModifyService();
		commentModifyService.modifyComment(comment_num, content);
		
		
		// forward = new ActionForward();
		// forward.setRedirect(true);
	
		return forward;
	}
}
