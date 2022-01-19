<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<script type="text/javascript">
	$(function seatSize2() {
		var width = ${pc.seatlow};
		var height = ${pc.seatcol};
		for(var i = 1; i <= width; i++) {
			for(var j = 1; j <= height; j++) {
					$("#seatChoice").append('<label class="seatLabel2 ' + i +'-' + j +'" for="' + i +'-' + j +'">' + i +'-' + j +'</lable>');
					$("#seatChoice").append('<input id="' + i +'-' + j +'" class="seat2" name="reserveSeatPosition" type="checkbox" value="'+ i +'-' + j +'" disabled="disabled"/>');
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
	 // 현재시간 기준 예약 시간 설정
	 	var hour = ${now_hour};
	 	var min = ${now_min};
	 	for (var i = hour; i < 24; i++) {
	 		if(min == 0) {
	 			$('#starttime').append('<option value=' + i + ':00/>' + i + ':00');
	 			$('#starttime').append('<option value=' + i + ':30/>' + i + ':30');
	 			$('#endtime').append('<option value=' + (i+1) + ':30/>' + (i+1) + ':30');
	 			$('#endtime').append('<option value=' + (i+1) + ':00/>' + (i+1) + ':00');
	 		} else {
	 			$('#starttime').append('<option value=' + i + ':30/>' + i + ':30');
	 			$('#starttime').append('<option value=' + (i+1) + ':00/>' + (i+1) + ':00');
	 			$('#endtime').append('<option value=' + (i+1) + ':00/>' + (i+1) + ':00');
	 			$('#endtime').append('<option value=' + (i+1) + ':30/>' + (i+1) + ':30');
	 		}
	 	}
	});
	 

</script>

<style type="text/css">
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
.reserveTiem {
		display: flex;
		justify-content: center;
		align-items: center;
}
</style>
<body>
<form action="reservation.do">
	<div id="seatChoice"></div>
	

	<div class="reserveTiem">
		<select id="starttime" name="starttime" class="form-control"></select>
		<select id="endtime" name="endtime" class="form-control"></select>
	</div>
	
	<select name="reservetime">
		<option value="${fee.w1000}">1000원  ${fee.w1000 }분</option>
		<option value="${fee.w3000}">3000원  ${fee.w3000 }분</option>
		<option value="${fee.w5000}">5000원  ${fee.w5000 }분</option>
		<option value="${fee.w10000}">10000원  ${fee.w10000 }분</option>
		<option value="${fee.w50000}">50000원  ${fee.w50000 }분</option>
		<option value="${fee.w100000}">100000원  ${fee.w100000 }분</option>
	</select>
	
	<input type="submit" value="예약">
</form>
</body>
</html>