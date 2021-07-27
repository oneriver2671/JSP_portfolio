package user;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.ResultSet;
import java.sql.Statement;
import java.util.ArrayList;

public class UserDAO {
	// 서블릿에서 전달된 ID를 활용 -> 회원정보 조회 -> 결과를 true / false로 반환.
	
	public boolean overlappedID(String id) {		// id : 클라이언트가 입력한 id를 가져옴.
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
}
