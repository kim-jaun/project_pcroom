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
li.current {
	background-color: white;
}
li a:hover:not(.current) {
	background-color: #d5d5d5;
}
</style>
</head>
<body>
	<ul>
		<li><a href="memberList.do">회원 관리</a></li>
		<li><a href="pcList.do">pc방 관리</a></li>
		<li><a href="">게시판 관리</a></li>
	</ul>
	<form action="pcList.do">
		<input type="hidden" name="pageNum" value="1">
		<select name="searchKey">
			<c:forTokens var="search" items="pcname,pcaddr,pcinfo" delims="," varStatus="i">
				<c:if test="${search==pc.searchKey }">
					<option value="${search}" selected="selected">${title[i.index]}</option>
				</c:if>
				<c:if test="${search!=pc.searchKey }">
					<option value="${search}">${title[i.index]}</option>
				</c:if>
			</c:forTokens>
		</select>
		<input type="text" name="searchValue" value="${pc.searchValue }">
		<input type="submit" value="확인">
	</form>
<div class="container" align="center">
	<table>
		<tr><th>번호</th><th>pc방 이름</th><th>위치</th><th>승인여부</th></tr>
		<c:if test="${empty pcList }">
			<tr><td colspan="4">가맹 문의한 pc방이 없습니다.</td></tr>
		</c:if>
		<c:if test="${not empty pcList }">
			<c:forEach var="pc2" items="${pcList }">
				<tr><td>${pc2.pcno }</td>
					<td><a href="pcMainForm.do?pcno=${pc2.pcno}&pageNum=${pb.currentPage}&searchKey=${pc.searchKey}&searchValue=${pc.searchValue}">${pc2.pcname }</a></td>
					<td>${pc2.pcaddr }</td>
					<td>${pc2.permit }
					</td>
				</tr>
			</c:forEach>
		</c:if>
	</table>
</div>
	<div align="center">
	<ul class="pagination">
	<!-- 시작 페이지가 pagePerBlock보다 크면 앞에 보여줄 것이 있다 -->
		<c:if test="${pb.startPage > pb.pagePerBlock }">
			<li><a href="pcList.do?pageNum=1&searchKey=${pc.searchKey}&searchValue=${pc.searchValue}">
				<span class="glyphicon glyphicon-backward"></span></a></li>
			<li><a href="pcList.do?pageNum=${pb.startPage-1}&searchKey=${pc.searchKey}&searchValue=${pc.searchValue}">
				<span class="glyphicon glyphicon-triangle-left"></span></a></li>
		</c:if>
		<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage }">
			<c:if test="${pb.currentPage==i }">
				<li class="active"><a href="pcList.do?pageNum=${i}&searchKey=${pc.searchKey}&searchValue=${pc.searchValue}">${i}</a></li>
			</c:if>
			<c:if test="${pb.currentPage!=i }">
				<li><a href="pcList.do?pageNum=${i}&searchKey=${pc.searchKey}&searchValue=${pc.searchValue}">${i}</a></li>
			</c:if>
		</c:forEach>
		<!-- 보여줄 것이 남아있는 경우에는 endPage보다 totalPage가 큰경우 -->
		<c:if test="${pb.endPage < pb.totalPage }">
			<li><a href="pcList.do?pageNum=${pb.endPage+1}&searchKey=${pc.searchKey}&searchValue=${pc.searchValue}">
				<span class="glyphicon glyphicon-triangle-right"></span></a></li>
			<li><a href="pcList.do?pageNum=${pb.totalPage}&searchKey=${pc.searchKey}&searchValue=${pc.searchValue}">
				<span class="glyphicon glyphicon-forward"></span></a></li>
		</c:if>
	</ul>
</div>
</body>
</html>