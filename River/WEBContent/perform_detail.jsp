<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%> 
<%@ page import = "java.util.Date" %>
<%@ page import = "java.text.SimpleDateFormat" %>
<%@ page import = "perform.PerformDTO" %>
<%
	request.setCharacterEncoding("utf-8");
	String id = (String)session.getAttribute("id");			// 로그인 상태 회원 정보
%>
<%
  PerformDTO performDTO = (PerformDTO)request.getAttribute("performDTO");		// 공연정보 불러오기
  
  /* 날짜 비교를 위한 Java코드 */
	 SimpleDateFormat dataFormat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
	 Date today_date = (Date)request.getAttribute("today_date");		// Controller에서 넘어온 '오늘 날짜'
	 boolean isLike = (Boolean)request.getAttribute("isLike");		// 게시글 좋아요 누른 회원인지 확인용
%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>공연예매</title>
 <!-- CSS 파일 -->
 <link rel="stylesheet" type="text/css" href="style/perform_detail.css" media="screen" />

 <link href="https://fonts.googleapis.com/css2?family=Nanum+Gothic&display=swap" rel="stylesheet">
 <!-- Font Awesome CDN -->
 <link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.15.3/css/all.css" integrity="sha384-SZXxX4whJ79/gErwcOYf+zWLeJdY/qpuqC4cAa9rOGUstPomtqpuNWT9wdPEn2fk" crossorigin="anonymous">
 <!-- jQuery -->
 <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<script>
/* header 부분 */
$(document).ready(function(){
  $('.header_level2, #header_box').hide();

  $('#navbar').mouseover(function(){
    $('.header_level2, #header_box').fadeIn(500);
  });
  $('#navbar, #header_box').mouseleave(function(){
    $('.header_level2, #header_box').fadeOut(500);
  });
  
  

	/*---- 좋아요 기능 (비동기식 구현) ----*/
	// 좋아요 클릭 시, 좋아요버튼 색깔 바뀜
	$('.like_btn').click(function(){		  
		var _perform_num = $('#perform_num').val();			// hidden으로 가져옴.
		var _member_id = $('#member_id').val();		// hidden으로 가져옴.
		
		// 로그인한 회원만 누를 수 있게.	
		if(_member_id == 'null'){
			alert('로그인 후 누르실 수 있습니다.');
		} 
		else{
			// 안눌린 상태 -> 눌린 상태
			if($('.like_btn i').attr('class')=='far fa-thumbs-up'){		
					$('.like_btn i').attr('class', 'fas fa-thumbs-up');
					
					$.ajax({
						type: "post",
						async: true,
						url: "performLikeAdd.pe",				// 좋아요 증가 기능
						data: {perform_num: _perform_num, member_id: _member_id},
						dataType: "text",
						error : function(request, error){
							alert("ajax 연결 실패"); 
							alert("code:"+ request.status + "\n" + "message:"+request.responseText+"\n"+"error:"+error);
						}
					})
					
			} 
			// 눌린 상태 -> 좋아요 해제
			else{		
				$('.like_btn i').attr('class', 'far fa-thumbs-up');
				
				$.ajax({
					type: "post",
					async: true,
					url: "performLikeReduce.pe",			// 좋아요 감소 기능
					data: {perform_num: _perform_num, member_id: _member_id},
					dataType: "text",
					error : function(request, error){
						alert("ajax 연결 실패"); 
						alert("code:"+ request.status + "\n" + "message:"+request.responseText+"\n"+"error:"+error);
					}
				})
			}
		}
	});
  

});

function logout(){
	  alert('로그아웃 되었습니다.');
location.href="logout.jsp";
}



</script>
<body>
<jsp:include page="searchBar.jsp"></jsp:include>		<!-- 검색창 담겨있음 -->

