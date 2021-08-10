package perform;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import perform.action.PerformAction;
import perform.action.PerformDetailAction;
import perform.action.PerformInsertAction;
import perform.action.PerformListAction;
import vo.ActionForward;

@WebServlet("*.pe")
public class PerformController extends HttpServlet {

	@Override
	protected void service(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//		super.service(request, response);
		request.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");
		
		String RequestURI = request.getRequestURI();
		String contextPath = request.getContextPath();
		String command = RequestURI.substring(contextPath.length());	
		ActionForward forward = null;
		PerformAction action = null;
		
		
		/* 공연 목록 출력 */
		if(command.equals("/performList.pe")) {
			
			action = new PerformListAction();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
			
		}
		
		/* 공연 추가 */
		if(command.equals("/performAdd.pe")) {
			
			action = new PerformInsertAction();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
			
		}
		
		/* 공연 상세페이지 */
		if(command.equals("/performDetail.pe")) {
			
			action = new PerformDetailAction();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
			
		}
		
		
		
		
		
		
		
		if(forward != null){	
			if(forward.isRedirect()){
				response.sendRedirect(forward.getPath());
			}else{
				RequestDispatcher dispatcher  = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);					
			}
		}
		
		
	}
	
	

}
