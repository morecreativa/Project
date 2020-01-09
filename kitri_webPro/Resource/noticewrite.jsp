<%@page import="kitri.com.dao.QnaBoardDAO"%>
<%@page import="kitri.com.vo.QnaBoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>qna_board</title>
<script src="../jquery-3.2.1.min.js"></script>
<%
HttpSession Session = request.getSession(true);
String writer = (String)Session.getAttribute("id");
request.setCharacterEncoding("utf-8");
%>
<script>
	$(document).ready(function() {

		
	});
</script>

<link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet"
	type="text/css">

<!-- Google Fonts -->
<link
	href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700"
	rel="stylesheet">
<link
	href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic'
	rel='stylesheet' type='text/css'>

<!-- Plugin CSS -->
<link href="../vendor/magnific-popup/magnific-popup.css"
	rel="stylesheet">

<!-- Theme CSS - Includes Bootstrap -->
<link href="./css/creative.min.css" rel="stylesheet">

</head>
<style>
table {
	width: 60%;
}

table, th, td {
	border: 1px solid black;
	border-collapse: collapse;
}

th {
	background-color: black;
	color: white;
}

.c1 {
	width: 10%
}
</style>

<body id="page-top">
<% request.setCharacterEncoding("UTF-8"); %>
	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-light fixed-top py-3"
		id="mainNav">
		<div class="container">
			<a class="navbar-brand js-scroll-trigger" href="#page-top">Kitri
				영화 예매 사이트</a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-toggle="collapse" data-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto my-2 my-lg-0">
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="#about">문의사항</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="../admin/movie_main.jsp">영화관리</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="#portfolio">공지사항</a></li>
				</ul>
			</div>
		</div>
	</nav>


	<header class="masthead">
		<div class="container h-100" style="text-align: left;">
			<!-- 			<div -->
			<!-- 				class="row h-100 align-items-center justify-content-center text-center"> -->
			<!-- 				<div class="col-lg-10 align-self-end"> -->
			<!-- 					<h1 class="text-uppercase text-white font-weight-bold">환영합니다! 관리자님</h1> -->
			<!-- 					<hr class="divider my-4"> -->
			<!-- 				</div> -->
			<!-- 				<div class="col-lg-8 align-self-baseline"> -->
			<!-- 					<p class="text-white-75 font-weight-light mb-5">조금 더 나은 상영관</p> -->

			<h1></h1>
			<form action="noticewriteresult.jsp" method="post">
				<input type="hidden" name="writer" value="<%=writer%>"/>
				<table border="1">
					<tr>
						<td>카테고리 <select name="category">
								<option>예매 관련</option>
								<option>영화 취소 관련</option>
								<option>공지사항</option>
						</select>
						</td>
					</tr>
<!-- 					<tr> -->
<!-- 						<td>작성자<input type="text" name="writer"></td> -->
<!-- 					</tr> -->
					<tr>
						<td>제목<input type="text" name="title"></td>
					</tr>
					<tr>
						<td>비밀번호 <input type="password" name="pw"></td>
					</tr>
					<tr>
						<td>내용<input type="text" name="contents"></td>
					</tr>
<!-- 					<tr> -->
<%-- 						<td>작성자<input type="hidden" name="<%=request.getParameter("writer") %>" value="admin"></td> --%>
<!-- 					</tr> -->
				</table>
				<input type="submit" value="글쓰기">
			</form>
		</div>
	</header>
</body>
</html>