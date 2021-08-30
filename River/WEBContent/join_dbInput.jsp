<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>

<%request.setCharacterEncoding("utf-8"); %>   	
<!DOCTYPE html>
<html>
<head>
  <meta charset="UTF-8">
  <title></title>
</head>

	<%
	String name = request.getParameter("nameInput");				// 이름
	String id = request.getParameter("idInput");						// id
	String pwd = request.getParameter("pwdInput");					// pwd
	String pwdCheck = request.getParameter("pwdCheck"); 		// pwd 확인
	String birth_year = request.getParameter("birth_1");		// 생년월일 (연도)
	String birth_month = request.getParameter("birth_2_1");	// 생년월일 (월)
	String birth_day = request.getParameter("birth_2_2");		// 생년월일 (일)
  String gender = request.getParameter("gender");					// 성별
  String tel_02 = request.getParameter("tel_02");					// 연락처 중간자리
  String tel_03 = request.getParameter("tel_03");					// 연락처 뒷자리
  String tel = request.getParameter("tel_01") + tel_02 + tel_03;			// 연락처
  String tel_sort = request.getParameter("tel_sort");			// 통신사 종류
  String mail_front = request.getParameter("mail_front");
  String mail_back =  request.getParameter("mail_back");
  String email = mail_front + "@" + mail_back;		        // 이메일
	String addrNum = request.getParameter("add_input_1");		// 우편번호
	String addr = "("+addrNum+") " + request.getParameter("add_input_2") +" "+ request.getParameter("addr_detail");			// 주소 (참고주소는 따로 가져오지 않음.)
	String mailOK = request.getParameter("mailOK");					// 이메일 수신여부 (0 or 1)		
	String smsOK = request.getParameter("sms_ok");					// sms 수신여부	(0 or 1)
	
	// 생년월일 변환 작업 (ex: 6월 7일 -> 06월 07일)
	if(birth_month.length()==1){
		birth_month = "0" + birth_month;
	}
	if(birth_day.length()==1){
		birth_day = "0" + birth_day;
	}
	String birth_temp = birth_year + birth_month + birth_day;
	int birth = Integer.parseInt(birth_temp);							// 생년월일
	
	
	int temp = 0;		// 회원가입 조건 충족 시, temp = 1이 되어 db에 insert 시작.

	
		/*---------------- ★ id 중복확인 필요함. 중복이면 넣지 못하게 ★ --------------*/
	// id 중복확인도 해야함 + email 중복확인도 해야함 (버튼이 눌리지 않으면 못넘어가게.)
	
	
		Connection conn = null;
		Statement st = null;
		// db와 연결 시작.
		try{
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn = DriverManager.getConnection("jdbc:mysql://localhost:3306/river?useSSL=false&characterEncoding=UTF-8", "root", "adsl48596!");
			if(conn == null){
				throw new Exception("데이터베이스 연결 실패.<br>");
			}
			st = conn.createStatement();
			
			/* id, 폰번호, 이메일 중복확인 체크용 select */
			ArrayList<String> id_list = new ArrayList<String>();
			ArrayList<String> tel_list = new ArrayList<String>();
			ArrayList<String> email_list = new ArrayList<String>();
			
			ResultSet rs = st.executeQuery("select id, tel, email from member_info;");
			while(rs.next()){
				String id_check = rs.getString("id");
				String tel_check = rs.getString("tel");
				String email_check = rs.getString("email");
				
				id_list.add(id_check);
				tel_list.add(tel_check);
				email_list.add(email_check);
			}
			
			
			/*------ 회원가입 insert ------*/
			int rowNum = st.executeUpdate("insert into member_info(name, id, pwd, birth, sex, tel, tel_sort, email, addr, email_ok, sms_ok) values('"+
										name+"', '"+id+"', '"+pwd+"', "+birth+", '"+gender+"', '"+tel+"', '"+tel_sort+"', '"+email+"', '"+addr+"', '"+
										mailOK+"', '"+smsOK+"');");                
			if(rowNum < 1){			
				throw new Exception("데이터 입력 실패.");        
			} else{
				out.println("<script>alert('회원가입이 완료되었습니다.');</script>");			
				out.println("<script>location.href = 'index.jsp'; </script>");   // 위에 history.back 때문인지, alert 떠도 이게 실행이 안됨.
				// response.sendRedirect("index.jsp");				// 이거쓰면 alert가 안뜸. 이건 어떨때 사용하는가?
			}
			
			
		
		} finally{
			try{
				st.close();
			} catch(Exception ignored){
			}
			try{
				conn.close();
			} catch(Exception ignored){
			}
		}
	
		
		// dispatcher 대신 위에서 response.sendRedirect를 써줬다. 이 차이는???
			// RequestDispatcher dispatcher = request.getRequestDispatcher("Prac_Modify.jsp");	
		  // dispatcher.forward(request, response);

%>
