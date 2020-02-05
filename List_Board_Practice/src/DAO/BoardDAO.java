package DAO;

import java.sql.Connection;
import java.sql.Driver;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Scanner;

import Board.PrintDetailView;
import VO.BoardVO;

public class BoardDAO {
	
	public static void insertBoard(BoardVO vo) throws Exception{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection
				("jdbc:oracle:thin:@localhost:1521:xe", "jdbc", "jdbc");
		
		String sql="insert into board"
				+ "values(board_seq.nextval,?,?,?,?,sysdate,0)";
		
		PreparedStatement pt=con.prepareStatement(sql);
		
		pt.setString(1, vo.getTitle());
		pt.setString(2, vo.getContents());
		pt.setString(3, vo.getPw());
		pt.setString(4, vo.getWriter());
		
		int row=pt.executeUpdate();
		
		if(row==1) System.out.println("Insert Clearly!!");
		else {
			System.out.println("There's information that not clear");
		}
		
		con.close();
	}
	
	public static void update(BoardVO vo) throws Exception{
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "jdbc", "jdbc");
		
		Scanner sc=new Scanner(System.in);
		String title=null;
		String contents=null;
		
		System.out.println("수정 제목을 입력하세요 : "); title=sc.nextLine();
		System.out.println("수정 내용을 입력해주세요 : "); contents=sc.nextLine();
		
		String sql="update board"
				+ " set title=?, contents=?, writer=?"
				+ " where seq=?";
		
		PreparedStatement pt=con.prepareStatement(sql);
		pt.setString(1, title);
		pt.setString(2, contents);
		pt.setString(3, vo.getWriter());
		pt.setInt(4, vo.getSeq());
		
		int row=pt.executeUpdate();
		if(row==1) System.out.println("Updated Complete!!!");
		else System.out.println("Error Find!!!!!!");
		
		con.close();
	}
	
	public static ArrayList<BoardVO> getPageList(int pagenum,int Perpage) throws Exception{
		ArrayList<BoardVO> list=new ArrayList<BoardVO>(Perpage);
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "jdbc", "jdbc");
		
		int start=(pagenum-1)*Perpage+1;
		int end=Perpage*pagenum;
		
		String sql="select *"
				+ " from (select* from (select *from board"
				+ " order by time desc))"
				+ " where rownum >= ? and rownum <= ?";
		
		PreparedStatement pt=con.prepareStatement(sql);
		pt.setInt(1, start);
		pt.setInt(2, end);
		
		ResultSet rs=pt.executeQuery();
		while(rs.next()) {
			BoardVO vo=new BoardVO();
			vo.setSeq(rs.getInt(1));
			vo.setTitle(rs.getString(2));
			vo.setContents(rs.getString(3));
			vo.setPw(rs.getString(4));
			vo.setWriter(rs.getString(5));
			vo.setTime(rs.getString(6));
			vo.setViewcount(String.valueOf(Integer.parseInt(rs.getString(7))+1));
			list.add(vo);
		}
		
		con.close();
		return list;
	}
	
	public static ArrayList<BoardVO> getConditionListView(String col,String condition) throws Exception{
		ArrayList<BoardVO> list=new ArrayList<BoardVO>();
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection
				("jdbc:oracle:thin:@localhost:1521:xe", "jdbc", "jdbc");
		String[] idx= {"title","writer","time","viewcount"};
		PreparedStatement pt=null;
		ResultSet rs=null;
		String sql=null;
		
		if(col.toLowerCase().equals(idx[0])) {
			sql="select *"
					+ " from board"
					+ " where title Like ?";
		}
		else if(col.toLowerCase().equals(idx[1])) {
			sql="select * "
					+ "from board "
					+ "where writer Like ?";
		}
		else if(col.toLowerCase().equals(idx[2])) {
			sql="select * "
					+ "from board "
					+ "where time Like ?";
		}
		else if(col.toLowerCase().equals(idx[3])) {
			sql="select * "
					+ "from board "
					+ "where viewcount Like ?";
		}
		
		pt=con.prepareStatement(sql);
		pt.setString(1, "%"+condition+"%");
		
		rs=pt.executeQuery();
		while(rs.next()) {
			BoardVO vo= new BoardVO();
			vo.setSeq(rs.getInt(1));
			vo.setTitle(rs.getString(2));
			vo.setContents(rs.getString(3));
			vo.setPw(rs.getString(4));
			vo.setWriter(rs.getString(5));
			vo.setTime(rs.getString(6));
			vo.setViewcount(String.valueOf(Integer.parseInt(rs.getString(7))+1));
			list.add(vo);
		}
		
		con.close();
		return list;
	}
	
	public static ArrayList<BoardVO> getMemberListView(String name) throws Exception{
		ArrayList<BoardVO> list=new ArrayList<BoardVO>();
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@loaclhost:1521:xe", "jdbc", "jdbc");
		
		String sql="select *"
				+ " from board"
				+ " where lowe(writer)=?";
		PreparedStatement pt=con.prepareStatement(sql);
		
		pt.setString(1, name);
		
		ResultSet rs=pt.executeQuery();
		while(rs.next()) {
			BoardVO vo=new BoardVO();
			vo.setSeq(rs.getInt(1));
			vo.setTitle(rs.getString(2));
			vo.setContents(rs.getString(3));
			vo.setPw(rs.getString(4));
			vo.setWriter(rs.getString(5));
			vo.setTime(rs.getString(6));
			vo.setViewcount(String.valueOf(Integer.parseInt(rs.getString(7))+1));
			list.add(vo);
		}
		
		con.close();
		return list;
	}

	public static void DeleteBoard(BoardVO vo, int seq_num) throws Exception{
		PrintDetailView.print_BOARDVO(vo);
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection
				("jdbc:oracle:thin:@localhost:1521:xe", "jdbc", "jdbc");
		
		String sql="delete"
				+ " from board "
				+ " where seq=?";
		PreparedStatement pt=con.prepareStatement(sql);
		pt.setInt(1, vo.getSeq());
		int row=pt.executeUpdate();
		
		if(row==1) System.out.println("번호  "+seq_num+"가 정상적으로 삭제되었습니다.");
		else System.out.println("정상적으로 삭제되지 않았습니다. Code 및 Table을 확인하세요.");
	}
}
