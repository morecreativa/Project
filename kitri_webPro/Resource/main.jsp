<%@page import="kitri.com.dao.MovieDAO"%>
<%@page import="kitri.com.vo.MovieVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>	
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <meta name="description" content="">
  <meta name="author" content="">

  <title>Kitri Movie Application</title>

  <!-- Font Awesome Icons -->
  <link href="vendor/fontawesome-free/css/all.min.css" rel="stylesheet" type="text/css">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Merriweather+Sans:400,700" rel="stylesheet">
  <link href='https://fonts.googleapis.com/css?family=Merriweather:400,300,300italic,400italic,700,700italic' rel='stylesheet' type='text/css'>

  <!-- Plugin CSS -->
  <link href="vendor/magnific-popup/magnific-popup.css" rel="stylesheet">

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
</style>
</head>
<script type="text/javascript">

</script>
<body id="page-top">

  <!-- Navigation -->
  <nav class="navbar navbar-expand-lg navbar-light fixed-top py-3" id="mainNav">
    <div class="container">
      <a class="navbar-brand js-scroll-trigger" href="main.jsp">Kitri 영화 예매 사이트</a>
      <button class="navbar-toggler navbar-toggler-right" type="button" data-toggle="collapse" data-target="#navbarResponsive" aria-controls="navbarResponsive" aria-expanded="false" aria-label="Toggle navigation">
        <span class="navbar-toggler-icon"></span>
      </button>
      <div class="collapse navbar-collapse" id="navbarResponsive">
        <ul class="navbar-nav ml-auto my-2 my-lg-0">
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="qna_board.jsp">문의사항</a>
          </li>
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="loginmain.jsp">영화예매</a>
          </li>
