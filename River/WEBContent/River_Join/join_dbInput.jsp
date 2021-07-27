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
	String name = request.getParameter("nameInput");			// 이름
	String id = request.getParameter("idInput");					// id
	String pwd = request.getParameter("pwdInput");				// pwd
	String pwdCheck = request.getParameter("pwdCheck"); 	// pwd 확인
  String birth_temp = request.getParameter("birth_1") + request.getParameter("birth_2_1") + request.getParameter("birth_2_2");
  // 월, 일 값들이 01, 02 처럼 입력되어야 함. length가 1일때, 앞에 0을 붙이는걸로 해결해보자.
	int birth = Integer.parseInt(birth_temp);							// 생년월일
  String gender = request.getParameter("gender");				// 성별
  String tel_02 = request.getParameter("tel_02");				// 연락처 중간자리
  String tel_03 = request.getParameter("tel_03");				// 연락처 뒷자리
  String tel = request.getParameter("tel_01") + tel_02 + tel_03;			// 연락처
  String tel_sort = request.getParameter("tel_sort");			// 통신사 종류
  String mail_front = request.getParameter("mail_front");
  String mail_back =  request.getParameter("mail_back");
  String email = mail_front + "@" + mail_back;		          // 이메일
	String addrNum = request.getParameter("add_input_1");			// 우편번호
	String addr = "("+addrNum+") " + request.getParameter("add_input_2") +" "+ request.getParameter("addr_detail");			// 주소 (참고주소는 따로 가져오지 않음.)
	String mailOK = request.getParameter("mailOK");					// 이메일 수신여부 (0 or 1)		
	String smsOK = request.getParameter("sms_ok");					// sms 수신여부	(0 or 1)
	
	
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
			
		
			
			/*---- 아이디 중복확인 ----*/
			/* if(id_list.contains(id) == true){	
				out.println("<script>");
				out.println("alert('이미 존재하는 id입니다.')");
				out.println("history.back();");
				out.println("</script>");
			} else{			
				String str = "idOk";
				
				out.println("<script>");
				out.println("alert('사용 가능한 id입니다.')");		
				out.println("history.back();");					  // 이 때, 뭔가를 넘겨주고 싶음 -> 그래야 '가입하기' 버튼 누를 때 중복확인 했는지 체크할 수 있음.
																					        // request.setAttribute를 시도해보자. 그리고 가입페이지 돌아가도, request가 남아있게. 아님 session을 잠시 쓰던가.
				out.println("</script>");
			
			} */
			
	
			
			/* '가입하기' 버튼 클릭 후, script 조건을 만족한 경우. (위의 코드들이 실행안되게 하고 싶은데...) */
			// 다른 input:button들과 구분하기 위함(특히 '중복확인' 버튼). form 내에서 onClick 시 다 이 페이지로 넘어오기 때문에, '구분'해주기 위함.
			/* if(!name.equals("") && !id.equals("") && !pwd.equals("") && !tel_02.equals("") && !tel_03.equals("") 
					&& !mail_front.equals("") && !mail_back.equals("")){
				temp = 1;
			} */
			

			
			/*------ 회원가입 insert ------*/
			int rowNum = st.executeUpdate("insert into member_info(name, id, pwd, birth, sex, tel, tel_sort, email, addr, email_ok, sms_ok) values('"+
										name+"', '"+id+"', '"+pwd+"', "+birth+", '"+gender+"', '"+tel+"', '"+tel_sort+"', '"+email+"', '"+addr+"', '"+
										mailOK+"', '"+smsOK+"');");                
			if(rowNum < 1){			
				throw new Exception("데이터 입력 실패.");        
			} else{
				out.println("<script>alert('회원가입이 완료되었습니다.');</script>");			
				out.println("<script>location.href = '../River_Index/index.jsp'; </script>");   // 위에 history.back 때문인지, alert 떠도 이게 실행이 안됨.
				// response.sendRedirect("../River_Index/index.jsp");				// 이거쓰면 alert가 안뜸. 이건 어떨때 사용하는가?
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
