<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>어데 피씹니까?</title>
<style type="text/css">
	#seatPosition input {
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
	.seatLabel {
		font-size: 13px;
		padding: 3px 0;
		width: 40px;
		margin: 2px 2px;
		border: 1px solid rgba(0, 0, 0, 0.5);
	}
</style>
<script type="text/javascript">
function seatSize() {
	$("#seatPosition").html("");
	var width = $("select[name=width]").val();
	var height = $("select[name=height]").val();
	for(var i = 1; i < width; i++) {
		for(var j = 1; j < height; j++) {
			$("#seatPosition").append('<label class="seatLabel btn btn-secondary" for="c' + i +'-' + j +'">' + i +'-' + j +'</lable><input id="c' + i +'-' + j +'" class="seat" type="checkbox" value="'+ i +'-' + j +'"/>')
		}
		$("#seatPosition").append('<br>');
	}
}

</script>
</head>
<body>
	<span>피씨방 좌석 구조</span>
	<select name="width">
		<optgroup label="가로"></optgroup>
			<c:forTokens var="i" items="10,15,20,25,30" delims=",">
				<option value=${i }>${i }</option>
			</c:forTokens>
	</select>
	<select name="height">
		<optgroup label="세로"></optgroup>
			<c:forTokens var="j" items="10,15,20,25,30" delims=",">
				<option value=${j }>${j }</option>
			</c:forTokens>
	</select>
	<input type="button" onclick="seatSize()" value="좌석 배치">
	<form action="seatSetting.do" name="frm">	
		<div id="seatPosition"></div>
		<input type="hidden" value="${pcno }">
		<input type="submit" value="저장">
	</form>
</body>
</html>