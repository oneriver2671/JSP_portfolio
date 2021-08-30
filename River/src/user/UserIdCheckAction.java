package user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/idCheck.join")
public class UserIdCheckAction extends HttpServlet {
	// 이 doGet 추가 안해주면 405 오류나왔다. 
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
	}
	
	// 그리고 Post로 넘겨주니 여기서도 doPost로 받아주는 것인듯 함. doGet으로 받으면 안되었음.
	protected void doPost(HttpServletRequest request, HttpServletResponse response) 	// doHandle 의미는?
			throws ServletException, IOException{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();				// java.io에 있음. 이거 쓰임 확인.
		String id = (String)request.getParameter("id");
		UserDAO userDAO = new UserDAO();
		boolean isIdExist = userDAO.isIdExist(id);		// ID 중복 여부 체크.
		
		// ajax에서 'data'로 들어가는 값들
		if(isIdExist == true) {
			writer.print("not_usable");		// 중복 존재 시.
		} else {
			writer.print("usable");			// 중복 미존재 시.
		}
		
		
	}
}
