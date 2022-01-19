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
	<form action="feeInsert.do">
		<div>
			1000원 <input type="number" placeholder="" name="w1000">분
		</div>
		<div>
			3000원 <input type="number" placeholder="" name="w3000">분
		</div>
		<div>
			5000원 <input type="number" placeholder="" name="w5000">분
		</div>
		<div>
			10000원 <input type="number" placeholder="" name="w10000">분
		</div>
		<div>
			50000원 <input type="number" placeholder="" name="w50000">분
		</div>
		<div>
			100000원 <input type="number" placeholder="" name="w100000">분
		</div>
		<input type="submit">
	</form>
</body>
</html>