<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<style type="text/css">
	.detailForm{
		display: none;
		position: absolute;
		width: 80%;
		height: 550px;
		z-index: 100;
		top: 0;
		left: 10%;
	}
	.detailForm .pcDetail_form {
		height:100%;
		width:100%;
		background-color: rgba(0, 0, 0, 0);
	}
	.detailForm .close {
/* 		position:absolute; */
/* 		width: 20px; */
/* 		top: 24px; */
/* 		right: 24px; */
/* 		cursor: pointer; */
	}
	
	.pcDetail_contentInner {
		position: absolute;
		top: 0;
		left: 0;
		background-color: rgba(255, 255, 255, 0.7);
		width: 300px;
		height: 100%;
	}
	
	
</style>
<script type="text/javascript">
	$(function() {
		$('.pcDetail_btn').on('click', function() {
			$('.detailForm').show();
			('html body').css('overflow', 'hidden');
		})
		$('.close, .pcDetail_form').on('click', function() {
			$('.detailForm').hide();
			$('html body').css('overflow', 'auto');
		})
	})
</script>
</head>
<body>
	<form class="detailForm" action="pcDetail.do" method="post" name="frm">
		<div class="pcDetail_form"></div>
		<div class="pcDetail_content"></div>
		<div class="close"></div>
		<div class="pcDetail_contentInner">
			<h5>wowwowowowow</h5>
		</div>
	</form>
</body>
</html>