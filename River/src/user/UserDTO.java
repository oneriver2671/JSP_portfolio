package user;


public class UserDTO {
	String name;		// 이름
	String id;			// 아이디
	String pwd;			// 비밀번호
	int birth;			// 생년월일
	String gender;		// 성별
	String tel;			// 전화번호
	String tel_sort;	// 통신사
	String email;		// 이메일
	String addr;		// 주소
	String eamil_ok;	// 이메일 수신여부
	String sms_ok;		// sms 수신여부
	String like_perform;	// 좋아요 클릭한 작품들
	String like_teacher;	// 좋아요 클릭한 레슨 선생님들
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public String getPwd() {
		return pwd;
	}
	public void setPwd(String pwd) {
		this.pwd = pwd;
	}
	public int getBirth() {
		return birth;
	}
	public void setBirth(int birth) {
		this.birth = birth;
	}
	public String getGender() {
		return gender;
	}
	public void setGender(String gender) {
		this.gender = gender;
	}
	public String getTel() {
		return tel;
	}
	public void setTel(String tel) {
		this.tel = tel;
	}
	public String getTel_sort() {
		return tel_sort;
	}
	public void setTel_sort(String tel_sort) {
		this.tel_sort = tel_sort;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getAddr() {
		return addr;
	}
	public void setAddr(String addr) {
		this.addr = addr;
	}
	public String getEamil_ok() {
		return eamil_ok;
	}
	public void setEamil_ok(String eamil_ok) {
		this.eamil_ok = eamil_ok;
	}
	public String getSms_ok() {
		return sms_ok;
	}
	public void setSms_ok(String sms_ok) {
		this.sms_ok = sms_ok;
	}
	public String getLike_perform() {
		return like_perform;
	}
	public void setLike_perform(String like_perform) {
		this.like_perform = like_perform;
	}
	public String getLike_teacher() {
		return like_teacher;
	}
	public void setLike_teacher(String like_teacher) {
		this.like_teacher = like_teacher;
	}

	
	
}
