package perform.svc;

import perform.PerformDTO;
import perform.PerformDataModel;

public class PerformDetailService {
	
	public PerformDTO getPerform(int perform_num) throws Exception {
		
		PerformDTO performDTO = null;
		
		PerformDataModel performDataModel = PerformDataModel.instance();
		performDTO = performDataModel.getPerformDetail(perform_num);
		
		
		return performDTO;
	}

}
