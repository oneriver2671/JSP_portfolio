package board.action;

import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.svc.DeleteService;
import board.svc.LikeNumService;
import vo.ActionForward;

public class LikeNumAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		String member_id = null;
		int board_num = Integer.parseInt(request.getParameter("orders"));
		int temp = Integer.parseInt(request.getParameter("temp"));  	// 0 : 좋아요 증가, 1 : 좋아요 감소
		member_id = request.getParameter("member_id");		// 로그인된 회원 id 넘어옴
	
		System.out.println(member_id);
		
		LikeNumService likeNumService = new LikeNumService();	// Model 객체 생성
		if(temp==0) {			
			likeNumService.addLikeNum(member_id, board_num);	// like_num 증가
		} else {
			likeNumService.decreaseLikeNum(member_id, board_num);	// like_num 감소
		}

		// forward = new ActionForward();
		// forward.setRedirect(true);
		// forward.setPath("boardList.bo?");	  
	
		return forward;
	}
}
