package Board;

import VO.BoardVO;

public class PrintDetailView {
	public static void print() {
//		System.out.println("-----------");
		System.out.println("21.�Խñ� ����");
		System.out.println("22.�Խñ� ����");
		System.out.println("23.ùȭ��");
//		System.out.println("-----------");
		System.out.println("��ȣ�� �Է��ϼ��� : ");
	}
	
	//BaordVO DetailView ��±�
	public static void print_BOARDVO(BoardVO vo) {
		System.out.println("");
		System.out.println("=============================");
		System.out.println("���� : "+vo.getTitle());
		System.out.println("���� : "+vo.getContents());
		System.out.println("�ۼ��ð� : "+vo.getTime());
		System.out.println("�ۼ��� : "+vo.getWriter());
		System.out.println("��ȸ�� : "+vo.getViewcount());
		System.out.println("=============================");
	}
}
