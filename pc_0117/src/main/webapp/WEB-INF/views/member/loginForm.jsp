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
<div class="container">
	<div class="login_dis">
		<div class="jumbotron">
			<form action="login.do" method="post" name="frm">
				<h3 style="text-align: center; padding-bottom: 15px;">로그인</h3>
				<div class="form-group">
					<input type="text" name="id" required="required" autofocus="autofocus" placeholder="ID" class="form-control">
				</div>
				<div class="form-group">
					<input type="password" name="password" required="required" placeholder="Password" class="form-control">
				</div>
				<div class="btn-group">
					<input type="submit" value="Login" class="btn btn-primary">
				</div>
			</form>	
			<button onclick="location.href='findIdForm.do'" class="btn btn-primary">아이디 찾기</button>
			<button onclick="location.href='findPwForm.do'" class="btn btn-primary">비밀번호 찾기</button>
		</div>
	</div>
</div>
</body>
</html>