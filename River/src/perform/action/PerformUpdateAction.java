package perform.action;

import java.time.DayOfWeek;
import java.time.LocalDate;
import java.util.ArrayList;
import java.util.Enumeration;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.oreilly.servlet.MultipartRequest;
import com.oreilly.servlet.multipart.DefaultFileRenamePolicy;

import perform.PerformDTO;
import perform.svc.PerformInsertService;
import perform.svc.PerformUpdateService;
import vo.ActionForward;

public class PerformUpdateAction implements PerformAction{

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
		
		Enumeration test = multi.getFileNames();
		ArrayList<String> attached = new ArrayList<String>();
		
		while(test.hasMoreElements()) {
			attached.add(multi.getOriginalFileName((String)test.nextElement()));
		}
		
		// 수정할 공연 ID. hidden값으로 넘어옴. (제일 중요 ★★)
		int perform_num = Integer.parseInt(multi.getParameter("perform_num"));
		
		
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
		
		
		// 공연 '요일', 티켓오픈일 '요일' 구하기
		String perform_dayOfWeek = null;
		String open_dayOfWeek = null;
	
		LocalDate perform_date_temp = LocalDate.of(Integer.parseInt(multi.getParameter("date_year")), Integer.parseInt(multi.getParameter("date_month")), Integer.parseInt(multi.getParameter("date_day")));
		DayOfWeek perform_dayOfWeek_enum = perform_date_temp.getDayOfWeek();
		int perform_dayOfWeekNumber = perform_dayOfWeek_enum.getValue();
		
		switch(perform_dayOfWeekNumber) {
		case(1):
			perform_dayOfWeek = "월"; break;
		case(2):
			perform_dayOfWeek = "화"; break;
		case(3):
			perform_dayOfWeek = "수"; break;
		case(4):
			perform_dayOfWeek = "목"; break;
		case(5):
			perform_dayOfWeek = "금"; break;
		case(6):
			perform_dayOfWeek = "토"; break;
		case(7):
			perform_dayOfWeek = "일"; break;
		}
		
		LocalDate open_date_temp = LocalDate.of(Integer.parseInt(multi.getParameter("open_year")), Integer.parseInt(multi.getParameter("open_month")), Integer.parseInt(multi.getParameter("open_day")));
		DayOfWeek open_dayOfWeek_enum = open_date_temp.getDayOfWeek();
		int open_dayOfWeekNumber = open_dayOfWeek_enum.getValue();
		
		switch(open_dayOfWeekNumber) {
		case(1):
			open_dayOfWeek = "월"; break;
		case(2):
			open_dayOfWeek = "화"; break;
		case(3):
			open_dayOfWeek = "수"; break;
		case(4):
			open_dayOfWeek = "목"; break;
		case(5):
			open_dayOfWeek = "금"; break;
		case(6):
			open_dayOfWeek = "토"; break;
		case(7):
			open_dayOfWeek = "일"; break;
		}
		
		
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
		int price_All;
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
		if(multi.getParameter("seat_price_All").equals("")) {
			price_All = 0;
		} else {
			price_All = Integer.parseInt(multi.getParameter("seat_price_All"));
		}
	
		
		/* 공연정보 dto에 담기 */
		performDTO = new PerformDTO();
		performDTO.setPerform_num(perform_num);   	// Insert와 차이 ★★
		performDTO.setPerform_title(multi.getParameter("title"));
		performDTO.setPerform_date(perform_date);
		performDTO.setLocation(multi.getParameter("location"));
		performDTO.setArtist_main(multi.getParameter("artist_main"));
		performDTO.setRunning_time(Integer.parseInt(multi.getParameter("running_time")));
		performDTO.setIntermission(Integer.parseInt(multi.getParameter("intermission")));
		performDTO.setMain_img(attached.get(0));
		performDTO.setSub_img(attached.get(1));
		performDTO.setIntro_text(multi.getParameter("intro_perform"));
		performDTO.setPerform_host(multi.getParameter("perform_host"));
		performDTO.setLimit_age(limit_age);
		performDTO.setOpen_date(open_date);
		performDTO.setPrice_R(price_R);
		performDTO.setPrice_S(price_S);
		performDTO.setPrice_A(price_A);
		performDTO.setPrice_B(price_B);
		performDTO.setPerform_day(perform_dayOfWeek);
		performDTO.setOpen_day(open_dayOfWeek);
		performDTO.setPrice_All(price_All);

		
		// model 객체 호출
		PerformUpdateService performUpdateService = new PerformUpdateService();
		int updateResult = performUpdateService.updatePerform(performDTO);
		
		if(updateResult == 0) {
			System.out.println("수정 실패!");
		} else {
			System.out.println("수정 성공");
			forward = new ActionForward();
			forward.setRedirect(true);
			forward.setPath("performList.pe");	
		}
		
		return forward;
	}

}
