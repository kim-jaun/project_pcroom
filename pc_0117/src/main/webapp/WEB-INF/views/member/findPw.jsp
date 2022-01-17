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
<div align="center">
	<div>비밀번호 찾기</div>
	<c:if test="${result == 1 and resultUpdatePw > 0 }">
		<div>
			${member1.email }로 임시비밀번호를 전송하였습니다. 로그인 후 비밀번호를 변경해주세요.
		</div>
	</c:if>
	<c:if test="${result == 0 }">
		<div>${msg }</div>
		<button onclick='location.href="findIdForm.do"'>아이디 찾기</button>
	</c:if>
	<c:if test="${result == -1 }">
		<script type="text/javascript">
			alert("찾을 수 없는 계정입니다. 정보를 확인해주세요.");
			history.go(-1);
		</script>
	</c:if>
</div>
</body>
</html>