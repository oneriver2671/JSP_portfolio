package board.action;

import java.io.PrintWriter;
import java.net.URLEncoder;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import board.BoardDTO;
import board.svc.WriteService;
import vo.ActionForward;

public class WriteAction implements Action {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		BoardDTO boardDTO = null;
		String realFolder="";
		String saveFolder="/River_Board/boardUpload";	// 경로 ok.
		int fileSize=5*1024*1024;
		ServletContext context = request.getServletContext();
		realFolder=context.getRealPath(saveFolder);   		
		MultipartRequest multi = new MultipartRequest(request,realFolder,fileSize,"UTF-8",new DefaultFileRenamePolicy());
		
		String sort = multi.getParameter("sort");	
		/* 게시글 dto 객체에 내용 담기 */		
		boardDTO = new BoardDTO();
		boardDTO.setSort(sort);
		boardDTO.setTitle(multi.getParameter("title"));
		boardDTO.setContent(multi.getParameter("content"));
		boardDTO.setWriter_id(request.getParameter("writer_id"));	// 쿼리스트링으로 들어옴.
		boardDTO.setAttached(multi.getOriginalFileName((String)multi.getFileNames().nextElement()));   // 첨부파일 이름만 db에 저장됨.
	
		
		// 이제 model 객체 불러서 처리해야 함.
		WriteService writeService = new WriteService();
		boolean isWriteSuccess = writeService.registArticle(boardDTO);
		
		if(!isWriteSuccess){	
			response.setContentType("text/html;charset=UTF-8");
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('입력 실패!')");
			out.println("history.back();");
			out.println("</script>");
		}
		else{	// 입력 성공.
			PrintWriter out = response.getWriter();
			out.println("<script>");
			out.println("alert('게시글 작성이 완료되었습니다.')");
			out.println("</script>");
			forward = new ActionForward();
			forward.setRedirect(true);
			
			String encoded_sort = URLEncoder.encode(sort, "utf-8");
			forward.setPath("boardList.bo?sort="+encoded_sort);	// 왜 sort가 안넘어가는 것일까...

		}
	
		return forward;
	}

}
