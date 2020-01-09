<%@page import="kitri.com.dao.QnaBoardDAO"%>
<%@page import="kitri.com.vo.QnaBoardVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link href="<c:url value="/css/bootstrap.min.css" />" rel="stylesheet">
<link rel="stylesheet" href="css/bootstrap.min.css">
<title>Q&A</title>
<script src="../jquery-3.2.1.min.js"></script>
<script>
	$(document).ready(function() {
		$("#wr").on('click', function() {
			location.href = "qna_writeform.jsp";
		});//on end
		$("#main").on('click', function() {
			location.href = "main.jsp";
		});//on end
	});
</script>
<style type="text/css">
body{
background-image: url('img/nss.jpg');
}
</style>
</head>
<div class="container" style="width:1000px" >
<div class="text-center" style="width:100%;">
<div class="card mb-4">
	<h1 class="card-header">Q&A 1:1</h1>
	<img src="img/ttt.jpg" alt="Card image">
	<div class="card-body">
		<body>

			<%
				request.setCharacterEncoding("utf-8");
				int pagenum = 0;
				if (request.getParameter("page") == null) {
					pagenum = 1;
				} else {
					pagenum = Integer.parseInt(request.getParameter("page"));
				}

				int start = (pagenum - 1) * 5 + 1;
				int end = pagenum * 5;
				String opt = request.getParameter("opt");
				String condition = request.getParameter("condition");

				QnaBoardVO vo = new QnaBoardVO();
				QnaBoardDAO dao = new QnaBoardDAO();
				ArrayList<QnaBoardVO> list = dao.getBoardList(start, end, opt, condition);
				//ArrayList<BoardVO> list = dao.getBoardList();
			%>

			<script>
				window.onload = function() {
					document.getElementById('a0').onclick = function() {
						document.getElementById('vo').value = document
								.getElementById('test0').value
						document.getElementById('aa').submit();
					};
					document.getElementById('a1').onclick = function() {
						document.getElementById('vo').value = document
								.getElementById('test1').value
						document.getElementById('aa').submit();
						return false;
					};
					document.getElementById('a2').onclick = function() {
						document.getElementById('vo').value = document
								.getElementById('test2').value
						document.getElementById('aa').submit();
						return false;
					};
					document.getElementById('a3').onclick = function() {
						document.getElementById('vo').value = document
								.getElementById('test3').value
						document.getElementById('aa').submit();
						return false;
					};
					document.getElementById('a4').onclick = function() {
						document.getElementById('vo').value = document
								.getElementById('test4').value
						document.getElementById('aa').submit();
						return false;
					};
				};
			</script>
			<script type="text/javascript">
				
			</script>
			<div>
				<form action="qna_view.jsp" id="aa" method="post">
					<table class="table table-hover">
						<th>NO</th>
						<th>TITLE</th>
						<th>WRITER</th>
						<th>TIME</th>
						<%
							for (int i = 0; i < list.size(); i++) {
								vo = list.get(i);
						%>
						<tr id="a<%=i%>">
							<td><p><%=vo.getNo()%></p></td>
							<td><%=vo.getTitle()%></td>
							<td><%=vo.getWriter()%></td>
							<td><%=vo.getRegdate()%></td>
						</tr>
						<input type="hidden" name="test<%=i%>" id="test<%=i%>"
							value=<%=vo.getNo()%>>

						<input type="hidden" name="testpw<%=i%>" id="test<%=i%>"
							value=<%=vo.getPassword()%>>

						<%
							}
						%>
						<input type="hidden" name="vo" id="vo" value="">
					</table>
				</form>
				<!--  ---------------------------페이지 번호 테이블 -----------------------------  -->
				<table class="table table-hover">
					<tr>
						<td>
							<%
								out.println("[pageNo▶]&nbsp");
								out.println("<a href='qna_board.jsp?page=" + 1 + "'>" + "[first]" + "</a>&nbsp;&nbsp;");
								int total = dao.getTotalBoard(opt, condition);
								int totalPage = total / 5;
								if (total % 5 != 0) {
									totalPage = totalPage + 1;
								}

								for (int i = 1; i <= totalPage; i++) {
									out.println("<a href='qna_board.jsp?page=" + i + "'>" + i + "</a>&nbsp;&nbsp;");
								}

								out.println("<a href='qna_board.jsp?page=" + totalPage + "'>" + "[last]" + "</a>&nbsp;&nbsp;");
							%>
						</td>
					</tr>
				</table>
				<!--  ---------------------------페이지 번호 테이블 끝 -----------------------------  -->
				<%
					if (request.getAttribute("qnaboardvo") != null) {
						QnaBoardVO newvo = (QnaBoardVO) request.getAttribute("qnaboardvo");
					}
				%>
				<div>
					<form action="qna_board.jsp" method="post">
						<select name="opt" class="btn btn-outline-primary">
							<option value="0">TITLE</option>
							<option value="1">CONTENTS</option>
							<option value="2">TITLE+CONTENTS</option>
							<option value="3">WRITER</option>
						</select> <input type="text" size="20" name="condition" /><input
							class="btn btn-primary btn-sm" type="submit" value="검색" />

					</form>
					<input type=button value="글쓰기버튼" class="btn btn-outline-primary" id="wr">
					<input type=button value="메인으로" class="btn btn-outline-primary" id="main">
				</div>
			</div>
		</body>
		</div>
		</div>
		</div>
		</div>
</html>