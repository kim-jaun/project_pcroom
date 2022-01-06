<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<div align="center">
		<div>
			<h2>가맹점 등록</h2>
		</div>
		<form action="register.do" name="frm" method="post" enctype="multipart/form-data">
			<div>
				<div>
					사업자등록번호<p><input type="text" name="pcbusinessnum" required="required">
				</div>
				<div>
					pc방 이름<p><input type="text" name="pcname" required="required">
				</div>
				<div>
					pc방 내부사진<p><input type="file" name="pcimage" required="required" multiple="multiple" readonly="readonly">
				</div>
				<div>
					전화번호<p><input type="text" name="pcpno" required="required" title="전화형식 3-3,4-4" pattern="\d{3}-\d{3,4}-\d{4}" placeholder="010-1111-1111">
				</div>
				<div>
					주소<p><input type="text" name="pcaddr" required="required">
				</div>
				<div>
					정보<p><textarea name="pcinfo" required="required" rows="10"></textarea>
				</div>
			</div>
			<div align="center">
			<button id="submit" type="submit">확인</button>
			</div>
		</form>
</div>
</body>
</html>