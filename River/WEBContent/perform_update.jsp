<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.List" %>
<%@ page import = "perform.PerformDTO" %>
<%
  request.setCharacterEncoding("utf-8");
  String id = (String)session.getAttribute("id");			// 로그인 상태 회원 정보.
%>
<% List<PerformDTO> performList = (List)request.getAttribute("performList"); %>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>관리자용 페이지 - 공연정보</title>
<!-- jQuery -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<style>
section{
 width: 1200px;
 min-height: 900px;
 margin: 0 auto;
 background-color: whitesmoke;
}
#h2_list{
	margin: 0 auto;
	text-align: center;
	padding: 50px 0 20px 0;
}
#wrap{
 background-color: #41414c;
}
table{
	margin: 0 auto;
	border-spacing: 0;
	text-align: center;
}
table td{
	border-bottom: solid 1px gray;
	border-right: solid 1px gray;
	height: 35px;
}
table td:first-child{	
	border-left: solid 1px gray;
	width: 80px;
	text-align: center;
}
table td:last-child{
	width: 130px;
}
table tr:first-child td{
	border-top: solid 1px gray;
}
.table_title{
	width: 400px;
}
.table_location{
	width: 200px;
}
.table_date{
	width: 170px;
}
table a{
	padding: 5px 10px;
	border: solid 1px gray;
	background-color: #eeeeee;
	color: black;
}


</style>

<script>
function deleteClick(){
	return confirm("정말 삭제하시겠습니까?");
}
</script>

<body>
<jsp:include page="searchBar.jsp"></jsp:include>		<!-- 검색창 담겨있음 -->
<jsp:include page="header.jsp"></jsp:include>		<!-- header 담겨있음 -->
<div id="wrap">
<section>
	<h2 id="h2_list">공연정보 List (참고용)</h2>
	<table>
		<tr>
			<td>공연 Id</td>
			<td class="table_title">공연 제목</td>
			<td class="table_location">공연 장소</td>
			<td class="table_date">공연 날짜</td>
			<td>수정/삭제</td>
		</tr>
		<%for(int i=0; i<performList.size(); i++){ 
			PerformDTO performDTO	= performList.get(i);
			%>
		<tr>
			<td><%=performDTO.getPerform_num() %></td>
			<td><%=performDTO.getPerform_title() %></td>
			<td><%=performDTO.getLocation() %></td>
			<td><%=performDTO.getPerform_date().substring(0, 10) %></td>
			<td><a href="perform_updateForm.jsp?perform_num=<%=performDTO.getPerform_num() %>">수정</a> / <a href="performDelete.pe?perform_num=<%=performDTO.getPerform_num() %>" onclick="return deleteClick()">삭제</a></td>
		</tr>
		<%} %>
	</table>
	

	
</section>
</div> <!-- wrap 끝 -->
<jsp:include page="footer.jsp"></jsp:include>	
</body>
</html>