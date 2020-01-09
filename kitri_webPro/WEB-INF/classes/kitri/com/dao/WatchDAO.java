package kitri.com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.Arrays;

import kitri.com.vo.WatchVO;

public class WatchDAO {
	
	// WatchDAO 1. 상영관 번호	2. 좌석 배열	3. 예약유무
	// 예약 확인 -> WatchVO + ReservationVO + MovieVO + TheaterVO
	// 극장과 상영관에 따른 변수 대입
	public String[] getWatchList(String watch_num, String theater_no,String watch_time) {
		Connection con=null;
		PreparedStatement pt=null;
		ResultSet rs=null;
		//A,B,C,D,E,F,G,H,I,J * 15 좌석 ==15*10
		String[] seat_list=new String[150];
		ArrayList<WatchVO> list=new ArrayList<WatchVO>();
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "PRO", "PRO");
			//watch 테이블의 모든 정보를 가져옴.
			String sql="select *from Watch w, Theater t"
					+ " where t.WATCH_NO=w.WATCH_NO"
					+ " and w.WATCH_NO=? and t.THEATER_NO=? and w.WATCH_TIME=?"
					+ " order by w.SEAT_NO";
			
			pt=con.prepareStatement(sql);
			pt.setString(1, watch_num);
			pt.setString(2, theater_no);
			pt.setString(3, watch_time);
			rs=pt.executeQuery();
			
			while(rs.next())
			{
				WatchVO vo=new WatchVO();
				vo.setWATCH_NO(Integer.parseInt(rs.getString(1)));
				vo.setSEAT_NO(rs.getString(2));
				vo.setRESERVED(Integer.parseInt(rs.getString(3)));
				list.add(vo);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				con.close();
			}catch(SQLException e) {}
		}
		
		//list 순회 하면서  Seat String을 생성 -> String을 리턴
		int i=0;
		for(WatchVO vo:list) {
			// watch_num 상영관, theater_num 영화관
			// A열 1번 좌석  0 예약안됨. -> A_1_0
			// B열 2번 좌석  1 예약됨 .  -> B_2_1
			String seatstr=vo.getSEAT_NO()+"_"+String.valueOf(vo.getRESERVED());
			seat_list[i]=seatstr; 	
			i++;
		}
		
		// String 정렬
		return seat_list;
	}
	
	// UPDATE DAO
	// 전달받는 변수 String[] arr에 따른 상황을 달리 설정하였음.
	public int UpdateSeatArray(String watch_num,String theater_no,String watch_time,String[] arr) {
		//String[] arr 은 하나일 떄 A_2, "" 둘일때 A_2 A_1 로 전달됨.
		Connection con=null;
		PreparedStatement pt=null;
		int result=0;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "PRO", "PRO");

		// 예약이 되었다는 seat_str로 바꿔줌.
		for(int i=0;i<arr.length;i++) arr[i]=arr[i]+"_1";
		
		//값이 없는 것을 찾아내야함.
		String[] seat_first_token=arr[0].split("_");
		String[] seat_second_token=arr[1].split("_");
		
		if(seat_first_token.length==1||seat_second_token.length==1) {// 넣어야할 좌석이 하나일 때
			
			String sql="update WATCH"
					+ " set SEAT_NO=?"
					+ " where WATCH_NO=? and THEATER_NO=? and WATCH_TIME=?";
			
			pt=con.prepareStatement(sql);
			if(seat_first_token.length==2) pt.setString(1, arr[0]);
			else pt.setString(1, arr[1]);
			pt.setString(2, watch_num);
			pt.setString(3, theater_no);
			pt.setString(4, watch_time);
			
			result=pt.executeUpdate();
		}
		else {	//좌석 둘다 넣어야 할 때
			for(int i=0;i<arr.length;i++) {
				String sql="update WATCH_NO"
						+ " set SEAT_NO=?"
						+ " where WATCH_NO=? and THEATER_NO=? and WATCH_TIME=?";
				
				pt=con.prepareStatement(sql);
				pt.setString(1, arr[i]);
				pt.setString(2, watch_num);
				pt.setString(3, theater_no);
				pt.setString(4, watch_time);
				
				result=pt.executeUpdate();
			}
		}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				con.close();
			}catch(SQLException e) {}
		}
		
		return result;
	}

}
