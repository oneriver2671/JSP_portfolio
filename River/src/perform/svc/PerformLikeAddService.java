package perform.svc;

import perform.PerformDataModel;

public class PerformLikeAddService {
	
	/* 회원이 눌렀던 좋아요 게시물 번호 가져오기 */
	public boolean getPerformLikeNum(String member_id, int perform_num) throws Exception{
		boolean result = false;
		
		PerformDataModel performDataModel = PerformDataModel.instance();
			
		if(!member_id.equals("null")) {
			result = performDataModel.getPerformLikeNum(member_id, perform_num);		
		}
		
		return result;
	}
	
	public boolean insertPerformLikeInfo(String member_id, int perform_num) throws Exception{
		boolean isInsertSuccess = false;
		
		PerformDataModel performDataModel = PerformDataModel.instance();
		int result = performDataModel.insertPerformLikeInfo(member_id, perform_num);

		if(result > 0) {
			isInsertSuccess = true;
		}
		
		return isInsertSuccess;
	}
	
	public boolean addPerformLike(int perform_num) throws Exception{
		boolean isAddSuccess = false;
		
		PerformDataModel performDataModel = PerformDataModel.instance();
		int result = performDataModel.addPerformLike(perform_num);
		
		if(result > 0) {
			isAddSuccess = true;
		}
		
		return isAddSuccess;
	}
	
	

}
