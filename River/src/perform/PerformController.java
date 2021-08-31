package perform;

import java.io.IOException;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import perform.action.PerformAction;
import perform.action.PerformBookAction;
import perform.action.PerformDeleteAction;
import perform.action.PerformDetailAction;
import perform.action.PerformDetailUpdateAction;
import perform.action.PerformInsertAction;
import perform.action.PerformLikeAddAction;
import perform.action.PerformLikeListAction;
import perform.action.PerformLikeReduceAction;
import perform.action.PerformListAction;
import perform.action.PerformListByDateAction;
import perform.action.PerformListManagerAction;
import perform.action.PerformUpdateAction;
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
		
		/* 공연 목록 출력 (달 선택 시) */
		if(command.equals("/performListByDate.pe")) {
			
			action = new PerformListByDateAction();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
			
		}
		
		/* 공연 목록 출력 (관리자용) */
		if(command.equals("/performListManager.pe")) {
			
			action = new PerformListManagerAction();
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
		
		/* 공연정보 삭제 */
		if(command.equals("/performDelete.pe")) {
			
			action = new PerformDeleteAction();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
			
		}
		
		/* 공연정보 수정 */
		if(command.equals("/performUpdate.pe")) {
			
			action = new PerformUpdateAction();
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
		

		/* 공연정보 수정을 위한 정보출력 */
		if(command.equals("/performDetailUpdate.pe")) {
			
			action = new PerformDetailUpdateAction();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
			
		}
		
		/* 공연정보 좋아요 증가 */
		if(command.equals("/performLikeAdd.pe")) {
			
			action = new PerformLikeAddAction();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
			
		}
		
		/* 공연정보 좋아요 감소 */
		if(command.equals("/performLikeReduce.pe")) {
			
			action = new PerformLikeReduceAction();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
			
		}
		
		/* 티켓예매 */
		if(command.equals("/performBook.pe")) {
			
			action = new PerformBookAction();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
			
		}
		
		/* 공연 관심정보 List */
		if(command.equals("/performLikeList.pe")) {
			
			action = new PerformLikeListAction();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
			
		}

		if(forward != null){	
			// Redirect로 이동 (request, response가 초기화됨)
			if(forward.isRedirect()){
				response.sendRedirect(forward.getPath());
			}
			// Forward로 이동 (이전 페이지의 request를 쓸 수 있음)
			else{
				RequestDispatcher dispatcher  = request.getRequestDispatcher(forward.getPath());
				dispatcher.forward(request, response);					
			}
		}
		
		
	}
	
	

}
