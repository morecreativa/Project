<%@page import="kitri.com.dao.QnaBoardDAO"%>
<%@page import="kitri.com.vo.QnaBoardVO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html;charset=UTF-8">
<title>WRITE</title>
</head>
<%if(request.getMethod().equals("GET")){
	response.sendRedirect("qna_writeform.jsp");
	return;
	}
	
	request.setCharacterEncoding("UTF-8");
	%>

<body>
<% 
//글작성
if(Integer.parseInt(request.getParameter("no"))==0){
//전달받은 데이터 저장
int no = Integer.parseInt(request.getParameter("no"));
int reply=Integer.parseInt(request.getParameter("reply"));
int step = Integer.parseInt(request.getParameter("step"));
int lev = Integer.parseInt(request.getParameter("lev"));
int pnum = Integer.parseInt(request.getParameter("pnum"));

String writer=request.getParameter("writer");
String title=request.getParameter("title");
String contents=request.getParameter("contents");
String password = request.getParameter("password");
String category = request.getParameter("category");
String filename=request.getParameter("filename");

String regdate = request.getParameter("regdate");

QnaBoardVO vo = new QnaBoardVO();
vo.setNo(no);
vo.setReply(reply);
vo.setStep(step);
vo.setLev(lev);
vo.setWriter(writer);
vo.setTitle(title);
vo.setContents(contents);
vo.setPassword(password);
vo.setCategory(category);
vo.setFilename(filename);
vo.setPnum(pnum);
vo.setRegdate(regdate);

//dao 메소드호출 저장
QnaBoardDAO dao= new QnaBoardDAO();
String result = dao.insertBoard(vo);

if(result.equals("good")){
	request.setAttribute("qnaboardvo", vo);
	%>
<jsp:forward page="qna_board.jsp"/>
	<% }else {
		%>
		<script type="text/javascript">
		alert("공백을 채워주세요");
		document.location="qna_writeform.jsp";
		</script>
	<%} /* out.println("<h3>"+result+"</h3>"); */
 
}// insert end 
else{
	int no = Integer.parseInt(request.getParameter("no"));
	int reply=Integer.parseInt(request.getParameter("reply"));
	int step = Integer.parseInt(request.getParameter("step"));
	int lev = Integer.parseInt(request.getParameter("lev"));
	int pnum = Integer.parseInt(request.getParameter("pnum"));

	String writer=request.getParameter("writer");
	String title=request.getParameter("title");
	String contents=request.getParameter("contents");
	String password = request.getParameter("password");
	String category = request.getParameter("category");
	String filename=request.getParameter("filename");

	String regdate = request.getParameter("regdate");

	QnaBoardVO vo = new QnaBoardVO();
	vo.setNo(no);
	vo.setReply(reply);
	vo.setStep(step);
	vo.setLev(lev);
	vo.setWriter(writer);
	vo.setTitle(title);
	vo.setContents(contents);
	vo.setPassword(password);
	vo.setCategory(category);
	vo.setFilename(filename);
	vo.setPnum(pnum);
	vo.setRegdate(regdate);
	
QnaBoardDAO dao = new QnaBoardDAO();
String result = dao.getUpdate(vo);

if(result.equals("change")){
	
request.setAttribute("qnaboardvo", vo);
%>
<jsp:forward page="qna_board.jsp"/>
<% }else {
	out.println("<h3>"+result+"</h3>");
	}

}//update end %>



</body>


</html>