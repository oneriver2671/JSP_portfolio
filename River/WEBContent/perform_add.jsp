<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%
  request.setCharacterEncoding("utf-8");
  String id = (String)session.getAttribute("id");			// 로그인 상태 회원 정보.
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<!-- jQuery -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<style>
section{
 width: 1200px;
 height: 900px;
 margin: 0 auto;
 background-color: whitesmoke;
}
#wrap{
 background-color: #41414c;
}
form{
	margin-left: 50px;
}
h2{
	margin: 0;
	padding: 60px 0 20px 40px;
}
table{

	border-spacing: 0;
	
}
table td{
	border-bottom: solid 1px gray;
	border-right: solid 1px gray;
	height: 35px;
}
table td:first-child{	
	border-left: solid 1px gray;
	width: 150px;
	text-align: center;
}
table tr:first-child td{
	border-top: solid 1px gray;
}
input[type=text]{
	width: 500px;
	height: 30px;
	border: none;
}
input[type=reset]{
	margin-top: 10px;
	margin-left: 470px;
	padding: 7px 25px;
	background-color: #646277;
	color: whitesmoke;
	border: none;
	font-weight: bold;
}
input[type=submit]{
	padding: 7px 25px;
	background-color: #CC0000;
	color: whitesmoke;
	border: none;
	font-weight: bold;
}
select{
	height: 30px;
}
textarea{
	width: 500px;
	height: 60px;
}

</style>

<script>

function addComplete(){
		var title = $('#title').val();
		var programTitle = $('#programTitle').val();
		var mainArtist = $('#mainArtist').val();
		var runningTime = $('#runningTime').val();
		var intermission = $('#intermission').val();
		
		if(title!="" && programTitle!="" && mainArtist!="" && runningTime!="" && intermission!=""){
			if(confirm("제목: "+title+"\n프로그램명: "+programTitle+"\n메인공연자: "+mainArtist
					+"\n추가하시겠습니까?") == true){
				
				return true;
			} else{		// 취소 버튼
				return false;
				}
			}
		else{
			alert('제목, 작품명, 메인 공연자, 러닝타임, 인터미션은 필수 입력 요소입니다.');
			return false;
		}
			
		}

	
		


</script>

