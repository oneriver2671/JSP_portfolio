package perform;

public class PerformSeatDTO {
	
	private int perform_num;			// 공연 ID
	private String perform_location;	// 공연장
	private String booked_seat;			// 예약된 좌석 현황
	private int remain_R;		// 남은 좌석 수 (R석)
	private int remain_S;		// 남은 좌석 수 (S석)
	private int remain_A;		// 남은 좌석 수 (A석)
	private int remain_B;		// 남은 좌석 수 (B석)
	private int remain_all;		// 남은 좌석 수 (전석)
	
	
	public int getPerform_num() {
		return perform_num;
	}
	public void setPerform_num(int perform_num) {
		this.perform_num = perform_num;
	}
	public String getPerform_location() {
		return perform_location;
	}
	public void setPerform_location(String perform_location) {
		this.perform_location = perform_location;
	}
	public String getBooked_seat() {
		return booked_seat;
	}
	public void setBooked_seat(String booked_seat) {
		this.booked_seat = booked_seat;
	}
	public int getRemain_R() {
		return remain_R;
	}
	public void setRemain_R(int remain_R) {
		this.remain_R = remain_R;
	}
	public int getRemain_S() {
		return remain_S;
	}
	public void setRemain_S(int remain_S) {
		this.remain_S = remain_S;
	}
	public int getRemain_A() {
		return remain_A;
	}
	public void setRemain_A(int remain_A) {
		this.remain_A = remain_A;
	}
	public int getRemain_B() {
		return remain_B;
	}
	public void setRemain_B(int remain_B) {
		this.remain_B = remain_B;
	}
	public int getRemain_all() {
		return remain_all;
	}
	public void setRemain_all(int remain_all) {
		this.remain_all = remain_all;
	}
	
	

}