<div id="wrap">
<!-- header 부분 -->
<header id="header">
  <div class="headerbar">
    <div class="headerbar_logo">
      <a href="index.jsp"><img src="images/art_logo.png" width="220" height="80"/> </a>
    </div>
    <div class="headerbar_main">
      <nav id="headerbar_info">
        <% if(id != null){
        	if(id.equals("manager")){ %>
        		<div>'관리자 계정'으로 로그인하셨습니다.</div>
        	<% } else{ %>
        		<div>"<%=id %>"님, 환영합니다!</div>
       			<%} %>
       		<%} %>
          <ul>
          <% if(id == null){
            out.println("<li class='headerbar_info_login'><a href='login.jsp'>로그인</a></li>");
            out.println("<li class='headerbar_info_join'><a href='join.jsp'>회원가입</a></li>");
            } else{
              out.println("<li class='headerbar_info_join' onclick='logout()'>로그아웃</a></li>");
            }
          %>
            <li class="headerbar_info_search">검색 <i class="fas fa-search"></i></li>
          </ul>
      </nav>
      <nav id="navbar">
        <ul>
          <li class="header_level1_1">공연안내/예매
            <ul class="header_level2">
              <li><a href="performListByDate.pe">공연 예매</a></li>
              <li>예매 안내</li>
              <li>패키지 예매</li>
              <li>예매 확인/취소</li>
              <li>공연관람 예절</li>
            </ul>
          </li>
            <li class="header_level1_2">연습실/악보
              <ul class="header_level2">
                <li>연습실 추천</li>
                <li>연습곡 추천</li>
                <li>악보 찾기</li>
              </ul>
            </li>
          <li class="header_level1">레슨 모집
            <ul class="header_level2">
              <li>강사 찾기</li>
              <li>수강생 찾기</li>
              <li>강사 신청</li>
            </ul>
          </li>
          <li class="header_level1">이용 안내
            <ul class="header_level2">
              <li>이용안내</li>
              <li>홈페이지 소개</li>
              <li>서비스 소개</li>
            </ul>
          </li>
          <li class="header_level1">커뮤니티
            <ul class="header_level2">
              <li>공지사항</li>
               <li><a href="board_free_m1.jsp">자유게시판</a></li>
               <li><a href="boardList.bo?sort=음악이야기">음악이야기</a></li>
               <li><a href="boardList.bo?sort=악기정보">악기정보</a></li>
               <li><a href="boardList.bo?sort=공연정보">공연정보</a></li>
            </ul>
          </li>
          <li class="header_level1_1">마이페이지
            <ul class="header_level2">
              <li>예매확인/취소</li>
              <li>나의 관심공연</li>
              <li>회원정보 변경</li>
              <li>아이디 찾기</li>
              <li>비밀번호 찾기</li> 
            </ul>
          </li>
        </ul>
      </nav>
    </div>
  </div>
  <p id="header_box"></p>
  <div class="header_info">
    <div class="header_info_text">
      <h1>공연예매</h1>
      <div class="header_info_text_detail">공연예매 페이지입니다.</div>
    </div>
    <div class="header_info_image">
      <img src="images/main_piano1.jpg" width="800" height="200">
    </div>
  </div>
</header>   <!-- header 끝 -->


