package vo;

// DB 연결 시, 날짜 구별을 위한 VO
public class DateInfo {
	
	private int startrow;
	private int startDate;
	private int endDate;
	
	

	public int getStartrow() {
		return startrow;
	}
	public void setStartrow(int startrow) {
		this.startrow = startrow;
	}
	public int getStartDate() {
		return startDate;
	}
	public void setStartDate(int startDate) {
		this.startDate = startDate;
	}
	public int getEndDate() {
		return endDate;
	}
	public void setEndDate(int endDate) {
		this.endDate = endDate;
	}
	

}
