<%@page import="kitri.com.vo.MovieVO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kitri.com.dao.MovieDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html lang="en">

<head>
<meta charset="utf-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">

<title>Kitri Movie Application</title>

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

<!-- Plugin CSS 
<link href="vendor/magnific-popup/magnific-popup.css" rel="stylesheet">-->

<!-- Theme CSS - Includes Bootstrap -->
<link href="css/creative.min.css" rel="stylesheet">
<style type="text/css">
span.star-prototype, span.star-prototype>* {
	height: 32px;
	background: url("img/star.png") 0 -32px repeat-x;
	width: 160px;
	display: inline-block;
}

span.star-prototype>* {
	background-position: 0 0;
	max-width: 160px;
}

#sort_genre, #sort_age {
  background: url(http://i62.tinypic.com/15xvbd5.png) no-repeat 96% 0;
  height: 29px;
  overflow: hidden;
  width: 120px;
    -webkit-border-radius: 20px;
  -moz-border-radius: 20px;
  border-radius: 20px;
  background-color: #f4623a;
  border-color: #f4623a;
  color: #fff;
  text-align: center;
}

</style>
</head>

<body id="page-top">
	<%
		int pagenum = 0;
		if (request.getParameter("page") == null) {
			pagenum = 1;
		} else {
			pagenum = Integer.parseInt(request.getParameter("page"));
		}
		MovieDAO dao = new MovieDAO();

		int start = (pagenum - 1) * 8 + 1;
		int end = pagenum * 8;
		String sort_genre = request.getParameter("sort_genre_to");
		String sort_age = request.getParameter("sort_age_to");
		ArrayList<MovieVO> list = dao.getBoardList(start, end, sort_genre, sort_age);
		int total = dao.getTotalBoard(sort_genre, sort_age);
		int totalpage = total / 8;
		if (total % 8 != 0)
			totalpage += 1;
	%>

	<!-- Navigation -->
	<nav class="navbar navbar-expand-lg navbar-light fixed-top py-3"
		id="mainNav">
	<div class="container">
		<a class="navbar-brand js-scroll-trigger" href="main.jsp">Kitri
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
					href="qna_board.jsp">문의사항</a></li>
				<li class="nav-item"><a class="nav-link js-scroll-trigger"
					href="loginmain.jsp">영화예매</a></li>
				<li class="nav-item"><a class="nav-link js-scroll-trigger"
					href="noticeboardlist.jsp">공지사항</a></li>
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
	<header class="masthead"> <!-- Portfolio Section --> <section
		id="portfolio">
	<div class="container-fluid p-0">
		<div class="sort_movie" style="width: 900px; margin: auto;">
			<form name="sort" action="loginmain.jsp">
				<div class="sort_select"
					style="width: 60%; float: left; box-sizing: border-box;">

					<!-- 					<div id="sort_rate" style="width: 20%; float: inherit;"></div> -->

					<div id="sort_genre_div" style="width: 30%; float: inherit;">
						<select id="sort_genre" >
							<option value="전체">전체</option>
							<option value="액션">액션</option>
							<option value="드라마">드라마</option>
							<option value="멜로/로맨스">멜로/로맨스</option>
							<option value="코미디">코미디</option>
							<option value="가족">가족</option>
							<option value="애니">애니</option>
							<option value="공포">공포</option>
							<option value="스릴러">스릴러</option>
							<option value="모험">모험</option>
						</select>
					</div>
					<div id="sort_age_div" style="width: 30%; float: inherit;">
						<select id="sort_age">
							<option value="전체">전체</option>
							<option value="전체 관람가">전체 관람가</option>
							<option value="12세 관람가">12세 관람가</option>
							<option value="15세 관람가">15세 관람가</option>
							<option value="청소년 관람불가">청소년 관람불가</option>
						</select>
					</div>
				</div>
				<input type="hidden" name="sort_genre_to" value=""> <input
					type="hidden" name="sort_age_to" value="">
				<div class="sort_submit" align="right"
					style="width: 40%; float: right; box-sizing: border-box;">
					<input class="btn btn-primary js-scroll-trigger" type="submit" value="정렬" onclick="now()">
				</div>
			</form>
		</div>

		<div class="row no-gutters" style="width: 900px; margin: auto;">
			<%
				for (int i = 0; i < list.size(); i++) {
					MovieVO vo = list.get(i);
			%>
			<div class="col-lg-4 col-sm-6" style="padding: 5px;">
				<form id="movie_info" >
					<a class="portfolio-box"
						onclick="document.getElementById('movie_no').value=<%=vo.getMovie_no()%>; $('#movie_info').attr('action', 'reservation_theater.jsp'); $('#movie_info').submit();">
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
								<button type="button" class="btn btn-light" id="trailer" onclick="event.cancelBubble = true; $('#myModal<%=i%>').modal()">메인 예고편</button>
								<br> <br>
								<div align="left" style="width: 160px; margin: auto;">
									<span class="star-prototype" onclick="document.getElementById('movie_no').value=<%=vo.getMovie_no()%>; event.cancelBubble = true; $('#movie_info').attr('action', 'movie_info.jsp'); $('#movie_info').submit();"><%=vo.getAvgrate()%></span>
								</div>
								<br>
							</div>
						</div>
					</a> <input type="hidden" name="movie_no" id="movie_no" value="">
				</form>
			</div>
			
								<!-- Modal -->
								<div id="myModal<%=i%>" class="modal fade" role="dialog">
									<div class="modal-dialog">

										<!-- Modal content-->
										<div class="modal-content">
											<h4 class="modal-title" style="float: left;">예고편</h4>
											<div class="modal-header">
												<button type="button" class="close" data-dismiss="modal">&times;</button>
											</div>
											<div class="modal-body">
												<iframe id="player" style="width: 100%; height: 300px"
													target="content"
													src="<%=vo.getTrailer() %>"
													frameborder="1" allowfullscreen=""></iframe>
											</div>
											<div class="modal-footer">
												<button type="button" class="btn btn-default"
													data-dismiss="modal">Close</button>
											</div>
										</div>
									</div>
								</div>
			<%
				}
			%>
		</div>
		<div align="center" style="margin: auto;">
			<div style="padding-top: 4px; background-color: rgba(255, 255, 255,.7);">
			<%
				for (int i = 1; i <= totalpage; i++) {
					out.println("<a href='loginmain.jsp?page=" + i + "'>" + i + "</a>&nbsp;&nbsp;");
				}
			%>
			</div>
		</div>

	</div>
	</section> </header>

	<script src="jquery-3.2.1.min.js"></script>
	<script>
		function now() {
			document.sort.sort_age_to.value = document
					.getElementById("sort_age").value;
			document.sort.sort_genre_to.value = document
					.getElementById("sort_genre").value;
		}

		$.fn.generateStars = function() {
		    return this.each(function(i,e){$(e).html($('<span/>').width($(e).text()*32));});
		};

		// 숫자 평점을 별로 변환하도록 호출하는 함수
		$('.star-prototype').generateStars();
	</script>
	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Plugin JavaScript -->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>

	<!-- <script src="vendor/magnific-popup/jquery.magnific-popup.min.js"></script> -->

	<!-- Custom scripts for this template -->
	<script src="js/creative.js"></script>

</body>
</html>