<body>
<jsp:include page="searchBar.jsp"></jsp:include>		<!-- 검색창 담겨있음 -->
<jsp:include page="header.jsp"></jsp:include>		<!-- header 담겨있음 -->
<div id="wrap">
	<section>
	<h2>공연 정보 입력 (관리자용)</h2>
	<form action="performAdd.pe" name="addPerform" enctype="multipart/form-data" method="POST" onsubmit="return addComplete()">
		<table>
			<tr>
				<td>공연 제목 *</td>
				<td><input type="text" name="title" id="title" placeholder="공연 제목을 입력하세요."></td>
			</tr>
			<tr>
				<td>공연 날짜 *</td>
				<td>
					<select name="date_year">
						<option>2021</option>
						<option>2022</option>
					</select> 년
					<select name="date_month">
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
						<option>6</option>
						<option>7</option>
						<option>8</option>
						<option>9</option>
						<option>10</option>
						<option>11</option>
						<option>12</option>
					</select> 월
					<select name="date_day">
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
						<option>6</option>
						<option>7</option>
						<option>8</option>
						<option>9</option>
						<option>10</option>
						<option>11</option>
						<option>12</option>
						<option>13</option>
						<option>14</option>
						<option>15</option>
						<option>16</option>
						<option>17</option>
						<option>18</option>
						<option>19</option>
						<option>20</option>
						<option>21</option>
						<option>22</option>
						<option>23</option>
						<option>24</option>
						<option>25</option>
						<option>26</option>
						<option>27</option>
						<option>28</option>
						<option>29</option>
						<option>30</option>
						<option>31</option>
					</select> 일
					<select name="date_hour">
						<option>12</option>
						<option>13</option>
						<option>14</option>
						<option>15</option>
						<option>16</option>
						<option>17</option>
						<option>18</option>
						<option>19</option>
						<option>20</option>
						<option>21</option>
						<option>22</option>
					</select> 시
					<select name="date_minute">
						<option>00</option>
						<option>10</option>
						<option>20</option>
						<option>30</option>
						<option>40</option>
						<option>50</option>
					</select> 분
				</td>
			</tr>
			<tr>
				<td>공연 장소 *</td>
				<td>
					<select name="location">
					<option>롯데 콘서트홀</option>
					<option>예술의전당 - 콘서트홀</option>
					<option>예술의전당 - 오페라하우스</option>
					<option>인천아트센터</option>
				</select>
				</td>
			</tr>
			<tr>
				<td>작품명 *</td>
				<td>			<!-- 이부분 비동기식으로 처리해, 여기에 List 찍을거임. -->
					<input type="text" id="programTitle" name="program_title" placeholder="작품명은 슬래쉬(/)로 구분해주세요.">
				</td>
			</tr>
			<tr>
				<td>메인 공연자 *</td>
				<td><input type="text" id="mainArtist" name="artist_main"></td>
			</tr>
			<tr>
				<td>조연</td>
				<td><input type="text" name="artist_sub" placeholder="조연 공연자는 슬래쉬(/)로 구분해주세요.">  </td>
			</tr>
			<tr>
				<td>러닝타임 *</td>
				<td><input type="text" name="running_time" id="runningTime" placeholder="분 단위로 숫자만 입력하세요."></td>
			</tr>
			<tr>
				<td>인터미션 *</td>
				<td> <input type="text" name="intermission" id="intermission" placeholder="분 단위로 숫자만 입력하세요."></td>
			</tr>
			<tr>
				<td>메인 이미지 첨부 *</td>
				<td><input type="file" name="main_img" required="required" /></td>
			</tr>
			<tr>
				<td>서브 이미지 첨부</td>  <!-- 여러개 첨부되게 하고 싶은데. -->
				<td><input type="file" name="sub_img" /></td>
			</tr>
			<tr>
				<td>소개글</td>
				<td><textarea name="intro_perform" placeholder="소개용 이미지가 있을 경우엔 미작성"></textarea> </td>
			</tr>						
			<tr>
				<td>공연자 소개글</td>
				<td><textarea name="intro_artist" placeholder="소개용 이미지가 있을 경우엔 미작성"></textarea></td>
			</tr>
			<tr>
				<td>주최</td>
				<td><input type="text" name="perform_host"></td>
			</tr>
			<tr>
				<td>제한연령</td>
				<td> <input type="text" name="limit_age" placeholder="숫자만 입력하세요."></td>
			</tr>
			<tr>
				<td>티켓오픈일</td>
				<td>
					<select name="open_year">
						<option>2021</option>
						<option>2022</option>
					</select> 년
					<select name="open_month">
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
						<option>6</option>
						<option>7</option>
						<option>8</option>
						<option>9</option>
						<option>10</option>
						<option>11</option>
						<option>12</option>
					</select> 월
					<select name="open_day">
						<option>1</option>
						<option>2</option>
						<option>3</option>
						<option>4</option>
						<option>5</option>
						<option>6</option>
						<option>7</option>
						<option>8</option>
						<option>9</option>
						<option>10</option>
						<option>11</option>
						<option>12</option>
						<option>13</option>
						<option>14</option>
						<option>15</option>
						<option>16</option>
						<option>17</option>
						<option>18</option>
						<option>19</option>
						<option>20</option>
						<option>21</option>
						<option>22</option>
						<option>23</option>
						<option>24</option>
						<option>25</option>
						<option>26</option>
						<option>27</option>
						<option>28</option>
						<option>29</option>
						<option>30</option>
						<option>31</option>
					</select> 일
					<select name="open_hour">
						<option>12</option>
						<option>13</option>
						<option>14</option>
						<option>15</option>
						<option>16</option>
						<option>17</option>
						<option>18</option>
						<option>19</option>
						<option>20</option>
						<option>21</option>
						<option>22</option>
					</select> 시
					<select name="open_minute">
						<option>00</option>
						<option>10</option>
						<option>20</option>
						<option>30</option>
						<option>40</option>
						<option>50</option>
				</select> 분
				</td>
			</tr>
		</table>
			<input type="reset" value="취소">
			<input type="submit" id="addBtn" value="작성 완료">
		
	</form>
	</section>
</div> <!-- wrap 끝 -->
<jsp:include page="footer.jsp"></jsp:include>	
</body>
</html>