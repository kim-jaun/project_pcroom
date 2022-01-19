<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<form action="feeUpdate.do">
		<div>
			1000원 <input type="number" placeholder="${fee.w1000 }" name="w1000">분
		</div>
		<div>
			3000원 <input type="number" placeholder="${fee.w3000 }" name="w3000">분
		</div>
		<div>
			5000원 <input type="number" placeholder="${fee.w5000 }" name="w5000">분
		</div>
		<div>
			10000원 <input type="number" placeholder="${fee.w10000 }" name="w10000">분
		</div>
		<div>
			50000원 <input type="number" placeholder="${fee.w50000 }" name="w50000">분
		</div>
		<div>
			100000원 <input type="number" placeholder="${fee.w100000 }" name="w100000">분
		</div>
		<input type="submit">
	</form>
</body>
</html>