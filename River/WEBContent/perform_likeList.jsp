<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import = "java.util.List" %>
<%@ page import = "perform.PerformDTO" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("utf-8"); %>


<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>마이페이지 - 관심공연</title>
<!-- jQuery -->
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
</head>
<style>
section{
 width: 1200px;
 min-height: 900px;
 margin: 0 auto;
 padding-bottom: 60px;
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
	width: 400px;
	text-align: center;
}
table td:last-child{
	width: 100px;
}
table tr:first-child td{
	border-top: solid 1px gray;
	font-weight: bold;
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



<body>
<jsp:include page="searchBar.jsp"></jsp:include>		<!-- 검색창 담겨있음 -->
<jsp:include page="header.jsp"></jsp:include>		<!-- header 담겨있음 -->
<div id="wrap">
<section>
	<h2 id="h2_list">관심공연 List </h2>
	<table>
		<tr>
			<td class="table_title">공연 제목</td>
			<td class="table_location">공연 장소</td>
			<td class="table_date">공연 날짜</td>
			<td>공연 시간</td>
		</tr>
		<c:forEach var="perform" items="${likeList}" >		<!-- Controller에서 request에 담긴 List -->
			<tr>
				<td><a href="performDetail.pe?perform_num=${perform.perform_num }&id=${id }">${perform.perform_title}</a></td>
				<td>${perform.location}</td>
				<td>${perform.perform_date.substring(0, 10)}</td>
				<td>${perform.perform_date.substring(11, 16)}</td>
			</tr>
		</c:forEach>
	</table>

</section>
</div> <!-- wrap 끝 -->
<jsp:include page="footer.jsp"></jsp:include>	
</body>
</html>