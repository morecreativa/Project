
<%@page import="kitri.com.dao.MovieRDAO"%>
<%@page import="kitri.com.vo.MovieRVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script src="jquery-3.2.1.min.js"></script>
<style type="text/css">
.section {
	border: 3px solid blue;
}
</style>
</head>
<body>
	<%
	String movie_no=request.getParameter("movie_no");
	String id =request.getParameter("id");
	double rate = Double.valueOf(request.getParameter("rate"));
	String comments = request.getParameter("comments");
		MovieRVO vo = new MovieRVO();
		vo.setMovie_no(Integer.parseInt(movie_no));
		vo.setId(id);
		vo.setRate(rate);
		vo.setComments(comments);
		MovieRDAO dao = new MovieRDAO();
		String result = dao.setMovie(movie_no, id, rate, comments);
request.setAttribute("result", result);
RequestDispatcher rd = request.getRequestDispatcher("movie_info.jsp");
rd.forward(request, response);
	
	%>
	
</body>
</html>