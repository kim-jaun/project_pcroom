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
<c:if test="${result > 0 }">
	<script type="text/javascript">
		alert("가맹점이 승인되었습니다.");
		location.href="pcList.do";
	</script>
</c:if>
<c:if test="${result == 0 }">
	<script type="text/javascript">
		alert("가맹점 승인에 실패하셨습니다.");
		history.go(-1);
	</script>
</c:if>
</body>
</html>