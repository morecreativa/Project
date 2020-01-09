<%@page import="kitri.com.vo.QnaBoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
 
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<meta name="viewport"
	content="width=device-width, initial-scale=1, shrink-to-fit=no">

<link href="<c:url value="/css/bootstrap.min.css" />" rel="stylesheet">
<link rel="stylesheet" href="css/bootstrap.min.css">

<title>WRITEFORM</title>
<style type="text/css">
body{
background-image: url(img/trv.jpg);
}
</style>
</head>
<div class="container" style="width:1000px" >
<div class="card mb-4">
<div class="card-body">
<body>
<%
//글작성,답글 입력 전달 페이지
int no = 0,reply = 0,step = 0,lev = 0,pnum = 0;

//답글 -> 부모값  저장
%>
<%if(request.getParameter("no")==null){
	%><h1>WRITE</h1>
	<%}else{ %>
<h1>MODIFY</h1>
<%} %>
<form action="qna_write.jsp" name="writeform" method="post">
<% 
//글번호가 있으면 받아온 값을 저장
if(request.getParameter("no")!=null){
	QnaBoardVO vo = new QnaBoardVO();
	no=Integer.parseInt(request.getParameter("no"));
	reply = vo.getReply();
	step = vo.getStep();
	lev = vo.getLev();
	pnum = vo.getPnum();
%>
	<input type = "hidden" name = "no" value="<%=no%>">
	<input type = "hidden" name = "reply" value="<%=reply%>">
	<input type = "hidden" name = "step" value="<%=step%>">
	<input type = "hidden" name = "lev" value="<%=lev%>">
	<input type = "hidden" name = "pnum" value="<%=pnum%>">

<% }else{%>
	
<input type = "hidden" name = "no" value="<%=no%>">
<input type = "hidden" name = "reply" value="<%=reply%>">
<input type = "hidden" name = "step" value="<%=step%>">
<input type = "hidden" name = "lev" value="<%=lev%>">
<input type = "hidden" name = "pnum" value="<%=pnum%>">

<%}%>

<input type = "hidden" name = "no" value="<%=no%>">
<input type = "hidden" name = "reply" value="<%=reply%>">
<input type = "hidden" name = "step" value="<%=step%>">
<input type = "hidden" name = "lev" value="<%=lev%>">
<input type = "hidden" name = "pnum" value="<%=pnum%>">
<table class="table table-hover">

<!-- 이름 -->
<tr>
<td colspan="2">
<label for="wtr" class="col-form-label">작성자</label>
<input type="text" name="writer" placeholder="writer" id=wtr class="form-control">
</td>
</tr>
<!-- 제목 -->
<tr>
<td colspan="2">
<label for="ti" class="col-form-label">제목</label>
<input type="text" name="title" id=ti placeholder="title" class="form-control">
</td>
</tr>
<!-- 내용 -->
<tr>
<td colspan="2">
<label for="ct">내용</label>
<textarea name="contents" class="form-control" id="ct" rows="3" placeholder="contents"></textarea>
</td>
</tr>
<tr>
<td>
<label for="qq">문의내용</label>
<select name="category"  class="btn btn-outline-primary" id=qq>
<option value="통합">통합</option>
<option value="극장이용">극장이용</option>
<option value="기프트콘">기프트콘</option>
<option value="기타">기타</option>
</select>
</td>
<td>
<label for="pw">암호</label>
<input type="text"name="password" id=pw>
</td>
<input type="hidden"name="filename">


<tr>
<td colspan="4" bgcolor="#b0e0e6" align="center">
<input type="submit" value="글쓰기"  class="btn btn-outline-primary">
<input type="reset" value="다시작성"  class="btn btn-outline-primary">
<input type="button" value="목록보기" Onclick="window.location='qna_board.jsp?pagenum=1'"  class="btn btn-outline-primary" >
</td>
</tr>
</table>
</form>

</body>
</div>
</div>
</div>

</html>