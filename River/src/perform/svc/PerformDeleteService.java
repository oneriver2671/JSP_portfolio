package perform.svc;

import perform.PerformDataModel;

public class PerformDeleteService {
	
	
public boolean getPerform(int perform_num) throws Exception {
		
		boolean isDelete = false;
		int result = 0;
		
		PerformDataModel performDataModel = PerformDataModel.instance();
		result = performDataModel.deletePerform(perform_num);
		
		if(result > 0) {
			isDelete = true;
		}
		
		return isDelete;
	}

}
