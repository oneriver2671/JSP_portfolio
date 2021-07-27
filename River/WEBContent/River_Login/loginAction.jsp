<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%request.setCharacterEncoding("utf-8"); %>   	

<%
	String id_input = request.getParameter("id_input");					// id
	String pwd_input = request.getParameter("pwd_input");				// pwd
	String id = "test";
	String pwd = "test";
	int temp = 0;
	
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
	
		
		ResultSet rs = st.executeQuery("select id, pwd from member_info where id='"+id_input+"';");        
		
		if(rs.next()){		// id가 있는 경우.
			id = rs.getString("id");
			pwd = rs.getString("pwd");
			
			if(!pwd_input.equals(pwd)){		
				out.println("<script>alert('비밀번호가 일치하지 않습니다.');");
				out.println("history.back()");
				out.println("</script>");
			} else{      // 로그인 성공.
				session.setAttribute("id", id);		// id를 세션에 등록 ★★★	
				out.println("<script>location.href = '../River_Index/index.jsp';</script>");    // 근데 이거 여기있으면... 밑에 finally 실행 안되는거 아님??
			}
			
		} else{		// id가 없는 상황.
			out.println("<script>alert('존재하지 않는 id입니다.');");
			out.println("history.back()");
			out.println("</script>");
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
	
		// dispatcher 대신 위에서 response.sendRedirect를 써줬다. 이 차이는??? (어차피 session에 등록시켰으니 그냥 탈출해도 무방하지만.)
			// RequestDispatcher dispatcher = request.getRequestDispatcher("Prac_Modify.jsp");	
		  // dispatcher.forward(request, response);

%>
    