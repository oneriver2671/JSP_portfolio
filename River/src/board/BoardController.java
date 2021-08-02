package board;

import java.io.IOException;
import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import vo.ActionForward;
import board.action.*;

@WebServlet("*.bo")	
public class BoardController extends HttpServlet {
	// 그리고 Post로 넘겨주니 여기서도 doPost로 받아주는 것인듯 함. doGet으로 받으면 안되었음.

	//  ----- doProcess는 뭐가 다른건지 확인 ------
	protected void doProcess(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		request.setCharacterEncoding("utf-8");		// 한글설정
		// response.setCharacterEncoding("utf-8");
		response.setContentType("text/html;charset=UTF-8");  // 이거 없으면 out.println(<script>~) 부분 한글깨짐.
		
		String RequestURI=request.getRequestURI();
		String contextPath=request.getContextPath();
		String command=RequestURI.substring(contextPath.length());	
		ActionForward forward=null;
		Action action = null;
		
		/* 게시글 '목록' */
		if(command.equals("/boardList.bo")){	
			// ------- 이런식으로 쓰는게 최선인가? 그냥 boardList.bo로 들어오게 하는 법은 없나?? --------
			String sort = request.getParameter("sort");
			action = new ListAction();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}	
		/* 게시글 쓰기 */
		else if(command.equals("/boardWrite.bo")){	
			action = new WriteAction();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		/* 게시글 상세보기 */
		else if(command.equals("/boardDetail.bo")){	
			String sort = request.getParameter("sort");
			action = new DetailAction();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		/* 이전글, 다음글 보기 */
		else if(command.equals("/boardDetailMove.bo")){	
			action = new DetailMoveAction();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}	
		/* 게시글 삭제 */
		else if(command.equals("/boardDelete.bo")){	
			String sort = request.getParameter("sort");
			action = new DeleteAction();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		/* 게시글 수정 Form */
		else if(command.equals("/boardModifyForm.bo")){	
			action = new ModifyFormAction();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		/* 게시글 수정 */
		else if(command.equals("/boardModify.bo")){	
			action = new ModifyAction();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		/* 게시글 검색 */
		else if(command.equals("/boardSearch.bo")){	
			action = new SearchAction();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		/* 댓글 달기 */
		else if(command.equals("/boardCommentWrite.bo")){	
			action = new CommentWriteAction();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		/* 댓글 삭제 */
		else if(command.equals("/boardCommentDelete.bo")){	
			action = new CommentDeleteAction();
			try{
				forward = action.execute(request, response);
			}catch(Exception e){
				e.printStackTrace();
			}
		}
		/* 좋아요 클릭 시 */
		else if(command.equals("/boardLikeNum.bo")){	
			action = new LikeNumAction();
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
	
	
	protected void doGet(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doProcess(request,response);
	}  	

	protected void doPost(HttpServletRequest request, HttpServletResponse response) 
			throws ServletException, IOException {
		doProcess(request,response);
	}   
	
	
	
	

}
