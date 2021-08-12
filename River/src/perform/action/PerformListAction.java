package perform.action;

import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.xml.crypto.Data;

import perform.PerformDTO;
import perform.svc.PerformListService;
import vo.ActionForward;
import vo.PageInfo;

public class PerformListAction implements PerformAction {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		List<PerformDTO> performList = null;
		int page = 1;	// 페이지 기본설정
		int limit = 15;		// 한페이지 최대 글 수.
		
		if(request.getParameter("page")!= null){		// perform_list.jsp에서 넘어올 예정.
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		// model 객체 호출
		PerformListService performListService = new PerformListService();
		int listCount = performListService.getPerformListCount();
		performList = performListService.getPerformList(page);
		
		
		/*-------- paging 처리 --------- */
		int maxPage = (int)((double)listCount/limit+0.95);	
		int startPage =  (((int)((double)page/10 + 0.9)) - 1) * 10 + 1;	 
		int endPage = startPage + 10-1;
		if(endPage > maxPage) {
			endPage = maxPage;
		}
		// pageInfo 객체에 정보 담기
		PageInfo pageInfo = new PageInfo();
		pageInfo.setEndPage(endPage);
		pageInfo.setListCount(listCount);
		pageInfo.setMaxPage(maxPage);
		pageInfo.setPage(page);
		pageInfo.setStartPage(startPage);	
		

		// 현재 날짜 구하기
		Calendar cal = Calendar.getInstance();	  // Calendar는 추상클래스라.
		Date today_date = cal.getTime();
		
		
		// view단으로 넘길 것들
		request.setAttribute("today_date", today_date);
		request.setAttribute("pageInfo", pageInfo);	
		request.setAttribute("performList", performList);
		ActionForward forward = new ActionForward();
   		forward.setPath("perform_list.jsp");
   		return forward;
	}

}
