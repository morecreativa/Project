package kitri.com.dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import kitri.com.vo.MovieVO;

public class MovieDAO {
	public ArrayList<MovieVO> getBoardList(int start, int end, String sort_genre, String sort_age) {
		// 페이징 리스트 조회 메소드
		ArrayList<MovieVO> list = new ArrayList<MovieVO>();
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "PRO", "PRO");
			String sql="";
			PreparedStatement pt = null;
			if((sort_genre==null&&sort_age==null)||(sort_genre.equals("전체")&&sort_age.equals("전체"))) {
			sql= "select MOVIE_NO,TITLE,DIRECTOR,ACTOR,GENRE,AGE,OPENDATE,IMG_NAME,IMG_SRC,avgrate,trailer,r from (select rownum r,MOVIE_NO,TITLE,DIRECTOR,ACTOR,GENRE,AGE,OPENDATE,IMG_NAME,IMG_SRC,avgrate,trailer from MOVIE) where r>=? and r<=?";
			pt = con.prepareStatement(sql);
			pt.setInt(1, start);
			pt.setInt(2, end);
			}
			else if(sort_genre.equals("전체")) {
			sql="select MOVIE_NO,TITLE,DIRECTOR,ACTOR,GENRE,AGE,OPENDATE,IMG_NAME,IMG_SRC,avgrate,trailer,r from (select rownum r,MOVIE_NO,TITLE,DIRECTOR,ACTOR,GENRE,AGE,OPENDATE,IMG_NAME,IMG_SRC,avgrate,trailer from MOVIE where age =?) where r>=? and r<=?";
			pt = con.prepareStatement(sql);
			pt.setString(1, sort_age);
			pt.setInt(2, start);
			pt.setInt(3, end);
			}
			else if(sort_age.equals("전체")) {
			sql="select MOVIE_NO,TITLE,DIRECTOR,ACTOR,GENRE,AGE,OPENDATE,IMG_NAME,IMG_SRC,avgrate,trailer,r from (select rownum r,MOVIE_NO,TITLE,DIRECTOR,ACTOR,GENRE,AGE,OPENDATE,IMG_NAME,IMG_SRC,avgrate,trailer from MOVIE where genre =?) where r>=? and r<=?";
			pt = con.prepareStatement(sql);
			pt.setString(1, sort_genre);
			pt.setInt(2, start);
			pt.setInt(3, end);
			}else {
			sql="select MOVIE_NO,TITLE,DIRECTOR,ACTOR,GENRE,AGE,OPENDATE,IMG_NAME,IMG_SRC,avgrate,trailer,r from (select rownum r,MOVIE_NO,TITLE,DIRECTOR,ACTOR,GENRE,AGE,OPENDATE,IMG_NAME,IMG_SRC,avgrate,trailer from MOVIE where genre=? and age=?) where r>=? and r<=?";
			pt = con.prepareStatement(sql);
			pt.setString(1, sort_genre);
			pt.setString(2, sort_age);
			pt.setInt(3, start);
			pt.setInt(4, end);
			}
			ResultSet rs = pt.executeQuery();
			while (rs.next()) {
				MovieVO vo = new MovieVO();
				vo.setMovie_no(rs.getInt("movie_no"));
				vo.setTITLE(rs.getString("TITLE"));
				vo.setDIRECTOR(rs.getString("dIRECTOR"));
				vo.setACTOR(rs.getString("aCTOR"));
				vo.setGENRE(rs.getString("gENRE"));
				vo.setAGE(rs.getString("aGE"));
				vo.setOPENDATE(rs.getString("oPENDATE"));
				vo.setIMG_NAME(rs.getString("iMG_NAME"));
				vo.setIMG_SRC(rs.getString("iMG_SRC"));
				vo.setAvgrate(rs.getDouble("avgrate"));
				vo.setTrailer(rs.getString("trailer"));
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

	public int getTotalBoard(String sort_genre, String sort_age) {
		// 전체 게시물 갯수 조회 메소드 (페이지 번호 생성 갯수 결정)
		int total = 0;
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "PRO", "PRO");
			String sql="";
			PreparedStatement pt = null;
			
			if((sort_genre==null&&sort_age==null)||(sort_genre.equals("전체")&&sort_age.equals("전체"))) {
				sql = "select count(*) from MOVIE";
				pt = con.prepareStatement(sql);
				}
			else if(sort_genre.equals("전체")) {
			sql = "select count(*) from MOVIE where age =?";
			pt = con.prepareStatement(sql);
			pt.setString(1, sort_age);
			}
			else if(sort_age.equals("전체")) {
			sql = "select count(*) from MOVIE where genre =?";
			pt = con.prepareStatement(sql);
			pt.setString(1, sort_genre);
			}else {
			sql = "select count(*) from MOVIE where genre =? and age =?";
			pt = con.prepareStatement(sql);
			pt.setString(1, sort_genre);
			pt.setString(2, sort_age);
			}
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
	public ArrayList<MovieVO> getBoardList() {
		// jdbc 계정 board 테이블 전체 레코드 전체 컬럼 조회
		// ArrayList<MovieVO> 리턴
		ArrayList<MovieVO> list = new ArrayList<MovieVO>();
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "PRO", "PRO");
			String sql = "select * from MOVIE";
			PreparedStatement pt = con.prepareStatement(sql);
			ResultSet rs = pt.executeQuery();
			while (rs.next()) {
				MovieVO vo = new MovieVO();
				vo.setMovie_no(rs.getInt("movie_no"));
				vo.setTITLE(rs.getString("TITLE"));
				vo.setDIRECTOR(rs.getString("dIRECTOR"));
				vo.setACTOR(rs.getString("aCTOR"));
				vo.setGENRE(rs.getString("gENRE"));
				vo.setAGE(rs.getString("aGE"));
				vo.setOPENDATE(rs.getString("oPENDATE"));
				vo.setIMG_NAME(rs.getString("iMG_NAME"));
				vo.setIMG_SRC(rs.getString("iMG_SRC"));
				vo.setAvgrate(rs.getDouble("avgrate"));
				vo.setTrailer(rs.getString("trailer"));
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

	public String deleteMovie(String movie_no) {
		String result = "";
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "PRO", "PRO");
			String sql="";
			PreparedStatement pt;
			
			sql = "delete MOVIE where movie_no = ?";
			pt = con.prepareStatement(sql);
			pt.setInt(1, Integer.parseInt(movie_no));
			pt.executeUpdate();
			
			sql = "delete MOVIErating where movie_no = ?";
			pt = con.prepareStatement(sql);
			pt.setInt(1, Integer.parseInt(movie_no));
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

	public String setMovie(String TITLE, String DIRECTOR, String ACTOR, String GENRE, String AGE, String OPENDATE,
			String IMG_NAME, String IMG_SRC,String trailer) {
		String result = "";

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "PRO", "PRO");

			String sql;
			PreparedStatement pt;

			sql = "select TITLE from MOVIE where TITLE= ?";
			pt = con.prepareStatement(sql);
			pt.setString(1, TITLE);
			pt.executeUpdate();
			ResultSet rs = pt.executeQuery(sql);
			if (rs.next()) {
				String TITLE_search = rs.getString(1);
				if (TITLE.equals(TITLE_search))
					result = "-1";// 이미 등록된 영화
				System.out.println(result);
			} else {
				sql = "insert into MOVIE values (movie_seq.nextval,?,?,?,?,?,?,?,?,0,?)";
				pt = con.prepareStatement(sql);
				pt.setString(1, TITLE);
				pt.setString(2, DIRECTOR);
				pt.setString(3, ACTOR);
				pt.setString(4, GENRE);
				pt.setString(5, AGE);
				pt.setString(6, OPENDATE);
				pt.setString(7, IMG_NAME);
				pt.setString(8, IMG_SRC);
				pt.setString(9, trailer);
				pt.executeUpdate();
				result = "1";
			}
			rs.close();
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
				vo.setAvgrate(rs.getDouble(10));
				vo.setTrailer(rs.getString(11));
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
			String OPENDATE, String IMG_NAME, String IMG_SRC,String trailer) {
		String result = "";

		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			Connection con = DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "PRO", "PRO");

			String sql;
			PreparedStatement pt;

			sql = "update movie set title=?,director=?,actor=?,genre=?,age=?,opendate=?,img_name=?,img_src=?,trailer=? where movie_no=?";
			pt = con.prepareStatement(sql);

			pt.setString(1, TITLE);
			pt.setString(2, DIRECTOR);
			pt.setString(3, ACTOR);
			pt.setString(4, GENRE);
			pt.setString(5, AGE);
			pt.setString(6, OPENDATE);
			pt.setString(7, IMG_NAME);
			pt.setString(8, IMG_SRC);
			pt.setString(9, trailer);
			pt.setInt(10, movie_no);
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
	public String getTitle(String movie_num) {
		Connection con=null;
		PreparedStatement pt=null;
		ResultSet rs=null;
		String Title="";
		
		try {
			Class.forName("oracle.jdbc.driver.OracleDriver");
			con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "PRO", "PRO");
			
			String sql="select TITLE"
					+ " from MOVIE"
					+ " where MOVIE_NO=?";
			pt=con.prepareStatement(sql);
			pt.setString(1, movie_num);
			rs=pt.executeQuery();
			while(rs.next()) {
				Title=rs.getString(1);
			}
		}catch(Exception e) {
			e.printStackTrace();
		}finally {
			try {
				con.close();
			}catch(SQLException e) {}
		}
		
		return Title;
	}
}
