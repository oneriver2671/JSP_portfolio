package perform.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import perform.svc.PerformLikeReduceService;
import vo.ActionForward;

public class PerformLikeReduceAction implements PerformAction {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String member_id = null;
		int perform_num = 0;
		
		// ajax를 통해 넘어오는 값들
		member_id = request.getParameter("member_id");
		perform_num = Integer.parseInt(request.getParameter("perform_num"));
		
		/* model 객체 생성 */ 
		PerformLikeReduceService performLikeReduceService = new PerformLikeReduceService();
		performLikeReduceService.deletePerformLikeInfo(member_id, perform_num);
		performLikeReduceService.reducePerformLike(perform_num);
		
		return null;
	}

}
