package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class UserDAO {
	/* ID 중복확인 */
	// 서블릿에서 전달된 ID를 활용 -> 회원정보 조회 -> 결과를 true / false로 반환.
	public boolean isIdExist(String id) {		// id : 클라이언트가 입력한 id를 가져옴.
		boolean result = false;	
		ArrayList<String> id_list = new ArrayList<String>();		// db에서 빼온 id 저장용.
		
		Connection conn = null;
		Statement st = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/river?useSSL=false&characterEncoding=UTF-8", "root", "adsl48596!");
		
			st = conn.createStatement();
			ResultSet rs = st.executeQuery("select id from member_info;");
			while(rs.next()) {
				String id_check = rs.getString("id");
				
				id_list.add(id_check);
			}
			
			if(id_list.contains(id)==true) {	// 중복인 상태.
				result = true;
			} else {
				result = false;
			}
					
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;		// 중복 : true , 중복x : false 리턴.
	}
	
	/* 연락처 중복확인 */
	public boolean isTelExist(String tel_input) {		// tel_input: 사용자가 입력한 연락처
		boolean result = false;	
		ArrayList<String> tel_list = new ArrayList<String>();	
		
		Connection conn = null;
		Statement st = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/river?useSSL=false&characterEncoding=UTF-8", "root", "adsl48596!");
		
			st = conn.createStatement();
			ResultSet rs = st.executeQuery("select tel from member_info;");
			while(rs.next()) {
				String tel_check = rs.getString("tel");
				
				tel_list.add(tel_check);
			}
			
			if(tel_list.contains(tel_input)==true) {	// 중복인 상태.
				result = true;
			} else {
				result = false;
			}
					
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;		// 중복 : true , 중복x : false 리턴.
	}
	
	/* 이메일 중복확인 */
	public boolean isEmailExist(String email_input) {		// email_input: 사용자가 입력한 이메일
		boolean result = false;	
		ArrayList<String> email_list = new ArrayList<String>();	
		
		Connection conn = null;
		Statement st = null;
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/river?useSSL=false&characterEncoding=UTF-8", "root", "adsl48596!");
		
			st = conn.createStatement();
			ResultSet rs = st.executeQuery("select email from member_info;");
			while(rs.next()) {
				String email_check = rs.getString("email");
				
				email_list.add(email_check);
			}
			
			if(email_list.contains(email_input)==true) {	// 중복인 상태.
				result = true;
			} else {
				result = false;
			}
					
		} catch(Exception e) {
			e.printStackTrace();
		}
		
		return result;		// 중복 : true , 중복x : false 리턴.
	}
}
