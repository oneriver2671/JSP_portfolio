package board.svc;

import java.util.ArrayList;

import board.BoardDAO;
import board.BoardDTO;
import board.CommentDTO;

public class CommentService {

	/* 댓글 작성용 메소드 */
	public boolean registArticle(CommentDTO commentDTO) throws Exception{		// 여기 boardBean이란 dto에 입력내용 담겨져옴.
		boolean isWriteSuccess = false;		
	
		BoardDAO boardDAO = BoardDAO.getInstance();
		int insertCount = boardDAO.insertComment(commentDTO);
		
		if(insertCount > 0){
			isWriteSuccess = true;    
		}
	
		return isWriteSuccess;
	}
	
	
	/* 댓글 select용 메소드 (DetailAction쪽에서 써야할듯) */
	public ArrayList<CommentDTO> getComment(int board_num) throws Exception{
		CommentDTO commentDTO = null;
		ArrayList<CommentDTO> commentList = new ArrayList<CommentDTO>();
		
		BoardDAO boardDAO = BoardDAO.getInstance();
		commentList = boardDAO.selectComment(board_num);
		
		return commentList;
	}
}
