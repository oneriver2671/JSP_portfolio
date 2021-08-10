package perform.action;

import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import perform.PerformDTO;

import perform.svc.PerformInsertService;
import vo.ActionForward;

public class PerformInsertAction implements PerformAction {

	@Override
	public ActionForward execute(HttpServletRequest request, HttpServletResponse response) throws Exception {
		ActionForward forward = null;
		PerformDTO performDTO = null;
		String realFolder="";
		String saveFolder="/performUpload";	
		int fileSize=5*1024*1024;
		ServletContext context = request.getServletContext();
		realFolder=context.getRealPath(saveFolder);   		
		MultipartRequest multi = new MultipartRequest(request,realFolder,fileSize,"UTF-8",new DefaultFileRenamePolicy());
		
		
//		String test = multi.getOriginalFileName((String)multi.getFileNames().nextElement());
		
		Enumeration test = multi.getFileNames();
		ArrayList<String> attached = new ArrayList<String>();
		
		while(test.hasMoreElements()) {
			attached.add(multi.getOriginalFileName((String)test.nextElement()));
		}
		
		System.out.println(attached);
		System.out.println(multi.getParameter("title"));
		System.out.println(multi.getParameter("location"));
		System.out.println(multi.getParameter("program_title"));
		System.out.println(multi.getParameter("artist_main"));
		System.out.println(multi.getParameter("running_time"));
		System.out.println(multi.getParameter("intermission"));
		
	
		// '공연 날짜+시간' 한 문자열로 처리
		String perform_year = multi.getParameter("date_year");
		String perform_month;
		String perform_day;
		String perform_hour = multi.getParameter("date_hour");
		String perform_minute = multi.getParameter("date_minute");
		
		if(multi.getParameter("date_month").length()==1) {
			perform_month = "0"+multi.getParameter("date_month");
		} else {
			perform_month = multi.getParameter("date_month");
		}
		if(multi.getParameter("date_day").length()==1) {
			perform_day = "0"+ multi.getParameter("date_day");
		} else {
			perform_day = multi.getParameter("date_day");	
		}

		String perform_date = perform_year + perform_month + perform_day + perform_hour + perform_minute + "00";
		
		
		// '티켓오픈일' 한 문자열로 처리
		String open_year = multi.getParameter("open_year");
		String open_month;
		String open_day;
		String open_hour = multi.getParameter("open_hour");
		String open_minute = multi.getParameter("open_minute");
		
		if(multi.getParameter("open_month").length()==1) {
			open_month = "0"+multi.getParameter("open_month");
		} else {
			open_month = multi.getParameter("open_month");
		}
		if(multi.getParameter("open_day").length()==1) {
			open_day = "0"+ multi.getParameter("open_day");
		} else {
			open_day = multi.getParameter("open_day");	
		}
	
		String open_date = open_year + open_month + open_day + open_hour + open_minute + "00";
		
		
		
		// 제한연령 null값 처리
		int limit_age;
		if(multi.getParameter("limit_age").equals("")) {
			limit_age = 0;
		} else {
			limit_age = Integer.parseInt(multi.getParameter("limit_age"));
		}
		
		int possible_seat = 0;
		if(multi.getParameter("location").equals("롯데 콘서트홀")) {
			possible_seat = 2036;
		}
		
		// 가격 null값 처리
		int price_R;
		int price_S;
		int price_A;
		int price_B;
		int priceLow_R;
		int priceLow_S;
		int priceLow_A;
		if(multi.getParameter("seat_price_R").equals("")) {
			price_R = 0;
		} else {
			price_R = Integer.parseInt(multi.getParameter("seat_price_R"));
		}
		if(multi.getParameter("seat_price_S").equals("")) {
			price_S = 0;
		} else {
			price_S = Integer.parseInt(multi.getParameter("seat_price_S"));
		}
		if(multi.getParameter("seat_price_A").equals("")) {
			price_A = 0;
		} else {
			price_A = Integer.parseInt(multi.getParameter("seat_price_A"));
		}
		if(multi.getParameter("seat_price_B").equals("")) {
			price_B = 0;
		} else {
			price_B = Integer.parseInt(multi.getParameter("seat_price_B"));
		}
		if(multi.getParameter("seat_priceLow_R").equals("")) {
			priceLow_R = 0;
		} else {
			priceLow_R = Integer.parseInt(multi.getParameter("seat_priceLow_R"));
		}
		if(multi.getParameter("seat_priceLow_S").equals("")) {
			priceLow_S = 0;
		} else {
			priceLow_S = Integer.parseInt(multi.getParameter("seat_priceLow_S"));
		}
		if(multi.getParameter("seat_priceLow_A").equals("")) {
			priceLow_A = 0;
		} else {
			priceLow_A = Integer.parseInt(multi.getParameter("seat_priceLow_A"));
		}
		
		
		/* 공연정보 dto에 담기 */
		performDTO = new PerformDTO();
		performDTO.setPerform_title(multi.getParameter("title"));
		performDTO.setPerform_date(perform_date);
		performDTO.setLocation(multi.getParameter("location"));
		performDTO.setProgram_title(multi.getParameter("program_title"));
		performDTO.setArtist_main(multi.getParameter("artist_main"));
		performDTO.setArtist_collabo(multi.getParameter("artist_sub"));
		performDTO.setRunning_time(Integer.parseInt(multi.getParameter("running_time")));
		performDTO.setIntermission(Integer.parseInt(multi.getParameter("intermission")));
		performDTO.setMain_img(attached.get(0));
		performDTO.setSub_img(attached.get(1));
		performDTO.setIntro_text(multi.getParameter("intro_perform"));
		performDTO.setArtist_introText(multi.getParameter("intro_artist"));
		performDTO.setPerform_host(multi.getParameter("perform_host"));
		performDTO.setLimit_age(limit_age);
		performDTO.setPossible_seat(possible_seat);
		performDTO.setOpen_date(open_date);
		performDTO.setPrice_R(price_R);
		performDTO.setPrice_S(price_S);
		performDTO.setPrice_A(price_A);
		performDTO.setPrice_B(price_B);
		performDTO.setPriceLow_R(priceLow_R);
		performDTO.setPriceLow_S(priceLow_S);
		performDTO.setPriceLow_A(priceLow_A);
		

		
		// model 객체 호출
		PerformInsertService performInsertService = new PerformInsertService();
		boolean isInsertSuccess = performInsertService.registArticle(performDTO);
		if(!isInsertSuccess) {
			System.out.println("입력 실패!");
		} else {
			System.out.println("입력 성공");
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("perform_list.jsp");	// 매핑주소로 대체될 것.
		}
	
		
		
		
		return forward;
	}

}
