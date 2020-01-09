package kitri.com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import kitri.com.vo.MemberVO;

public class MemberDAO {

	public String insertMember(MemberVO vo) {

		String result = "";
		Connection con = null;
		PreparedStatement pt = null;

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("����̹��ε��Ϸ�");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "PRO", "PRO");

			String insertsql = "insert into member (no,id,password,name,gender,tel,cp,email,address,zipcode,admin,birth) values (member_seq.nextval,?,?,?,?,?,?,?,?,?,'no','birth')";
			pt = con.prepareStatement(insertsql);
			pt.setString(1, vo.getID());
			pt.setString(2, vo.getPASSWORD());
			pt.setString(3, vo.getNAME());
			pt.setString(4, vo.getGENDER());
			pt.setString(5, vo.getTEL());
			pt.setString(6, vo.getCP());
			pt.setString(7, vo.getEMAIL());
			pt.setString(8, vo.getADDRESS());
			pt.setString(9, vo.getZIPCODE());

			int i = pt.executeUpdate();

			result = "ȸ�����ԿϷ�";

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

			result = "ȸ������ ���� ���� �߻�";
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO: handle exception
			}
//			con.commit();
		}
		return result;
	}

	public int selectMember(MemberVO vo) {

		int result = 0;
		Connection con = null;
		PreparedStatement pt = null;

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("����̹��ε��Ϸ�");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "PRO", "PRO");

			String selectSql = "select id,admin from member where id=? and password = ?";
			pt = con.prepareStatement(selectSql);
			pt.setString(1, vo.getID());
			pt.setString(2, vo.getPASSWORD());

			ResultSet rs = pt.executeQuery();
//			try {
//				rs.next();
//				System.out.println("? => " + rs.getString("admin"));
//				if(rs.getString("admin").equals("yes")) {
//					result = 2;
//				}
//				if(rs.getString("admin").equals("null")) {
//					result = 1;
//				}
//			} catch (Exception e) {
//				e.printStackTrace();
//				result = 0;
//			}
//
//		} catch (Exception e) {
//			e.printStackTrace();
//			result = 0;
//		} finally {
//			try {
//				con.close();
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
//		}
			while(rs.next()) {
				if(rs.getString(2).equals("yes")) {
					result =2;
				}else if(rs.getString(2).equals("no")) {
					result = 1;
				}else {
					result = 0;
				}
			}
		}catch (Exception e) {
				// TODO: handle exception
				e.printStackTrace();
			}
		return result;
	}

//	public int getMember(String ID, String PASSWORD) {
//		int result = 0;
//
//		try {
//			Class.forName("oracle.jdbc.driver.OracleDriver");
//			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "PRO", "PRO");
//
//			String sql;
//			PreparedStatement pt;
//			if (rs.next()) {
//				if (rs.getString(1).equals("yes")) {
//					result = "3";
//					System.out.println(result);
//				} else {
//					result = 1;
//					System.out.println(result);
//				}
//			} else {
//				result = "ID�� Password�� Ȯ�����ּ���!";
//				System.out.println(result);
//			}
//			rs.close();
//			con.close();
//		} catch (ClassNotFoundException e) {
//			e.printStackTrace();
//			result = "DB ��ȸ ����!";
//			System.out.println(result);
//		} catch (SQLException e) {
//			e.printStackTrace();
//			result = "DB ��ȸ ����!";
//			System.out.println(result);
//		}
//
//			sql = "select admin from member where ID= ? and password =?";
//			pt = con.prepareStatement(sql);
//			pt.setString(1, ID);
//			pt.setString(2, PASSWORD);
//			pt.executeUpdate();
//			ResultSet rs = pt.executeQuery(sql);
//		return 0;
//	}

	public String setMember(String ID, String PASSWORD, String NAME, String ADDRESS, String TEL, String CP,
			String EMAIL, String BIRTH, String ADMIN, String ZIPCODE,String GENDER) {
		String result = "";

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "PRO", "PRO");

			String sql;
			PreparedStatement pt;

			sql = "select ID from member where ID= ?";
			pt = con.prepareStatement(sql);
			pt.setString(1, ID);
			pt.executeUpdate();
			ResultSet rs = pt.executeQuery(sql);
			if (rs.next()) {
				String id_search = rs.getString(1);
				if (ID.equals(id_search))
					result = "�̹� ��ϵ� ���̵��Դϴ�.";
				System.out.println(result);
			} else {
				sql = "insert into member values (seq.nextval,?,?,?,?,?,?,?,?,'no',?,'1')";
				pt = con.prepareStatement(sql);
				pt.setString(1, ID);
				pt.setString(2, PASSWORD);
				pt.setString(3, NAME);
				pt.setString(4, ADDRESS);
				pt.setString(5, TEL);
				pt.setString(6, CP);
				pt.setString(7, EMAIL);
				pt.setString(8, BIRTH);
				pt.setString(10, ZIPCODE);
				pt.setString(11, GENDER);
				pt.executeUpdate();
				result = "DB�� Insert ����!";
				System.out.println(result);
			}
			rs.close();
			con.close();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			result = "DB Insert ����!";
			return result;
		} catch (SQLException e) {
			e.printStackTrace();
			result = "DB Insert ����!";
			return result;
		}

		return result;
	}
}
