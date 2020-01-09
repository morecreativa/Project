<%@page import="kitri.com.dao.MovieDAO"%>
<%@page import="kitri.com.vo.MovieVO"%>
<%@page import="java.util.Enumeration"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<head>

<!-- update the version number as needed -->
<script defer src="/__/firebase/6.4.0/firebase-app.js"></script>
<!-- include only the Firebase features as you need -->
<script defer src="/__/firebase/6.4.0/firebase-auth.js"></script>
<script defer src="/__/firebase/6.4.0/firebase-database.js"></script>
<script defer src="/__/firebase/6.4.0/firebase-messaging.js"></script>
<script defer src="/__/firebase/6.4.0/firebase-storage.js"></script>
<!-- initialize the SDK after all desired features are loaded -->
<script defer src="/__/firebase/init.js"></script>

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
td,tr{border: black solid 3px; background-color: black;}
#slate{background-color: white;}
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

    <%String movie_no=String.valueOf(request.getParameter("no_update"));
    MovieDAO dao = new MovieDAO();
    MovieVO vo = dao.getMovie(movie_no);
    String img_src=vo.getIMG_SRC();
%>

	<!-- Insert these scripts at the bottom of the HTML, but before you use any Firebase services -->

	<!-- Loads the entire Firebase JavaScript SDK -->
	<script src="https://www.gstatic.com/firebasejs/5.10.1/firebase.js"></script>

	<script>
        var firebaseConfig = {
        		 apiKey: "AIzaSyBfmb0v5_l2EC_FLzFZRA91LAQt_f4bnFg",
        		 authDomain: "kitrimovie.firebaseapp.com",
        		 databaseURL: "https://kitrimovie.firebaseio.com",
        		 projectId: "kitrimovie",
        		 storageBucket: "kitrimovie.appspot.com",
        		 messagingSenderId: "397984309873",
        		 appId: "1:397984309873:web:5473a8b421be0158"
        };
        // Initialize Firebase
        firebase.initializeApp(firebaseConfig);
        </script>

	<!-- Masthead -->
	<header class="masthead">
		<div class="container h-80">
			<div
				class="row h-100 align-items-center justify-content-center text-center">

				<div class="col-lg-10 align-self-end">
					<h2 class="text-uppercase text-white font-weight-bold">등록한 영화를 수정합니다.</h2>
					<hr class="divider my-4">
				</div>

				<div style="width: 50%; float: left; box-sizing: border-box;">
					<div
						style="width: 244px; height: 348px; border: 2px solid #f4623a; margin: auto;">
						<img alt='' src='file' width="240" height="344" onerror="this.src='<%=img_src%>'">
					</div>
					<br>
					<input type="file" class="btn btn-light" onchange="uploadFile()" id="files"
						name="files[]" multiple />
				</div>

				<div style="width: 50%; float: right; box-sizing: border-box;">
						
						<form name="form1" action="../admin/movie_update_result.jsp">
						<table style="color: white; font:bold;">
						<tr id="slate"><td colspan="2" id="slate"><img alt="" src="../img/slate.png" width="350px"></td></tr>
						<tr><td>영화제목</td><td><input type="text" name="title" value="<%=vo.getTITLE()%>"></td></tr>
					<tr><td>감독</td><td><input type="text" name="director" value="<%=vo.getDIRECTOR()%>"></td></tr>
						<tr><td>주연</td><td><input type="text" name="actor" value="<%=vo.getACTOR()%>"></td></tr>
						<tr><td>장르</td><td><select name="genre" >
							<option value="액션" <%if(vo.getGENRE().equals("액션")) {%>selected="selected"<%}%>>액션</option>
							<option value="드라마" <%if(vo.getGENRE().equals("드라마")) {%>selected="selected"<%}%>>드라마</option>
							<option value="멜로/로맨스" <%if(vo.getGENRE().equals("멜로/로맨스")) {%>selected="selected"<%}%>>멜로/로맨스</option>
							<option value="코미디" <%if(vo.getGENRE().equals("코미디")) {%>selected="selected"<%}%>>코미디</option>
							<option value="가족" <%if(vo.getGENRE().equals("가족")) {%>selected="selected"<%}%>>가족</option>
							<option value="애니" <%if(vo.getGENRE().equals("애니")) {%>selected="selected"<%}%>>애니</option>
							<option value="공포" <%if(vo.getGENRE().equals("공포")) {%>selected="selected"<%}%>>공포</option>
							<option value="스릴러" <%if(vo.getGENRE().equals("스릴러")) {%>selected="selected"<%}%>>스릴러</option>
							<option value="모험" <%if(vo.getGENRE().equals("모험")) {%>selected="selected"<%}%>>모험</option>
						</select></td></tr>
						<tr><td>시청연령</td><td><select name="age">
							<option value="전체 관람가" <%if(vo.getGENRE().equals("전체 관람가")) {%>selected="selected"<%}%>>전체 관람가</option>
							<option value="12세 관람가" <%if(vo.getGENRE().equals("12세 관람가")) {%>selected="selected"<%}%>>12세 관람가</option>
							<option value="15세 관람가" <%if(vo.getGENRE().equals("15세 관람가")) {%>selected="selected"<%}%>>15세 관람가</option>
							<option value="청소년 관람불가" <%if(vo.getGENRE().equals("청소년 관람불가")) {%>selected="selected"<%}%>>청소년 관람불가</option>
						</select></td></tr>
						<tr><td>상영일</td><td><input type="date" name="opendate" value="<%=vo.getOPENDATE()%>"></td></tr>
						<tr><td>예고편</td><td><input type="text" name="trailer" value="<%=vo.getTrailer()%>?rel=0&amp;enablejsapi=1"></td></tr>
						<tr><td colspan="2"><input class="btn btn-light"  type="submit" value="수정"></td></tr>
						</table>
						<input type="hidden" name="img_name" value=""> 
						<input type="hidden" name="img_src" value=""> 
						<input type="hidden" name="no" value=<%=movie_no %>>
					</form>
				</div>

			</div>

		</div>
	</header>
	<script>
          //function to save file
          function uploadFile(){
          
          // Created a Storage Reference with root dir
          var storageRef = firebase.storage().ref();
          // Get the file from DOM
          var file = document.getElementById("files").files[0];
          
          //dynamically set reference to the file name
          var thisRef = storageRef.child(file.name);

          //put request upload file to firebase storage
          thisRef.put(file).then(function(snapshot) {
             alert("이미지 업로드 완료!")
             
             storageRef.child(file.name).getDownloadURL().then(function(url) {
                var img_name = file.name;
            	 var test = url;
                 // alert(file.name);
                 // alert(url);
                 alert("이미지 출력 완료!")
                 document.querySelector('img').src = test;

                 document.form1.img_name.value =  file.name.toString();
                 document.form1.img_src.value = test.toString();
             }).catch(function(error) {
            	 alert("영화 등록 실패!")
             });   
          });
            
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

</body>
</html>