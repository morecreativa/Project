package Board;

import java.util.ArrayList;
import java.util.Scanner;

import DAO.BoardDAO;
import VO.BoardVO;

public class BoardConditionListView {
	
	public void input() throws Exception{
		Scanner sc=new Scanner(System.in);
		
		System.out.println("�÷���� ���ǰ��� �Է��ϼ���.");
		System.out.print("�÷��� : "); String col=sc.nextLine();
		System.out.print("���ǰ� : "); String condition=sc.nextLine();
		
		ArrayList<BoardVO> list=BoardDAO.getConditionListView(col, condition);
		
		int tep=0;
		
		for(BoardVO vo : list) {
			System.out.println("��ȣ : "+ ++tep);
			System.out.println("�Խñ� ��ȣ : "+ vo.getSeq());
			System.out.println("���� : "+vo.getTitle());
			System.out.println("���� : "+vo.getContents());
			System.out.println("�ۼ��� : "+vo.getWriter());
			System.out.println("�ۼ��ð� : "+vo.getTime());
			System.out.println("��ȸ�� : "+ vo.getViewcount());
			System.out.println("=================================");
		}
		
		System.out.println("");
		System.out.println("����ȸ�� �Խñ��� ��ȣ�� �Է��ϼ��� : "); int seq_num=sc.nextInt();
		
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
