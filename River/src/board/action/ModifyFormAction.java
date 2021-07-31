package board.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDTO;
import board.svc.DetailService;
import vo.ActionForward;


public class ModifyFormAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = new ActionForward();
		int board_num = Integer.parseInt(request.getParameter("orders"));	// 쿼리스트링으로 넘어온 게시글 번호.
		
		DetailService detailService = new DetailService();	
	   	BoardDTO article = detailService.getArticle(board_num);
	   	
	   	request.setAttribute("article", article);	// dto 정보를 통째로 넘겨줌.
   		forward.setPath("board_update.jsp");
   		return forward;
   		
	}

}
