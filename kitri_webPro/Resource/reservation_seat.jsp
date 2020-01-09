<%@page import="kitri.com.dao.WatchDAO"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>좌석예매</title>
<style type="text/css">
#div_root{
margin:auto;
width:1000px;
}

#div_top{
width:80%;
height:100x;
background-color:#D1FFD5;
float:right;
text-align:center;
}

#div_menu{
width:20%
height:300px;
float:left;
text-align:left;
}

#div_con{
width:80%;
height:800px;
float:right;
}
.button_style{
	border:1px solid black; /*테두리 정릐*/ 
	background-Color:#FFFFFF; /*백그라운드 정의*/
	font-weight:bold; /*폰트 굵기*/
	color:black; /*폰트 색깔*/
	width:30px; height:30px; /*버튼 크기*/
}
.screen_style{
	border:1px solid black;
	background-Color:#D1FFD5;
	width:565px; height:50px;
}
.button_blocked_style{
	border:1px solid black; /*테두리 정릐*/ 
	background-Color:#000000; /*백그라운드 정의*/
	font-weight:bold; /*폰트 굵기*/
	color:black; /*폰트 색깔*/
	width:30px; height:30px; /*버튼 크기*/
	}
.column_style{
	border:1px solid black; /*테두리 정릐*/ 
	background-Color:#FFA3BF; /*백그라운드 정의*/
	font-weight:bold; /*폰트 굵기*/
	color:black; /*폰트 색깔*/
	width:30px; height:30px; /*버튼 크기*/
}
.reservation_style{
	border:1px solid black; /*테두리 정릐*/ 
	background-Color:#CCDCFF; /*백그라운드 정의*/
	font-weight:bold; /*폰트 굵기*/
	color:black; /*폰트 색깔*/
	width:100px; height:30px; /*버튼 크기*/
}
.clicked_style{
border:1px solid black; /*테두리 정릐*/ 
	background-Color:#FC9330; /*백그라운드 정의*/
	font-weight:bold; /*폰트 굵기*/
	color:black; /*폰트 색깔*/
	width:30px; height:30px; /*버튼 크기*/
}
</style>

<script src="jquery-3.2.1.min.js"></script>
<script>
//버튼 별 카운트 A : 1~15 B : 16~30 C : ~~~~~ 

		var count=new Array();
		for(var i=0;i<150;i++){count[i]=1;}

		function reply_clicked(btn,value,col)
		{ 
		   var cnt=col*15+value-1;
		   var property=document.getElementById(btn);
		   if(count[cnt]%2==0)
		   {
		      property.className="button_style";
		   }
		   //When EventClick is on it turns #~
		   else
		   {
		      //좌석의 갯수를 제한 할 수 있음.
		      property.className="clicked_style";   
		   }
		   count[cnt]++;
		}

		function reservation_check(wn,tn,wt)
		{
			   if(confirm("선택한 좌석들을 예매하시겠습니까?")==true){
			      var selected=document.getElementsByClassName('clicked_style');
			      if(selected.length>2){
			         alert("예매가능한 좌석의 개수는 2개로 제한됩니다!");
			         return;
			      }
			      var str="WATCH_NUM="+wn+"&THEATER_NO="+tn+"&WATCH_TIME="+wt+"&";
			      for(var i=0;i<selected.length;i++){
			         var j=i+1;
			         if(selected[i]) str+="seat_str"+j+"="+selected[i].name+"&";
			      }
			      document.location.href="reservation_check.jsp?"+str;
			   }
		}
</script>
</head>
<body>
	<div id ="div_root">
		<p class="test">영화에 대한 좌석 정보입니다.</p>
		<div>
<!-- 	@get parameter value of theater_no, watch_num, watch_time with previous page @-->
		<input type="button" class="screen_style" value="SCREEN"><br><br>
		<%
		// 이전 페이지에서 값을 가져옴.
		request.setCharacterEncoding("UTF-8"); // 받아올 데이터의 인코딩
		
		String watch_num=request.getParameter("WATCH_NUM");
		String theater_no=request.getParameter("THEATER_NO");
		String watch_time=request.getParameter("WATCH_TIME");
		
		//DAO 객체 선언
		WatchDAO dao=new WatchDAO();
		// DB에서 값들을 가져옴
		// seat_arr[] -> getWatchList에서 가져온 좌석DB A_1_1  A_2_0 처럼 정렬디어 있음. 
		String[] seat_arr=dao.getWatchList(watch_num, theater_no, watch_time);
		%>
		<%
		for(int i=0;i<10;i++)
		{
			// A_1_0
			for(int j=0;j<15;j++)
			{
				String[] values=seat_arr[i*15+j].split("_");
				if(j==0)
				{
				%><input type="button" class="column_style" value="<%=values[0]%>"><%
				}
					// values[0] = A행 ,B 행
					// values[1] = 1번 ,2 번 좌석번호
					// 좌석이 예매가 안되어 있을 경우에는 기본 이미지
					if(values[2].equals("0"))
					{ %>
						<input type="button" id="<%=values[0]%>_<%=j+1%>" value="<%=j+1%>" name="<%=values[0]%>_<%=j+1%>" class="button_style"
							   onclick="reply_clicked(this.id,this.value,<%=i%>)"> <%
					}
					// 좌석이 예매가 되어 있을 때에는 백그라운드 Black
					else 
					{%>
						<input type="button" id="Blocked" value="X" name="Blocked" class="button_blocked_style"
							   onclick="reply_clicked(this.id,this.value,0)"><%
					}
			}%><br><br><%
		}
		%><br>
		<input type="button" id="reservation" value="예매하기" name="reservation" class="reservation_style"
			   onclick="reservation_check(<%=watch_num%>,<%=theater_no%>,<%=watch_time%>)">
		<!--좌석 선택완료 -->
<!-- 		1. 클릭된 버튼의 인원수를 표시 -->
<!-- 		2. 좌석을 누르면 결제 페이지로 넘어감.  -->
<!-- 		3. 결제가 끝나면 DB는 0에서 1로 바뀜. -->
<!-- 		4. 고로 이 페이지에서는 체크된 좌석 값만 넘기면 됨.0 -->
		</div>		
	</div>
</body>
</html>