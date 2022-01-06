<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>어데 피씹니까?</title>
</head>
<body>
	<div class="container" align="center">
		<div>아이디 찾기</div>
		<form action="findId.do" method="post" name="frm">
			<div>이름</div>
			<div>
				<input type="text" name="name" required="required" autofocus="autofocus">
			</div>
			<div>전화번호</div>
			<div>
				<input type="tel" name="phone" required="required">
			</div>
			<div>
				<input type="submit" value="아이디 찾기">
			</div>
		</form>
		<div>
			<button onclick="location.href='findPasswordForm.do'">비밀번호 찾기</button>
		</div>
	</div>
</body>
</html>