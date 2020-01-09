package kitri.com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import kitri.com.vo.QnaBoardVO;
import kitri.com.vo.QnaReplyVO;

public class QnaBoardDAO {
	public ArrayList<QnaBoardVO> getBoardList(int start, int end, String opt, String condition) {

		Connection con = null;
		PreparedStatement pt = null;
		ResultSet rs = null;
		ArrayList<QnaBoardVO> list = new ArrayList<QnaBoardVO>();

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "PRO", "PRO");

			if (opt == null) { 
				pt = con.prepareStatement("select no, title, writer,regdate " + " from(select rownum r, no, title, "
						+ "       writer,regdate " + "       from(select * from qnaboard "
						+ "    order by regdate desc))" + " where r >= ? and r <= ?");
				pt.setInt(1, start);
				pt.setInt(2, end);
			} else if (opt.equals("0")) {// �������� �˻�
				pt = con.prepareStatement(
						"select no, title, writer,regdate " + " from (select rownum r, no, title,writer,regdate "
								+ " from (select * from qnaboard where title like ? " + " order by regdate desc))"
								+ " where r >= ? and r <= ?");
				pt.setString(1, "%" + condition + "%");
				pt.setInt(2, start);
				pt.setInt(3, end);

			} else if (opt.equals("1")) { // �������� �˻�
				pt = con.prepareStatement(
						"select no, title, writer,regdate " + " from (select rownum r, no, title,writer,regdate "
								+ " from (select * from qnaboard where contents like ?  " + " order by regdate desc))"
								+ " where r >= ? and r <= ?");
				pt.setString(1, "%" + condition + "%");
				pt.setInt(2, start);
				pt.setInt(3, end);

			} else if (opt.equals("2")) { // ����+�������� �˻�
				pt = con.prepareStatement(
						"select no, title, writer,regdate " + " from (select rownum r, no, title,writer,regdate "
								+ " from (select * from qnaboard where title like ? and contents like ? "
								+ " order by regdate desc))" + " where r >= ? and r <= ?");
				pt.setString(1, "%" + condition + "%");
				pt.setString(2, "%" + condition + "%");
				pt.setInt(3, start);
				pt.setInt(4, end);

			} else if (opt.equals("3")) {// �۾��̷� �˻�
				pt = con.prepareStatement(
						"select no, title, writer,regdate " + " from (select rownum r, no, title,writer,regdate "
								+ " from (select * from qnaboard where writer like ? " + " order by regdate desc))"
								+ " where r >= ? and r <= ?");
				pt.setString(1, "%" + condition + "%");
				pt.setInt(2, start);
				pt.setInt(3, end);
			}
			rs = pt.executeQuery();
			while (rs.next()) {
				QnaBoardVO vo = new QnaBoardVO();
				vo.setNo(rs.getInt("no"));
				vo.setTitle(rs.getString("title"));
				vo.setWriter(rs.getString("writer"));
				vo.setRegdate(rs.getString("regdate"));
				list.add(vo);
			}
		
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
			}
		}
		return list;// 5 ����
	}

	public int getTotalBoard(String opt, String condition) {
		Connection con = null;
		PreparedStatement pt = null;
		ResultSet rs = null;
		int total = 0;
		try {

			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "PRO", "PRO");

			if (opt == null) { // ��ü�޴��ɼ�
				pt = con.prepareStatement("select count(*) from qnaboard");
				rs = pt.executeQuery();
			} else if (opt.equals("0")) {// ����˻�
				pt = con.prepareStatement("select count(*) from qnaboard where title like ?");
				pt.setString(1, "%" + condition + "%");
			} else if (opt.equals("1")) {// ����˻�
				pt = con.prepareStatement("select count(*) from qnaboard where contents like ?");
				pt.setString(1, "%" + condition + "%");
			} else if (opt.equals("2")) {// ����+���� �˻�
				pt = con.prepareStatement("select count(*) from qnaboard where title like ? or contents like ?");
				pt.setString(1, "%" + condition + "%");
				pt.setString(2, "%" + condition + "%");
			} else if (opt.equals("3")) {// �۾��� �˻�
				pt = con.prepareStatement("select count(*) from qnaboard where writer like ?");
				pt.setString(1, "%" + condition + "%");

			}
			rs = pt.executeQuery();
			rs.next();
			total = rs.getInt("count(*)");

		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
			}
		}
		return total;
	}

	// �Խù�1������޼ҵ�
	public String insertBoard(QnaBoardVO vo) {
		Connection con = null;
		PreparedStatement pt = null;
		String result = "";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "PRO", "PRO");
			pt = con.prepareStatement("insert into qnaboard values(qna_Seq.nextval,?,?,?,?,?,sysdate,?,?,?,?,?)");
			pt.setString(1, vo.getTitle()); // ����
			pt.setString(2, vo.getWriter()); // �ۼ���
			pt.setString(3, vo.getPassword()); // ��ȣ
			pt.setString(4, vo.getCategory()); // ī�װ�
			pt.setString(5, vo.getFilename()); // ÷�����ϸ�
			pt.setInt(6, vo.getStep()); // ���ܹ�ȣ
			pt.setInt(7, vo.getLev()); // ������ȣ
			pt.setInt(8, vo.getPnum()); // �θ��ȣ
			pt.setInt(9, vo.getReply()); // ��۹�ȣ
			pt.setString(10, vo.getContents()); // ����
			// int i= pt.executeUpdate();
			pt.executeUpdate();
			result = "good";
		} catch (Exception e) {
			e.printStackTrace();
			result = "bad";
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
			}
		}

		return result;
	}

	/* 상세조회 */
	public QnaBoardVO getDetailView2(int no) {/* 글번호로 구분 */
		Connection con = null;
		PreparedStatement pt = null;
		ResultSet rs = null;
		QnaBoardVO vo = new QnaBoardVO();
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "PRO", "PRO");
			pt = con.prepareStatement("select * from qnaboard where no = ?");
			pt.setInt(1, no);
			rs = pt.executeQuery();

			if (rs.next()) {
				vo.setTitle(rs.getString("title"));
				vo.setContents(rs.getString("contents"));
				vo.setWriter(rs.getString("writer"));
				vo.setFilename(rs.getString("filename"));
				vo.setPassword(rs.getString("password"));
			}
		} catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
			}
		}

		return vo;

	}

	
	
	public String getUpdate(QnaBoardVO vo) { /*업데이트*/
		Connection con = null;
		PreparedStatement pt = null;
		String result = "";
		try {
		Class.forName("oracle.jdbc.driver.OracleDriver");
		con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "PRO", "PRO");
		
		pt = con.prepareStatement("update qnaboard set title=? , writer=?, password=?,category=?,filename=?,"
				+ " step=?,lev=?,pnum=?,reply=?,contents=? where no=?");
		pt.setString(1, vo.getTitle()); // ����
		pt.setString(2, vo.getWriter()); // �ۼ���
		pt.setString(3, vo.getPassword()); // ��ȣ
		pt.setString(4, vo.getCategory()); // ī�װ�
		pt.setString(5, vo.getFilename()); // ÷�����ϸ�
		pt.setInt(6, vo.getStep()); // ���ܹ�ȣ
		pt.setInt(7, vo.getLev()); // ������ȣ
		pt.setInt(8, vo.getPnum()); // �θ��ȣ
		pt.setInt(9, vo.getReply()); // ��۹�ȣ
		pt.setString(10, vo.getContents()); // ����
		pt.setInt(11, vo.getNo());
		pt.executeUpdate();
		
		result="change";
		
		}catch (Exception e) {
			e.printStackTrace();
			result="bad";
		}finally {
			try {
				con.close();
			} catch (SQLException e) {
			}
		}
		
		return result;
	}

	public boolean deleteBoard(int no) { /*delete*/
		boolean result=false;
		Connection con = null;
		PreparedStatement pt = null;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "PRO", "PRO");
			pt = con.prepareStatement	
				("delete from qnaboard where no=?");
						
			pt.setInt(1, no);
			
			pt.executeUpdate();
				result = true;
			
			
		} catch (Exception e) {
			throw new RuntimeException(e.getMessage());
		} 
		
		try {
			con.close();
		} catch (SQLException e1) {
			// TODO Auto-generated catch block
			e1.printStackTrace();
		}
		return result;
		
	}


	
	/*댓글리스트*/
	public ArrayList<QnaReplyVO> getReplyList(int no) {

		Connection con = null;
		PreparedStatement pt = null;
		ResultSet rs = null;
		ArrayList<QnaReplyVO> list1 = new ArrayList<QnaReplyVO>();
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "PRO", "PRO");
			
			pt = con.prepareStatement("select q_no,a.reply,q_regdate from qnareply a,qnaboard b where a.q_no=?");
			pt.setInt(1, no);
			rs = pt.executeQuery();
			
			while (rs.next()) {
				QnaReplyVO vo1 = new QnaReplyVO();
				vo1.setQ_no(rs.getInt("q_no"));
				vo1.setReply(rs.getString("reply"));
				vo1.setRegdate(rs.getString("q_regdate"));
				list1.add(vo1);
			}
		
		}catch (Exception e) {
			e.printStackTrace();
		} finally {
			try {
				con.close();
			} catch (SQLException e) {
			}
		}
		return list1;// 5 ����
	}


	public int ReplyPage() {
		Connection con = null;
		PreparedStatement pt = null;
		ResultSet rs = null;
		int total = 0;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "PRO", "PRO");
			pt = con.prepareStatement("select count(*) from qnareply");
			rs = pt.executeQuery();
		rs = pt.executeQuery();
		rs.next();
		total = rs.getInt("count(*)");

	} catch (Exception e) {
		e.printStackTrace();
	} finally {
		try {
			con.close();
		} catch (SQLException e) {
		}
	}
	return total;
}

	public String ReplyIn(QnaReplyVO vo) {
		Connection con = null;
		PreparedStatement pt = null;
		String result = "";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "PRO", "PRO");
			pt = con.prepareStatement("insert into qnareply values(?,?,sysdate)");
			pt.setInt(1, vo.getQ_no());
			pt.setString(2, vo.getReply());
			pt.executeUpdate();
			result = "reply";
		}catch(NumberFormatException e){
			
		}catch (Exception e) {
			e.printStackTrace();
			result = "bad";
		} 
		finally {
			try {
				con.close();
			} catch (SQLException e) {
			}
		}

		return result;
	}


}
