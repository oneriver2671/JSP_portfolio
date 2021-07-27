package board.svc;


import board.BoardDAO;

public class DeleteService {
	public boolean removeArticle(int board_num) throws Exception{
	
		boolean isRemoveSuccess = false;
		BoardDAO boardDAO = BoardDAO.getInstance();
	
		int deleteCount = boardDAO.delete(board_num);
		
		if(deleteCount > 0){
			isRemoveSuccess = true;
		}

		return isRemoveSuccess;
	}
}
