<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<title>Insert title here</title>
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

<body onload="seatSize2">
<form action="reservation.do">
	<div id="seatChoice"></div>
	<input type="submit" value="예약">
</form>
</body>
</html>