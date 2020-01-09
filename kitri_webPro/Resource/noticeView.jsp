<%@page import="kitri.com.vo.NoticeVO"%>
<%@page import="kitri.com.dao.NoticeDAO"%>
<%@page import="com.sun.java_cup.internal.runtime.Scanner"%>
<%@page import="java.nio.channels.SeekableByteChannel"%>

<%@page import="kitri.com.dao.QnaBoardDAO"%>
<%@page import="kitri.com.vo.QnaBoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<meta name="description" content="">
<meta name="author" content="">
<title>글 보기</title>
<script src="../jquery-3.2.1.min.js"></script>
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
<%
	String no = (String)request.getParameter("no");
	HttpSession Session = request.getSession(true);
	String user = (String) Session.getAttribute("id");
	System.out.println("user=> " + request.getParameter("user"));
	NoticeVO vo = null;

	NoticeDAO dao = new NoticeDAO();
	System.out.println("view => " + request.getParameter("no"));
	vo = dao.selectNotice((String) request.getParameter("no"));
	System.out.println(vo);
	if (vo != null) {

	} else {
		vo = new NoticeVO();
		vo.setCategory("");
		vo.setContents("");
		vo.setNo(0);
		vo.setPassword("");
		vo.setRegdate("");
		vo.setTitle("");
		vo.setWriter("");
	}
%>

<script>
	$(function(){
		if("${param.msg}"!=""){
			alert("${param.msg}");
		}
	});
	
	function noticeDelete(no){
		var pw = $('#pw').val().trim();
		if(!pw) {
			alert("비밀번호를 입력 해주세요.");
			$('#pw').focus();
		}
		else {
			$('#type').val('delete');
			location.href="noticeDeleteAndUpdate.jsp?"+$('#updateForm').serialize();	
		}
	}
	
	function noticeUpdate(no){
		var pw = $('#pw').val().trim();
		if(!pw) {
			alert("비밀번호를 입력 해주세요.");
			$('#pw').focus();
		}
		else{
			$('#type').val('update');			
			location.href="noticeDeleteAndUpdate.jsp?"+$('#updateForm').serialize();
		}
	}
</script>
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

	<!-- Masthead -->
	<header class="masthead">
	<div class="container h-100">

			<div class="container">
			<form id="updateForm" method="post" enctype="utf-8" action="<%=no==null ? "noticewriteresult.jsp" : ""%>">
			<div style="margin: auto;">
		<input type="hidden" id="type" name="type" value="">
		<input type="hidden" name="no" value="<%=vo.getNo()%>">
		<input type="hidden" name="writer" value="<%=user%>">
		<table border="1" style="color: white;">
			<caption>
				<b>공지사항</b>
			</caption>
			<colgroup>
				<col width=100 />
				<col width=500 />
			</colgroup>

			<tbody>
				<tr>
					<td>카테고리 
						<select name="category" <%=vo.getWriter().equals(user) ? "" : no==null ? "" : "disabled"%>>
							<option <%=vo.getCategory().equals("예매 관련") ? "selected" : "" %>>예매 관련</option>
							<option <%=vo.getCategory().equals("영화 취소 관련") ? "selected" : "" %>>영화 취소 관련</option>
							<option <%=vo.getCategory().equals("공지사항") ? "selected" : "" %>>공지사항</option>
						</select>
					</td>
				</tr>
				<tr>
					<td>제목<input type="text" name="title" value="<%=vo.getTitle()%>" <%=vo.getWriter().equals(user) ? "" : no==null ? "" : "readonly"%>></td>
				</tr>
				<tr>
					<c:if test="<%=vo.getWriter().equals(user) || no==null%>">
						<td>비밀번호 <input id="pw" type="password" name="pw"></td>
					</c:if>
				</tr>
				<tr>
					<td>내용 <textarea rows=15 cols=85 name="contents" <%=vo.getWriter().equals(user) ? "" : no==null ? "" : "readonly"%>><%=vo.getContents()%></textarea></td>
				</tr>
			</tbody>
		</table>
		<p>
			<c:if test="<%= no != null %>">
				<c:if test="<%=vo.getWriter().equals(user)%>">
					<input type="button" value="수정" onclick="noticeUpdate(<%=vo.getNo()%>);">
					<input type="button" id="del" value="삭제" onclick="noticeDelete(<%=vo.getNo()%>);">
				</c:if>
			</c:if>
			<c:if test="<%= no == null %>">
				<input type="submit" class="btn btn-light" value="저장">
				<input type="button" class="btn btn-light" id="cancel" value="취소" onclick="history.goback(-1)'">
			</c:if>
		</p>
		</div>
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