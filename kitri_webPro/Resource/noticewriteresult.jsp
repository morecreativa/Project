
<%@page import="kitri.com.dao.NoticeDAO"%>
<%@page import="kitri.com.vo.NoticeVO"%>
<%@page import="kitri.com.dao.MemberDAO"%>

<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="jquery-3.2.1.min.js"></script>
<%
HttpSession Session = request.getSession(true);
String writer = (String)Session.getAttribute("id");
%>
<script>
	$(document).ready(function() {
		
	});
</script>
</head>
<body>
<% request.setCharacterEncoding("UTF-8"); %>
	<%
		NoticeVO vo = new NoticeVO();

		vo.setCategory(request.getParameter("category"));
		vo.setTitle(request.getParameter("title"));
		vo.setWriter(request.getParameter("writer"));
		vo.setContents(request.getParameter("contents"));
		vo.setPassword(request.getParameter("pw"));
 		vo.setRegdate(request.getParameter("regdate"));

		System.out.println(vo.toString());

		NoticeDAO dao = new NoticeDAO();
		String result = dao.insertNotice(vo);
		if (result.equals("글저장")) {
			response.sendRedirect("noticeboardlist.jsp");
		} else {
			System.out.println("에러");
		}
	%>
</body>
</html>