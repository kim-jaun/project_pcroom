<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>어데 피씹니까?</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style type="text/css">
div.left {
	width: 50%;
	float: left;
	border-right: 1px solid black;
}

div.right {
	width: 50%;
	float: right;
}

.carousel-inner img {
	width: 100%;
	height: 100%:
}
.item {
	width: 100%;
	height: 40%;
	display: flex;
	align-items: center;
}
.right {
	display: flex;
	justify-content: center;
	align-items: center;
	flex-direction: column;
}
#seatChoice input {
 	position: absolute;
 	top: 50%; 	
 	left: 50%; 	
 	transform: translate(-50%, -50%);
	width: inherit;
	height: inherit;
	margin-bottom: 0;
 	z-index: -1;
 	opacity: 0;
 }
.seatLabel2 {
	font-size: 13px;
	padding: 3px 0;
	width: 40px;
	margin: 2px 2px;
	border: 1px solid rgba(0, 0, 0, 0); 
	opacity: 0;
}
.seatLabel2.active{
	background-color: rgba(255, 255, 255, 0.8);
}
.seatLabel2.btn {
	font-size: 13px;
	padding: 3px 0;
	width: 40px;
	margin: 2px 2px;
	border: 1px solid rgba(0, 0, 0, 0.5); 
	opacity: 1;
}

</style>
<script type="text/javascript">
$(function() {	
	$('#disp').load('reservationForm.do?pcno=${pc.pcno}');
});
</script>

</head>
<body>
	<h3>${pc.pcname }</h3>
	<div class="left" align="center">
		<div id="carousel-example-generic" class="carousel slide"
			data-ride="carousel">

			<!-- Wrapper for slides -->
			<div class="carousel-inner" role="listbox">
				<div class="item active">
					<img alt="" src="resources/upload/${photolist[0].imagename }">
				</div>
				<c:forEach var="photo" items="${photolist }" begin="1">
					<div class="item">
						<img alt="" src="resources/upload/${photo.imagename }">
					</div>
				</c:forEach>
			</div>

			<!-- Controls -->
			<a class="left carousel-control" href="#carousel-example-generic"
				role="button" data-slide="prev"> <span
				class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
				<span class="sr-only">Previous</span>
			</a> <a class="right carousel-control" href="#carousel-example-generic"
				role="button" data-slide="next"> <span
				class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
				<span class="sr-only">Next</span>
			</a>
		</div>
		<div>주소</div>
		<div>${pc.pcaddr }</div>
		<div>정보</div>
		<div>${pc.pcinfo }</div>
	</div>
	<div class="right" align="center">
		<div>
			<button onclick='location.href="boardList.do?pcno=${pc.pcno}"'>게시판</button>
			<button onclick='location.href="seatForm.do?pcno=${pc.pcno}"'>좌석배치 수정</button>
		</div>
		<div id="disp"></div>
	</div>
</body>
</html>