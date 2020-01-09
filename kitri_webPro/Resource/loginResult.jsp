
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
		MemberVO vo = new MemberVO();
	
		vo.setID(request.getParameter("id"));
		vo.setPASSWORD(request.getParameter("password"));
		
		System.out.println(vo.toString());
		MemberDAO dao = new MemberDAO();
		HttpSession Session = request.getSession(true);
		int result = dao.selectMember(vo);
		String url = "";
		if(result==1){
			Session.setAttribute("id", vo.getID());
			Session.setAttribute("admin", "no");
			url = "./main.jsp";
		}else if(result == 2){
			Session.setAttribute("id", vo.getID());
			Session.setAttribute("admin", "yes");
			url = "./admin/admin_main.jsp";
		}
		else{
			url = "./login.jsp?fail=-1";
		}
		response.sendRedirect(url);
		
		
	%>
</body>
</html>