<section>
	<div id="section_top">
		<!-- 좋아요 ajax처리 등에 활용하기 위한 hidden값 -->
		<input type="hidden" id="perform_num" value=<%=performDTO.getPerform_num() %>>
		<input type="hidden" id="member_id" value=<%=id %>>
		
		<img src="performUpload/<%=performDTO.getMain_img() %>" id="main_img">
		<div id="article_title"><%=performDTO.getPerform_title() %></div>
		<div class="article_outline">
			<div><span>일자</span><span><%=performDTO.getPerform_date().substring(0, 10) %>(<%=performDTO.getPerform_day() %>)</span></div>
			<div><span>공연시간</span><span><%=performDTO.getPerform_date().substring(11, 16) %></span></div>
			<div><span>공연장소</span><span><%=performDTO.getLocation() %></span></div>
			<div><span>가격</span>
			<%
				String format_priceR = String.format("%,d", performDTO.getPrice_R()); 
				String format_priceS = String.format("%,d", performDTO.getPrice_S()); 
				String format_priceA = String.format("%,d", performDTO.getPrice_A()); 
				String format_priceB = String.format("%,d", performDTO.getPrice_B()); 
				String format_priceAll = String.format("%,d", performDTO.getPrice_All()); 
			%>
			<span>
			<!-- 전석 가격이 존재할 경우, 전석 이외의 가격은 보이지 않음  -->
			<% if(performDTO.getPrice_All()!=0){ %> 전석 <%=format_priceAll %> <%} else{ %>
				<% if(performDTO.getPrice_R()!=0){ %> R석 <%=format_priceR %> <%} %>
				<% if(performDTO.getPrice_S()!=0){ %> | S석 <%=format_priceS %> <%} %>
				<% if(performDTO.getPrice_A()!=0){ %> | A석 <%=format_priceA %> <%} %>
				<% if(performDTO.getPrice_B()!=0){ %> | B석 <%=format_priceB %> <%} %>
			<%} %>
			</span></div>
			<div><span>러닝타임</span><span><%=performDTO.getRunning_time() %>분 (인터미션 <%=performDTO.getIntermission() %>분)</span></div>
			<div><span>관람연령</span><span>만 <%=performDTO.getLimit_age() %>세 이상 입장(미취학아동 입장불가)</span></div>
			<div class="article_outline_ticket"><span>티켓오픈일</span><span><%=performDTO.getOpen_date().substring(0, 10) %>(<%=performDTO.getPerform_day() %>) <%=performDTO.getOpen_date().substring(11, 16) %></span></div>
			<div><span>출연</span><span><%=performDTO.getArtist_main() %></span></div>
			<%if(!performDTO.getPerform_host().equals("")){ %>		<!-- '주최'는 null일 수 있으므로, 예외 처리. -->
				<div><span>주최</span><span><%=performDTO.getPerform_host() %></span></div> <%} %>
		</div>
		<div id="sns_share">
			<span>SNS 공유하기</span>
			<div id="sns_share_btns">
				<a href=""><img src="images/article/ico_facebook.png"></a>
				<a href=""><img src="images/article/ico_twitter.png"></a>
				<a href=""><img src="images/article/ico_kakao.png"></a>
				<a href=""><img src="images/article/ico_blog.png"></a>			
			</div>
		</div>
		<div id="reservation_outline">
		<div class="reser_out1"><span>예매가능시간 : <span style="color:#CC0000">공연 2시간 전까지</span></span></div>
		<!-- 이부분 DB처리 필요 ★ (잔여좌석 특히!!) ★ -->
			<div class="reser_out2">
				<span>예매 가능 공연 일자</span>
				<select name="select_time">
					<option><%=performDTO.getPerform_date().substring(0, 4) %>년 <%=performDTO.getPerform_date().substring(5, 7) %>월 <%=performDTO.getPerform_date().substring(8, 10) %>일</option>
				</select>
				<select name="select_turn">
					<option><%=performDTO.getPerform_date().substring(11, 16) %></option>
				</select>
			</div>
			<div class="reser_out3">예매가능 잔여좌석</div>
			<div class="reser_out4">
				<div><div>R석</div><div class="possible_seat">0석</div></div>
				<div><div>S석</div><div class="possible_seat">11석</div></div>				
				<div><div>A석</div><div class="possible_seat">0석</div></div>				
				<div><div>B석</div><div class="possible_seat">8석</div></div>				
				<div><div>시야방해R</div><div class="possible_seat">25석</div></div>				
				<div><div>시야방해S</div><div class="possible_seat">15석</div></div>				
				<div><div>시야방해A</div><div class="possible_seat">17석</div></div>				
			</div>
			<%
			Date open_date = dataFormat.parse(performDTO.getOpen_date());
			Date perform_date = dataFormat.parse(performDTO.getPerform_date());
			if(open_date.after(today_date)){ %>
				<div class="reser_btn_prepare">티켓 오픈 준비중</div>	
			<%} else if(perform_date.after(today_date)) { %>	
				<a href="" class="reser_btn">예매하기</a>	
			<%} else{ %>
	   	 <div class="reser_btn_end">공연 종료</div>
			<%} %>

			<div class="like_btn">
			<%if(isLike == false){ %>
					<i class="far fa-thumbs-up"></i>		<!-- 색깔 없는 좋아요 -->
			<%} else{ %>
					<i class="fas fa-thumbs-up"></i>		<!-- 색깔 있는 좋아요 -->
			<%} %> 관심공연</div>
			<div class="like_list"><i class="fas fa-list"></i></div>
		</div>
	</div>
	
	<div id="section_middle">
		<div id="section_middle_list"><a href="#perform_info">공연정보</a><a href="#perform_intro">작품/아티스트 소개</a><a href="#reser_notice">예매유의사항</a></div>
		<div id="section_middle_notice">
			<a name="perform_info"></a>
			<div class="section_middle_title"><img src="images/article/bu_concert_info01.gif"> 알립니다</div>
			<img src="images/article/corona_700px_30.jpg" class="section_middle_notice_corona"> <br>
			<div class="section_middle_notice_corona">
			※ 매표원과의 대화를 최소화하기 위해 티켓수령 전 예매내역(문자/카카오톡 등) 및 할인증빙서류를 미리 준비해주시기 바랍니다. <br><br>
			※ 공연장 입장 전 모바일 관객 질문서 작성을 부탁드립니다. <a href="">작성 바로가기 ▶▶</a>
			</div>
			<!-- 좌석배치도(공연장별 구분) -->
			<%if(performDTO.getLocation().equals("롯데콘서트홀")){ %>
				<img src="images/article/lotte_seatAll.jpg" class="section_middle_notice_seat">
			<%} else if(performDTO.getLocation().equals("예술의전당 - 콘서트홀")){ %>
				<img src="images/article/performSeat_artCenter_main1.gif" class="section_middle_notice_seat">
				<img src="images/article/performSeat_artCenter_main2.gif" class="section_middle_notice_seat">
			<%}  
			 else if(performDTO.getLocation().equals("예술의전당 - IBK챔버홀")){ %>
				<img src="images/article/performSeat_artCenter_IBK.gif" class="section_middle_notice_seat">
			<%}  
			 else if(performDTO.getLocation().equals("예술의전당 - 리사이틀홀")){ %>
				<img src="images/article/performSeat_artCenter_recital.gif" class="section_middle_notice_seat">
			<%}  
			 else if(performDTO.getLocation().equals("예술의전당 - 자유소극장")){ %>
				<img src="images/article/performSeat_artCenter_smallTheater.gif" class="section_middle_notice_seat">
			<%}  
			 else if(performDTO.getLocation().equals("예술의전당 - 오페라극장")){ %>
				<img src="images/article/performSeat_artCenter_opera1.gif" class="section_middle_notice_seat">
				<img src="images/article/performSeat_artCenter_opera2.gif" class="section_middle_notice_seat">
			<%}  
			 else if(performDTO.getLocation().equals("예술의전당 - CJ토월극장")){ %>
				<img src="images/article/performSeat_artCenter_cj1.gif" class="section_middle_notice_seat">
				<img src="images/article/performSeat_artCenter_cj2.gif" class="section_middle_notice_seat">
			<%}  
			 else if(performDTO.getLocation().equals("인천아트센터")){ %>
				<img src="images/article/performSeat_incheon1.jpg" class="section_middle_notice_seat">
				<img src="images/article/performSeat_incheon2.jpg" class="section_middle_notice_seat">
				<img src="images/article/performSeat_incheon3.jpg" class="section_middle_notice_seat">
			<%}  %>
			
			======================================================================================================= 
			<div id="section_middle_notice_ticket">
				<br><h2>티켓오픈일정</h2> <br>
				<%=performDTO.getOpen_date().substring(0, 10) %> <%=performDTO.getOpen_date().substring(11, 16) %> 일반오픈 (롯데콘서트홀-예스24-티켓링크-옥션티켓-11번가) / 인터파크 티켓) <br><br>
				
				※ 본 공연은 1인 4매까지 예매가 가능하며, 온라인/전화예매만 가능합니다.(공연장 방문예매불가) <br>
				   고객센터 전화량이 많은 경우에 전화 예매가 어려울 수 있으니 가급적 온라인 예매를 권장 드립니다. <br><br>
				
				※ 본 공연은 롯데콘서트홀(예스24-티켓링크-옥션티켓-11번가) 과 인터파크에 좌석이 배분되어 오픈 됩니다. <br>
				   선오픈석과 일반오픈석 또한 구분되어 오픈되오니 자세한 좌석 정보는 상단 좌석배치도를 참고해주시기 바랍니다. <br><br>
				
				※ 예매자 본인이 직접 공식 예매처를 통해 예매한 건 외, <br>
				   개인간직거래 / 중고거래사이트 / 예매대행사이트 등을 통한 구매로 인해 발생되는 불이익 및 피해에 대해서는 구매한 본인에게 전적으로 책임이 있으며, <br>
				   주최사에서 관련한 해결을 해드릴 수 없음을 알려드립니다. <br><br>
				
				※ 본 공연의 좌석은 정부의 '일행 간 거리두기' 방침을 준수하여 1좌석 또는 2연석 앉고 한 칸을 띄우는 1:1과 2:1을 혼용하여 운영됩니다. <br>
				    본인의 관람 인원에 맞는 좌석을 예매하여 주시기를 부탁드리며, 2연석 중 1좌석만 선택하신 예매자 분은 옆 좌석에 타인이 착석하실 수 있습니다. <br>
				    이로 인한 공연 당일 예매 취소/변경은 불가합니다. <br>
				    <div style="color:#CC0000">거리두기 단계 격상 등의 코로나19로 인한 불가피한 변수 발생 시 변경되는 내용은 본 페이지에 가장 먼저 공지될 예정이니 예매 전 참고를 부탁드립니다. </div><br>
				
				※ 사회적 거리두기 단계 완화 전까지 휠체어석 또한 거리두기를 반영합니다. <br>
				   휠체어석 관련한 더 자세한 내용은 롯데콘서트홀 고객센터 1544-7744로 문의 주시면 상세한 안내 드리도록 하겠습니다. <br><br>
				
				※ 시야방해석은 다른 좌석보다 난간이 높아 시야가 일부 제한되는 좌석입니다. <br>
				   할인가 또는 최저 등급으로 판매되며, 공연 당일 시야방해로 인한 취소/환불/변경은 불가합니다. <br><br>
				
				※ 1층 C구역 17열  / 2층 A, B, C, D, E구역 1열 / 2층 L, R구역은 관객의 안전을 위해 <br>
				   좌석 앞에 안전바가 설치된 좌석이니 예매 시 참고를 부탁드립니다. <br><br>
   		</div>
		</div>
		
		<div id="section_middle_discount">
			<div class="section_middle_title"><img src="images/article/bu_concert_info01.gif"> 할인정보</div>
			<div>
				빈야드 블랙 10% 할인 (1인 4매) <br>
				빈야드 레드 5% 할인 (1인 4매) <br><br>
				
				롯데면세점 LVVIP / LVIP 회원 10% 할인 (1인 4매 / 티켓수령 시 롯데면세점 앱 로그인 혹은 실물 카드로 회원등급 증빙) <br><br>

				경로우대(70세 이상) 20% 할인 (본인 / 티켓수령 시 신분증 확인) <br><br>

				국가유공자 및 유족 50% 할인 (본인 / 티켓수령 시 유공자증 혹은 유족증 확인) <br>
				장애인 1~3급 50% 할인 (동반 1인 / 티켓수령 시 복지카드 확인)	<br>
				장애인 4~6급 50% 할인 (본인 / 티켓수령 시 복지카드 확인)	<br><br>
				<div style="font-weight:bold">
				※ 모든 할인은 실관람자 기준으로 적용되며, 티켓수령 시 '할인 대상자'가 직접 증빙자료를 제시하여 할인 적용 대상임을 확인해 주셔야 합니다. <br>
		  		할인에 해당하는 증빙자료(신분증, 유공자증, 복지카드 등) 미 지참 시에는 현장에서 차액을 지불한 후 관람이 가능합니다. (가족/지인 등의 대리 수령 불가) <br><br>

				※ 시야방해석은 모든 할인에서 제외됩니다. <br><br>
				</div>
			</div>
		</div>
				<a name="perform_intro"></a>
		<%if(performDTO.getSub_img()!=null || !performDTO.getIntro_text().equals("")){ %>
			<div id="section_middle_intro">
				<div class="section_middle_title"><img src="images/article/bu_concert_info01.gif"> 작품 설명 및 아티스트 소개</div>
				<%if(performDTO.getSub_img()!=null){ %>
					<div id="section_middle_introImg"><img src="performUpload/<%=performDTO.getSub_img() %>" ></div>
				<%} if(!performDTO.getIntro_text().equals("")){ %>
					<pre id="section_middle_introText"><%=performDTO.getIntro_text() %></pre>
				<%} %>
			</div>
		<%} %>
		
		<a name="reser_notice"></a>
		<div id="section_middle_ticketGuide">
			<div class="section_middle_title"><img src="images/article/bu_concert_info01.gif"> 티켓 수령안내</div>
			<h4>현장수령</h4>
			- 공연 당일 공연장 8F 메인로비 ‘티켓 박스’에서 티켓을 발권 받을 수 있습니다. <br>
			- 티켓 박스는 공연 1시간 30분 전 오픈됩니다. <br>
			- 예매확인서 또는 신분증을 제시하시고 입장권을 수령하실 수 있으며, 증빙이 필요한 할인을 받으신 경우 증빙서류를 함께 제시해주셔야 합니다. (미지참시 정가에 대한 차액지불) <br><br>
		
			<h4>배송</h4>
			- 우편발송을 원하실 경우 공연일 2주 전까지 고객센터로 신청하시기 바랍니다. (롯데콘서트홀 고객센터 1544-7744 / 배송료 2,500원 별도 부담) <br>
			- 티켓 배송은 결제 완료 후 5일 이내에 배송됩니다. (카드 결제만 가능 / 공휴일 제외 / 영업일 기준) <br>
			- 티켓 배송이 시작된 이후에 취소 요청 시에는 배송료가 환불되지 않습니다. <br>
			- 고객 귀책사유로 티켓 분실이나 파손 시 재발행 되지 않으며, 공연 취소 및 변경도 불가하오니 보관에 유의해주시기 바랍니다. <br><br><br>
		</div>
		
		<div id="section_middle_cancelGuide">
			<div class="section_middle_title"><img src="images/article/bu_concert_info01.gif"> 예매 취소 시 유의사항</div>
			- 예매 티켓의 취소 및 변경은 공연일 전 평일 18시(주말, 공휴일 휴무)까지 인터넷, 전화로 가능합니다. <br>
			- 취소마감시간 이후(공연 당일 포함)에는 티켓의 취소 및 변경이 불가합니다. <br>
			- 고객 귀책사유로 티켓 분실이나 파손이 될 경우에는 티켓은 재발행 되지 않으며, 공연 취소 및 변경도 불가합니다. <br>
			- 티켓 예매시 선택한 결제수단으로만 환불, 변경이 가능합니다. <br>
			- 롯데콘서트홀 이외의 외부 예매처나 공연기획사에서 예매한 티켓은 직접 예매한 곳으로 환불 및 변경 절차를  문의해 주시기 바랍니다. <br>
			- 초대권, 초대교환권, 기획사 판매로 명시된 티켓은 환불이나 변경되지 않습니다. <br><br><br>
		</div>
		
		<div id="section_middle_watchGuide">
			<div class="section_middle_title"><img src="images/article/bu_concert_info01.gif"> 공연 관람안내</div>
			- 공연 시작 후에는 객석 입장이 통제될 수 있으니, 공연 시작 30분 전까지는 도착해주시기 바랍니다. <br>
			- 지연 관객 입장이 가능한 공연의 경우, 연주자와 협의된 입장 시점에 객석으로 입장 가능합니다. <br>
				&nbsp; 지연 관객 입장 시에는 예매하신 좌석에서 관람이 어려울 수 있으며, 다른 관람객의 관람에 방해되지 않도록 안내원의 유도에 따라주시기 바랍니다. <br>
			- 악장과 악장 사이의 박수는 곡의 흐름을 방해하니, 한 곡이 모두 끝나고 열렬한 환호와 박수를 부탁드립니다. <br>
			- 공연 관람 시 상체를 숙일 경우 뒷좌석 관객의 시야를 가릴 수 있습니다. 등받이에 상체를 붙이고 관람하시기 바라며, 앞 좌석을 발로 차는 행위를 삼가 주시기 바랍니다. <br>
			- 공연 중에는 휴대전화의 진동음도 공연 관람에 방해가 되므로 휴대전화의 전원을 반드시 꺼 주시기 바랍니다. <br>
			- 취학 전 어린이는 공연장에 입장할 수 없습니다. 단, 어린이를 위해 특별히 기획된 공연은 예외로 하고 있으며, 예매 시 반드시 입장 가능 연령을 확인해주시기 바랍니다. <br>
			- 어린이 관객도 반드시 입장권을 구매해야 하며, 관람 시 다른 관객의 공연 관람에 불편을 끼치지 않도록 세심한 주의를 기울여 주시길 부탁드립니다. <br>
			- 사진촬영이나 녹음 등은 공연물의 저작권과 초상권을 침해하는 행위로 엄격히 통제되고 있으니, 공연장 내에서는 각종 미디어 기기의 전원을 꺼주시기 바랍니다. <br>
			- 공연장 내에는 뚜껑이 있는 페트(PET) 생수만 반입이 가능하며, 꽃다발, 음식물 및 반려동물의 반입은 금지하고 있습니다. <br>
				&nbsp; (단, 시각장애인의 안내 보조견 동반 입장은 가능합니다. 관련 문의 : 롯데콘서트홀 고객센터 1544-7744) <br>
			- 공연 관람일에는 공연장 주변 교통 혼잡이 예상되오니 공연 전 여유롭게 도착해주시기를 부탁드립니다. <br>
			- 대중교통으로 함께할 때, 롯데콘서트홀을 더욱 여유롭고 편안하게 즐기실 수 있습니다. <br><br>
		
		</div>
	</div> <!-- section_middle 끝 -->
</section>


</div> <!-- wrap 끝 -->

<!-- footer 담겨있음 -->
<jsp:include page="footer.jsp"></jsp:include>	
</body>
</html>