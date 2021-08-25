package perform.svc;

import perform.PerformDTO;
import perform.PerformDataModel;
import perform.PerformSeatDTO;

public class PerformDetailService {
	
	// 공연 '상세정보' 가져오기
	public PerformDTO getPerform(int perform_num) throws Exception {
		
		PerformDTO performDTO = null;
		
		PerformDataModel performDataModel = PerformDataModel.instance();
		performDTO = performDataModel.getPerformDetail(perform_num);
		
		return performDTO;
	}
	
	
	// 해당 공연의 '좌석정보' 가져오기
	public PerformSeatDTO getPerformSeatInfo(int perform_num) throws Exception{
		
		PerformSeatDTO performSeatDTO = null;
		
		PerformDataModel performDataModel = PerformDataModel.instance();
		performSeatDTO = performDataModel.getPerformSeatInfo(perform_num);
		
		return performSeatDTO;
	}
	
	

}
