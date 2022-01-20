<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<style type="text/css">
	.slide-div {
	  position: absolute;
	  left: 0px;
	  top: 0px;
	  width: 250px;
	  height: 550px;
	  background: rgba(255, 255, 255, 0.6);
	  z-index: 100;
	  padding: 20px;
	}
	
	.button-div {
	  position: absolute;
	  left: 250px;
	  top: 30px;
	  width: 30px;
	  height: 90px;
	  background: #2C3D4F;
	  z-index: 100;
	}
	
	.button-open {
	  width: 0px;
	  height: 0px;
	  border-top: 20px solid transparent;
	  border-right: 25px solid #E5BF20;
	  border-bottom: 20px solid transparent;
	  z-index: 100;
	  margin: 25px 2.5px;
	}
	
	.button-close {
	  width: 0px;
	  height: 0px;
	  border-top: 20px solid transparent;
	  border-left: 25px solid #E5BF20;
	  border-bottom: 20px solid transparent;
	  z-index: 100;
	  margin: 25px 2.5px;
	}
</style>
<script type="text/javascript">
	$(".button-div").click(function(){
	  
	  $(this).toggleClass("div-close");
	  
	  if ($(this).hasClass("div-close")) {
	    $(".slide-div").animate({ left: "-230px"}, 800);  
	    $(".button-div").animate({ left: "20px"}, 800);
	    $(this).find(".button-open").attr("class", "button-close");
	  } else {
	    $(".slide-div").animate({ left: "0px"}, 800);  
	    $(".button-div").animate({ left: "250px"}, 800);
	    $(this).find(".button-close").attr("class", "button-open");
	  }
	});
</script>
</head>
<body>
	<div class="slide-div">
		<form action="" name="frm" onsubmit="return juso()">
			<select id="sido" name="sido">
				<option value="">특별시/도</option>
			</select> 
			<select id="sigugun" name="sigugun">
				<option value="">시/군/구</option>
			</select> 
			<select id="dong" name="dong">
				<option value="">동/읍/면</option>
			</select>
			<input type="submit">
		</form>
		<form action="">
			<label class="keyword" for="print">프린트</label>
			<input type="checkbox" id="print" class="keywordbox" name="print" value="프린트">
			<label class="keyword" for="duel">듀얼모니터</label>
			<input type="checkbox" id="duel" class="keywordbox" name="duel" value="듀얼모니터">
			<label class="keyword" for="curve">커브드모니터</label>
			<input type="checkbox" id="curve" class="keywordbox" name="curve" value="커브모니터">
			<label class="keyword" for="crt">CRT모니터</label>
			<input type="checkbox" id="crt" class="keywordbox" name="crt" value="CRT모니터">
			<label class="keyword" for="atm">ATM기기</label>
			<input type="checkbox" id="atm" class="keywordbox" name="atm" value="ATM기기">
			<label class="keyword" for="air">공기청정기</label>
			<input type="checkbox" id="air" class="keywordbox" name="air" value="공기청정기">
			<label class="keyword" for="battery">스마트폰충전</label>
			<input type="checkbox" id="battery" class="keywordbox" name="battery" value="스마트폰충전">
			<label class="keyword" for="game">모바일게임</label>
			<input type="checkbox" id="game" class="keywordbox" name="game" value="모바일게임">
			<input type="submit" value="찾기">
		</form>
		<div id="dispww">
		<c:if test="${not empty listsearch }">
			<c:forEach var="i" items="${listsearch }">
				<span>${i.pcno }</span>
			</c:forEach>
		</c:if>
		</div>
	</div>
	<div class="button-div div-close">
		<div class="button-open"></div>
	</div>
</body>
</html>