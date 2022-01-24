<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>어데 피씹니까?</title>
<style type="text/css">
	body {
		background-color: #2c3e50;
	}
	.content_center{
		display: flex;
		justify-content: center;
		position: relative;
		}
	.total_content{
		width: 90%; 
		height: 90%;
		border-radius: 20px;
		background-color: white;
		padding-left: 0;
	}
</style>
</head>
<body>
<div class="content_center">
<div class="total_content">
<h3>현재 예약 내역</h3>
<table class="table table-hover">
	<tr class="table-primary"><th>번호</th><th>pc방 이름</th><th>예약날짜</th><th>시작시간</th><th>끝시간</th></tr>
	<c:if test="${empty list && expiration == 'n' }">
		<tr><td colspan="5">현재 예약 내역이 없습니다.</td></tr>
	</c:if>
	<c:if test="${not empty list && expiration == 'n' }">
		<c:forEach var="reserve" items="${list }">
			<tr>
			<td>${reserve.reserveno }</td>
			<td>${pcname }</td>
			<td>${reserve.starttime }</td>
			<td>${reserve.endtime }</td>
		</c:forEach>
	</c:if>
</table>
<h3>지난 예약 내역</h3>
<table class="table table-hover">
	<tr class="table-primary"><th>번호</th><th>pc방 이름</th><th>예약날짜</th><th>시작시간</th><th>끝시간</th></tr>
	<c:if test="${empty list && expiration == 'y' }">
		<tr><td colspan="5">지난 예약 내역이 없습니다.</td></tr>
	</c:if>
	<c:if test="${not empty list && expiration == 'y' }">
		<c:forEach var="reserve" items="${list }">
			<tr>
			<td>${reserve.reserveno }</td>
			<td>${pcname }</td>
			<td>${reserve.starttime }</td>
			<td>${reserve.endtime }</td>
		</c:forEach>
	</c:if>
</table>
</div>
</div>
</body>
</html>