package board.action;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.BoardDTO;
import board.svc.ListService;
import vo.ActionForward;
import vo.PageInfo;

public class ListAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		
		ArrayList<BoardDTO> articleList = new ArrayList<>();
		int page = 1;	// 페이지 기본설정
		int limit = 15;		// 한페이지 최대 글 수.
		String sort = "test";
		sort = request.getParameter("sort");	// 게시판 종류. header에서 넘어옴.
				
		if(request.getParameter("page")!= null){		// 이 page는 어디서 오는가. -> board_music_list.jsp에서 넘어옴. null이면 아무런 이벤트도 없는 상태니 기본 페이지로.
			page = Integer.parseInt(request.getParameter("page"));
		}
		
		// 이제 model 객체 호출해야함. model 클래스 만들기.
		ListService listService = new ListService();
		int listCount = listService.getListCount(sort);		// 총 게시글 갯수.
		articleList = listService.getArticleList(sort, page, limit);  // paging처리를 위한 변수 추가.
		
		
		/*-------- paging 처리 (이해 잘 안됨) --------- */
		int maxPage = (int)((double)listCount/limit+0.95);	  // 이부분 왜 0.95 더함??
		int startPage =  (((int)((double)page/10 + 0.9)) - 1) * 10 + 1;	 // 음.. 이렇게까지..?
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
		ActionForward forward = new ActionForward();
   		forward.setPath("../River_Board/board_list.jsp");
   		return forward;
	}

}
