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
<title>�α���</title>

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
		<a class="navbar-brand js-scroll-trigger" href="main.jsp">Kitri ��ȭ
			���� ����Ʈ</a>
		<button class="navbar-toggler navbar-toggler-right" type="button"
			data-toggle="collapse" data-target="#navbarResponsive"
			aria-controls="navbarResponsive" aria-expanded="false"
			aria-label="Toggle navigation">
			<span class="navbar-toggler-icon"></span>
		</button>
		<div class="collapse navbar-collapse" id="navbarResponsive">
			<ul class="navbar-nav ml-auto my-2 my-lg-0">
				<li class="nav-item"><a class="nav-link js-scroll-trigger"
					href="">���ǻ���</a></li>
				<li class="nav-item"><a class="nav-link js-scroll-trigger"
					href="">��ȭ����</a></li>
				<%--           	<c:if test="${sessionScope.admin eq 'yes' }"> --%>
				<!-- 					<h5> -->
				<!-- 					<input type="submit" value="�۾���"> -->
				<!-- 					</h5> -->
				<%-- 				</c:if> --%>



				<li class="nav-item"><a class="nav-link js-scroll-trigger"
					href="">��������</a></li>
				<li class="nav-item"><a class="nav-link js-scroll-trigger"
					href="join.html">ȸ������</a></li>
				<li class="nav-item"><c:choose>
						<c:when test="${empty sessionScope.id }">
							<a class="nav-link js-scroll-trigger" href="login.jsp">�α���</a>
						</c:when>

						<c:otherwise>
							<a class="nav-link js-scroll-trigger"
								onclick="location.href='./logout.jsp'">�α׾ƿ�</a>
						</c:otherwise>
					</c:choose></li>
				<c:if test="${not empty sessionScope.id }">
					<li class="nav-item"><a class="nav-link js-scroll-trigger">${sessionScope.id }��
							ȯ���մϴ�.</a></li>
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
				<%-- method�� get������� action�� ex2�� ���� --%>
				<table border="1" cellspacing="1">

					<tr colspan="4">
						<font size=2 color="red"> ���̵�� ��й�ȣ�� �Է��ϼ��� </font>
					</tr>

					<tr>
						<td style="color: white;">���̵�</td>

						<td><input type="text" name="id" size=15></td>
					</tr>

					<tr>
						<td style="color: white;">��й�ȣ</td>

						<td><input type="password" name="password" size=15></td>
					</tr>
						</table>
			<br>
						<input type="submit" class="btn btn-primary js-scroll-trigger" value="�α���"> &nbsp;&nbsp;&nbsp;&nbsp;
						<input type="reset" class="btn btn-primary js-scroll-trigger" value="�� �� ">
				

				
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
