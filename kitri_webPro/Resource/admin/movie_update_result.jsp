<%@page import="kitri.com.dao.MovieDAO"%>
<%@page import="kitri.com.vo.MovieVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
	<%
		MovieVO vo = new MovieVO();
		vo.setACTOR(request.getParameter("actor"));
		vo.setAGE(request.getParameter("age"));
		vo.setDIRECTOR(request.getParameter("director"));
		vo.setGENRE(request.getParameter("genre"));
		vo.setOPENDATE(request.getParameter("opendate"));
		vo.setTITLE(request.getParameter("title"));
		vo.setIMG_NAME(request.getParameter("img_name"));
		vo.setIMG_SRC(request.getParameter("img_src"));
		vo.setTrailer(request.getParameter("trailer")+"?rel=0&amp;enablejsapi=1");
		int movie_no=Integer.parseInt(request.getParameter("no"));
		MovieDAO dao = new MovieDAO();
		String result = dao.modifyMovie(movie_no,vo.getTITLE(), vo.getDIRECTOR(), vo.getACTOR(), vo.getGENRE(), vo.getAGE(),
				vo.getOPENDATE(), vo.getIMG_NAME(), vo.getIMG_SRC(),vo.getTrailer());
		
		request.setAttribute("result_modify", result);
		RequestDispatcher rd = request.getRequestDispatcher("movie_list.jsp");
		rd.forward(request, response);
	%>
</body>
</html>