package kitri.com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.util.ArrayList;

import kitri.com.vo.ReservationVO;

public class ReservationDAO {
	
	public ArrayList<ReservationVO> getReserVationAvailablePage(int movie_num){
		Connection con=null;
		PreparedStatement pt=null;
		ArrayList<ReservationVO> list=new ArrayList<ReservationVO>();
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "PRO", "PRO");
			
			String sql="select TITLE"
					+ " from MOVIE m"
					+ " where MOVIE_NO=?";
			pt=con.prepareStatement(sql);
			pt.setInt(1, movie_num);
		/*
		 미완성.
		 * */
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
