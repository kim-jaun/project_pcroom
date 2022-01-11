<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>어데 피씹니까?</title>
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

	#carousel-example-generic {
		height: 190px;
		display: flex;
		align-items: center;
	}
	.pcDetail_contentInner {
		position: absolute;
		top: 0;
		left: 0;
		background-color: rgba(255, 255, 255, 0.7);
		width: 300px;
		height: 100%;
	}
	.pcTitle {
		display: flex;
		justify-content: center;
		align-items: center;
		width: 100%;
		height: 40px;
		padding: 0 15px;
		position: relative;
		font-size: 20px;
		margin: 10px 0;
	}
	.pcLikes {
		position: absolute;
		left: 15px;
	}
	.pcName {
		
	}
	.pcStar {
		position: absolute;
		right: 15px;
	}
	.pcInfo {
		margin-top: 20px;
		padding: 15px; 
	}
</style>
<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.14.0/css/all.css" integrity="sha384-HzLeBuhoNPvSl5KYnjx0BT+WB0QEEqLprO+NBkkk5gbc67FTaL7XIGa2w1L0Xbgc" crossorigin="anonymous">
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
			<div>
				<!-- pc방 헤드라인 -->
				<div class="pcTitle">
					<!-- 북마크 -->
					
					<span class="pcLikes"><i class="far fa-heart"></i></span>
					
					<!-- 북마크 끝 -->
					<a class="pcName" href="pcMainForm.do?pcno=${pc.pcno }">${pc.pcname}</a>
					<div class="pcStar">
						<span><i class="far fa-star"></i>${pc.pclikes }</span>
					</div>
				</div>
				<!-- pc방 헤드라인 끝 -->
				<!-- pc방 사진 -->
				<div id="carousel-example-generic" class="carousel slide" data-ride="carousel">
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
					<a class="left carousel-control" href="#carousel-example-generic" role="button" data-slide="prev"> 
						<span class="glyphicon glyphicon-chevron-left" aria-hidden="true"></span>
						<span class="sr-only">Previous</span>
					</a> 
					<a class="right carousel-control" href="#carousel-example-generic" role="button" data-slide="next"> 
						<span class="glyphicon glyphicon-chevron-right" aria-hidden="true"></span>
						<span class="sr-only">Next</span>
					</a>
				</div>
				<!-- pc방 사진 끝 -->
				
				<!-- pc방 info -->
				<div class="pcInfo">
					<span>${pc.pcinfo }</span>
				</div>
			</div>
		</div>
	</form>
</body>
</html>