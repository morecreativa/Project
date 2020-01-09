package kitri.com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import kitri.com.vo.NoticeVO;

public class NoticeDAO {

	public String insertNotice(NoticeVO vo) {

		String result = "";
		Connection con = null;
		PreparedStatement pt = null;

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("����̹��ε��Ϸ�");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "PRO", "PRO");

			String insertsql = "insert into noticeboard(no,category,title,password,contents,writer,regdate) values (notice_seq.nextval,?,?,?,?,?,SYSDATE)";
			pt = con.prepareStatement(insertsql);
			pt.setString(1, vo.getCategory());
			pt.setString(2, vo.getTitle());
			pt.setString(3, vo.getPassword());
			pt.setString(4, vo.getContents());
			pt.setString(5, vo.getWriter());

			pt.executeUpdate();

			result = "글저장";

		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

			result = "������ ����";
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO: handle exception
			}
			// con.commit();
		}
		return result;
	}

	public ArrayList<NoticeVO> getBoardList() {
		Connection con = null;
		PreparedStatement pt = null;
		ResultSet rs = null;
		ArrayList<NoticeVO> list = new ArrayList<NoticeVO>();
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("����̹��ε��Ϸ�");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "PRO", "PRO");
			pt = con.prepareStatement("select * from noticeboard order by no desc");
			rs = pt.executeQuery();
			while (rs.next()) {
				NoticeVO vo = new NoticeVO();
				vo.setNo(rs.getInt("no"));
				vo.setCategory(rs.getString("category"));
				vo.setTitle(rs.getString("title"));
				vo.setContents(rs.getString("contents"));
				vo.setPassword(rs.getString("password"));
				vo.setWriter(rs.getString("writer"));
				vo.setRegdate(rs.getString("regdate"));
				list.add(vo);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO: handle exception
			}
		}
		return list;
	}

	public NoticeVO selectNotice(String no) {
		Connection con = null;
		PreparedStatement pt = null;
		ResultSet rs = null;
		NoticeVO noticeVo = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("����̹��ε��Ϸ� no : " + no);
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "PRO", "PRO");
			pt = con.prepareStatement("select * from noticeboard where no = ? order by no desc");
			pt.setString(1, no);
			rs = pt.executeQuery();
			while (rs.next()) {
				noticeVo = new NoticeVO();
				noticeVo.setNo(rs.getInt("no"));
				noticeVo.setCategory(rs.getString("category"));
				noticeVo.setTitle(rs.getString("title"));
				noticeVo.setWriter(rs.getString("writer"));
				noticeVo.setContents(rs.getString("contents"));
				noticeVo.setPassword(rs.getString("password"));
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO: handle exception
			}
		}
		return noticeVo;
	}

	public int updateNotice() {
		Connection con = null;
		PreparedStatement pt = null;
		ResultSet rs = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("����̹��ε��Ϸ�");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "PRO", "PRO");
			pt = con.prepareStatement("update noticeboard set category=?, title=?, contents=? password=? where no = ?");
			rs = pt.executeQuery();
			while (rs.next()) {
				NoticeVO vo = new NoticeVO();
				vo.setCategory(rs.getString("category"));
				vo.setTitle(rs.getString("title"));
				vo.setContents(rs.getString("contents"));
				vo.setPassword(rs.getString("password"));
				vo.setNo(rs.getInt("no"));
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO: handle exception
			}
		}
		return 1;
	}

	public int deleteAndUpdateNotice(NoticeVO vo , String type) {
		Connection con = null;
		PreparedStatement pt = null;
		int result = 0;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			System.out.println("����̹��ε��Ϸ�");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "PRO", "PRO");
			String sql = "";
			if(type.equals("update")) {
				sql = "update noticeboard set title = ? , contents = ? , category = ? where no = ? and password = ?";
				pt = con.prepareStatement(sql);
				pt.setString(1, vo.getTitle());
				pt.setString(2, vo.getContents());
				pt.setString(3, vo.getCategory());
				pt.setInt(4, vo.getNo());
				pt.setString(5, vo.getPassword());
			}else if(type.equals("delete")) {
				sql = "delete from noticeboard where no = ? and password = ?";
				pt = con.prepareStatement(sql);
				pt.setInt(1, vo.getNo());
				pt.setString(2, vo.getPassword());
			}
			result = pt.executeUpdate();
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
				// TODO: handle exception
			}
		}
		return result;
	}

}
