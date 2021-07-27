package board.svc;


import java.sql.Connection;

import board.BoardDAO;
import board.BoardDTO;


public class WriteService {
	

	public boolean registArticle(BoardDTO boardDTO) throws Exception{		// 여기 boardBean이란 dto에 입력내용 담겨져옴.
		boolean isWriteSuccess = false;		

		BoardDAO boardDAO = BoardDAO.getInstance();
		int insertCount = boardDAO.insert(boardDTO);
		
		if(insertCount > 0){
			isWriteSuccess = true;    
		}
		
		return isWriteSuccess;
	}
}
