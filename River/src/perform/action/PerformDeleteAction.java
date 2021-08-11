package perform.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import perform.svc.PerformDeleteService;
import vo.ActionForward;

public class PerformDeleteAction implements PerformAction {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int perform_num = 0;
		boolean isDelete = false;
		
		perform_num = Integer.parseInt(request.getParameter("perform_num"));
		
		// Model 객체 생성
		PerformDeleteService performDeleteService = new PerformDeleteService();
		isDelete = performDeleteService.getPerform(perform_num);
		
		if(isDelete==true) {
			System.out.println("삭제 성공");
		}
		
		ActionForward forward = new ActionForward();
		forward.setPath("performListManager.pe");
		return forward;
	}

}
