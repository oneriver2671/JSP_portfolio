package board.svc;

import java.util.ArrayList;

import board.BoardDAO;
import board.BoardDTO;

public class SearchService {
	/* 게시글 갯수 세는 메소드 (매개변수 : 게시판 종류) */
	public int getSearchListCount(String board_sort, String day, String sort, String content) throws Exception{
		int listCount = 0;
		BoardDAO boardDAO = BoardDAO.getInstance();
		listCount = boardDAO.searchListCount(board_sort, day, sort, content);	// day, sort : 검색조건 / content : 검색어
		
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
