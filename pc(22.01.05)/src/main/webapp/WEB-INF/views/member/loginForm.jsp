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
	<div>로그인</div>
	<form action="login.do" method="post" name="frm">
		<div>아이디</div>
		<div>
			<input type="text" name="id" required="required" autofocus="autofocus">
		</div>
		<div>암호</div>
		<div>
			<input type="password" name="password" required="required">
		</div>
		<div>
			<input type="submit" value="로그인">
		</div>
		<div>
			<button onclick="location.href='findIdForm.do'">아이디 찾기</button>
			<button onclick="location.href='findPwForm.do'">비밀번호 찾기</button>
		</div>
	</form>	
</div>
</body>
</html>