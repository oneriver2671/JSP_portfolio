package board.svc;

import board.BoardDAO;

public class CommentModifyService {
	public boolean modifyComment(int comment_num, String content) throws Exception {	
		boolean isModifySuccess = false;
		
		BoardDAO boardDAO = BoardDAO.getInstance();
		
		int updateCount = boardDAO.modifyComment(comment_num, content);
		
		if(updateCount > 0){
			isModifySuccess=true;
		}

		return isModifySuccess;

	}

}
