package perform.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import perform.PerformDTO;
import perform.svc.PerformLikeAddService;
import perform.svc.PerformLikeListService;
import vo.ActionForward;

public class PerformLikeListAction implements PerformAction {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String member_id = request.getParameter("member_id");
		
		/* model 객체 생성 */ 
		PerformLikeListService performLikeListService = new PerformLikeListService();
		List<PerformDTO> performLikeList = performLikeListService.getPerformLikeList(member_id);
	
		request.setAttribute("likeList", performLikeList);
		
		ActionForward forward = new ActionForward();
   		forward.setPath("perform_likeList.jsp");
   		return forward;
	}

}
