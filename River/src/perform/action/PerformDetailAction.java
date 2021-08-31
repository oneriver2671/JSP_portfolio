package perform.action;

import java.util.Calendar;
import java.util.Date;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.svc.LikeNumService;
import perform.PerformDTO;
import perform.PerformSeatDTO;
import perform.svc.PerformDetailService;
import perform.svc.PerformLikeAddService;
import vo.ActionForward;

public class PerformDetailAction implements PerformAction {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		int perform_num = 0;		// 공연 id
		String member_id = null;	// 현재 로그인한 회원 id
		boolean isLike = false;		// 게시물 좋아요 눌렀던 회원인지 확인용
		PerformDTO performDTO = null;
		
		member_id = request.getParameter("id");		
		perform_num = Integer.parseInt(request.getParameter("perform_num"));
	
		
		/*------ model단 작업 ------*/
		PerformDetailService performDetailService = new PerformDetailService();
		/* 공연 '상세정보' 가져오기 */
		performDTO = performDetailService.getPerform(perform_num);
		
		// 회원이 누른 좋아요 확인용 model 객체 생성
		if(member_id != null) {		    // 로그인 안한 상태. (무조건 isLike == false)
			PerformLikeAddService performLikeAddService = new PerformLikeAddService();
			isLike = performLikeAddService.getPerformLikeNum(member_id, perform_num);
		} 

		
		// 현재 날짜 구하기
		Calendar cal = Calendar.getInstance();	  // Calendar는 추상클래스라.
		Date today_date = cal.getTime();
		
		
		/* 공연 '좌석정보' 가져오기 */
		PerformSeatDTO performSeatDTO = performDetailService.getPerformSeatInfo(perform_num);
		
		
		/* view단으로 넘길 것들 */
		// 공연 '상세정보'
		request.setAttribute("today_date", today_date);
		request.setAttribute("performDTO", performDTO);
		request.setAttribute("isLike", isLike);   // 게시물 좋아요 정보 (boolean 반환)
		// 공연 '좌석정보' 
		request.setAttribute("performSeatDTO", performSeatDTO);
		
		
		ActionForward forward = new ActionForward();
		forward.setPath("perform_detail.jsp");
   		return forward;
	}
	

}
