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
		<div>비밀번호 찾기</div>
		<form action="findPw.do">
			<div>아이디</div>
			<div>
				<input type="text" name="id" required="required" autofocus="autofocus">
			</div>
			<div>이메일</div>
			<div>
				<input type="email" name="email" required="required">
			</div>
			<div>
				<input type="submit" value="비밀번호 찾기">
			</div>
		</form>
		<div>
			<button onclick="location.href='findIdForm.do'">아이디 찾기</button>
		</div>
	</div>
</body>
</html>