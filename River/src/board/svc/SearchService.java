package board.svc;

import java.util.ArrayList;

import board.BoardDAO;
import board.BoardDTO;

public class SearchService {
	
	/* 게시글 갯수 세는 메소드 (매개변수 : 게시판 종류) */
		// -------- dao에서 이걸 검색조건별로 새로 만들어야할지, 아님 밑 select 메소드에서 뽑아올 수 있을지. ------------
	public int getListCount(String sort) throws Exception{
		int listCount = 0;
		BoardDAO boardDAO = BoardDAO.getInstance();
		listCount = boardDAO.selectListCount(sort);	
		
		return listCount;
		
	}

	/* 게시글 select 메소드 */
	public ArrayList<BoardDTO> getSearchList(String board_sort, String day, String content, String sort, int page, int limit) throws Exception{
			// day, sort: 검색조건 / content: 검색내용 
		ArrayList<BoardDTO> searchList = null;
		BoardDAO boardDAO = BoardDAO.getInstance();
		searchList = boardDAO.search(board_sort, day, sort, content, page, limit);
		
		return searchList;
	}

}
