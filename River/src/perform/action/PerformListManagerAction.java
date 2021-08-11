package perform.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import perform.PerformDTO;
import perform.svc.PerformListService;
import vo.ActionForward;

public class PerformListManagerAction implements PerformAction {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		List<PerformDTO> performList = null;
	
		
		// model 객체 호출
		PerformListService performListService = new PerformListService();
		performList = performListService.getPerformListManager();
		
		// view단으로 넘길 것들
		request.setAttribute("performList", performList);
		ActionForward forward = new ActionForward();
   		forward.setPath("perform_update.jsp");
   		return forward;
	}
}
