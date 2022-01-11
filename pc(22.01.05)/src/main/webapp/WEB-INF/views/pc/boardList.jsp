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
<div class="container" align="center">
	<table>
		<tr><th>번호</th><th>제목</th><th>작성자</th><th>작성일</th><th>조회수</th><th>좋아요</th></tr>
		<c:if test="${empty list }">
			<tr><td colspan="6">작성된 게시글이 없습니다</td></tr>
		</c:if>
		<c:if test="${not empty list }">
			<c:forEach var="board" items="${list }">
				<tr><td>${board.bno }</td>
				<c:if test="${board.del == 'y' }">
					<td colspan="5">삭제된 글입니다</td>
				</c:if>
				<c:if test="${board.del != 'y' }">
					<td title="${board.content }">
						<a href="content.do?pcno=${board.pcno}&bno=${board.bno}&pageNum=${pb.currentPage}">${board.subject }</a></td>
					<td>${board.nick_name }</td>
					<td>${board.reg_date }</td>
					<td>${board.read_cnt }</td>
					<td>${board.likes }</td>
				</c:if>
			</c:forEach>
		</c:if>
	</table>
	<div align="center">
	<ul class="pagination">
	<!-- 시작 페이지가 pagePerBlock보다 크면 앞에 보여줄 것이 있다 -->
		<c:if test="${pb.startPage > pb.pagePerBlock }">
			<li><a href="boardList.do?pcno=${board.pcno}&pageNum=1">
				<span class="glyphicon glyphicon-backward"></span></a></li>
			<li><a href="boardList.do?pcno=${board.pcno}&pageNum=${pb.startPage-1}">
				<span class="glyphicon glyphicon-triangle-left"></span></a></li>
		</c:if>
		<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage }">
			<c:if test="${pb.currentPage==i }">
				<li class="active"><a href="boardList.do?pcno=${board.pcno}&pageNum=${i}">${i}</a></li>
			</c:if>
			<c:if test="${pb.currentPage!=i }">
				<li><a href="boardList.do?pcno=${board.pcno}&pageNum=${i}">${i}</a></li>
			</c:if>
		</c:forEach>
		<!-- 보여줄 것이 남아있는 경우에는 endPage보다 totalPage가 큰경우 -->
		<c:if test="${pb.endPage < pb.totalPage }">
			<li><a href="boardList.do?pcno=${board.pcno}&pageNum=${pb.endPage+1}">
				<span class="glyphicon glyphicon-triangle-right"></span></a></li>
			<li><a href="boardList.do?pcno=${board.pcno}&pageNum=${pb.totalPage}">
				<span class="glyphicon glyphicon-forward"></span></a></li>
		</c:if>
	</ul>
</div>
</div>
<a href="insertForm.do?pcno=${board.pcno}&bno=0&pageNum=1">글쓰기</a>
</body>
</html>