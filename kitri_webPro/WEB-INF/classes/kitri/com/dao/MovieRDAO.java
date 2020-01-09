package kitri.com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import kitri.com.vo.MovieRVO;
import kitri.com.vo.MovieVO;

public class MovieRDAO {
	public ArrayList<MovieRVO> getBoardList(int start, int end,String movie_no) {
		// 페이징 리스트 조회 메소드
		ArrayList<MovieRVO> list = new ArrayList<MovieRVO>();
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "PRO", "PRO");
			String sql = "";
			PreparedStatement pt = null;
			sql = "select rate_no,movie_no, id, rate, comments, regdate,r from (select rownum r,rate_no,movie_no, id, rate, comments, regdate from MOVIErating where movie_no = ?) where r>=? and r<=?";
			pt = con.prepareStatement(sql);
			pt.setInt(1, Integer.parseInt(movie_no));
			pt.setInt(2, start);
			pt.setInt(3, end);
			ResultSet rs = pt.executeQuery();
			while (rs.next()) {
				MovieRVO vo = new MovieRVO();
				vo.setRate_no(rs.getInt("rate_no"));
				vo.setMovie_no(rs.getInt("movie_no"));
				vo.setId(rs.getString("id"));
				vo.setRate(rs.getDouble("rate"));
				vo.setComments(rs.getString("comments"));
				vo.setRegdate(rs.getString("regdate"));
				list.add(vo);
			}
			con.close();

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}

	public int getTotalBoard(String movie_no) {
		// 전체 게시물 갯수 조회 메소드 (페이지 번호 생성 갯수 결정)
		int total = 0;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "PRO", "PRO");
			String sql = "";
			PreparedStatement pt = null;

			sql = "select count(*) from movierating where movie_no =?";
			pt = con.prepareStatement(sql);
			pt.setInt(1, Integer.parseInt(movie_no));
			ResultSet rs = pt.executeQuery();
			rs.next();
			total = rs.getInt("count(*)");
			con.close();

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return total;
	}

//게시물 리스트 조회 메소드
	public ArrayList<MovieRVO> getBoardList() {
		// jdbc 계정 board 테이블 전체 레코드 전체 컬럼 조회
		// ArrayList<MovieVO> 리턴
		ArrayList<MovieRVO> list = new ArrayList<MovieRVO>();
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "PRO", "PRO");
			String sql = "select * from MOVIERATING";
			PreparedStatement pt = con.prepareStatement(sql);
			ResultSet rs = pt.executeQuery();
			while (rs.next()) {
				MovieRVO vo = new MovieRVO();
				vo.setRate_no(rs.getInt("rate_no"));
				vo.setMovie_no(rs.getInt("movie_no"));
				vo.setId(rs.getString("id"));
				vo.setRate(rs.getDouble("rate"));
				vo.setComments(rs.getString("comments"));
				vo.setRegdate(rs.getString("regdate"));
				list.add(vo);
			}
			con.close();

		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();

		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}

		return list;
	}

	public String deleteMovie(String rate_no) {
		String result = "";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "PRO", "PRO");
			String sql = "delete MOVIERATING where RATE_no = ?";
			PreparedStatement pt = con.prepareStatement(sql);
			pt = con.prepareStatement(sql);
			pt.setInt(1, Integer.parseInt(rate_no));
			pt.executeUpdate();
			con.close();
			result = "1";
		} catch (ClassNotFoundException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			result = "0";
		} catch (SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
			result = "0";
		}
		return result;
	}

	public String setMovie(String movie_no,String id, double rate,String comments) {
		String result = "";
		double totalrate=0;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "PRO", "PRO");

			String sql;
			PreparedStatement pt;
			
			sql="select * from movierating where movie_no = ? and id = ?";
			pt=con.prepareStatement(sql);
			pt.setString(1, movie_no);
			pt.setString(2, id);
			ResultSet rs = pt.executeQuery();
			if(rs.next()) {
				result="-1";
			}else {
				sql = "insert into MOVIErating values (movier_seq.nextval,?,?,?,?,sysdate)";
				pt = con.prepareStatement(sql);
				pt.setString(1, movie_no);
				pt.setString(2, id);
				pt.setDouble(3, rate);
				pt.setString(4, comments);
				pt.executeUpdate();
		
				sql = "select sum(rate) from MOVIERATING where movie_no = ?";
				pt = con.prepareStatement(sql);
				pt.setString(1, movie_no);
				rs = pt.executeQuery();
				if(rs.next())
				totalrate= rs.getDouble(1);
				
				int total = getTotalBoard(movie_no);
				double avgrate = totalrate/total;
				sql = "update MOVIE set avgrate=? where movie_no=?";
				pt = con.prepareStatement(sql);
				pt.setDouble(1, avgrate);
				pt.setInt(2, Integer.parseInt(movie_no));
				pt.executeUpdate();
				
				result = "1";
			}
			con.close();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
			result = "0";
			return result;
		} catch (SQLException e) {
			e.printStackTrace();
			result = "0";
			return result;
		}

		return result;
	}

	public MovieVO getMovie(String movie_no) {
		MovieVO vo = new MovieVO();

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "PRO", "PRO");

			String sql;
			PreparedStatement pt;

			sql = "select * from MOVIE where movie_no = ?";
			pt = con.prepareStatement(sql);
			pt.setInt(1, Integer.parseInt(movie_no));
			pt.executeUpdate();
			ResultSet rs = pt.executeQuery(sql);
			if (rs.next()) {
				vo.setTITLE(rs.getString(2));
				vo.setDIRECTOR(rs.getString(3));
				vo.setACTOR(rs.getString(4));
				vo.setGENRE(rs.getString(5));
				vo.setAGE(rs.getString(6));
				vo.setOPENDATE(rs.getString(7));
				vo.setIMG_NAME(rs.getString(8));
				vo.setIMG_SRC(rs.getString(9));
			}
			rs.close();
			con.close();
		} catch (ClassNotFoundException e) {
			e.printStackTrace();
		} catch (SQLException e) {
			e.printStackTrace();
		}

		return vo;
	}

	public String modifyMovie(int movie_no, String TITLE, String DIRECTOR, String ACTOR, String GENRE, String AGE,
			String OPENDATE, String IMG_NAME, String IMG_SRC) {
		String result = "";

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "PRO", "PRO");

			String sql;
			PreparedStatement pt;

			sql = "update movie set title=?,director=?,actor=?,genre=?,age=?,opendate=?,img_name=?,img_src=? where movie_no=?";
			pt = con.prepareStatement(sql);

			pt.setString(1, TITLE);
			pt.setString(2, DIRECTOR);
			pt.setString(3, ACTOR);
			pt.setString(4, GENRE);
			pt.setString(5, AGE);
			pt.setString(6, OPENDATE);
			pt.setString(7, IMG_NAME);
			pt.setString(8, IMG_SRC);
			pt.setInt(9, movie_no);
			pt.executeUpdate();
			result = "1";
			con.close();
		} catch (

		ClassNotFoundException e) {
			e.printStackTrace();
			result = "0";
			return result;
		} catch (SQLException e) {
			e.printStackTrace();
			result = "0";
			return result;
		}

		return result;
	}

}
