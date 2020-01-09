<%@page import="kitri.com.dao.WatchDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>예매완료</title>
<script src="jquery-3.2.1.min.js"></script>
<script>
$(document).ready(function(){

});
</script>
</head>
<body>
	<div class="test">
	
		<h1>좌석을 확인하세요!</h1>
		<div>
		<%
		request.setCharacterEncoding("UTF-8");
		
		String watch_num=request.getParameter("WATCH_NUM");
		String theater_no=request.getParameter("THEATER_NO");
		String watch_time=request.getParameter("WATCH_TIME");
		String[] seat_arr={request.getParameter("seat_str1"),""};
		//선택한 좌석의 갯수가 2개 일때는 seat_str2도 저장을 해줌.
		if(!request.getParameter("seat_str2").equals("null")||request.getParameter("seat_str2")!=null){
			seat_arr[1]=request.getParameter("seat_str2");
		}
		WatchDAO dao=new WatchDAO();
		int result=0;
		//선택한 좌석이 하나일때
		if(seat_arr[1].equals("")){
			%>
			<h1> 선택하신 좌석은 <%=seat_arr[1] %>입니다.</h1><%
			result=dao.UpdateSeatArray(watch_num,theater_no, watch_time,seat_arr);
			if(result==1){
				%><br><h2>예약이 정상적으로 처리되었습니다.</h2><%
			}
			else %><br><h2>예약 처리과정 중 오류가 발생하였습니다. 문의 게시판을 이용해주세요!</h2><%
		}
		// 선택한 좌석의 갯수가 2개 일때
		else{
			%><h1> 선택하신 좌석은 <%=seat_arr[0] %>,<%=seat_arr[1] %>입니다.</h1><%
			result=dao.UpdateSeatArray(watch_num,theater_no, watch_time,seat_arr);
			if(result==1){
				%><br><h2>예약이 정상적으로 처리되었습니다.</h2><%
			}
			else %><br><h2>예약 처리과정 중 오류가 발생하였습니다. 문의 게시판을 이용해주세요!</h2><%
		}
		%>
		<br>
		<button type="button" onclick="location.href='main.jsp'">메인페이지로 가기</button>
		</div>
	</div>
</body>
</html>