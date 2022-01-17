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
	$('#disp').load('reservation.do?pcno=2');
});

</script>
<script type="text/javascript">
function seatSize2() {
	var width = ${pc.seatlow};
	var height = ${pc.seatcol};
	for(var i = 1; i <= width; i++) {
		for(var j = 1; j <= height; j++) {
				$("#seatChoice").append('<label class="seatLabel2 ' + i +'-' + j +'" for="' + i +'-' + j +'">' + i +'-' + j +'</lable>');
				$("#seatChoice").append('<input id="' + i +'-' + j +'" class="seat2" name="seatposition" type="checkbox" value="'+ i +'-' + j +'" disabled="disabled"/>');
		}
		$("#seatChoice").append('<br>');
	}
 	var seatlists = "${seatlists}";
 	var ss = seatlists.replace('[','');
 	var sss = ss.replace(']','');
 	var array = sss.split(',');
 	for (var s in array) {
		var trim = array[s].trim();
		$("." + trim).addClass('btn');
		$("#" + trim).removeAttr('disabled');	
	}
 	$('.seatLabel2').on('click', function(){
		if ($(this).hasClass("active")) { 
		// active class 제거
			$(this).removeClass("active");
		}
		else {
    	// active class 추가
			$(this).addClass('active');
		}
	});
};
</script>

</head>
<body onload="seatSize2()">
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
		<form action="reservation.do">
			<div id="seatChoice"></div>
			<input type="submit" value="예약">
		</form>
	</div>
</body>
</html>