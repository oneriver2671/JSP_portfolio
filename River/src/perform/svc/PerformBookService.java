package perform.svc;

import perform.PerformBookDTO;
import perform.PerformDataModel;
import perform.PerformSeatDTO;
import user.UserDTO;

public class PerformBookService {
	
	// '좌석정보' 뽑아오기
	public PerformSeatDTO getPerformSeat(int perform_num) throws Exception {
		PerformSeatDTO performSeatDTO = null;
		PerformDataModel performDataModel = PerformDataModel.instance();
		performSeatDTO = performDataModel.selectPerformSeat(perform_num);
		
		return performSeatDTO;
	}
	
	// '좌석정보' 수정 반영
	public int updatePerformSeatBook(PerformSeatDTO performSeatDTO) throws Exception {
		int result = 0;
		PerformDataModel performDataModel = PerformDataModel.instance();
		result = performDataModel.updatePerformSeat(performSeatDTO);
		
		return result;
	}
	
	// '예약정보' 입력
	public int setPerformBook(PerformBookDTO performBookDTO) throws Exception {
		int result = 0;
		PerformDataModel performDataModel = PerformDataModel.instance();
		result = performDataModel.insertPerformBook(performBookDTO);
		
		return result;
	}
	
	// '예약정보' 입력을 위한 '회원정보' 가져오기
	public UserDTO getBookMemberInfo(String memberId) throws Exception {
		UserDTO userDTO = null;
		PerformDataModel performDataModel = PerformDataModel.instance();
		userDTO = performDataModel.selectBookMemberInfo(memberId);
		
		return userDTO;
	}

	

}
