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
<div class="navi_admin"> 
	<ul class="sidebar">
		<li><a href="updateForm.do">회원정보 수정</a></li>
		<li><a href="reserveList.do">예매내역</a></li>
		<li><a href="mybookmark.do">즐겨찾기</a></li>
	</ul>
</div>
<div class="total_content">
	<h3>즐겨찾기한 pc방 목록 | ${total }개</h3>
<table class="table table-hover">
	<tr class="table-primary"><th>pc방 이름</th><th>pc방 위치</th><th>pc방 정보</th></tr>
		<c:if test="${list.size() == 0 }">
			<tr><td colspan="3">즐겨찾기한 pc방이 없습니다.</td></tr>
		</c:if>
		<c:if test="${list.size() != 0 }">
			<c:forEach var="bookmark" items="${list }">
				<tr onclick="location.href='pcMainForm.do?pcno=${bookmark.pcno}&pageNum=${pb.currentPage}'" style="cursor:hand">
					<td>${bookmark.pcname}</td>
					<td>${bookmark.pcaddr }</td>
					<td>${bookmark.pcinfo }</td></tr>
			</c:forEach>
		</c:if>
	</table>
</div>
	<!-- paging -->
	<div align="center">
	<ul class="pagination">
	<!-- 시작 페이지가 pagePerBlock보다 크면 앞에 보여줄 것이 있다 -->
		<c:if test="${pb.startPage > pb.pagePerBlock }">
			<li><a class="btn btn-outline-primary" href="mybookmark.do?pcno=${bookmark.pcno}&pageNum=1">
				<span class="glyphicon glyphicon-backward"></span></a></li>
			<li><a class="btn btn-outline-primary" href="mybookmark.do?pcno=${bookmark.pcno}&pageNum=${pb.startPage-1}">
				<span class="glyphicon glyphicon-triangle-left"></span></a></li>
		</c:if>
		<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage }">
			<c:if test="${pb.currentPage==i }">
				<li><a class="btn btn-outline-primary active" href="mybookmark.do?pcno=${bookmark.pcno}&pageNum=${i}">${i}</a></li>
			</c:if>
			<c:if test="${pb.currentPage!=i }">
				<li><a class="btn btn-outline-primary" href="mybookmark.do?pcno=${bookmark.pcno}&pageNum=${i}">${i}</a></li>
			</c:if>
		</c:forEach>
		<!-- 보여줄 것이 남아있는 경우에는 endPage보다 totalPage가 큰경우 -->
		<c:if test="${pb.endPage < pb.totalPage }">
			<li><a class="btn btn-outline-primary" href="mybookmark.do?pcno=${bookmark.pcno}&pageNum=${pb.endPage+1}">
				<span class="glyphicon glyphicon-triangle-right"></span></a></li>
			<li><a class="btn btn-outline-primary" href="mybookmark.do?pcno=${bookmark.pcno}&pageNum=${pb.totalPage}">
				<span class="glyphicon glyphicon-forward"></span></a></li>
		</c:if>
	</ul>
</div>
</body>
</html>