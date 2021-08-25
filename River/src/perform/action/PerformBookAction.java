package perform.action;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import perform.PerformBookDTO;
import perform.PerformSeatDTO;
import perform.svc.PerformBookService;
import user.UserDTO;
import vo.ActionForward;

public class PerformBookAction implements PerformAction {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		// 예매완료 후 넘어오는 것들
		String memberId = request.getParameter("memberId");			// 회원 ID
		String _seatGradeArr = request.getParameter("selectedSeatGrade");   // '좌석등급' 배열
		String seatValArr = request.getParameter("selectedSeatVal");		// '좌석정보' 배열
		int totalPrice = Integer.parseInt(request.getParameter("totalPrice"));	 // 총 결제금액
		int performNum = Integer.parseInt(request.getParameter("performNum"));   // 공연 번호
		
		String[] seatGradeArr = _seatGradeArr.split(",");	// 콤마 제거 후 배열 형태로 변환.
		
		
		/*---- 테스트용 출력 ----*/
		System.out.println(seatGradeArr[0]);
		System.out.println(seatGradeArr[1]);
		System.out.println(seatValArr);
		System.out.println(totalPrice);
		System.out.println(performNum);
		System.out.println(memberId);
		
		
		/* model단 처리 */
		PerformBookService performBookService = new PerformBookService();
		
		// 회원정보 뽑아오기(이메일, 생년월일, 연락처) -> '예약정보' 테이블에 추가될 것들
		UserDTO userDTO = performBookService.getBookMemberInfo(memberId);
		String memberEmail = userDTO.getEmail();	
		String memberTel = userDTO.getTel();
		int memberBirth = userDTO.getBirth();
		
		
		/*----- '좌석정보' 테이블 수정 -----*/
		// 좌석정보 테이블 수정을 위한 작업
		PerformSeatDTO _performSeatDTO = performBookService.getPerformSeat(performNum);
		PerformSeatDTO performSeatDTO = new PerformSeatDTO();
		
		// R석, S석 등등 값을 수정해야함.
		int _remain_R = _performSeatDTO.getRemain_R();
		int _remain_S = _performSeatDTO.getRemain_S();
		int _remain_A = _performSeatDTO.getRemain_A();
		int _remain_B = _performSeatDTO.getRemain_B();
		int _remain_all = _performSeatDTO.getRemain_all();
		

		// 아래 for문 이후에도 0이라면, 해당등급은 선택되지 않았다는 뜻.
		int seat_R_num = 0;
		int seat_S_num = 0;
		int seat_A_num = 0;
		int seat_B_num = 0;
		int seat_all_num = 0;	
		
		for(int i=0; i<seatGradeArr.length; i++) {
			if(seatGradeArr[i].equals("R석")) seat_R_num++;
			else if(seatGradeArr[i].equals("S석")) seat_S_num++;		
			else if(seatGradeArr[i].equals("A석")) seat_A_num++;		
			else if(seatGradeArr[i].equals("B석")) seat_B_num++;		
			else if(seatGradeArr[i].equals("전석")) seat_all_num++;		
		}
		int remain_R = _remain_R - seat_R_num;
		int remain_S = _remain_S - seat_S_num;
		int remain_A = _remain_A - seat_A_num;
		int remain_B = _remain_B - seat_B_num;
		int remain_all = _remain_all - seat_all_num;
		
		// 이제 새로운 객체에 변경된 값을 넣기.
		performSeatDTO.setPerform_num(performNum);
		performSeatDTO.setBooked_seat(seatValArr);	 // 이건 새롭게 추가될 좌석 정보 형태 그대로.
		performSeatDTO.setRemain_R(remain_R);
		performSeatDTO.setRemain_S(remain_S);
		performSeatDTO.setRemain_A(remain_A);
		performSeatDTO.setRemain_B(remain_B);
		performSeatDTO.setRemain_all(remain_all);
		
		int updateResult = performBookService.updatePerformSeatBook(performSeatDTO);	// '좌석정보' 수정
		if(updateResult == 0) {
			System.out.println("수정 실패");
		} else {
			System.out.println("수정 성공!");			
		}
		
		
		/*----- '예약정보' 테이블에 입력 -----*/
		// 전화번호, 이메일 필요함!! (여기서 뽑아쓸지, 아니면 View에서 넘어오게 할 지.)
		PerformBookDTO performBookDTO = new PerformBookDTO();
		performBookDTO.setMember_id(memberId);
		performBookDTO.setMember_tel(memberTel);
		performBookDTO.setMember_email(memberEmail);
		performBookDTO.setPerform_num(performNum);
		performBookDTO.setSeat(seatValArr);
		
		performBookService.setPerformBook(performBookDTO);	// '예약정보' 입력
		
		
		ActionForward forward = new ActionForward();
		forward.setPath("performDetail.pe?perform_num="+performNum+"&id="+memberId);	// 다시 '상세페이지'로.
   		return forward;
	}

}
