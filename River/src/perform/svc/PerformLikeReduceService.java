package perform.svc;

import perform.PerformDataModel;

public class PerformLikeReduceService {
	
	public boolean deletePerformLikeInfo(String member_id, int perform_num) throws Exception{
		boolean isDeleteSuccess = false;
		
		PerformDataModel performDataModel = PerformDataModel.instance();
		int result = performDataModel.deletePerformLikeInfo(member_id, perform_num);

		if(result > 0) {
			isDeleteSuccess = true;
		}
		
		return isDeleteSuccess;
	}
	
	public boolean reducePerformLike(int perform_num) throws Exception{
		boolean isReduceSuccess = false;
		
		PerformDataModel performDataModel = PerformDataModel.instance();
		int result = performDataModel.reducePerformLike(perform_num);
		
		if(result > 0) {
			isReduceSuccess = true;
		}
		
		return isReduceSuccess;
	}

}
