package board;

import java.util.ArrayList;
import java.util.Scanner;

import VO.BoardVO;
import dao.BoardDAO;

public class BoardMemberListView {
	
	public void input() throws Exception{
		Scanner sc=new Scanner(System.in);
		
		System.out.print("회원명 : ");	String name=sc.nextLine();
		
		ArrayList<BoardVO> list=BoardDAO.getMemberListView(name);
		
		int temp=0;
		for(BoardVO vo:list) {
			System.out.println("");
			System.out.println("번호 : "+ ++temp);
			System.out.println("제목 : "+vo.getTitle());
			System.out.println("내용 : "+vo.getContents());
			System.out.println("작성자: "+vo.getWriter());
			System.out.println("작성날짜 : "+vo.getTime());
			System.out.println("조회수 : "+vo.getViewcount());
		}
		
		System.out.println("");
		System.out.print("상세조회할 게시글의 번호를 입력하세요 : "); int seq_num=sc.nextInt();
		
		BoardVO Find=new BoardVO();
		for(BoardVO vo:list) {
			if(vo.getSeq()==seq_num) {
				Find=vo;
				break;
			}
		}
		BoardDetailView bdv=new BoardDetailView();
		bdv.input(Find);
		//제목 내용 작성자 작성날짜 조회수
	}
}
