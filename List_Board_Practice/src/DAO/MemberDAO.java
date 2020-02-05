package DAO;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import VO.MemberVO;

public class MemberDAO {
	
	public int getMember(MemberVO vo) throws Exception{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection
				("jdbc:oracle:thin:@localhost:1521:xe", "jdbc", "jdbc");
		
		String sql="select pw"
				+ " from member"
				+ " where id=?";
		
		PreparedStatement pt=con.prepareStatement(sql);
		pt.setString(1, vo.getId());
		ResultSet rs=pt.executeQuery();
		
		if(rs.next()) {
			String dbpw=rs.getString("pw");
			String inputpw=vo.getPw();
			if(dbpw.equals(inputpw)) {
				return 1;
			}
			else return 2;
		}
		else {
			return 3;
		}
	}
}
