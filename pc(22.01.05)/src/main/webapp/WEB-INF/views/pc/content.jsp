<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>어데 피씹니까?</title>
<script type="text/javascript">
	function del(del_bno) {
		var con = confirm("삭제하시겠습니까?");
		if (con) {
			location.href="boardDelete.do?pcno=${board.pcno}&pageNum=${pageNum}&bno="+del_bno;
		} else alert("삭제가 취소되었습니다.");
	}
// 	$(function() {
// 		$('#disp').load('replyList.do?pcno=${board.pcno}&bno=${board.bno}&pageNum=${pageNum}')
// 	});
	$(function() {
		// 현재 게시글에 해당하는 댓글을 가져와서 보여줘라
		$('#disp').load('replyList.do?pcno=${board.pcno}&bno=${board.bno}&pageNum=${pageNum}');
		$('#rInsert').click(function() {
/* 			var sendData="bno="+frm1.bno.value+"&replyer="+
				frm1.replyer.value+"&replytext="+frm1.replytext.value; */
			var sendData = $('#frm1').serialize();
			$.post('rInsert.do',sendData, function(data) {
				alert("댓글이 작성 되었습니다");	
				$('#disp').html(data);
				frm1.content.value="";  // 작성했던 댓글 삭제
			});
		});
	});
</script>
</head>
<body>
<div class="container" align="center">
	<div>제목</div>
	<div>${board.subject }</div>
	<div>작성자</div>
	<div>${board.nick_name }</div>
	<div>작성일</div>
	<div>${board.reg_date }</div>
	<div>조회수</div>
	<div>${board.read_cnt }</div>
	<div>좋아요</div>
	<div>${board.likes }</div>
	<div>내용</div>
	<div>${board.content }</div>
	<a href="boardList.do?pcno=${board.pcno}&pageNum=${pageNum }" class="btn btn-info">목록</a>
	<div>
		<c:if test="${memberSession.id == 'admin'}">
			<a onclick="del('${board.bno}')">삭제</a>
		</c:if>
  		<c:if test="${memberSession.nick_name == board.nick_name}"> 
			<a href="boardUpdateForm.do?pcno=${board.pcno}&bno=${board.bno}&pageNum=${pageNum}">수정</a>
			<a onclick="del('${board.bno}')">삭제</a>
  		</c:if> 
	</div>
</div>
	<div align="center">
		<form action="" name="frm1" id="frm1">
			<input type="hidden" name="pcno" value="${board.pcno }">
			<input type="hidden" name="bno" value="${board.bno }">
			<input type="hidden" name="pageNum" value="${pageNum }">
			<div class="reply_title">댓글작성</div>
			<textarea rows="5" cols="40" name="content"></textarea>
			<div>
				<input type="submit" value="확인" id="rInsert" class="btn btn-primary">
			</div>
		</form>
	</div>
	<br>
<div id="disp"></div>
</body>
</html>