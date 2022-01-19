<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
<style type="text/css">
	.form-control {
		width: 40%;
	}
	.reserveTiem {
		display: flex;
		justify-content: center;
		align-items: center;
	}
</style>
<script type="text/javascript">
$(function() {
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
 	
 	// 현재시간 기준 예약 시간 설정
 	var hour = ${now_hour};
 	var min = ${now_min};
 	for (var i = hour; i < 25; i++) {
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
</head>

<body>
<form action="reservation.do">
	<div class="reserveTiem">
		<select id="starttime" name="starttime" class="form-control"></select>
		<select id="endtime" name="endtime" class="form-control"></select>
	</div>
	<div id="seatChoice"></div>
	<input type="submit" value="예약">
</form>
</body>
</html>