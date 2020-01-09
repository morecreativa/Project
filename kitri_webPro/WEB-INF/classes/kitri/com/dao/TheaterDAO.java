package kitri.com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import kitri.com.vo.TheaterVO;

public class TheaterDAO {
	
	public ArrayList<TheaterVO> getTheaterList(String movie_num){
		Connection con=null;
		PreparedStatement pt=null;
		ResultSet rs=null;
		ArrayList<TheaterVO> list=new ArrayList<TheaterVO>();
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "PRO", "PRO");
			
			//MOVIE_NO와 일치하는 THEATER_NO들을 출력
			String sql="select t.THEATER_NO, t.WATCH_NO, t.WATCH_TIME"
					+ " from THEATER t, MOVIE m"
					+ " where m.movie_no=t.movie_no and t.movie_no=?"
					+ " order by t.THEATER_NO";
			pt=con.prepareStatement(sql);
			pt.setString(1, movie_num);
			rs=pt.executeQuery();
			
			while(rs.next()) {
				TheaterVO vo=new TheaterVO();
				vo.setTHEATER_NO(rs.getString(1));
				vo.setWATCH_NO(rs.getString(2));
				vo.setWATCH_TIME(rs.getString(3));
				list.add(vo);
			}
			
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				con.close();
			}catch(SQLException e) {}
		}
		
		return list;
	}
}
