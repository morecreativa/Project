package Board;

import java.util.Scanner;

import DAO.BoardDAO;
import VO.BoardVO;

public class BoardDetailView {
	
	public void input(BoardVO vo) throws Exception{
		PrintDetailView.print_BOARDVO(vo);
		Scanner sc=new Scanner(System.in);
		
		boolean flag=false;
		while(!flag) {
			PrintDetailView.print();
			int detail_num=sc.nextInt();
			sc.nextLine();
			if(detail_num>23 && detail_num<21) {
				System.out.println("���ο� ���� �����Դϴ�.");
			}
			else {
				if(detail_num==21 || detail_num==2) {
					System.out.println("�е���带 �Է��ϼ��� : ");
					String pw=sc.nextLine();
					if(pw.equals(vo.getPw())) {
						if(detail_num==21) BoardDAO.update(vo);
						else BoardDAO.DeleteBoard(vo,vo.getSeq());
						flag=true;
					}
					else System.out.println("�н����尡 ��ġ���� �ʽ��ϴ�. �ٽ� �Է��ϼ���.");
				}
				else {
					System.out.println("ùȭ������ ������");
					System.out.println("");
					break;
				}
			}
		}
	}
}
