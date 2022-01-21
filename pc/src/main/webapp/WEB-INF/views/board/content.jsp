<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>어데 피씹니까?</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/bootstrap/css/content.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style type="text/css">

 	body {
		background-color: #2c3e50;
	}
	.content_center{
		display: flex;
		justify-content: center;
		align-items: center;
		flex-direction: column;
		}
	.total_content{
		width: 90%; 
		height: 90%;
		border-radius: 20px;
		background-color: white;
		padding: 50px;
		margin-top: -7px;
		
	}  
</style>
<script type="text/javascript">
	function del(del_bno) {
		var con = confirm("삭제하시겠습니까?");
		if (con) {
			location.href="boardDelete.do?pcno=${board.pcno}&pageNum=${pageNum}&bno="+del_bno;
		} else alert("삭제가 취소되었습니다.");
	}
	$(function() {
		// 현재 게시글에 해당하는 댓글을 가져와서 보여줘라
		$('#disp').load('replyList.do?pcno=${board.pcno}&bno=${board.bno}&pageNum=${pageNum}');
		$('#rInsert').click(function() {
			var sendData = $('#frm1').serialize();
			$.post('rInsert.do',sendData, function(data) {
				alert("댓글이 작성 되었습니다");	
				$('#disp').html(data);
				frm1.content.value="";  // 작성했던 댓글 삭제
			});
		});
	});
	function likesClick(bno) {
		// 게시글 좋아요 클릭
		$.post("board_likes.do", "bno=" + bno, function(data) {
			var likes = data.split(",")[0];
			var imgSrc = data.split(",")[1];
			$(".likes_cnt").text(likes);
			$(".likes_cnt").siblings("img").attr("src", imgSrc);
		});
	}
</script>

</head>
<body>
<div class="content_center">
<div class="total_content">
<div class="table">
<div class="table_form1">
	<div class="first">${board.subject }</div>
	<div class="second">| ${nick_name }</div>
	<div class="fourth">조회수 : ${board.read_cnt }</div>
	<div class="third">${board.reg_date }</div>
</div>
	<div class="table_form2">${board.content }</div>
</div>
	<div align="center">
		<img class="likes" alt="" src="${imgSrc }" onclick="likesClick(${board.bno})"><span class="likes_cnt">${board.likes }</span>
		<br>
	<a href="boardList.do?pcno=${board.pcno}&pageNum=${pageNum }&searchKey=${board.searchKey}&searchValue=${board.searchValue}" class="btn btn-secondary btn-sm">목록</a>
	<div>
		<c:if test="${memberSession.id == 'admin'}">
			<a onclick="del('${board.bno}')" class="btn btn-danger">삭제</a>
		</c:if>
  		<c:if test="${memberSession.nick_name == nick_name}"> 
			<a href="boardUpdateForm.do?pcno=${board.pcno}&bno=${board.bno}&pageNum=${pageNum}&searchKey=${board.searchKey}&searchValue=${board.searchValue}" class="btn btn-primary btn-sm">수정</a>
			<a onclick="del('${board.bno}')" class="btn btn-danger btn-sm">삭제</a>
  		</c:if> 
	</div>
	<div>
		<form action="" name="frm1" id="frm1">
			<input type="hidden" name="pcno" value="${board.pcno }">
			<input type="hidden" name="bno" value="${board.bno }">
			<input type="hidden" name="pageNum" value="${pageNum }">
			<input type="hidden" name="mno" value="${memberSession.mno }">
			<div class="reply_title">댓글작성</div>
			<textarea rows="5" cols="40" name="content"></textarea>
			<div>
				<input type="button" value="확인" id="rInsert" class="btn btn-primary">
			</div>
		</form>
	</div>
		</div>
	<br>
<div id="disp"></div>
</div>
</div>
</body>
</html>