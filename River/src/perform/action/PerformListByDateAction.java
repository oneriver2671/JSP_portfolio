package perform.action;

import java.util.Calendar;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import perform.PerformDTO;
import perform.svc.PerformListService;
import vo.ActionForward;
import vo.PageInfo;

public class PerformListByDateAction implements PerformAction {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		List<PerformDTO> performList = null;
		int page = 1;	// 페이지 기본설정
		int limit = 15;		// 한페이지 최대 글 수.
		int startDate = 0;
		int endDate = 0;
		String startDate_temp = null;
		String endDate_temp = null;
		
		// 페이지 정보 
		if(request.getParameter("page")!= null){		// perform_list.jsp에서 넘어올 예정.
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		// 현재 날짜 구하기
		Calendar cal = Calendar.getInstance();	  // Calendar는 추상클래스라 생성자 호출 불가.
		Date today_date = cal.getTime();				// View단 넘어가서 비교할 때 쓸 예정
		int today_year = cal.get(Calendar.YEAR);		// 현재 연도
		int today_month = cal.get(Calendar.MONTH)+1;	// 현재 달
		
		// 날짜 세팅 
		String selected_year_temp = Integer.toString(today_year);		// 초기값 설정 (현재)
		String selected_month_temp = Integer.toString(today_month);		// 초기값 설정 (현재)

		
		if(request.getParameter("year")!=null) {
			selected_year_temp = request.getParameter("year");	
		}
		if(request.getParameter("month")!=null) {
			selected_month_temp = request.getParameter("month");	
		}
		
		
		// if문: 연간일정 검색 / else문: 월간일정 검색
		if(selected_month_temp.equals("null")) {	// 월을 01~12월로 설정해줄 것임.
			startDate_temp = selected_year_temp + "0101";	// 연초
			endDate_temp = selected_year_temp + "1231";		// 연말
			
		} else {
			// 1~9월 앞엔 0을 붙여주기 위한 작업.
			if(selected_month_temp.length()==1) {
				selected_month_temp = "0" + selected_month_temp;	
			}
			startDate_temp = selected_year_temp + selected_month_temp + "01";	// 1일
			endDate_temp = selected_year_temp + selected_month_temp + "31";		// 31일
			
		}
		
		
		startDate = Integer.parseInt(startDate_temp);
		endDate = Integer.parseInt(endDate_temp);
	
		
		// model 객체 호출
		PerformListService performListService = new PerformListService();
		int listCount = performListService.getPerformListCountByDate(startDate, endDate);
		performList = performListService.getPerformListByDate(page, startDate, endDate);
	
		
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
		

		// view단으로 넘길 것들
		request.setAttribute("today_date", today_date);
		request.setAttribute("today_year", today_year);
		request.setAttribute("today_month", today_month);
		request.setAttribute("pageInfo", pageInfo);	
		request.setAttribute("performList", performList);
		if(request.getParameter("year")!=null) {
			request.setAttribute("selected_year", selected_year_temp);	// View에서 받은 것 다시 돌려줘야 함.
		}
		if(request.getParameter("month")!=null) {
			request.setAttribute("selected_month", selected_month_temp);  // View에서 받은 것 다시 돌려줘야 함.
		}
		
		ActionForward forward = new ActionForward();
   		forward.setPath("perform_list.jsp");
   		return forward;
	}

}
