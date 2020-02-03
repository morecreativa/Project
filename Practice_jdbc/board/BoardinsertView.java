package board;

import java.sql.Date;
import java.text.SimpleDateFormat;
import java.util.Scanner;

import VO.BoardVO;
import VO.MemberVO;
import dao.BoardDAO;
import dao.MemberDAO;

public class BoardinsertView{

	public void input() throws Exception{
		// TODO Auto-generated method stub
				Scanner sc=new Scanner(System.in);
				System.out.println("로그인 아이디의 암호를 입력하세요.");
				
				System.out.print("ID : ");	String id=sc.nextLine();
				System.out.print("PassWord : ");	String pw=sc.nextLine();
				
				MemberVO vo=new MemberVO();
				MemberDAO dao=new MemberDAO();
				vo.setId(id);
				vo.setPw(pw);
				
				int result=dao.getMember(vo);
				
				if(result==1)
				{
					System.out.println("");
					System.out.println("Log in complete");
					
					BoardVO bo=new BoardVO();
					String title;
					String contents;
					String content_pw;
					
					System.out.println("제목을 입력하세요 : "); title=sc.nextLine();	bo.setTitle(title);
					System.out.println("내용을 입력하세요 : "); contents=sc.nextLine();	bo.setContents(contents);
					System.out.println("password를 입력하세요 : "); content_pw=sc.nextLine();	bo.setPw(content_pw);
					bo.setWriter(id);
					
//					Date today=new Date();
//					SimpleDateFormat date=new SimpleDateFormat("yyyy/mm/dd");					
//
//					bo.setTime(date.format(today));
					BoardDAO bao=new BoardDAO();
					bao.insertBoard(bo);
					System.out.println("게시물 입력을 마쳤습니다.");
				}
				else if(result==2) {
					System.out.println("check your password");
				}
				else System.out.println("Signed first");
	}
}

