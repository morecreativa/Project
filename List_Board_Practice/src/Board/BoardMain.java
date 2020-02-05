package Board;

import java.util.Scanner;

import DAO.BoardDAO;

public class BoardMain {
	public static void main(String[] args) {
		// TODO Auto-generated method stub
			try {
				while(true) {
					 System.out.println("");
				      System.out.println("---게시판 프로젝트---");
				      System.out.println("1. 게시물 글쓰기");
				      System.out.println("2. 페이지별 글조회");
				      System.out.println("3. 조건별 글조회");
				      System.out.println("4. 회원별 글조회");
				      System.out.println("5. 게시판 프로젝트 종료");
				      
				      System.out.print("번호 입력: ");
				      
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
				    	  System.out.println("파일이 없거나 디렉토리입니다.");
				      }
				}
			}
			catch(Exception e) {
				e.printStackTrace();
			}
	}

}
