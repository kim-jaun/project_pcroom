<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>어데 피씹니까?</title>
<script type="text/javascript">
	function blackin(b_mno) {
		var con = confirm("블랙리스트에 추가하시겠습니까?");
		if(con) {
			location.href="blackin.do?mno="+b_mno;
		}
	}
	function blackout(b_mno) {
		var con = confirm("블랙리스트에서 제외하시겠습니까?");
		if(con) {
			location.href="blackout.do?mno="+b_mno;
		}
	}
	function del(d_mno) {
		var con = confirm("탈퇴처리 하시겠습니까?");
		if(con) {
			location.href="memberDelete.do?mno="+d_mno;
		}
	}
</script>
<style type="text/css">
ul {
	background-color: #d5d5d5;
	width: 150px;
	list-style-type: none;
	margin: 0;
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
li
 
a
:hover
:not
 
(
.current
 
)
{
background-color
:
 
#d5d5d5
;


}
</style>
</head>
<body>
	<ul>
		<li><a href="memberList.do">회원 관리</a></li>
		<li><a href="pcList.do">pc방 관리</a></li>
		<li><a href="">게시판 관리</a></li>
	</ul>
	<form action="memberList.do">
		<input type="hidden" name="pageNum" value="1">
		<select name="searchKey">
			<c:forTokens var="search" items="identity,id,name,nick_name" delims="," varStatus="i">
				<c:if test="${search==member1.searchKey }">
					<option value="${search}" selected="selected">${title[i.index]}</option>
				</c:if>
				<c:if test="${search!=member1.searchKey }">
					<option value="${search}">${title[i.index]}</option>
				</c:if>
			</c:forTokens>
		</select>
		<input type="text" name="searchValue" value="${member1.searchValue }">
		<input type="submit" value="확인">
	</form>
	<div class="container" align="center">
		<table>
			<tr>
				<th>번호</th>
				<th>구별</th>
				<th>아이디</th>
				<th>이름</th>
				<th>닉네임</th>
				<th>생년월일</th>
				<th>전화번호</th>
				<th>성별</th>
				<th>이메일</th>
				<th>블랙리스트</th>
				<th>탈퇴여부</th>
			</tr>
			<c:if test="${empty memberList }">
				<tr>
					<td colspan="11">회원이 없습니다.</td>
				</tr>
			</c:if>
			<c:if test="${not empty memberList }">
				<c:forEach var="member" items="${memberList }">
					<tr>
						<td>${member.mno }</td>
						<td>${member.identity }</td>
						<td>${member.id }</td>
						<td>${member.name }</td>
						<td>${member.nick_name }</td>
						<td>${member.birth }</td>
						<td>${member.phone }</td>
						<td>${member.gender }</td>
						<td>${member.email }</td>
						<td>
							<c:if test="${member.del == 'n'}">
								<c:if test="${member.blacklist == 'n   '}">
									<button onclick="blackin('${member.mno }')">추가</button>
								</c:if>
								<c:if test="${member.blacklist == 'y   '}">
									<button onclick="blackout('${member.mno }')">취소</button>
								</c:if>
							</c:if>
						</td>
						<td>
							<c:if test="${member.del == 'n'}">
								<button onclick="del('${member.mno }')">탈퇴</button>
							</c:if>
							<c:if test="${member.del == 'y'}">
								탈퇴한 회원입니다.
							</c:if>
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
				<li><a href="memberList.do?pageNum=1&searchKey=${member1.searchKey}&searchValue=${member1.searchValue}"> 
					<span class="glyphicon glyphicon-backward"></span></a></li>
				<li><a href="memberList.do?pageNum=${pb.startPage-1}&searchKey=${member1.searchKey}&searchValue=${member1.searchValue}"> <span
						class="glyphicon glyphicon-triangle-left"></span></a></li>
			</c:if>
			<c:forEach var="i" begin="${pb.startPage }" end="${pb.endPage }">
				<c:if test="${pb.currentPage==i }">
					<li class="active"><a href="memberList.do?pageNum=${i}&searchKey=${member1.searchKey}&searchValue=${member1.searchValue}">${i}</a></li>
				</c:if>
				<c:if test="${pb.currentPage!=i }">
					<li><a href="memberList.do?pageNum=${i}&searchKey=${member1.searchKey}&searchValue=${member1.searchValue}">${i}</a></li>
				</c:if>
			</c:forEach>
			<!-- 보여줄 것이 남아있는 경우에는 endPage보다 totalPage가 큰경우 -->
			<c:if test="${pb.endPage < pb.totalPage }">
				<li><a href="memberList.do?pageNum=${pb.endPage+1}&searchKey=${member1.searchKey}&searchValue=${member1.searchValue}"> <span
						class="glyphicon glyphicon-triangle-right"></span></a></li>
				<li><a href="memberList.do?pageNum=${pb.totalPage}&searchKey=${member1.searchKey}&searchValue=${member1.searchValue}"> <span
						class="glyphicon glyphicon-forward"></span></a></li>
			</c:if>
		</ul>
	</div>
</body>
</html>