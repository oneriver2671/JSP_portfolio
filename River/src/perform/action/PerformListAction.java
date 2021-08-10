package perform.action;

import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import perform.PerformDTO;
import perform.svc.PerformListService;
import vo.ActionForward;

public class PerformListAction implements PerformAction {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		List<PerformDTO> performList = null;
		int page = 1;	// 페이지 기본설정
		int limit = 15;		// 한페이지 최대 글 수.
		
		if(request.getParameter("page")!= null){		// perform_list.jsp에서 넘어올 예정.
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		// model 객체 호출
		PerformListService performListService = new PerformListService();
		performList = performListService.getPerformList(page, limit);
		
		// view단으로 넘길 것들
		request.setAttribute("performList", performList);
		ActionForward forward = new ActionForward();
   		forward.setPath("perform_list.jsp");
   		return forward;
	}

}
