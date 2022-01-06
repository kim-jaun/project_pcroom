<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initialscale=1">
<style>
	caption { font-size: 30px; }
	.err { color: red; font-weight: bold; }
    th { background: green; color:white; font-weight: bold; }
    .total { background: #2A557F; opacity: 0.9;}
    img { height: 70px;}
</style>
<!-- pageContext.request.contextPath : 프로젝트 명 -->
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<%-- ${path }를 사용하면 패키지의 경올가 절대경로로 변경 --%>
<link rel="stylesheet" type="text/css" href="${path}/resources/bootstrap/css/bootstrap.min.css">
<script type="text/javascript" src="${path}/resources/bootstrap/js/jquery.js"></script>
<script type="text/javascript" src="${path}/resources/bootstrap/js/bootstrap.min.js"></script>
<body>
<div class="total">
	<a href="main.do">
		<img alt="" src="/pc/resources/images/logo.png">
	</a>

	<c:if test="${sessionScope.memberSession.id == null }">
		 <button onclick='location.href = "loginForm.do"'>로그인</button>
		 <button onclick='location.href = "joinForm.do"'>회원가입</button>
		 <button onclick='location.href= "mypageForm.do"'>마이페이지</button>
	</c:if>
	<c:if test="${sessionScope.memberSession.id != null }">
		<c:if test="${sessionScope.memberSession.id == 'admin'}">
			<button onclick='location.href="adminMain.do"'>관리자 페이지</button>
				</c:if>
				<c:if test="${sessionScope.memberSession.id != 'admin'}">
					<img alt="" src="/pc/resources/upload/${sessionScope.memberSession.profile }">
					${sessionScope.memberSession.nick_name }님 환영합니다
				</c:if>
				<button onclick='location.href="mypageForm.do"'>마이페이지</button>
				<button onclick='location.href="logout.do"'>로그아웃</button>
			</c:if>
	 <button onclick='location.href = "registerForm.do"'>가맹점 문의</button>
	 <button onclick='location.href = "pcMainForm.do"'>pc방</button>
</div>
</body>