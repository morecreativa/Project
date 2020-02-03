package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

import VO.BoardVO;
import VO.MemberVO;

public class MemberDAO {
	public int getMember(MemberVO vo) throws Exception{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con =DriverManager.getConnection
				("jdbc:oracle:thin:@localhost:1521:xe", "jdbc", "jdbc");
		String sql=
				"select pw from member where id=?";
		PreparedStatement pt=con.prepareStatement(sql);
		pt.setString(1, vo.getId());
		ResultSet rs=pt.executeQuery();
		if(rs.next()) {
			String dbpw=rs.getString("pw");
			String inputpw=vo.getPw();
			if(dbpw.equals(inputpw)) {
				return 1;
			}
			// 아이디가 있지만 패스워드가 다른 상태
			else return 2;
		}
		else {
			return 3;
		}
	}
}
