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
<div class="search_form">
<form action="boardList.do">
	<input type="hidden" name="pageNum" value="1">
	<select name="searchKey">
		<c:forTokens var="search" items="subject,nick_name,content" delims="," varStatus="i">
			<c:if test="${search == board.searchKey }">
				<option value="${search }" selected="selected">${title[i.index] }</option>
			</c:if>
			<c:if test="${search != board.searchKey }">
				<option value="${search }">${title[i.index] }</option>
			</c:if>
		</c:forTokens>
	</select>
		<input type="text" name="searchValue" value="${board.searchValue }" class="form-control" placeholder="검색어를 입력하세요.">
		<input type="submit" value="검색" class="btn btn-primary">
</form>
</div>
<div class="total_content">
	<table class="table table-hover">
		<tr class="table-primary"><th>번호</th><th>제목</th><th>작성자</th><th>작성일</th><th>조회수</th><th>좋아요</th></tr>
		<c:if test="${empty list }">
			<tr><td colspan="6">작성된 게시글이 없습니다</td></tr>
		</c:if>
		<c:if test="${not empty list }">
			<c:forEach var="board2" items="${list }">
				<tr onclick="location.href='content.do?pcno=${board2.pcno}&bno=${board2.bno}&pageNum=${pb.currentPage}&searchKey=${board.searchKey}&searchValue=${board.searchValue}'" style="cursor:hand">
					<td>${board2.bno }</td>
				<c:if test="${board2.del == 'y' }">
					<td colspan="5">삭제된 글입니다</td>
				</c:if>
				<c:if test="${board2.del != 'y' }">
					<td title="${board.content }">${board2.subject }</td>
					<td>${board2.nick_name }</td>
					<td>${board2.reg_date }</td>
					<td>${board2.read_cnt }</td>
					<td>${board2.likes }</td>
				</c:if>
			</c:forEach>
		</c:if>
	</table>
	<div align="center">
	<ul class="pagination">
	<!-- 시작 페이지가 pagePerBlock보다 크면 앞에 보여줄 것이 있다 -->
		<c:if test="${pb.startPage > pb.pagePerBlock }">
			<li><a class="btn btn-outline-primary" href="boardList.do?pcno=${board.pcno}&pageNum=1&searchKey=${board.searchKey}&searchValue=${board.searchValue}">
				<span class="glyphicon glyphicon-backward"></span></a></li>
			<li><a class="btn btn-outline-primary" href="boardList.do?pcno=${board.pcno}&pageNum=${pb.startPage-1}&searchKey=${board.searchKey}&searchValue=${board.searchValue}">
				<span class="glyphicon glyphicon-triangle-left"></span></a></li>
		</c:if>
		<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage }">
			<c:if test="${pb.currentPage==i }">
				<li><a class="btn btn-outline-primary active" href="boardList.do?pcno=${board.pcno}&pageNum=${i}&searchKey=${board.searchKey}&searchValue=${board.searchValue}">${i}</a></li>
			</c:if>
			<c:if test="${pb.currentPage!=i }">
				<li><a class="btn btn-outline-primary" href="boardList.do?pcno=${board.pcno}&pageNum=${i}&searchKey=${board.searchKey}&searchValue=${board.searchValue}">${i}</a></li>
			</c:if>
		</c:forEach>
		<!-- 보여줄 것이 남아있는 경우에는 endPage보다 totalPage가 큰경우 -->
		<c:if test="${pb.endPage < pb.totalPage }">
			<li><a class="btn btn-outline-primary" href="boardList.do?pcno=${board.pcno}&pageNum=${pb.endPage+1}&searchKey=${board.searchKey}&searchValue=${board.searchValue}">
				<span class="glyphicon glyphicon-triangle-right"></span></a></li>
			<li><a class="btn btn-outline-primary" href="boardList.do?pcno=${board.pcno}&pageNum=${pb.totalPage}&searchKey=${board.searchKey}&searchValue=${board.searchValue}">
				<span class="glyphicon glyphicon-forward"></span></a></li>
		</c:if>
	</ul>
</div>
</div>
<button class="btn btn-primary" onclick='location.href="insertForm.do?pcno=${board.pcno}&bno=0&pageNum=1"'>글쓰기</button>
</body>
</html>