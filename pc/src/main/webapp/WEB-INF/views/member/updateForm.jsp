<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.pass_chk {
		position: absolute;
		width: 100%;
		height: 100%;
		background-color: white;
	}
	.form {
		width: 100%;
		height: 100%;
		background-color: yellow;
	}
</style>
</head>
<body>
	<div class="pass_chk disp_hide">
		<input type="password" placeholder="암호를 입력하세요">
		<button onclick="chk()">확인</button>
	</div>
	<form>
		<div class="form">
			<input type="text">
			<button></button>
		</div>
	</form>
</body>
</html>