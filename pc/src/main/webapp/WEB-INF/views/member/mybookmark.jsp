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
		width: 90%; 
		height: 500px;
		border-radius: 20px;
		background-color: white;
	}
	.btn-primary{
		margin: 7px 20px;
	}
	.form_line {
		display: flex;
		justify-content: center;
	}
	.form-control {
	width: 335px;
	border: none;
	background-color: white;
	border-bottom: 1px solid #2c3e50;
	margin-bottom: 10px;
}
.paging {
	display: flex;
		justify-content: center;
}
.title {
	margin-left: 30px;
}
.navi_admin{
	float: left;
	margin-right: 30px;
}

</style>
</head>
<body>
<div class="content_center">
<div class="total_content">
<div class="navi_admin"> 
	<ul class="sidebar">
		<li><a href="updateForm.do">회원정보 수정</a></li>
		<li><a href="reserveList.do">예매내역</a></li>
		<li><a href="mybookmark.do">즐겨찾기</a></li>
	</ul>
</div>
	<h5 class="title">즐겨찾기한 pc방 목록  : ${total }개</h5>
<div class="form_line">
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
	<div class="paging">
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
</div>
</div>
</body>
</html>