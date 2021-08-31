package perform;

public class PerformBookDTO {
	String member_id;	// 예약자 ID
	int perform_num;	// 예약하는 공연
	String seat;		// 예악하는 좌석
	
	
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
	public String getSeat() {
		return seat;
	}
	public void setSeat(String seat) {
		this.seat = seat;
	}
	
	

}
