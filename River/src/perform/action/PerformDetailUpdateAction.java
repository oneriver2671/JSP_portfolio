package perform.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import perform.PerformDTO;
import perform.svc.PerformDetailService;
import vo.ActionForward;

public class PerformDetailUpdateAction implements PerformAction {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int perform_num = 0;		// 공연 id
		PerformDTO performDTO = null;
		
		perform_num = Integer.parseInt(request.getParameter("perform_num"));	// a태그로 넘어온 값.
		
		// 게시글 출력용 model 객체 생성 (PerformDetailAction과 같음)
		PerformDetailService performDetailService = new PerformDetailService();
		performDTO = performDetailService.getPerform(perform_num);
				
		
		request.setAttribute("performDTO", performDTO); 	// updateForm.jsp에 넘겨줄거임.
		
		ActionForward forward = new ActionForward();
		forward.setPath("perform_updateForm.jsp");
   		return forward;
	}

}
