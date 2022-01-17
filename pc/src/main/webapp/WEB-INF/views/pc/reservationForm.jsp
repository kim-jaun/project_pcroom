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
 	var today = new Date();
	var hours = today.getHours();
	var minutes = today.getMinutes();
	var times = "";
	if (minutes < 30) {
		times = houars + ":00";
	} else {
		times = houars + ":30";
	}
	var start = ""
	$('#hours').val(times);
});
</script>
</head>

<body>
<form action="reservation.do">
	<div class="reserveTiem">
		<select id="starttime" name="starttime" class="form-control">
		<c:set var="breakPoint" value="0" />
		<c:forEach var="i" begin="${hours }" end="24">
		    <c:forEach var="j" begin="0" end="1">
		        <c:if test="${(i == 24) && (j == 1)}">    
		            <c:set var="breakPoint" value="1" />                                    
		        </c:if>
		        <c:if test="${breakPoint == 0}">
		            <option value="${i}:<fmt:formatNumber pattern="00" value="${j*30}" />">${i}:
		            <fmt:formatNumber pattern="00" value="${j*30}" />
		            </option>                                                                            
		        </c:if>
		    </c:forEach>
		</c:forEach>
		</select>
		<select id="endtime" name="endtime" class="form-control">
		<c:set var="breakPoint" value="0" />
		<c:forEach var="i" begin="${hours }" end="24">
		    <c:forEach var="j" begin="0" end="1">
		        <c:if test="${(i == 24) && (j == 1)}">    
		            <c:set var="breakPoint" value="1" />                                    
		        </c:if>
		        <c:if test="${breakPoint == 0}">
		            <option value="${i}:<fmt:formatNumber pattern="00" value="${j*30}" />">${i}:
		            <fmt:formatNumber pattern="00" value="${j*30}" />
		            </option>                                                                            
		        </c:if>
		    </c:forEach>
		</c:forEach>
		</select>
	</div>
	<input type="text" id="hours">
	<div id="seatChoice"></div>
	<input type="submit" value="예약">
</form>
</body>
</html>