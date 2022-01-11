<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.container {
		display: flex;
		justify-content: center;
		align-items: center;
		flex-direction: column;
	}
</style>
<script type="text/javascript">

</script>
</head>
<body> 
	<div>
	<div id="seatDisp"></div>
	<button onclick="location.href='seatForm.do?pcno=${pcno}'">좌석 배치</button>
	</div>	
</body>
</html>