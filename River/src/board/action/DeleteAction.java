package board.action;

import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import board.svc.DeleteService;
import vo.ActionForward;

public class DeleteAction implements Action {
	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {	
		// request.setCharacterEncoding("utf-8");
		// response.setCharacterEncoding("utf-8");
		
		PrintWriter out = response.getWriter();
		ActionForward forward = null;
		int board_num = Integer.parseInt(request.getParameter("orders"));
		String sort = request.getParameter("sort");
		System.out.println(sort + " deleteAction");
		
		DeleteService deleteService = new DeleteService();	// Model 객체 생성

		boolean isDeleteSuccess = deleteService.removeArticle(board_num);	 // 삭제 성공 시 true 반환.

		if(!isDeleteSuccess){
			out.println("<script>");
			out.println("alert('삭제에 실패하였습니다. 관리자에게 문의하여 주세요.');");
			out.println("history.back();");
			out.println("</script>");
			// out.close();   // 이게 있어야 script가 제대로 실행되는데, 대신 forward로 이동하는게 안됨..
		}
		else{
			out.println("<script>");
			out.println("alert('삭제가 완료되었습니다.');");
			out.println("</script>");
			// out.close();   // 이게 있어야 script가 제대로 실행되는데, 대신 forward로 이동하는게 안됨..
	
			forward = new ActionForward();
			forward.setRedirect(true);
			
			// sort가 한글일 때, controller에서 sendRedirect()할 때 한글깨짐 발생. 해결 ok.
			String encoded_sort = URLEncoder.encode(sort, "utf-8");
			forward.setPath("boardList.bo?sort="+encoded_sort);	  
		}
		
		return forward;
	}
}
