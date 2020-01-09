<%@page import="kitri.com.vo.MovieVO"%>
<%@page import="kitri.com.dao.MovieDAO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>

<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Kitri Movie Application</title>

<!-- Font Awesome Icons -->
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
<link href="../css/creative.min.css" rel="stylesheet">

<style type="text/css">
table {
	border: 2px solid blue;
	border-collapse: collapse;
}

td {
	border: 2px solid blue;
}
</style>

</head>

<body id="page-top">

	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-light fixed-top py-3"
		id="mainNav">
		<div class="container">
			<a class="navbar-brand js-scroll-trigger" href="admin_main.jsp">Kitri
				영화 예매 사이트</a>
			<button class="navbar-toggler navbar-toggler-right" type="button"
				data-toggle="collapse" data-target="#navbarResponsive"
				aria-controls="navbarResponsive" aria-expanded="false"
				aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
	<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto my-2 my-lg-0">
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="../qna_board.jsp">문의사항</a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="../admin/movie_main.jsp">영화관리</a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="../noticeboardlist.jsp">공지사항</a>
          </li>
           <li class="nav-item">
          	<c:choose>
          		<c:when test="${empty sessionScope.id }">
		            <a class="nav-link js-scroll-trigger" href="../login.jsp">로그인</a>
          		</c:when>
          		
          		<c:otherwise>
		            <a class="nav-link js-scroll-trigger" onclick="location.href='../logout.jsp'">로그아웃</a>
          		</c:otherwise>
          	</c:choose>
          </li>
          <c:if test="${not empty sessionScope.id }">
	          <li class="nav-item">
	            <a class="nav-link js-scroll-trigger">${sessionScope.id }님 환영합니다.</a>
	          </li>
          </c:if>
        </ul>
      </div>
    </div>
  </nav>
	<script>
	<%String result_delete = (String) request.getAttribute("result_delete");
			if (result_delete != null) {
				if (result_delete.equals("1")) {%>
	alert("영화 삭제 성공!");
	<%} else {%>
	alert("영화 삭제 실패!");
	<%}
			}%>
	
	<%String result_modify = (String) request.getAttribute("result_modify");
			if (result_modify != null) {
				if (result_modify.equals("1")) {%>
    alert("영화 수정 성공!");
    <%} else {%>
    alert("영화 수정 실패!");
    <%}
			}%>
	</script>

	<%
		int pagenum = 0;
		if (request.getParameter("page") == null) {
			pagenum = 1;
		} else {
			pagenum = Integer.parseInt(request.getParameter("page"));
		}
		MovieDAO dao = new MovieDAO();
		ArrayList<MovieVO> list = dao.getBoardList();

		int start = (pagenum - 1) * 8 + 1;
		int end = pagenum * 8;
		ArrayList<MovieVO> list2 = dao.getBoardList(start, end,"전체","전체");
		int total = dao.getTotalBoard("전체","전체");
		int totalpage = total / 8;
		if (total % 8 != 0)
			totalpage += 1;
	%>

	<!-- Masthead -->
	<header class="masthead">
		<!-- Portfolio Section -->
		<section id="portfolio">
			<div class="container-fluid p-0">
				<div class="row no-gutters" style="width: 900px; margin: auto;">
					<%
						for (int i = 0; i < list2.size(); i++) {
							MovieVO vo = list2.get(i);
					%>
					<div class="col-lg-4 col-sm-6" style="padding: 5px;">
						<a class="portfolio-box" onclick="">
							<img class="img-fluid" src="<%=vo.getIMG_SRC()%>">
							<div class="portfolio-box-caption">
								<div class="project-category text-white-50">
									<h2><%=vo.getTITLE()%></h2>
								</div>
								<div class="project-name">
									감독 :
									<%=vo.getDIRECTOR()%><br /> 배우 :
									<%=vo.getACTOR()%><br /> 장르 :
									<%=vo.getGENRE()%><br /> 시청 연령 :
									<%=vo.getAGE()%><br /> 개봉일 :
									<%=vo.getOPENDATE()%><br />
								</div>
								<div >
								<br>
								<form>
									<input type=hidden name="no_delete" value=<%=vo.getMovie_no()%>>
									<input type="submit" value="삭제" class="btn btn-light" formaction="movie_delete.jsp">
								&nbsp;
									<input type=hidden name="no_update" value=<%=vo.getMovie_no()%>>
									<input type="submit" value="수정" class="btn btn-light" formaction="movie_update.jsp">
								</form>
								</div>
							</div>
						</a>
					</div>
					<%
						}
					%>
					<div align="center" style="margin: auto;">
						<%
							for (int i = 1; i <= totalpage; i++) {
								out.println("<a href='movie_list.jsp?page=" + i + "'>" + i + "</a>&nbsp;&nbsp;");
							}
						%>
					</div>
				</div>
			</div>
		</section>
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
