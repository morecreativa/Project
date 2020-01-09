<%@page import="kitri.com.dao.QnaBoardDAO"%>
<%@page import="kitri.com.vo.QnaBoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<script type="text/javascript">
</script>
	<%
	int no =Integer.parseInt(request.getParameter("no"));
	QnaBoardDAO dao = new QnaBoardDAO();
	boolean result = dao.deleteBoard(no);
	
	if(result){
		%>
		<h1>글이 정상적으로 삭제되었습니다.</h1>
		<jsp:forward page="qna_board.jsp"/>
	<%}else{%>
	<h1>실패~</h1>
	<%} %>
	
<body>
</body>
</html>