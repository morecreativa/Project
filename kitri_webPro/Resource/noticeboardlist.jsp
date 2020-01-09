<%@page import="kitri.com.vo.NoticeVO"%>
<%@page import="kitri.com.dao.NoticeDAO"%>
<%@page import="java.util.ArrayList"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Kitri Movie Application</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet"
	href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.4.1/jquery.min.js"></script>
<script
	src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/js/bootstrap.min.js"></script>
<script src="jquery-3.2.1.min.js"></script>
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
<style>
	.trHover:hover{
		background-color:#df9f9f;
	}
</style>
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
					href="qna_board.jsp">문의사항</a></li>
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
	
	<% request.setCharacterEncoding("UTF-8"); %>
	
	<!-- Masthead -->
	<header class="masthead">
	<div class="container h-100">

			<div class="container">
		<h1 class="text-uppercase text-white font-weight-bold" style="margin: auto;">공지사항</h1>
		<p class="text-white-75 font-weight-light mb-5"style="margin: auto;">공지사항, 예매관련, 환불관련 공지 게시판</p>
		<div class="table-responsive">
			<table class="table" style="border: solid 3px #f4623a;background-color: white;">
				<thead>
					<tr style="background-color: white">
						<th>번호</th>
						<th>카테고리</th>
						<th>내용</th>
						<th>제목</th>
						<th>작성자</th>
						<th>작성시간</th>
					</tr>
				</thead>
				<thead>
					<%
						NoticeDAO dao = new NoticeDAO();
						ArrayList<NoticeVO> list = dao.getBoardList();
						for (int i = 0; i < list.size(); i++) {
							NoticeVO vo = list.get(i);
					%>
							<tr class="trHover" style="cursor:pointer" onclick="location.href='./noticeView.jsp?no=<%=vo.getNo()%>'">
								<th><%=vo.getNo() %></th>
								<th><%=vo.getCategory()%></th>
								<th><%=vo.getContents() %></th>
								<th><%=vo.getTitle() %></th>
								<th><%=vo.getWriter() %></th>
								<th><%=vo.getRegdate() %></th>
							</tr>
						<%
						}
						%>
				</thead>
				</tbody>
			</table>
			<c:if test="${sessionScope.admin eq 'yes'}">
			<input type="button" class="btn btn-light" value="글쓰기" onclick="location.href='noticeView.jsp'">
				</c:if>
		</div>
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