<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>어데 피씹니까?</title>
<link rel="stylesheet" type="text/css" href="${path}/resources/bootstrap/css/bootstrap.min.css">  
<script type="text/javascript" src="${path}/resources/bootstrap/js/jquery.js"></script>
<script type="text/javascript" src="${path}/resources/bootstrap/js/bootstrap.min.js"></script>
<script type="text/javascript">
	// 가맹점 승인(관리자만)
	function permit(p_pcno){
		var con = confirm("가맹점 승인하시겠습니까?");
		if(con){
			location.href="pcPermit.do?pageNum=${pageNum}&pcno="+p_pcno;
		}
	}
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
	function bookmarkClick(pcno) {
		// 피씨방 북마크 클릭
		$.post("bookmark.do", "pcno="+pcno, function(data) {
			var imgSrc = data;
			$(".bookmark").attr("src", imgSrc);
		});
	} 
	$(function() {
		// 현재 게시글에 해당하는 댓글을 가져와서 보여줘라
		$('#review').load('reviewList.do?pcno=${pc.pcno}&pcname=${pc.pcname }&pageNum=${pageNum}');
	});
</script>
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
.carousel {
	width: 500px;
	height: 300px;
}
.carousel-inner img {
	width: 100%;
	height: 100%:
}

.item {
	width: 100%;
	height: 100%;
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

.seatLabel2.active {
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
		padding-left: 0;
	}  
</style>
</head>
<body onload="seatSize2()">
<div class="content_center">
<div class="total_content">
	<!-- 북마크 -->
	<div class="pcLikes">
		<c:if test="${id != null}">
			<c:if test="${id != 'admin'}">
				<img class="bookmark" onclick="bookmarkClick(${pc.pcno})" alt=""
					src="${imgSrc}" width="30px" height="30px">
			</c:if>
		</c:if>
	</div>
	<!-- 북마크 끝 -->
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
		<c:if test="${id == 'admin'}">
			<c:if test="${pc.permit == 'n' }">
				<button onclick="permit(${pc.pcno})">승인</button>
			</c:if>
			<c:if test="${pc.permit == 'y' }">
				<button>승인완료</button>
			</c:if>
		</c:if>
	</div>
	<div class="right" align="center">
		<div>
			<div id="view"></div>
			<button onclick='location.href="reviewList.do?pcno=${pc.pcno}&pcname=${pc.pcname }"'>리뷰</button>
			<button onclick='location.href="boardList.do?pcno=${pc.pcno}"'>게시판</button>
			<button onclick='location.href="seatForm.do?pcno=${pc.pcno}"'>좌석배치
				수정</button>
		</div>
		<div>
			<c:if test="${id == 'admin'}">
				<button onclick="location.href='pcList.do?pageNum=${pageNum}'">목록</button>
			</c:if>
		</div>
		<form action="reservation.do">
			<div id="seatChoice"></div>
			<input type="submit" value="예약">
		</form>
	</div>
</div>
</div>
</body>
</html>