package board.svc;

import java.sql.Connection;

import board.BoardDAO;
import board.BoardDTO;


public class DetailService {

	public BoardDTO getArticle(int board_num) throws Exception{
		BoardDTO article = null;
		BoardDAO boardDAO = BoardDAO.getInstance();
	
		int updateCount = boardDAO.hits(board_num);	 // 조회수 증가
		
//		if(updateCount > 0){
//			commit(con);
//		}
//		else{
//			rollback(con);
//		}
		
		article = boardDAO.content(board_num);	// 해당 게시물 뽑아옴
		return article;	
	}
	
	/* 게시글이 첫번째인지, 마지막인지 확인용 메소드 (view에서 이전글, 다음글 처리 때문) */
	public int[] checkArticleNum(String sort) {
		int[] articleNum = new int[2];
		BoardDAO boardDAO = BoardDAO.getInstance();
		articleNum = boardDAO.checkArticleNum(sort);
		
		
		return articleNum;
	}

	
}
