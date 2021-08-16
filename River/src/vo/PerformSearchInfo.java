package vo;

// DB 연결 시, 날짜 구별을 위한 VO
public class PerformSearchInfo {
	
	private int startrow;
	private int startDate;		// 검색조건: 시작날짜
	private int endDate;		// 검색조건: 끝날짜
	private String location;	// 검색조건: 공연장 종류
	

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
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	

}
