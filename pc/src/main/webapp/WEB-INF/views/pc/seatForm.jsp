<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>어데 피씹니까?</title>
<style type="text/css">
	.seatBox{
		display: flex;
		justify-content: center;
		
	}
</style>
<script type="text/javascript">
function seatSize() {
	$("#seatPosition").html("");
	var width = $("select[name=width]").val();
	var height = $("select[name=height]").val();
	for(var i = 1; i < width; i++) {
		for(var j = 1; j < height; j++) {
			$("#seatPosition").append('<label class="seatLabel">' + i +'-' + j +'</lable>')
			$("#seatPosition").append('<input class="seat" type="checkbox" value="'+ i +'-' + j +'">');
		}
		$("#seatPosition").append('<br>');
	}
}

</script>
</head>
<body>
	<span>가로 좌석 길이</span>
	<select name="width">
		<optgroup label="가로"></optgroup>
			<c:forTokens var="i" items="10,30,50,70,100" delims=",">
				<option value=${i }>${i }</option>
			</c:forTokens>
	</select>
	<select name="height">
		<optgroup label="세로"></optgroup>
			<c:forTokens var="j" items="10,30,50,70,100" delims=",">
				<option value=${j }>${j }</option>
			</c:forTokens>
	</select>
	<input type="button" onclick="seatSize()" value="좌석 배치">
	<div id="seatPosition"></div>
</body>
</html>