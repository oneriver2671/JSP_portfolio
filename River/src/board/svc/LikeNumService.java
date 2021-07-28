package board.svc;

import board.BoardDAO;

public class LikeNumService {
	
	public boolean addLikeNum(String member_id, int board_num) throws Exception{
		boolean isAddSuccess = false;
		int insertCount = 0;
		BoardDAO boardDAO = BoardDAO.getInstance();
	
		int addCount = boardDAO.addLikeNum(board_num);	      // 게시판 table에 추가
		if(member_id != null) {
			insertCount = boardDAO.insertLikeNum(member_id, board_num);		// 좋아요관리 table에 추가			
		}
		
		if(addCount > 0 && insertCount > 0){
			isAddSuccess = true;
		}

		return isAddSuccess;
	}
	
	
	public boolean decreaseLikeNum(String member_id, int board_num) throws Exception{
		boolean isDecreaseSuccess = false;
		BoardDAO boardDAO = BoardDAO.getInstance();
		int deleteCount = 0;
	
		int decreaseCount = boardDAO.decreaseLikeNum(board_num);     // 게시판 table에서 삭제
		if(member_id != null) {
			deleteCount = boardDAO.deleteLikeNum(member_id, board_num);   // 좋아요관리 table에서 삭제			
		}
		
		
		if(decreaseCount > 0 && deleteCount > 0){
			isDecreaseSuccess = true;
		}

		return isDecreaseSuccess;
	}
}
