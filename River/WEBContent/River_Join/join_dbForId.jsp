<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8" %>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.ArrayList" %>

<%request.setCharacterEncoding("utf-8"); %>   	

	<%
	String id = request.getParameter("idInput");					// id
	
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
			
			if(id_list.contains(id) == true){
				out.println("<script>");
				out.println("alert('이미 존재하는 id입니다.')");
				out.println("</script>");
			}
			
			
			
			
			// 중복확인을 위해 해당 페이지로 list를 가져감.
			request.setAttribute("id_list", id_list);
			request.setAttribute("tel_list", tel_list);
			request.setAttribute("email_list", email_list);
		
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
			 RequestDispatcher dispatcher = request.getRequestDispatcher("join_dbInput.jsp");	
		   dispatcher.forward(request, response);

%>
