package Board;

import java.util.ArrayList;
import java.util.Scanner;

import DAO.BoardDAO;
import VO.BoardVO;

public class BoardMemberListView {
	
	public void input() throws Exception{
		Scanner sc=new Scanner(System.in);
		
		System.out.println("ȸ���� : "); String name=sc.nextLine();
		
		ArrayList<BoardVO> list=BoardDAO.getMemberListView(name);
		
		int temp=0;
		for(BoardVO vo:list) {
			System.out.println("");
			System.out.println("��ȣ : "+ ++temp);
			System.out.println("���� : "+vo.getTitle());
			System.out.println("���� : "+vo.getContents());
			System.out.println("�ۼ���: "+vo.getWriter());
			System.out.println("�ۼ���¥ : "+vo.getTime());
			System.out.println("��ȸ�� : "+vo.getViewcount());
		}
		
		System.out.println("");
		System.out.print("����ȸ�� �Խñ��� ��ȣ�� �Է��ϼ��� : "); int seq_num=sc.nextInt();
		
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
