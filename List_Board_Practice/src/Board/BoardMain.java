package Board;

import java.util.Scanner;

import DAO.BoardDAO;

public class BoardMain {
	public static void main(String[] args) {
		// TODO Auto-generated method stub
			try {
				while(true) {
					 System.out.println("");
				      System.out.println("---�Խ��� ������Ʈ---");
				      System.out.println("1. �Խù� �۾���");
				      System.out.println("2. �������� ����ȸ");
				      System.out.println("3. ���Ǻ� ����ȸ");
				      System.out.println("4. ȸ���� ����ȸ");
				      System.out.println("5. �Խ��� ������Ʈ ����");
				      
				      System.out.print("��ȣ �Է�: ");
				      
				      Scanner key=new Scanner(System.in);
				      int menu=key.nextInt();
				      
				      if(menu==5) {
				    	  System.out.println("Exit!!!!");
				    	  System.exit(0);;
				      }
				      else if(menu==1) {
				    	 BoardInsertView view=new BoardInsertView();
				    	 view.input();
				      }
				      else if(menu==2) {
				    	  BoardPagingListView bpv=new BoardPagingListView();
				    	  bpv.input();
				      }
				      else if(menu==3) {
				    	  BoardConditionListView bclv=new BoardConditionListView();
				    	  bclv.input();
				      }
				      else if(menu==4) {
				    	  BoardMemberListView BMLV=new BoardMemberListView();
				    	  BMLV.input();
				      }
				      else {
				    	  System.out.println("������ ���ų� ���丮�Դϴ�.");
				      }
				}
			}
			catch(Exception e) {
				e.printStackTrace();
			}
	}

}
