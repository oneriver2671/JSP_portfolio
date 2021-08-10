package perform.svc;

import perform.PerformDTO;
import perform.PerformDataModel;

public class PerformInsertService {
	
	public boolean registArticle(PerformDTO performDTO) throws Exception {
		
		boolean isInsertSuccess = false;	
		
		PerformDataModel performDataModel = PerformDataModel.instance();
		int insertResult = performDataModel.insertPerform(performDTO);
		
		if(insertResult > 0){
			isInsertSuccess = true;    
		}
		
		return isInsertSuccess;
		
	}

}
