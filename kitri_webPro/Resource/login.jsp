<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>로그인</title>

<!-- Font Awesome Icons -->
<link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700"
	rel="stylesheet">
<link
	href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic'
	rel='stylesheet' type='text/css'>

<!-- Plugin CSS -->
<link href="vendor/magnific-popup/magnific-popup.css" rel="stylesheet">

<!-- Theme CSS - Includes Bootstrap -->
<link href="css/creative.min.css" rel="stylesheet">

</head>

<body id="page-top">

	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-light fixed-top py-3"
		id="mainNav">
	<div class="container">
		<a class="navbar-brand js-scroll-trigger" href="main.jsp">Kitri 영화
			예매 사이트</a>
		<button class="navbar-toggler navbar-toggler-right" type="button"
			data-toggle="collapse" data-target="#navbarResponsive"
			aria-controls="navbarResponsive" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav ml-auto my-2 my-lg-0">
				<li class="nav-item"><a class="nav-link js-scroll-trigger"
					href="">문의사항</a></li>
				<li class="nav-item"><a class="nav-link js-scroll-trigger"
					href="">영화예매</a></li>
				<%--           	<c:if test="${sessionScope.admin eq 'yes' }"> --%>
				<!-- 					<h5> -->
				<!-- 					<input type="submit" value="글쓰기"> -->
				<!-- 					</h5> -->
				<%-- 				</c:if> --%>



				<li class="nav-item"><a class="nav-link js-scroll-trigger"
					href="">공지사항</a></li>
				<li class="nav-item"><a class="nav-link js-scroll-trigger"
					href="join.html">회원가입</a></li>
				<li class="nav-item"><c:choose>
						<c:when test="${empty sessionScope.id }">
							<a class="nav-link js-scroll-trigger" href="login.jsp">로그인</a>
						</c:when>

						<c:otherwise>
							<a class="nav-link js-scroll-trigger"
								onclick="location.href='./logout.jsp'">로그아웃</a>
						</c:otherwise>
					</c:choose></li>
				<c:if test="${not empty sessionScope.id }">
					<li class="nav-item"><a class="nav-link js-scroll-trigger">${sessionScope.id }님
							환영합니다.</a></li>
				</c:if>
				<br />
			</ul>
		</div>
	</div>
	</nav>


	<!-- Masthead -->
	<header class="masthead">
	<div class="container h-100">
		<div
			class="row h-100 align-items-center justify-content-center text-center">
			<form method=post action="loginResult.jsp">
				<%-- method를 get방식으로 action은 ex2로 지정 --%>
				<table border="1" cellspacing="1">

					<tr colspan="4">
						<font size=2 color="red"> 아이디와 비밀번호를 입력하세요 </font>
					</tr>

					<tr>
						<td style="color: white;">아이디</td>

						<td><input type="text" name="id" size=15></td>
					</tr>

					<tr>
						<td style="color: white;">비밀번호</td>

						<td><input type="password" name="password" size=15></td>
					</tr>
						</table>
			<br>
						<input type="submit" class="btn btn-primary js-scroll-trigger" value="로그인"> &nbsp;&nbsp;&nbsp;&nbsp;
						<input type="reset" class="btn btn-primary js-scroll-trigger" value="취 소 ">
				

				
			</form>
		</div>
	</div>
	</header>

	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Plugin JavaScript -->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>
	<script src="vendor/magnific-popup/jquery.magnific-popup.min.js"></script>

	<!-- Custom scripts for this template -->
	<script src="js/creative.min.js"></script>

</body>
</html>
