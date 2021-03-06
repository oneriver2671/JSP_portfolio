package perform;

public class PerformDTO {
	
	private int perform_num;		// PK. 
	private String perform_title;	// 제목
	private String perform_date;    // 날짜 + 시간 (datetime)
	private String location;		// 공연 장소
	private String artist_main;		// 메인 아티스트
	private int running_time;		// 러닝타임
	private int intermission;		// 인터미션 시간
	private String main_img;		// 포스터 사진
	private String sub_img;		    // 기타 이미지
	private String intro_text;		// 간략한 소개글
	private String perform_host;	// 주최
	private int limit_age;			// 관람연령제한
	private int like_num;		    // 좋아요 수
	private String open_date;		// 티켓예매 날짜
	private int price_R;			// R석 가격
	private int price_S;			// S석 가격
	private int price_A;			// A석 가격
	private int price_B;			// B석 가격
	private String perform_day;		// 공연 요일
	private String open_day;		// 티켓오픈 요일
	private int price_All;			// 전석 동일가격
	

	
	public int getPerform_num() {
		return perform_num;
	}
	public void setPerform_num(int perform_num) {
		this.perform_num = perform_num;
	}
	public String getPerform_title() {
		return perform_title;
	}
	public void setPerform_title(String perform_title) {
		this.perform_title = perform_title;
	}
	public String getLocation() {
		return location;
	}
	public void setLocation(String location) {
		this.location = location;
	}
	public String getPerform_date() {
		return perform_date;
	}
	public void setPerform_date(String perform_date) {
		this.perform_date = perform_date;
	}
	public String getArtist_main() {
		return artist_main;
	}
	public void setArtist_main(String artist_main) {
		this.artist_main = artist_main;
	}
	public int getRunning_time() {
		return running_time;
	}
	public void setRunning_time(int running_time) {
		this.running_time = running_time;
	}
	public int getIntermission() {
		return intermission;
	}
	public void setIntermission(int intermission) {
		this.intermission = intermission;
	}
	public String getMain_img() {
		return main_img;
	}
	public void setMain_img(String main_img) {
		this.main_img = main_img;
	}
	public String getSub_img() {
		return sub_img;
	}
	public void setSub_img(String sub_img) {
		this.sub_img = sub_img;
	}
	public String getIntro_text() {
		return intro_text;
	}
	public void setIntro_text(String intro_text) {
		this.intro_text = intro_text;
	}
	public String getPerform_host() {
		return perform_host;
	}
	public void setPerform_host(String perform_host) {
		this.perform_host = perform_host;
	}
	public int getLimit_age() {
		return limit_age;
	}
	public void setLimit_age(int limit_age) {
		this.limit_age = limit_age;
	}
	public int getLike_num() {
		return like_num;
	}
	public void setLike_num(int like_num) {
		this.like_num = like_num;
	}
	public String getOpen_date() {
		return open_date;
	}
	public void setOpen_date(String open_date) {
		this.open_date = open_date;
	}
	public int getPrice_R() {
		return price_R;
	}
	public void setPrice_R(int price_R) {
		this.price_R = price_R;
	}
	public int getPrice_S() {
		return price_S;
	}
	public void setPrice_S(int price_S) {
		this.price_S = price_S;
	}
	public int getPrice_A() {
		return price_A;
	}
	public void setPrice_A(int price_A) {
		this.price_A = price_A;
	}
	public int getPrice_B() {
		return price_B;
	}
	public void setPrice_B(int price_B) {
		this.price_B = price_B;
	}
	public String getPerform_day() {
		return perform_day;
	}
	public void setPerform_day(String perform_day) {
		this.perform_day = perform_day;
	}
	public String getOpen_day() {
		return open_day;
	}
	public void setOpen_day(String open_day) {
		this.open_day = open_day;
	}
	public int getPrice_All() {
		return price_All;
	}
	public void setPrice_All(int price_All) {
		this.price_All = price_All;
	}

	
}
