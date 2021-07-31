package board.action;

import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import board.BoardDTO;
import board.svc.ModifyService;
import board.svc.WriteService;
import vo.ActionForward;

public class ModifyAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		PrintWriter out = response.getWriter();
		ActionForward forward = null;
		BoardDTO boardDTO = null;
		String realFolder="";
		String saveFolder="/boardUpload";	// 경로 ok.
		int fileSize=5*1024*1024;
		ServletContext context = request.getServletContext();
		realFolder=context.getRealPath(saveFolder);   		
		MultipartRequest multi = new MultipartRequest(request,realFolder,fileSize,"UTF-8",new DefaultFileRenamePolicy());
		
	
		/* 게시글 dto 객체에 내용 담기 */		
		boardDTO = new BoardDTO();
		String sort = multi.getParameter("sort");	 
		int orders = Integer.parseInt(request.getParameter("orders"));	// 얘만 쿼리스트링으로 들어옴.
		boardDTO.setOrders(orders);	
		boardDTO.setSort(sort);
		boardDTO.setTitle(multi.getParameter("title"));
		boardDTO.setContent(multi.getParameter("content"));
		boardDTO.setAttached(multi.getOriginalFileName((String)multi.getFileNames().nextElement()));   // 첨부파일 이름만 db에 저장됨.
	
		
		
		// 이제 model 객체 불러서 처리해야 함.
		ModifyService modifyService = new ModifyService();
		boolean isWriteSuccess = modifyService.modifyArticle(boardDTO);
		
		if(!isWriteSuccess){	
			out.println("<script>");
			out.println("alert('수정 실패. 관리자에게 문의해주세요.')");
			out.println("history.back();");
			out.println("</script>");
		}
		else{	// 입력 성공.
//			out.println("<script>");
//			out.println("alert('게시글 수정이 완료되었습니다.')");
//			out.println("</script>");
			forward = new ActionForward();
			forward.setRedirect(true);
			
			// 보낼 것 : sort, 게시판 번호
			String encoded_sort = URLEncoder.encode(sort, "utf-8");
			forward.setPath("boardDetail.bo?orders="+orders+"&sort="+encoded_sort);	
		}
		// out.close();
		
		return forward;
	}

}
