package perform.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.svc.LikeNumService;
import perform.PerformDTO;
import perform.svc.PerformDetailService;
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
	
		
		// 게시글 출력용 model 객체 생성
		PerformDetailService performDetailService = new PerformDetailService();
		performDTO = performDetailService.getPerform(perform_num);
		
		
		// 회원이 누른 좋아요 확인용 model 객체 생성
//		if(!member_id.equals("")) {		    // board_list.jsp에서 id가 null일 시 "" 처리함.
//			LikeNumService likeNumService = new LikeNumService();
//			isLike = likeNumService.getLikeNum(member_id, board_num);			
//		}
		
		System.out.println("컨트롤러는 잘 찍힘: " + performDTO.getPerform_title());
		
		
		request.setAttribute("performDTO", performDTO);
		request.setAttribute("isLike", isLike);   // 게시물 좋아요 정보 (boolean 반환)
		
		ActionForward forward = new ActionForward();
		forward.setPath("perform_detail.jsp");
   		return forward;
	}
	

}