<%--           	<c:if test="${sessionScope.admin eq 'yes' }"> --%>
<!-- 					<h5> -->
<!-- 					<input type="submit" value="글쓰기"> -->
<!-- 					</h5> -->
<%-- 				</c:if> --%>
          
          
          
          <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="noticeboardlist.jsp">공지사항</a>
          </li>
           <li class="nav-item">
            <a class="nav-link js-scroll-trigger" href="join.html">회원가입</a>
          </li>
          <li class="nav-item">
          	<c:choose>
          		<c:when test="${empty sessionScope.id }">
		            <a class="nav-link js-scroll-trigger" href="login.jsp">로그인</a>
          		</c:when>
          		
          		<c:otherwise>
		            <a class="nav-link js-scroll-trigger" onclick="location.href='./logout.jsp'">로그아웃</a>
          		</c:otherwise>
          	</c:choose>
          </li>
          <c:if test="${not empty sessionScope.id }">
	          <li class="nav-item">
	            <a class="nav-link js-scroll-trigger">${sessionScope.id }님 환영합니다.</a>
	          </li>
          </c:if>
          <br/>
        </ul>
      </div>
    </div>
  </nav>

  <!-- Masthead -->
  <header class="masthead">
    <div class="container h-100">
      <div class="row h-100 align-items-center justify-content-center text-center">
        <div class="col-lg-10 align-self-end">
          <h1 class="text-uppercase text-white font-weight-bold">Kitri사이트에 오신걸 환영 합니다. </h1>
          <hr class="divider my-4">
        </div>
        <div class="col-lg-8 align-self-baseline">
          <p class="text-white-75 font-weight-light mb-5"> 이번달 추천 영화 보러가기 </p>
          <a class="btn btn-primary btn-xl js-scroll-trigger" href="#about">Click</a>
        </div>
      </div>
    </div>
  </header>

  <!-- About Section -->
  <section class="page-section bg-primary" id="about">
        <div class="col-lg-8 text-center" style="margin: auto;">
          <h2 class="text-white mt-0">We've got what you need!</h2>
          <hr class="divider light my-4">
          <p class="text-white-50 mb-4">Kitri가 '더 좋은 영화관'을 만들어 갑니다! </p>
        </div>
  </section>
  
  <% 
  	MovieDAO dao = new MovieDAO();
 	int start = 1;
	int end = 4;
	ArrayList<MovieVO> list = dao.getBoardList(start, end, "전체", "전체");
  %>
  
  <!-- Portfolio Section -->
  <section id="portfolio">
    <div class="container-fluid p-0">
     	<div class="row no-gutters" style="width: 1500px; margin: auto;">
			<%
				for (int i = 0; i < list.size(); i++) {
					MovieVO vo = list.get(i);
			%>
			<div class="col-lg-4 col-sm-6" style="padding: 5px;">
				<form id="movie_info">
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
    </div>
  </section>

  <!-- Call to Action Section -->
<!--   <section class="page-section bg-dark text-white"> -->
<!--     <div class="container text-center"> -->
<!--       <h2 class="mb-4">영화 그 이상의 감동</h2> -->
<!--       <a class="btn btn-light btn-xl" href="https://startbootstrap.com/themes/creative/">영화 예매</a> -->
<!--     </div> -->
<!--   </section> -->
  <!-- Services Section -->
  <section class="page-section" id="services">
    <div class="container">
      <h2 class="text-center mt-0">At Your Service</h2>
      <hr class="divider my-4">
      <div class="row">
        <div class="col-lg-3 col-md-6 text-center">
          <div class="mt-5">
            <i class="fas fa-4x fa-gem text-primary mb-4"></i>
            <h3 class="h4 mb-2">고객 우선</h3>
            <p class="text-muted mb-0">고객이 최우선인 그런 서비스를 지향합니다!</p>
          </div>
        </div>
        <div class="col-lg-3 col-md-6 text-center">
          <div class="mt-5">
            <i class="fas fa-4x fa-laptop-code text-primary mb-4"></i>
            <h3 class="h4 mb-2">고객과의 소통</h3>
            <p class="text-muted mb-0">불편한 점이 있으면 언제든 연락 주세요!</p>
          </div>
        </div>
        <div class="col-lg-3 col-md-6 text-center">
          <div class="mt-5">
            <i class="fas fa-4x fa-globe text-primary mb-4"></i>
            <h3 class="h4 mb-2">고객님과의 협력</h3>
            <p class="text-muted mb-0">항상 대기중인 샛별들이 있어요!</p>
          </div>
        </div>
        <div class="col-lg-3 col-md-6 text-center">
          <div class="mt-5">
            <i class="fas fa-4x fa-heart text-primary mb-4"></i>
            <h3 class="h4 mb-2">고객님의 사랑</h3>
            <p class="text-muted mb-0">항상 고객님을 사랑으로 대하는 샛별입니다.</p>
          </div>
        </div>
      </div>
    </div>
  </section>

  <!-- Contact Section -->
  <section class="page-section" id="contact">
    <div class="container">
      <div class="row justify-content-center">
        <div class="col-lg-8 text-center">
          <h2 class="mt-1">회사소개 | IR | 채용정보 | 제휴문의 | 출점 문의 |</h2>
          <hr class="divider my-4">
          <p class="text-muted mb-5">(04377)서울특별시 양천구  목5동, 아이파크몰 6층<br/>
									대표이사 : kitri  사업자등록번호 : kitri		통신판매업신고번호 : kitri<br/>
									개인정보보호 책임자 : kitri		이메일 : kitri@kitri.net	kitri : 1544-1122</p>
        </div>
      </div>
      <div class="row">
        <div class="col-lg-4 ml-auto text-center mb-5 mb-lg-0">
          <i class="fas fa-phone fa-3x mb-3 text-muted"></i>
          <div>(02) 869-8301</div>
        </div>
        <div class="col-lg-4 mr-auto text-center">
          <i class="fas fa-envelope fa-3x mb-3 text-muted"></i>
          <!-- Make sure to change the email address in anchor text AND the link below! -->
          <a class="d-block" href="mailto:contact@yourwebsite.com">contact@kitri.com</a>
        </div>
      </div>
    </div>
  </section>

  <!-- Footer -->
  <footer class="bg-light py-5">
    <div class="container">
      <div class="small text-center text-muted">Copyright &copy; 2019 - Kitri</div>
    </div>
  </footer>

<script src="jquery-3.2.1.min.js"></script>
	<script>

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
  <script src="vendor/magnific-popup/jquery.magnific-popup.min.js"></script>

  <!-- Custom scripts for this template -->
  <script src="js/creative.js"></script>

</body>

</html>
