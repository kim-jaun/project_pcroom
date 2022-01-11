<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>어데 피씹니까?</title>
<link rel="stylesheet"
	href="https://use.fontawesome.com/releases/v5.14.0/css/all.css"
	integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc"
	crossorigin="anonymous">
<!-- pageContext.request.contextPath : 프로젝트 명 -->
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<%-- ${path }를 사용하면 패키지의 경올가 절대경로로 변경 --%>
<link rel="stylesheet" type="text/css"
	href="${path}/resources/bootstrap/css/bootstrap.min.css">
<script type="text/javascript"
	src="${path}/resources/bootstrap/js/jquery.js"></script>
<script type="text/javascript"
	src="${path}/resources/bootstrap/js/bootstrap.min.js"></script>
<style type="text/css">
.font_family {
	font-family: InfinitySans-RegularA1;
	margin: 0 50px;
}
.reply_likes{
	width: 50px;
	font-size: 12px;
	height: 30px;
	margin: 0 1px;
}
.reply_list{
	display: flex;
	width: 100%;
	align-items: center;
}
.reply_btn {
	display: flex;
	width: 100%;
	justify-content: flex-end;
	align-items: center;
}
.reply_writer{
	display:flex;
	width: 100%;
	align-items: flex-end;
}
.reply_reg_date{
	margin-left: 5px;
	font-size: 4px;
}
</style>
<script type="text/javascript">
function rDelete(pcno,bno,rno) {
	var sendData = 'pcno='+pcno+'bno='+bno+'&rno='+rno;
	$.post('${path}/rDelete', sendData, function(data) {
		alert("댓글이 삭제 되었습니다");
		$('#disp').html(data);
	});
}
function rUpdate(pcno,bno,rno) {
//	댓글을 읽어서 textarea에 넣어서 수정 가능하게 만들어야 한다
//	input, textarea에 있는 데이터를 읽을 떄는 jquery val()
//	td등 일반태그에 있는 데이터를 읽을 때는 jquery에서는 text()로 읽는다
	var txt = $('#td_'+rno).text();
//	클릭한 위치에 있는 댓글을 읽어서 수정할 수있도록 textarea에 넣기		
	$('#td_'+rno).html("<textarea rows='3' cols='30' id='rt_"+rno+"'>" +
			txt+"</textarea>");
//  현재의 버튼을 수정하고 난 후에 확인, 취소로 변경	
	$('#btn_'+rno).html("<input type='button' onclick='up("+pcno+","+bno+","+rno+")'"+
		" class='btn btn-sm btn-danger' value='확인'> "+
		"<input type='button' onclick='lst("+pcno+","+bno+")' " +
		" class='btn btn-sm btn-info' value='취소'>");
}
function lst(pcno,bno) {
	$('#disp').load('${path}/replyList/pcno/'+pcno+'/bno/'+bno);
}
function up(pcno,bno,rno) {
	var sendData = "replytext="+$('#rt_'+rno).val()+"&pcno="+pcno+"&bno="+bno+"&rno="+rno;
	$.post("${path}/rUpdate", sendData, function(data) {
		alert("댓글 수정 되었습니다");
		$('#disp').html(data);
	});
}

// 	$(function() {
// 		// 시작 시 수정 폼 hide
// 		$(".update_form").css("display", "none");
// 		$(".update_hide").css("display", "none");
// 		// 댓글 수정 폼 show
// 		$(".update_view").click(
// 				function() {
// 					$(this).parents(".reply_update").find(".update_form").css(
// 							"display", "block");
// 					$(this).parents(".reply_update").find(".origin_content").css(
// 							"display", "none");
// 					$(this).css("display", "none");
// 					$(this).siblings().css("display", "block");	
					
// 				});
// 		// 댓글 수정 폼 hide
// 		$(".update_hide").click(
// 				function() {
// 					$(this).parents(".reply_update").find(".update_form").css(
// 							"display", "none");
// 					$(this).parents(".reply_update").find(".origin_content").css(
// 							"display", "block");
// 					$(this).css("display", "none");
	
// 					$(this).siblings().css("display", "block");	
// 				});
		
// 	});
// 	function update() {
// 		alert("댓글이 수정되었습니다.");
// 	}
	
