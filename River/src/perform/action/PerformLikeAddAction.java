package perform.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import perform.svc.PerformLikeAddService;
import vo.ActionForward;

public class PerformLikeAddAction implements PerformAction {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		String member_id = null;
		int perform_num = 0;
		
		// ajax를 통해 넘어오는 값들
		member_id = request.getParameter("member_id");
		perform_num = Integer.parseInt(request.getParameter("perform_num"));
		

		/* model 객체 생성 */ 
		PerformLikeAddService performLikeAddService = new PerformLikeAddService();
		performLikeAddService.insertPerformLikeInfo(member_id, perform_num);
		performLikeAddService.addPerformLike(perform_num);
		
		return null;
	}

}
