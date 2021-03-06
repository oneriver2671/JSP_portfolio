package board.action;

import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.svc.CommentDeleteService;
import vo.ActionForward;

public class CommentDeleteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		
		ActionForward forward = null;
		
		int board_num = Integer.parseInt(request.getParameter("orders"));	// 삭제 후 다시 해당 페이지 띄우기 위해 필요함.
		String board_sort = request.getParameter("sort");	
		String member_id = request.getParameter("id");		// 현재 로그인한 회원
		int comment_num = Integer.parseInt(request.getParameter("comment_num"));
	
		CommentDeleteService commentDeleteService = new CommentDeleteService();
		boolean isDeleteSuccess = commentDeleteService.removeComment(comment_num);	 // 삭제 성공 시 true 반환.
		

		if(!isDeleteSuccess){
			out.println("<script>");
			out.println("alert('삭제에 실패하였습니다. 관리자에게 문의하여 주세요.');");
			out.println("history.back();");
		}
		else{
			forward = new ActionForward();
			forward.setRedirect(true);
			String encoded_sort = URLEncoder.encode(board_sort, "utf-8");
			forward.setPath("boardDetail.bo?orders="+board_num+"&sort="+encoded_sort+"&id="+member_id);	  
		}
		
	
		return forward;
	}

}
