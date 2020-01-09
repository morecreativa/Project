<%@page import="kitri.com.vo.QnaReplyVO"%>
<%@page import="java.util.ArrayList"%>

<%@page import="kitri.com.dao.QnaBoardDAO"%>
<%@page import="kitri.com.vo.QnaBoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
<link href="<c:url value="/css/bootstrap.min.css" />" rel="stylesheet">
<link rel="stylesheet" href="css/bootstrap.min.css">

<title >view</title>
<style type="text/css">
body{
background-image: url(img/hro.jpg);
}

</style>
<script type="text/javascript">
function LayerView(){
	rep0.style.visibility="visible";
}
function LayerHiding(){
	rep0.style.visibility="hidden";
}

</script>

</head>

<div class="container" style="width:1000px" >
<div class="card mb-4">
<div class="card-body">
<body class="card-body">
	<h1>DETAILVIEW</h1>
	<%
		int no = Integer.parseInt(request.getParameter("vo"));
		QnaBoardDAO dao = new QnaBoardDAO();
		QnaBoardVO vo = dao.getDetailView2(no);

		//vo에서 전달받아서
		
	%>
	<script type="text/javascript">
	var pt=prompt('암호를 입력하세요');
	if(pt!=<%=vo.getPassword()%>){
		alert("암호를 틀렸습니다.");
		history.back();
	}
	</script>
	<table class="table table-hover">
		<tr>
			<td width="50%">작성자 : <%=vo.getWriter()%></td><td width="60%" colspan="3">제목 : <%=vo.getTitle()%></td>
		</tr>
		
		<tr class="c">
			<td colspan="3">
			<label for="ct">내용</label>
			<textarea class="form-control" id="ct" rows="5" placeholder="<%=vo.getContents()%>" readonly=""></textarea>
			</td>
		</tr>
		<tr>
			<td><form id="up" action="qna_writeform.jsp">
			<input type = "submit" value="수정">
			<input type="hidden" name ="no" value="<%=no%>">
			</form></td>
			<td><form id="del" action="qna_delete.jsp">
			<input type = "submit" value="삭제">
			<input type="hidden" name ="no" value="<%=no%>">
			</form></td>
			<td>
			<input type="button" value="목록보기" Onclick="window.location='qna_board.jsp?pagenum=1'">
			</td>
		</tr>
	</table>
	<br>
	
<!-- -------------------------------답글작성----------------------------------- -->			
			<form action="qna_reply.jsp">
			<table>
			<tr>
			<textarea name=reply1 class="form-control" id="rp" rows="1" placeholder="contents"></textarea>
			<input type = "submit" value="댓글작성">
			</tr>
			</table>
			<input type="hidden" name ="q_no" value="<%=no%>">
			</form>
			<br><br>
<!-- -------------------------------------------------------------------- -->

<%request.setCharacterEncoding("utf-8");
int pagenum = 0;
if (request.getParameter("page") == null) {
	pagenum = 1;
} else {
	pagenum = Integer.parseInt(request.getParameter("page"));
}

int start = (pagenum - 1) * 5 + 1;
int end = pagenum * 5;

QnaReplyVO vo1 = new QnaReplyVO();
ArrayList<QnaReplyVO> list1 = dao.getReplyList(no);
%>

<!-- ---------------------------------------------------------------- -->

<a href = "Javascript:LayerView();" class="btn btn-primary">펼치기</a>
<a href = "Javascript:LayerHiding();" class="btn btn-primary">접기</a>

<table class="table table-hover" id=rep0 style="visibility: hidden">
	
	<th>no</th><th>reply</th><th>date</th>
	<% 
	for(int j = 0; j < list1.size(); j++) {
		vo1 = list1.get(j);
	 %><tr>
		<td><%=vo1.getQ_no()%></td>
		<td><%=vo1.getReply() %></td>
		<td><%=vo1.getRegdate() %></td>
	   </tr>
		<%} %>
</table>
				<%-- <!--  ---------------------------페이지 번호 테이블 -----------------------------  -->
				<table class="table table-hover">
					<tr>
						<td>
							<%
								out.println("[pageNo▶]&nbsp");
								out.println("<a href='qna_view.jsp?page=" + 1 + "'>" + "[first]" + "</a>&nbsp;&nbsp;");
								int total1 = dao.ReplyPage();
								int totalPage1 = total1 / 5;
								if (total1 % 5 != 0) {
									totalPage1 = totalPage1 + 1;
								}

								for (int i = 1; i <= totalPage1; i++) {
									out.println("<a href='qna_view.jsp?page=" + i + "'>" + i + "</a>&nbsp;&nbsp;");
								}

								out.println("<a href='qna_view.jsp?page=" + totalPage1 + "'>" + "[last]" + "</a>&nbsp;&nbsp;");
							%>
						</td>
					</tr>
				</table>
				<!--  ---------------------------페이지 번호 테이블 끝 -----------------------------  -->


 --%>
</body>
</div>
</div>
</div>
</html>

