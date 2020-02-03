package board;

import java.util.ArrayList;
import java.util.Scanner;

import VO.BoardVO;
import dao.BoardDAO;

public class BoardConditionListView {
	
	public void input() throws Exception{
		
		Scanner sc=new Scanner(System.in);
		System.out.println("컬럼명과 조건값을 입력하세요.");
		System.out.print("컬럼명 : ");	String column=sc.nextLine(); 
		System.out.print("조건값 : ");String condition=sc.nextLine();
		
		ArrayList<BoardVO> list=BoardDAO.getConditionListView(column, condition);
		
		int temp=0;
		for(BoardVO vo:list) {
			System.out.println("번호 : "+ ++temp);
			System.out.println("게시글번호 : "+ vo.getSeq());
			System.out.println("제목 : "+vo.getTitle());
			System.out.println("내용 : "+vo.getContents());
			System.out.println("작성자 : "+vo.getWriter());
			System.out.println("작성시간: "+vo.getTime());
			System.out.println("조회수: "+vo.getViewcount());
			System.out.println("==================================");
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
	}
}
