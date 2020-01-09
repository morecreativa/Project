
<%@page import="kitri.com.dao.NoticeDAO"%>
<%@page import="kitri.com.vo.NoticeVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<script src="jquery-3.2.1.min.js"></script>
<script>
	$(document).ready(function() {

	});
</script>
<%
	HttpSession Session = request.getSession(true);
	String writer = (String) Session.getAttribute("id");
%>
</head>
<body>
	<%
	
		NoticeVO vo = new NoticeVO();
		vo.setCategory((String)request.getParameter("category"));
		vo.setContents((String)request.getParameter("contents"));
		vo.setNo(Integer.parseInt((String)request.getParameter("no")));
		vo.setPassword((String)request.getParameter("pw"));
		vo.setTitle((String)request.getParameter("title"));
		String type = (String)request.getParameter("type");
		NoticeDAO dao = new NoticeDAO();
		int result = dao.deleteAndUpdateNotice(vo,type);
		if(result>0){
			response.sendRedirect("noticeboardlist.jsp");
		}else{
			response.sendRedirect("noticeView.jsp?no="+vo.getNo()+"&msg=Not eqauls password!!");
		}
	%>
</body>
</html>