// 	function del() {
// 		var con = confirm("정말로 삭제하시겠습니까?")
// 		if (con) {
// 			alert("삭제되었습니다.")
// 			return
// 		} else
// 			alert("삭제가 취소되었습니다.")
// 			return false
// 	}
</script>
</head>
<body>
	<div class="container">
		<div>
			<c:if test="${empty list }">
				<div>댓글이 없습니다.</div>
			</c:if>
			<c:if test="${not empty list }">
				<c:forEach var="board_reply" items="${list }">
					<hr>
					<div class="reply_update">
						<c:if test="${board_reply.del=='y' }">
							<div><br>
							<span>삭제된 댓글입니다.</span><br>
							</div>
						</c:if>
						<c:if test="${board_reply.del != 'y' }">
							<div class="reply_list">
								<div class="reply_writer">
								<div style="color:black;">${board_reply.nick_name}</div> 
								<div class="reply_reg_date">(${reg_date}) </div> 
								</div>
								<div class="reply_btn">
	<%-- 								<c:if test="${board_reply.likesConfirm == 0}">									
										<div onclick="location.href='replyLikes.do?pcno=${board_reply.pcno}&bno=${board_reply.bno }&pageNum=${pageNum}&rno=${board_reply.rno}'" class="btn btn-primary likes reply_likes"><i class="far fa-thumbs-up"></i>${reply_event.likes }</div>
									</c:if>
									<!-- 추천을 한 사람 일때 -->
									<c:if test="${board_reply.likesConfirm == 1}">
										<div onclick="location.href='replyLikes.do?pcno=${board_reply.pcno}&bno=${board_reply.bno}&pageNum=${pageNum}&rno=${board_reply.rno}'" class="btn btn-warning likes_cancel reply_likes"><i class="far fa-thumbs-down"></i>${board_reply.likes }</div>
									</c:if>
									--%>
									<c:if test="${memberSession.mno == board_reply.mno || memberSession.id == 'admin'}">
<!-- 										<div class="btn btn-primary update_view reply_likes"><i class="far fa-edit"></i></div> -->
<!-- 										<div class="btn btn-primary update_hide reply_likes"><i class="fas fa-times"></i></div> -->
<%-- 									</c:if> --%>
<%-- 									<c:if test="${memberSession.mno == board_reply.mno || memberSession.id == 'admin'}"> --%>
									<form action="content.do" onsubmit="return del()">
										<input type="hidden" value="${board_reply.bno}" name="bno">
										<input type="hidden" value="1" name="delete">
										<input type="hidden" value="${board_reply.rno}" name="rno">
										<input type="hidden" value="${pageNum}" name="pageNum">
										<div id="btn_${board_reply.rno }">
											<input class="btn btn-info reply_likes" 
												onclick="rUpdate(${board_reply.bno},${board_reply.bno},${board_reply.rno})" type="submit" value="수정">
											<input class="btn btn-danger reply_likes" 
												onclick="rDelete(${board_reply.pcno},${board_reply.bno},${board_reply.rno})"type="submit" value="삭제">
										</div>
									</form>
									</c:if>  
<%-- 									<c:if test="${memberSession.mno == board_reply.mno}"> --%>
<!-- 										<form action="content.do" onsubmit="return del()"> -->
<%-- 											<input type="hidden" value="${board_reply.bno}" name="bno"> --%>
<!-- 											<input type="hidden" value="1" name="delete"> -->
<%-- 											<input type="hidden" value="${board_reply.rno}" name="rno"> --%>
<%-- 											<input type="hidden" value="${pageNum}" name="pageNum"> --%>
<%-- 											<div id="btn_${board_reply.rno }"> --%>
<!-- 												<input class="btn btn-danger reply_likes"  -->
<%-- 													onclick="rDelete(${board_reply.pcno},${board_reply.bno},${board_reply.rno})"type="submit" value="삭제"> --%>
<!-- 											</div> -->
<!-- 										</form> -->
<%-- 									</c:if>  --%>
									</div> 
								<br>
							</div>
								<div class="origin_content" id="td_${board_reply.rno }">${board_reply.content}</div>
<!-- 								<div class="update_form"> -->
<!-- 									<form action="content.do" onsubmit="return update()"> -->
<%-- 											<textarea class="form-control" id="exampleTextarea" rows="5" cols="20" name="update_content" style="resize: none;" required="required">${board_reply.content}</textarea><br> --%>
<%-- 											<input type="hidden" value="${board_reply.bno}" name="bno">  --%>
<%-- 											<input type="hidden" value="${pageNum}" name="pageNum">  --%>
<%-- 											<input type="hidden" value="${board_reply.rno}" name="rno">  --%>
<!-- 											<input class="btn btn-primary" type="submit" value="확인"> -->
<!-- 									</form> -->
<!-- 								</div> -->
						</c:if>
					</div><br>
				</c:forEach><br><br>
			</c:if>
		</div>
	</div>
</body>
</html>