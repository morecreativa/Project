package Board;

import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.Scanner;

import DAO.BoardDAO;
import DAO.MemberDAO;
import VO.BoardVO;
import VO.MemberVO;

public class BoardInsertView {
	
	public void input() throws Exception{
		Scanner sc=new Scanner(System.in);
		
		System.out.println("로그인 아이디의 암호를 입력하세요.");
		
		System.out.println("ID : "); String id=sc.nextLine();
		System.out.println("PassWord : "); String pw=sc.nextLine();
		
		MemberVO vo=new MemberVO();
		MemberDAO dao=new MemberDAO();
		
		vo.setId(id);
		vo.setPw(pw);
		
		int result=dao.getMember(vo);
		
		if(result==1) {
			System.out.println("");
			System.out.println("Log in Complete");
			
			BoardVO bo= new BoardVO();
			String title;
			String contents;
			String content_pw;
			
			System.out.println("제목을 입력하세요 : "); title=sc.nextLine(); bo.setTitle(title);
			System.out.println("내용을 입력하세요 : "); contents=sc.nextLine(); bo.setContents(contents);
			System.out.println("Password를 입력하세요 : "); content_pw=sc.nextLine(); bo.setPw(content_pw);
			bo.setWriter(id);
			
			Date today=new Date();	SimpleDateFormat date=new SimpleDateFormat("yyyy/mm/dd");
			bo.setTime(date.format(today));
			BoardDAO.insertBoard(bo);
			System.out.println("게시물 입력을 마쳤습니다.");
		}
		else if(result==2) {
			System.out.println("Check your Password");
		}
		else System.out.println("Signed First");
	}
}
