<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>

  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Kitri Movie Application</title>

  <!-- Font Awesome Icons -->
  <link href="../vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700" rel="stylesheet">
  <link href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic' rel='stylesheet' type='text/css'>

  <!-- Plugin CSS -->
  <link href="../vendor/magnific-popup/magnific-popup.css" rel="stylesheet">

  <!-- Theme CSS - Includes Bootstrap -->
  <link href="../css/creative.min.css" rel="stylesheet">

</head>

<body id="page-top">

  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-light fixed-top py-3" id="mainNav">
    <div class="container">
      <a class="navbar-brand js-scroll-trigger" href="admin_main.jsp">Kitri 영화 예매 사이트</a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
			<div class="collapse navbar-collapse" id="navbarResponsive">
				<ul class="navbar-nav ml-auto my-2 my-lg-0">
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="../qna_board.jsp">문의사항</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="movie_main.jsp">영화관리</a></li>
					<li class="nav-item"><a class="nav-link js-scroll-trigger"
						href="../noticeView.jsp">공지사항</a></li>
					<li class="nav-item"><c:choose>
							<c:when test="${empty sessionScope.id }">
								<a class="nav-link js-scroll-trigger" href="../login.jsp">로그인</a>
							</c:when>

							<c:otherwise>
								<a class="nav-link js-scroll-trigger"
									onclick="location.href='../logout.jsp'">로그아웃</a>
							</c:otherwise>
						</c:choose></li>
					<c:if test="${not empty sessionScope.id }">
						<li class="nav-item"><a class="nav-link js-scroll-trigger">${sessionScope.id }님
								환영합니다.</a></li>
					</c:if>
				</ul>
			</div>
    </div>
  </nav>

  <!-- Masthead -->
  <header class="masthead">
    <div class="container h-100">
      <div class="row h-100 align-items-center justify-content-center text-center">
        <div class="col-lg-10 align-self-end">
          <h1 class="text-uppercase text-white font-weight-bold">환영합니다! 관리자님 </h1>
          <hr class="divider my-4">
        </div>
        <div class="col-lg-8 align-self-baseline">
          <p class="text-white-75 font-weight-light mb-5">조금 더 나은 상영관 </p>
          <a class="btn btn-primary btn-xl js-scroll-trigger" href="../admin/movie_add.jsp">영화 추가</a><br><br>
          <a class="btn btn-primary btn-xl js-scroll-trigger" href="../admin/movie_list.jsp">영화 수정</a>
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
