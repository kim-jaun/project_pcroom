<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>어데 피씹니까?</title>
</head>
<body>
<div class="container" align="center">
	<form action="insert.do" method="post">
		<input type="hidden" name="pcno" value="${board.pcno}">
		<input type="hidden" name="bno" value="${board.bno}">
		<input type="hidden" name="pageNum" value="${pageNum}">
		<div>제목</div>
		<div>
			<input type="text" name="subject" required="required" autofocus="autofocus">
		</div>
		<div>내용</div>
		<div>
			<textarea rows="10" cols="50" name="content" required="required"></textarea>
		</div>
		<div>
			<input type="submit" value="확인">
		</div>
	</form>
</div>
</body>
</html>