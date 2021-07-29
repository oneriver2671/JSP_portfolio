package board.svc;


import board.BoardDAO;

public class LikeNumService {
	/* 회원이 눌렀던 좋아요 게시물 모두 가져오기 */
	public boolean getLikeNum(String member_id, int board_num) throws Exception{
		boolean result = false;
		BoardDAO boardDAO = BoardDAO.getInstance();
			
		if(!member_id.equals("null")) {
			result = boardDAO.getLikeNum(member_id, board_num);				
		}
		
		return result;
	}
	
	/* 좋아요 갯수 증가 */
	public boolean addLikeNum(String member_id, int board_num) throws Exception{
		boolean isAddSuccess = false;
		int insertCount = 0;
		BoardDAO boardDAO = BoardDAO.getInstance();
	
		int addCount = boardDAO.addLikeNum(board_num);	      // 게시판 table에 추가
		
		if(!member_id.equals("null")) {
			insertCount = boardDAO.insertLikeNum(member_id, board_num);		// 좋아요관리 table에 추가			
		}
		
		if(addCount > 0 && insertCount > 0){
			isAddSuccess = true;
		}

		return isAddSuccess;
	}
	
	/* 좋아요 갯수 감소 */
	public boolean decreaseLikeNum(String member_id, int board_num) throws Exception{
		boolean isDecreaseSuccess = false;
		int deleteCount = 0;
		BoardDAO boardDAO = BoardDAO.getInstance();
//		if(member_id == null) {
//			member_id = "null";			// null값 오류 방지용 (위의 add메소드에선 null이 아닌데 왜 여기는 null 뜸??)
//		}
		
		// System.out.println(member_id);
	
		int decreaseCount = boardDAO.decreaseLikeNum(board_num);     // 게시판 table에서 삭제
		if(!member_id.equals("null")) {
			deleteCount = boardDAO.deleteLikeNum(member_id, board_num);   // 좋아요관리 table에서 삭제			
		}
		
		if(decreaseCount > 0 && deleteCount > 0){
			isDecreaseSuccess = true;
		}

		return isDecreaseSuccess;
	}
}
