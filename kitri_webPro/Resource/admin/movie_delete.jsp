<%@page import="kitri.com.dao.MovieDAO"%>
<%@page import="kitri.com.vo.MovieVO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>Insert title here</title>
</head>
<body>
<%String delete_no=String.valueOf(request.getParameter("no_delete")); 
MovieDAO dao = new MovieDAO();
String result=dao.deleteMovie(delete_no);
request.setAttribute("result_delete", result);
RequestDispatcher rd = request.getRequestDispatcher("movie_list.jsp");
rd.forward(request, response);
%>
</body>
</html>