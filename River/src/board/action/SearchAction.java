package board.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDTO;
import board.svc.ListService;
import board.svc.SearchService;
import vo.ActionForward;
import vo.PageInfo;

public class SearchAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ArrayList<BoardDTO> articleList = new ArrayList<>();
		
		// model쪽 메소드에 들어갈  변수들
		String board_sort = request.getParameter("sort");          // 게시판 종류. 
		String day = request.getParameter("search_by_day");		   // 검색조건 (날짜)
		String sort = request.getParameter("search_by_content");   // 검색조건 (제목+내용 등)
		String content = request.getParameter("search_value");	   // 검색내용
		int page = 1;	    	// 페이지 기본설정
		int limit = 15;			// 한페이지 최대 글 수.
		int listCount = 0;		// 검색결과 게시글 갯수.	
		
		if(request.getParameter("page")!= null){		// 이 page는 어디서 오는가. -> board_list.jsp에서 넘어옴. null이면 아무런 이벤트도 없는 상태니 기본 페이지로.
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		// sort에 있는 +가 쿼리스트링으로 넘어올 땐 공백으로 넘어옴. ('제목+내용'이 '제목 내용'으로)
		if(sort.equals("제목 내용")) {
			sort = "제목+내용";
		}
	
		
		// 이제 model 객체 호출해야함. model 클래스 만들기.
		SearchService searchService = new SearchService();
		articleList = searchService.getSearchList(board_sort, day, content, sort, page, limit);  // 검색결과 List
		listCount = searchService.getSearchListCount(board_sort, day, sort, content);	    // 검색결과 총 게시물 갯수.
	
		/*---- paging 처리 ----*/   
		// -------------- 페이징처리 부분 검색조건으로 메소드 새로 만들어야 함 -------------------
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
		request.setAttribute("pageInfo", pageInfo);	
		request.setAttribute("articleList", articleList);
		// paging처리를 위해 '검색조건' 다시 넘겨주기
		request.setAttribute("searchDay", day);		
		request.setAttribute("searchSort", sort);	
		request.setAttribute("searchContent", content);	
		
		ActionForward forward = new ActionForward();
   		forward.setPath("../River_Board/board_searchList.jsp");
   		return forward;
	}

}
