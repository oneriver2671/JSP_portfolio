package vo;

public class MemberLikeInfo {
	
	private String member_id;
	private int perform_num;		// 공연 ID
	private int board_num;			// 게시판 ID
	
	
	public String getMember_id() {
		return member_id;
	}
	public void setMember_id(String member_id) {
		this.member_id = member_id;
	}
	public int getPerform_num() {
		return perform_num;
	}
	public void setPerform_num(int perform_num) {
		this.perform_num = perform_num;
	}
	public int getBoard_num() {
		return board_num;
	}
	public void setBoard_num(int board_num) {
		this.board_num = board_num;
	}
	
}
