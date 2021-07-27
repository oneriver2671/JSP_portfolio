package board;

public class BoardDTO {
	int orders;				// 번호 (자동증가)
	String sort;			// 게시판 종류
	String writer_id;		// 작성자 id
	String title;			// 제목
	String content;			// 내용
	String writed_date; 	// 작성된 날짜+시간. (int로 할까 고민중)
	int check_num;			// 조회수
	int like_num;			// 좋아요 수
	String attached;		// 첨부파일 이름
	
	 
	public int getOrders() {
		return orders;
	}
	public void setOrders(int orders) {
		this.orders = orders;
	}
	public String getSort() {
		return sort;
	}
	public void setSort(String sort) {
		this.sort = sort;
	}
	public String getWriter_id() {
		return writer_id;
	}
	public void setWriter_id(String writer_id) {
		this.writer_id = writer_id;
	}
	public String getTitle() {
		return title;
	}
	public void setTitle(String title) {
		this.title = title;
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
	public int getCheck_num() {
		return check_num;
	}
	public void setCheck_num(int check_num) {
		this.check_num = check_num;
	}
	public int getLike_num() {
		return like_num;
	}
	public void setLike_num(int like_num) {
		this.like_num = like_num;
	}
	public String getAttached() {
		return attached;
	}
	public void setAttached(String attached) {
		this.attached = attached;
	}

}
