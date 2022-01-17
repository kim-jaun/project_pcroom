<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>어데 피씹니까?</title>
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
}
</style>
<script type="text/javascript">
$(function() {	
	$('#disp').load('reservation.do?pcno=5');
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
					<img alt="" src="resources/upload/${list[0].imagename }">
				</div>
				<c:forEach var="photo" items="${list }" begin="1">
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
	<div class="right">
		<div id="disp"></div>
	</div>
</body>
</html>