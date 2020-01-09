<%@page import="kitri.com.dao.QnaBoardDAO"%>
<%@page import="kitri.com.vo.QnaReplyVO"%>
<%@page import="kitri.com.vo.QnaBoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>REPLY</title>
</head>
<body>
<%
int q_no = Integer.parseInt(request.getParameter("q_no"));
String reply1= request.getParameter("reply1");

QnaReplyVO vo = new QnaReplyVO();
vo.setQ_no(q_no);
vo.setReply(reply1);

QnaBoardDAO dao = new QnaBoardDAO();
String result=dao.ReplyIn(vo);

if(result.equals("reply")){
	request.setAttribute("qnareplyvo", vo);
	%>
<jsp:forward page="qna_view.jsp">
<jsp:param value="<%=vo.getQ_no()%>" name="vo"/>
</jsp:forward>
	<% }else {
		%>
		<script type="text/javascript">
		document.location="qna_view.jsp";
		</script>
	<%}%>

</body>
</html>