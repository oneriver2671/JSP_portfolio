package perform.svc;

import perform.PerformDTO;
import perform.PerformDataModel;

public class PerformUpdateService {
	
	public int updatePerform(PerformDTO performDTO) throws Exception{
		
		int updateResult = 0;
		
		PerformDataModel performDataModel = PerformDataModel.instance();
		updateResult = performDataModel.updatePerform(performDTO);
		
		
		return updateResult;
		
	}

}
