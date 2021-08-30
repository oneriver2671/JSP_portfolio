package user;

import java.io.IOException;
import java.io.PrintWriter;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


@WebServlet("/telCheck.join")
public class UserTelCheckAction extends HttpServlet {
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
	}
	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException{
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=utf-8");
		PrintWriter writer = response.getWriter();				// java.io에 있음. 이거 쓰임 확인.
		String tel_input = (String)request.getParameter("tel_input");
		UserDAO userDAO = new UserDAO();
		boolean isTelExist = userDAO.isTelExist(tel_input);		// ID 중복 여부 체크.
		
		// ajax에서 'data'로 들어가는 값들
		if(isTelExist == true) {
			writer.print("not_usable");		// 중복 존재 시.
		} else {
			writer.print("usable");			// 중복 미존재 시.
		}
		
		
	}
}
