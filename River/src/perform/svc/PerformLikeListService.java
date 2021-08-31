package perform.svc;

import java.util.List;

import perform.PerformDTO;
import perform.PerformDataModel;

public class PerformLikeListService {
	
	public List<PerformDTO> getPerformLikeList(String member_id) throws Exception{
		
		PerformDataModel performDataModel = PerformDataModel.instance();
		List<PerformDTO> performList = performDataModel.getPerformLikeList(member_id);
		
		return performList;
	}

}
