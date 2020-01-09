<%@page import="kitri.com.dao.MovieRDAO"%>
<%@page import="java.util.ArrayList"%>
<%@page import="kitri.com.vo.MovieRVO"%>
<%@page import="kitri.com.dao.MovieDAO"%>
<%@page import="kitri.com.vo.MovieVO"%>
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
<link href="css/star.css" rel="stylesheet"> 

<style type="text/css">
td,tr{border: #f4623a solid 3px; background-color: white;}
</style>
</head>

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
	<%
		String movie_no = request.getParameter("movie_no");
		MovieDAO dao = new MovieDAO();
		MovieVO vo = dao.getMovie(movie_no);
		
		int pagenum = 0;
		if (request.getParameter("page") == null) {
			pagenum = 1;
		} else {
			pagenum = Integer.parseInt(request.getParameter("page"));
		}

		int start = (pagenum - 1) * 8+ 1;
		int end = pagenum * 8;

		MovieRDAO rdao = new MovieRDAO();
		ArrayList<MovieRVO> list = rdao.getBoardList(start, end,movie_no);
		int total = rdao.getTotalBoard(movie_no);
		int totalpage = total / 8;
		if (total % 8 != 0)
			totalpage += 1;
	
		String result = (String)request.getAttribute("result");
		if(result!=null){
		if(result.equals("-1")){%>
		<script>alert("이미 평점 등록하셨습니다.")</script>  
		<%}else if(result.equals("1")){%>
		<script>alert("평점 등록 하였습니다.")</script>
		<%}else if(result.equals("0")){%>
		<script>alert("평점을 등록하지 못했습니다.(오류발생!)")</script>  
		<% }}%>
	<!-- Masthead -->
	<header class="masthead">
		<div class="container h-80">
			<div class="row h-100 align-items-center justify-content-center text-center">

				<div class="col-lg-10 align-self-end">
					<h2 class="text-uppercase text-white font-weight-bold">영화 정보</h2>
					<hr class="divider my-4">
				</div>

				<div name="left" style="width: 50%; float: left; box-sizing: border-box;">
					<div style="width: 244px; height: 348px; border: 2px solid #f4623a; margin: auto;">
						<img alt='' src='<%=vo.getIMG_SRC()%>' width="240" height="344">
						</div>
						<br>
						<table style="width: 200px;margin: auto;">
								<tr><td><h7>영화제목</h7></td><td><%=vo.getTITLE()%></td></tr> 
								<tr><td><h7>감독</h7></td><td><%=vo.getDIRECTOR()%></td></tr>
								<tr><td><h7>주연</h7></td><td><%=vo.getACTOR()%></td></tr> 
								<tr><td><h7>장르</h7></td><td><%=vo.getGENRE()%></td></tr> 
								<tr><td><h7>시청연령</h7></td><td><%=vo.getAGE()%></td></tr>
								<tr><td><h7>상영일</h7></td><td><%=vo.getOPENDATE()%></td></tr>
							</table>
				
				</div>

				<div name="right" style="width: 50%; float: right; box-sizing: border-box;">
				<form name="form_rate" action="movie_info_result.jsp">
							
							<table>
							<th>평점순번</th><th>ID</th><th>평점</th><th>내용</th><th>날짜</th>
								<%
				for (int i = 0; i < list.size(); i++) {
					MovieRVO rvo = list.get(i);
						%>
						<tr><td><%=rvo.getRate_no()%></td><td style="width: 80px;"><%=rvo.getId()%></td><td><%=rvo.getRate()%></td><td style="width: 270px;"><%=rvo.getComments()%></td><td><%=rvo.getRegdate()%></td></tr>
				<%					
				}
	%></table>
				<div align="center" style="margin: auto;">
				<%
					for (int i = 1; i <= totalpage; i++) {
						out.println("<a href='movie_info.jsp?page=" + i + "'>" + i + "</a>&nbsp;&nbsp;");
					}
				%>
			</div>
							<br>
							
							
				<div class="starRev" style="position: static;">
					<span class="starR1 on">0.5</span> 
					<span class="starR2">1</span> 
					<span class="starR1">1.5</span> 
					<span class="starR2">2</span> 
					<span class="starR1">2.5</span> 
					<span class="starR2">3</span> 
					<span class="starR1">3.5</span> 
					<span class="starR2">4</span> 
					<span class="starR1">4.5</span> 
					<span class="starR2">5</span>
				</div>
				
				<input type="text" id="aa" style="width:30px; position: absolute;right: 580px;">
				<span>ID<input type="text" name="id" value="${sessionScope.id }" readonly="readonly" style="position: absolute;right: 280px; width: 100px;"></span>
				
				<textarea name="comments" id="comments" style="float: none;" rows="5" cols="50"></textarea>
				<input type="hidden" name="movie_no" value="<%=movie_no%>"> 
				<input type="hidden" id="rate" name="rate" value="">				
				<input type="button" class="btn btn-light" name="sub" value="평점저장완료" onclick="aaf()">
				
				</form>
				</div>

			</div>
		</div>
	</header>
<script type="text/javascript">
function aaf(){
	if(!document.getElementById("aa").value){
		alert("평점을 입력해주세요!")
	}
	else if(!document.getElementById("comments").value){
		alert("후기를 입력해주세요!");
	}
	else{
document.getElementById("rate").value = document.getElementById("aa").value
document.form_rate.submit();
	}
}
</script>
	<!-- Bootstrap core JavaScript -->
	<script src="vendor/jquery/jquery.min.js"></script>
	<script src="vendor/bootstrap/js/bootstrap.bundle.min.js"></script>

	<!-- Plugin JavaScript -->
	<script src="vendor/jquery-easing/jquery.easing.min.js"></script>
	<script src="vendor/magnific-popup/jquery.magnific-popup.min.js"></script>

	<!-- Custom scripts for this template -->
	<script src="js/creative.min.js"></script>
 	<script src="jquery-3.2.1.min.js"></script>
 	<script src="js/star.js"></script>
</body>
</html>