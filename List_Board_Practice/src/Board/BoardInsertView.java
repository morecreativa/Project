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
		
		System.out.println("�α��� ���̵��� ��ȣ�� �Է��ϼ���.");
		
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
			
			System.out.println("������ �Է��ϼ��� : "); title=sc.nextLine(); bo.setTitle(title);
			System.out.println("������ �Է��ϼ��� : "); contents=sc.nextLine(); bo.setContents(contents);
			System.out.println("Password�� �Է��ϼ��� : "); content_pw=sc.nextLine(); bo.setPw(content_pw);
			bo.setWriter(id);
			
			Date today=new Date();	SimpleDateFormat date=new SimpleDateFormat("yyyy/mm/dd");
			bo.setTime(date.format(today));
			BoardDAO.insertBoard(bo);
			System.out.println("�Խù� �Է��� ���ƽ��ϴ�.");
		}
		else if(result==2) {
			System.out.println("Check your Password");
		}
		else System.out.println("Signed First");
	}
}
