package board.svc;

import java.sql.Connection;

import board.BoardDAO;
import board.BoardDTO;


public class ModifyService {
	public boolean modifyArticle(BoardDTO article) throws Exception {	
		boolean isModifySuccess = false;
		
		BoardDAO boardDAO = BoardDAO.getInstance();
		
		int updateCount = boardDAO.update(article);
		
		if(updateCount > 0){
			isModifySuccess=true;
		}

		return isModifySuccess;

	}
}
