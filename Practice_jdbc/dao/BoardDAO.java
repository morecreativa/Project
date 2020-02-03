package dao;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.Scanner;

import VO.BoardVO;
import board.PrintDetailView;

public class BoardDAO {
	
	public void insertBoard(BoardVO vo) throws Exception{
//		스캐너
//		제목 : XXX
//		내용 : XXXX
//		암호 : XXXX
//		작성자(id변수)
//		4개 변수 저장 BoardVO 객체 생성
//		BoardDAO.insertBoard()
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection
				("jdbc:oracle:thin:@localhost:1521:xe", "jdbc", "jdbc");
		
		String sql="insert into board"
				+ " values(board_seq.nextval,?,?,?,?,sysdate,0)";
		
		PreparedStatement pt=con.prepareStatement(sql);
		
//		pt.setInt(0, vo.getSeq());
		pt.setString(1, vo.getTitle());
		pt.setString(2, vo.getContents());
		pt.setString(3, vo.getPw());
		pt.setString(4, vo.getWriter());
		
//		pt.executeUpdate();
		int row=pt.executeUpdate();
		if(row==1) System.out.println("게시물 입력이 완료되었습니다.");
		else {
			System.out.println("잘못 입력된 내용이 있었습니다.");
		}
		con.close();
	}
	
	public static ArrayList<BoardVO> getPageList(int pagenum,int pagePerPage) throws Exception{
		ArrayList<BoardVO> list=new ArrayList<BoardVO>(pagePerPage);
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "jdbc", "jdbc");
		
		int start=(pagenum-1)*pagePerPage +1;
		int end=pagePerPage*pagenum;
		
		PreparedStatement pt= null;
		
		String sql="select *"
				+ " from (select * from (select * from board"
				+ " order by time desc))"
				+ " where rownum>=? and rownum<=?";
		
		pt=con.prepareStatement(sql);
		pt.setInt(1, start);
		pt.setInt(2, end);
		ResultSet rs=pt.executeQuery();
		while(rs.next()) {
			// 제목 내용 작성자  작성시간 조회수
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
		// 번호 제목 작성자 장성 시간
		con.close();
		return list;
	}
	
	public static ArrayList<BoardVO> getConditionListView(String column,String condition) throws Exception{

		ArrayList<BoardVO> list=new ArrayList<BoardVO>();
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "jdbc", "jdbc");
		/*
		1. 컬럼명과 조건명이 같이 input되서 들어옴
		2. 존재하지 않는 컬럼명일 시에는 오류 발생 ********************
		3. 해당 컬럼에 조건값이 들어가 있는 경우를 조회
		 */
		String[] idx= {"title","writer","time","viewcount"};
		PreparedStatement pt=null;
		ResultSet rs=null;
		String sql=null;
		
		if(column.toLowerCase().equals(idx[0])) {
			sql="select *"
					+ " from board"
					+ " where title Like ?";
		}
		else if(column.toLowerCase().equals(idx[1])) {
			sql="select *"
					+ " from board"
					+ " where writer Like ?";
		}
		else if(column.toLowerCase().equals(idx[2])){
			sql="select *"
					+ " from board"
					+ " where time Like ?";
		}
		else if(column.toLowerCase().equals(idx[3])){
			sql="select *"
					+ " from board"
					+ " where viewcount Like ?";
		}
		
		pt=con.prepareStatement(sql);
		pt.setString(1, "%"+condition+"%");
//		System.out.println("여기까지는 된다");
		rs=pt.executeQuery();
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

	public static ArrayList<BoardVO> getMemberListView(String name)throws Exception{
		ArrayList<BoardVO> list=new ArrayList<BoardVO>();
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "jdbc", "jdbc");
		
		//제목 내용 작성자 작성날짜 조회수
		String sql="select *"
				+ " from board"
				+ " where lower(writer)=?";
		
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

	public static void updateBoard(BoardVO vo) throws Exception{
		// 제목 내용 작성자 수정
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "jdbc","jdbc");
		
		Scanner sc=new Scanner(System.in);
		String title=null;
		String contents=null;
		String writer=null;
		
		System.out.println("수정 제목을 입력해주세요 : "); title=sc.nextLine(); 
		System.out.println("수정 내용을 입력해주세요 : "); contents=sc.nextLine();
//		System.out.println("작성자 : "); writer=sc.nextLine();
//		UPDATE 테이블명
//		SET 수정되어야 할 컬럼명 = 수정되기를 원하는 새로운 값
//		WHERE 변경 데이터 조건 컬럼 = 선택 조건 값;
//
//		UPDATE PLAYER
//		SET BACK_NO = 99
//		WHERE PLAYER_NAME = '박지성';
//
//		출처: https://hyeonstorage.tistory.com/295 [개발이 하고 싶어요]
		
//		UPDATE table-name
//	     SET column-1 = value-1,
//	         column-2 = value-2, ...
//	     WHERE search-condition ...
		
		String sql="update board"
				+ " set title=?, contents=?, writer=?"
				+ " where seq=?";
		
		PreparedStatement pt=con.prepareStatement(sql);
		pt.setString(1, title);
		pt.setString(2, contents);
		pt.setString(3,vo.getWriter());
		pt.setInt(4, vo.getSeq());
		
		int row=pt.executeUpdate();
		if(row==1)	System.out.println("변경처리되었습니다.");
		else System.out.println("잘못 입력된 내용이 있습니다.");
	}
	
	public static void DeleteBoard(BoardVO vo,int seq_num) throws Exception{
		PrintDetailView.print_BOARDVO(vo);
		
		Class.forName("oracle.jdbc.driver.OracleDriver");
		Connection con=DriverManager.getConnection("jdbc:oracle:thin:@localhost:1521:xe", "jdbc", "jdbc");
				
//		DELETE FROM 테이블명 WHERE 필드명 = '조건';
//
//		출처: https://kmj1107.tistory.com/entry/SQL-데이터-삭제DELETE [토순이네집]
		
		String sql="delete"
				+ " from board"
				+ " where seq=?";
		
		PreparedStatement pt=con.prepareCall(sql);
		pt.setInt(1, vo.getSeq());
		int row=pt.executeUpdate();
		
		if(row==1) System.out.println("번호 "+seq_num+"가 정상적으로 삭제되었습니다.");
		else System.out.println("정상적으로 삭제 되지 않았습니다. Code 및 Table을 다시 확인하세요.");
	}
}
