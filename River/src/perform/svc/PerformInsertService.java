package perform.svc;

import perform.PerformDTO;
import perform.PerformDataModel;
import perform.PerformSeatDTO;

public class PerformInsertService {
	
	// 공연정보 등록
	public boolean registArticle(PerformDTO performDTO) throws Exception {
		boolean isInsertSuccess = false;	
		
		PerformDataModel performDataModel = PerformDataModel.instance();
		int insertResult = performDataModel.insertPerform(performDTO);
		
		if(insertResult > 0){
			isInsertSuccess = true;    
		}
		return isInsertSuccess;
	}
	
	// 공연번호(ID) 불러오기 (for 공연 좌석정보)
	public int getPerformNumFinal() throws Exception{
		int perform_num = 0;
		
		PerformDataModel performDataModel = PerformDataModel.instance();
		perform_num = performDataModel.selectFianlPerformNum();
		
		return perform_num;
	}
	
	
	// 공연 '좌석정보' 테이블 최초 설정
	public int setPerformSeatInfo(PerformSeatDTO performSeatDTO) throws Exception{
		int result = 0;
		
		PerformDataModel performDataModel = PerformDataModel.instance();
		result = performDataModel.insertPerformSeatInfo(performSeatDTO);
		
		return result;
	}
	

}
