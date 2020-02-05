package Board;

import java.util.ArrayList;
import java.util.Scanner;

import DAO.BoardDAO;
import VO.BoardVO;

public class BoardPagingListView {
	public void input() throws Exception{
		Scanner sc=new Scanner(System.in);
		System.out.println("������ ��ȣ : ");
		int pagenum=sc.nextInt();
		System.out.println("1�������� ����� �Խù� ���� : ");
		int ListPerPage=sc.nextInt();
		
		ArrayList<BoardVO> list=BoardDAO.getPageList(pagenum,ListPerPage);
		
		int temp=0;
		for(BoardVO vo:list) {
			System.out.println("���� : "+ ++temp);
			System.out.println("���� : "+vo.getTitle());
			System.out.println("���� : "+vo.getContents());
			System.out.println("�ۼ��� : "+vo.getWriter());
			System.out.println("�ۼ��ð�: "+vo.getTime());
			System.out.println("��ȸ��: "+vo.getViewcount());
			System.out.println("==================================");
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
