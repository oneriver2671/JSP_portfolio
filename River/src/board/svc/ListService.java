package board.svc;

import java.sql.Connection;
import java.util.ArrayList;

import board.BoardDAO;
import board.BoardDTO;



public class ListService {
	/* 게시글 갯수 세는 메소드 (매개변수 : 게시판 종류) */
	public int getListCount(String sort) throws Exception{
		int listCount = 0;
		BoardDAO boardDAO = BoardDAO.getInstance();
		listCount = boardDAO.selectListCount(sort);	
		
		return listCount;
	}

	/* 게시글 select 메소드 */
	public ArrayList<BoardDTO> getArticleList(String sort, int page, int limit) throws Exception{
		ArrayList<BoardDTO> articleList = null;
		BoardDAO boardDAO = BoardDAO.getInstance();
		articleList = boardDAO.selectArticleList(sort, page, limit);
	
		return articleList;
	}
		
	
}
