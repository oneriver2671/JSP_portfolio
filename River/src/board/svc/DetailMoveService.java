package board.svc;

import java.util.ArrayList;

import board.BoardDAO;
import board.BoardDTO;

public class DetailMoveService {

	public int getNextArticleNum(String sort, int orders, int temp) throws Exception{
		// temp => 이전페이지 : 0, 다음페이지 : 1
		int board_num = 0;	// 리턴될 게시글 번호.
		ArrayList<Integer> boardList = null;
		BoardDAO boardDAO = BoardDAO.getInstance();
	
		boardList = boardDAO.select(sort);
		
		// 이전 게시물 (temp == 0)
		if(temp == 0) {		
			for(int i=0; i<boardList.size(); i++) {
				if(orders==boardList.get(i) && i!=boardList.size()-1) {	  // 마지막 게시물이 아니라면. (마지막 게시물은 이전게시물이 없음)
					board_num = boardList.get(i+1);
				} 
			}
		}
		
		// 다음 게시물 (temp == 1)
		if(temp == 1) {
			for(int i=0; i<boardList.size(); i++) {
				if(orders==boardList.get(i) && i!=0) {	  // 첫번째 게시물이 아니라면. (첫번째 게시물은 다음 게시물 없음)
					board_num = boardList.get(i-1);
				} 
			}
		}
		
		return board_num;	// 아래 getArticle()메소드에서 사용될 것임. (사용위치 : Action)
	}
	
	// 여기서 위 메소드 리턴값 사용. 
	public BoardDTO getNextArticle(int board_num) throws Exception {
		BoardDTO boardDTO = null;
		BoardDAO boardDAO = BoardDAO.getInstance();
		
		boardDTO = boardDAO.content(board_num);
		
		
		return boardDTO;
	}
	
	
	/* 게시글이 첫번째인지, 마지막인지 확인용 메소드 (view에서 이전글, 다음글 처리 때문) */
	public int[] checkArticleNum(String sort) {
		int[] articleNum = new int[2];
		BoardDAO boardDAO = BoardDAO.getInstance();
		articleNum = boardDAO.checkArticleNum(sort);
		
		
		return articleNum;
	}
	
	
}
