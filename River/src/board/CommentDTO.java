package board;

public class CommentDTO {
	int comment_num;		// 댓글 번호
	String writer_id;		// 작성자 id
	String content;			// 작성 내용
	String writed_date;		// 작성날짜 및 시간
	int board_num;			// 게시글 번호
	String board_sort;		// 게시판 종류
	
	
	public int getComment_num() {
		return comment_num;
	}
	public void setComment_num(int comment_num) {
		this.comment_num = comment_num;
	}
	public String getWriter_id() {
		return writer_id;
	}
	public void setWriter_id(String writer_id) {
		this.writer_id = writer_id;
	}
	public String getContent() {
		return content;
	}
	public void setContent(String content) {
		this.content = content;
	}
	public String getWrited_date() {
		return writed_date;
	}
	public void setWrited_date(String writed_date) {
		this.writed_date = writed_date;
	}
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	public String getBoard_sort() {
		return board_sort;
	}
	public void setBoard_sort(String board_sort) {
		this.board_sort = board_sort;
	}
}
