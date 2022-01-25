<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
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
	}
		.navi_admin{
		float: left;
	/* 	margin-top: 50px; */
		width: 200px;
		margin-left: -50px;
		margin-right: 30px;
		z-index: 100;
	}
</style>
</head>
<body>
<div class="content_center">
<div class="total_content">
	<div class="navi_admin"> 
		<ul class="sidebar">
			<li><a href="passChkForm.do">회원정보 수정</a></li>
			<li><a href="reserveList.do">예매내역</a></li>
			<li><a href="mybookmark.do">즐겨찾기</a></li>
			<c:if test="${memberSession.identity == '점주' }">
               <li><a href="mypcUpdateForm.do">가맹점 수정</a></li>
               <li><a href="seatForm.do?pcno=${pcno}">좌석배치 수정</a></li>
               <c:if test="${f1 == 'null' }">
               <li><a href="feeInsertForm.do?pcno=${pcno}">요금 입력</a></li>
               </c:if>
               <c:if test="${f1 != 'null' }">
               <li><a href="feeUpdateForm.do?pcno=${pcno}">요금 수정</a></li>
               </c:if>
            </c:if>
		</ul>
	</div>
	<form action="feeUpdate.do">
		<div>
			1000원 <input type="number" value="${fee.w1000 }" name="w1000" >분
		</div>
		<div>
			3000원 <input type="number" value="${fee.w3000 }" name="w3000" >분
		</div>
		<div>
			5000원 <input type="number" value="${fee.w5000 }" name="w5000">분
		</div>
		<div>
			10000원 <input type="number" value="${fee.w10000 }" name="w10000">분
		</div>
		<div>
			50000원 <input type="number" value="${fee.w50000 }" name="w50000">분
		</div>
		<div>
			100000원 <input type="number" value="${fee.w100000 }" name="w100000">분
		</div>
		<input type="submit">
	</form>
</div>
</div>
</body>
</html>