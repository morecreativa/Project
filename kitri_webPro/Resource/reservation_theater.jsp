
<%@page import="kitri.com.vo.TheaterVO"%>
<%@page import="kitri.com.dao.TheaterDAO"%>
<%@page import="java.util.ArrayList"%>

<%@page import="kitri.com.dao.MovieDAO"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<title>상영관 정보</title>

</head>
<script>
//reservation_seat으로 넘겨야 할 parameter WATCH_NO, THEATER_NO, WATCH_TIME
function reply_clicked(id,watch_num,theater_no,watch_time){
	if(confirm("선택하시겠습니까?")==true){
		document.location.href="reservation_seat.jsp?WATCH_NUM="+watch_num+
				"&THEATER_NO="+theater_no+"&WATCH_TIME="+watch_time;
	}
	else{
		alert("다시 선택해주세요!");
		var property=document.getElementById(id);
		property.checked=false;
		return;
	}
}
</script>
<body>
	<%
	String movie_num=request.getParameter("movie_no");
	MovieDAO movie_dao=new MovieDAO();
	TheaterDAO theater_dao=new TheaterDAO();
	String movietitle=movie_dao.getTitle(movie_num);
	%>
	<h1><%=movietitle %>에 대한 상영정보입니다.</h1><%
	ArrayList<TheaterVO> list=theater_dao.getTheaterList(movie_num);
	TheaterVO vo=new TheaterVO();
	//영화관, 상영관, 상영시간
	%>
	<table>
         <th>체크</th>
         <th>영화관</th>
         <th>상영관</th>
         <th>상영시간</th>
         <%
         for (int i = 0; i < list.size(); i++)
         {
            vo = list.get(i);%>
         <tr id="a<%=i%>">
            <td><input type="checkbox" id="CheckBox_no_<%=i%>" 
            onclick="reply_clicked(this.id,<%=vo.getTHEATER_NO()%>,<%=vo.getWATCH_NO()%>,<%=vo.getWATCH_TIME()%>)"></td>
            <td><%=vo.getTHEATER_NO()%></td><td><%=vo.getWATCH_NO()%></td><td><%=vo.getWATCH_TIME()%></td>
         </tr><%
           }
         %>
	</table>
</body>
</html>