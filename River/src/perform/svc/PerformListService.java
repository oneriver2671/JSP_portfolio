package perform.svc;

import java.util.List;

import perform.PerformDTO;
import perform.PerformDataModel;

public class PerformListService {
	
	/* 게시글 갯수 세는 메소드 */
	public int getPerformListCount() throws Exception{
		int listCount = 0;
		PerformDataModel performDataModel = PerformDataModel.instance();
		listCount = performDataModel.getPerformListCount();
		
		return listCount;
	}

	/* 게시글 select 메소드 */
	public List<PerformDTO> getPerformList(int page) throws Exception{
		int listCount = 0;
		List<PerformDTO> performList = null;
		PerformDataModel performDataModel = PerformDataModel.instance();
		performList = performDataModel.getPerformList(page);	// page, limit도 활용해야 함.
	
		return performList;
	}
	
	/* 게시글 select 메소드 (관리자용) */
	public List<PerformDTO> getPerformListManager() throws Exception{
		List<PerformDTO> performList = null;
		PerformDataModel performDataModel = PerformDataModel.instance();
		performList = performDataModel.getPerformListManager();
	
		return performList;
	}
	
	
	

}
