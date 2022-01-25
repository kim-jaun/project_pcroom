<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>어데 피씹니까?</title>
<style type="text/css">
body {
	background-color: #2c3e50;
}

.content_center {
	display: flex;
	justify-content: center;
	position: relative;
}

.total_content {
	width: 90%;
	height: 90%;
	border-radius: 20px;
	background-color: white;
	padding-left: 0;
}
	.navi_admin{
	float: left;
/* 	margin-top: 50px; */
	width: 200px;
	margin-left: -50px;
}
</style>
</head>
<body>

	<div class="content_center">
		<div class="total_content">
		<div class="navi_admin"> 
	<ul class="sidebar">
         <li><a href="updateForm.do">회원정보 수정</a></li>
         <li><a href="reserveList.do">예매내역</a></li>
         <li><a href="mybookmark.do">즐겨찾기</a></li>
            <c:if test="${memberSession.identity == '점주' }">
               <li><a href="mypcUpdateForm.do">가맹점 수정</a></li>
               <li><a href="seatForm.do?pcno=${pc.pcno}">좌석배치 수정</a></li>
               <c:if test="${f1 == 'null' }">
               <li><a href="feeInsertForm.do?pcno=${pc.pcno}">요금 입력</a></li>
               </c:if>
               <c:if test="${f1 != 'null' }">
               <li><a href="feeUpdateForm.do?pcno=${pc.pcno}">요금 수정</a></li>
               </c:if>
            </c:if>
   </ul>
</div>
			<h3>현재 예약 내역</h3>
			<table class="table table-hover">
				<tr class="table-primary">
					<th>번호</th>
					<th>pc방 이름</th>
					<th>예약날짜</th>
					<th>시작시간</th>
					<th>끝시간</th>
				</tr>
				<c:if test="${empty nList }">
					<tr>
						<td colspan="5">현재 예약 내역이 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${not empty nList }">	
					<c:forEach var="reserve" items="${nList }">
						
								<tr>
									<td>${reserve.reserveno }</td>
									<td>${reserve.pcname }</td>
									<td>${reserve.reg_date }</td>
									<td>${reserve.starttime }</td>
									<td>${reserve.endtime }</td>
								</tr>
					</c:forEach>
				</c:if>
			</table>
			<h3>지난 예약 내역</h3>
			<table class="table table-hover">
				<tr class="table-primary">
					<th>번호</th>
					<th>pc방 이름</th>
					<th>예약날짜</th>
					<th>시작시간</th>
					<th>끝시간</th>
				</tr>
				<c:if test="${empty yList }">
					<tr>
						<td colspan="5">지난 예약 내역이 없습니다.</td>
					</tr>
				</c:if>
				<c:if test="${not empty yList }">
					<c:forEach var="reserve" items="${yList }">
								<tr>
									<td>${reserve.reserveno }</td>
									<td>${reserve.pcname }</td>
									<td>${reserve.reg_date }</td>
									<td>${reserve.starttime }</td>
									<td>${reserve.endtime }</td>
								</tr>
					</c:forEach>
				</c:if>
			</table>
		</div>
	</div>
</body>
</html>