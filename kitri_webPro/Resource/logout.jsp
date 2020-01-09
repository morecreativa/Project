
<%@page import="kitri.com.dao.MemberDAO"%>
<%@page import="kitri.com.vo.MemberVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<title>회원가입 완료</title>

<style>
</style>
</head>
<body>
	<%
		HttpSession Session = request.getSession(true);
		Session.removeAttribute("id");
		Session.removeAttribute("admin");
		response.sendRedirect("./main.jsp");
	%>
</body>
</html>


