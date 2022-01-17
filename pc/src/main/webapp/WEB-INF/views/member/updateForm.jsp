<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="../header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>어데 피씹니까?</title>
<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" /> 
<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script> 
<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
<style type="text/css">
ul {
	background-color: #d5d5d5;
	width : 150px;
	list-style-type : none;
	margin : 0;
	padding: 0;
}
li a {
	display: block;
	color: black;
	padding: 8px;
	text-align: center;
	text-decoration: none;
	font-weight: bold;
}
li.current {
	background-color: white;
}
li a:hover:not(.current) {
	background-color: #d5d5d5;
}
</style>
<script type="text/javascript">
function chk() {
	if (frm.nick_namechk.value == 0) {
		alert("닉네임를 확인해주세요.");
		return false;
	}
	if (frm.emailchk.value == 0) {
		alert("이메일를 확인해주세요.");
		return false;
	}
}
function pass_chk() { // 암호 확인
	if (frm.password.value != '' && frm.password2.value != '') {
		if (frm.password.value == frm.password2.value) {
			document.getElementById('same').innerHTML = '비밀번호가 일치합니다.';
			document.getElementById('same').style.color = 'blue';
		} else {
			document.getElementById('same').innerHTML = '비밀번호가 일치하지 않습니다.';
			document.getElementById('same').style.color = 'red';
			frm.password2.focus();
			frm.password2.value = "";
		}
	}
}
function chk3() { // 닉네임 중복체크
	if (!frm.nick_name.value) {
		alert("닉네임을 입력하고 중복체크 하세요.");
		frm.nick_name.focus();
		return false;
	}
	$.post('confirmNick_name2.do', "nick_name=" + frm.nick_name.value, function(data) {
		if (data == 0) {
			$('#err2').html("이미 사용중인 닉네임입니다.");
			$('#err2').css("color", "red");
			return false;
		} else {
			$('#err2').html("사용 가능한 닉네임입니다.");
			$('#err2').css("color", "blue");
			frm.nick_namechk.value = "1";
			return false;
		}
	});
}
function chk4() { // 이메일 중복체크
	if (!frm.email.value) {
		alert("이메일을 입력하고 중복체크 하세요.");
		frm.email.focus();
		return false;
	}
	$.post('confirmEmail2.do', "email=" + frm.email.value, function(data) {
		if (data == 0) {
			$('#err3').html("이미 사용중인 이메일입니다.");
			$('#err3').css("color", "red");
			return false;
		} else {
			$('#err3').html("사용 가능한 이메일입니다.");
			$('#err3').css("color", "blue");
			frm.emailchk.value = "1";
			return false;
		}
	});
}
</script>
</head>
<body>
<div class="navi_admin"> 
	<ul class="sidebar">
		<li><a href="updateForm.do">회원정보 수정</a></li>
		<li><a href="reserveList.do">예매내역</a></li>
		<li><a href="bookmark.do">즐겨찾기</a></li>
	</ul>
</div>
	<div class="total_content" align="center">
	<form class="join_form" action="update.do" method="post" name="frm" onsubmit="return chk()"  enctype="multipart/form-data">
		<input type="hidden" name="nick_namechk" value="0"> 
		<input type="hidden" name="emailchk" value="0">
		<div class="join_total">
		<div class="title_size">회원정보 수정</div>
			<div class="form_group">
				<input class="form-control" type="file" name="file">
			</div>
			<div>아이디</div>
			<div class="join_content content_id">
				<input type="text" name="id" value="${member.id }" readonly="readonly" class="form-control" style="width:335px;">
			</div>
			<div>암호</div>
			<div class="join_content">
				<input type="password" name="password" required="required" class="form-control" style="width:335px;">
			</div>
			<div>암호확인</div>
			<div class="join_content">
				<input type="password" name="password2" required="required" onchange="pass_chk()" class="form-control" style="width:335px;">
			</div>
			<div id="same"></div>
			<div>이름</div>
			<div class="join_content">
				<input type="text" name="name" value="${member.name }" required="required" class="form-control" style="width:335px;">
			</div>
			<div>닉네임</div>
			<div class="join_content content_id">
				<input type="text" name="nick_name" value="${member.nick_name }" required="required" class="form-control" style="width:335px;">
				<input type="button" onclick="chk3()" value="중복체크" class="btn btn-primary btn_size">
			</div>
			<div id="err2"></div>
			<div>연락처</div>
			<div class="join_content">
				<input type="tel" name="phone" required="required" value="${member.phone }" pattern="010-\d{3,4}-\d{4}"
						placeholder="ex)010-1111-1111" title="전화형식 010-숫자3/4-숫자4" class="form-control" style="width:335px;">
			</div>
			<div>성별</div>
			<div>
				<input type="radio" name="gender" value="m" id="m" checked="checked"><label for="m">남자</label> 
				<input type="radio" name="gender" value="f" id="f"><label for="f">여자</label>
			</div>
			<div>생년월일</div>
			<div>
				<input type="date" name="birth" id='currentDate' required="required" value="${member.birth }">
			       <script>
			           document.getElementById('currentDate').max = new Date().toISOString().substring(0, 10);
			       </script>
			</div>
			<div>이메일</div>
			<div class="join_content content_id">
				<input type="email" name="email" value="${member.email }" required="required" class="form-control" style="width:335px;">
				<input type="button" onclick="chk4()" value="중복체크" class="btn btn-primary btn_size">
			</div>
			<div id="err3"></div>
			<div>회원식별</div>
				<select name="identity">
					<option>일반회원</option>
					<option>점주</option>
				</select>
			<div><input type="submit" value="수정완료" class="btn btn-primary btn_size"></div>
		</div>
	</form>
	</div>
</body>
</html>