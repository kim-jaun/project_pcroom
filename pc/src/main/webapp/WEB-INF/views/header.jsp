<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="spring" uri="http://www.springframework.org/tags"%>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initialscale=1">
<style>
caption {
	font-size: 30px;
}

.err {
	color: red;
	font-weight: bold;
}

.total {
	color: white;
}

.total img {
	width: 350px;
}

.dropdown {
	position: relative;
	display: inline-block;
}

.dropdown-button {
	padding: 8px;
	border: none;
	width: 60px;
}

.dropdown-content {
	display: none;
	position: absolute;
	/* 	background-color: white; */
	min-width: 160px;
	padding: 8px;
	box-shadow: 0px 8px 16px 0px rgba(0, 0, 0, 0, 2);
}

.dropdown-content a {
	color: yellow;
	padding: 8px;
	text-decoration: none;
	display: block;
}

.dropdown-content a:hover {
	background-color: white;
}

.dropdown:hover .dropdown-content {
	display: block;
}
</style>
<!-- pageContext.request.contextPath : 프로젝트 명 -->
<c:set var="path" value="${pageContext.request.contextPath }"></c:set>
<%-- ${path }를 사용하면 패키지의 경올가 절대경로로 변경 --%>
<link rel="stylesheet" type="text/css"
	href="${path}/resources/bootstrap/css/bootstrap.min.css">
<script type="text/javascript"
	src="${path}/resources/bootstrap/js/jquery.js"></script>
<script type="text/javascript"
	src="${path}/resources/bootstrap/js/bootstrap.min.js"></script>

<link rel="stylesheet" type="text/css"
	href="${path}/resources/bootstrap/css/pc.css">
<body>
	<nav class="navbar navbar-expand-lg navbar-dark bg-primary">
		<div class="container-fluid">
			<div class="total">
				<a href="main.do"><img alt=""
					src="/pc/resources/images/logo.png"></a>

				<c:if test="${sessionScope.memberSession.id == null }">
					<button class="btn btn-secondary my-2 my-sm-0"
						onclick='location.href="loginForm.do"'>로그인</button>
					<button class="btn btn-secondary my-2 my-sm-0"
						onclick='location.href="joinForm.do"'>회원가입</button>
				</c:if>
				<c:if test="${sessionScope.memberSession.id != null }">
					<c:if test="${sessionScope.memberSession.id == 'admin'}">
						<button class="btn btn-secondary my-2 my-sm-0"
							onclick='location.href="memberList.do"'>관리자 페이지</button>
						<div class="dropdown">
							<input class="dropdown-button" type="image"
								src="/pc/resources/upload/${sessionScope.memberSession.profile}"
								value=" ">
							<div class="dropdown-content">
								<a href="logout.do">로그아웃</a>
							</div>
						</div>
					</c:if>
					<c:if test="${sessionScope.memberSession.id != 'admin'}">
				${sessionScope.memberSession.nick_name }님 환영합니다
				<c:if test="${sessionScope.memberSession.identity == '점주'}">
							<c:if test="${sessionScope.memberSession.permitConfirm == -1}">
								<button class="btn btn-secondary my-2 my-sm-0"
									onclick='location.href = "registerForm.do"'>가맹점 문의</button>
							</c:if>
							<c:if test="${sessionScope.memberSession.permitConfirm == 0}">
						승인대기 중
					</c:if>
							<c:if test="${sessionScope.memberSession.permitConfirm == 1}">
						승인 완료
					</c:if>
						</c:if>
						<div class="dropdown">
							<input class="dropdown-button" type="image"
								src="/pc/resources/upload/${sessionScope.memberSession.profile}"
								value=" ">
							<div class="dropdown-content">
								<a href="passChkForm.do">마이페이지</a> <a href="logout.do">로그아웃</a>
							</div>
						</div>
					</c:if>
				</c:if>
			</div>
		</div>
	</nav>
</body>