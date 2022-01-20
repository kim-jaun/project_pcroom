<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>어데 피씹니까?</title>
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
		display: flex;
		justify-content: center;
		width: 90%; 
		height: 500px;
		border-radius: 20px;
		background-color: white;
		
	}
	.btn_ok{
		margin: 30px;
	}
	.form-control {
		width: 300px;
	}
	.btn-primary {
		margin: 0 10px;
	}
</style>
<script type="text/javascript">

</script>
</head>
<body>
<div class="content_center">
<div class="total_content">
	<form action="passChk.do">
		<div class="join_content content_id">
			<input class="form-control" type="password" name="password" autofocus="autofocus" required="required" placeholder="암호를 입력하세요">
			<input class="btn btn-primary" type="submit" value="확인">
		</div>
	</form>
</div>
</div>
</body>
</html>