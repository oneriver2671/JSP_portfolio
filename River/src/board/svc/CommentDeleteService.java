package board.svc;

import java.io.PrintWriter;

import board.BoardDAO;

public class CommentDeleteService {
	public boolean removeComment(int comment_num) throws Exception{
		boolean isRemoveSuccess = false;
		BoardDAO boardDAO = BoardDAO.getInstance();
	
		int deleteCount = boardDAO.deleteComment(comment_num);
		if(deleteCount > 0){
			isRemoveSuccess = true;
		}
		
		return isRemoveSuccess;
	}
}
