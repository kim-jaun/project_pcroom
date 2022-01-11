<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>어데 피씹니까?</title>
<style type="text/css">
ul {
	background-color: #d5d5d5;
	width : 150px;
	list-style-type : none;
	margin : 0;
	padding: 0;
}
li a {
	display: block;
	color: black;
	padding: 8px;
	text-align: center;
	text-decoration: none;
	font-weight: bold;
}
li a.current {
	background-color: gray;
}
li a:hover:not(.current) {
	background-color: #d5d5d5;
}

</style>
<script type="text/javascript">

</script>
</head>
<body>
	<ul>
		<li><a href="updateForm.do">회원정보 수정</a></li>
		<li><a href="reserveList.do">예매내역</a></li>
		<li><a href="bookmark.do">즐겨찾기</a></li>
	</ul>
	<form action="passChk.do">
		<div class="pass_chk disp_hide">
			<input type="password" name="password" required="required" placeholder="암호를 입력하세요">
			<input type="submit" value="확인">
		</div>
	</form>
	
</body>
</html>