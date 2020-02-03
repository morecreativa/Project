package board;

import java.util.Scanner;

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
		      
		      Scanner key = new Scanner(System.in);
		      int menu = key.nextInt();
		      
		      if(menu==5) {
		         System.out.println("게시판 프로젝드를 종료합니다.");
		         System.exit(0);   
		      }//if 5번 시 종료
		      else if(menu==1) {
		         BoardinsertView view = new BoardinsertView();
		         view.input();
		         
		      }//글쓰기(로그인)
		      else if(menu==2) {
		         // 페이지 조회
		    	 // 페이지 번호 : 2 (BoardPagingListView)
		    	 // 한페이지 보여줄 게시물 수 : 10
		    	 BoardPagingListView bpv=new BoardPagingListView();
		    	 bpv.input();

		      }//페이지조회
		      else if(menu==3) {
//		         1. BoardConditionListView 객체 생성
//		         2. 조건별 글조회
//		         3. 컬럼명 과 조건값을 BoardConditionListView에서 입력
//		         4. 입력 받은 값으로 DAO 내 getConditionList 메소드 생성
//		    	 5. 제목 작성자 작성시간
		    	 BoardConditionListView bclv=new BoardConditionListView();
		    	 bclv.input();
		    	 //글 상세조회 란으로 돌아감
		      }//조건조회
		      else if(menu==4) {
		    	//회원 글조회(로그인)
//		    	1. BoardMemberListView 객체 생성
//		    	2. 회원별 글조회
//		    	3. 회원명 입력
//		    	4. 회원명에 따른 리스트 조회
//		    	5. getBoardMemberListView 생성
		    	 BoardMemberListView BMLV=new BoardMemberListView();
		    	 BMLV.input();
		      }
		      else if(menu==5) {
		    	  System.out.println("Exit BoardMangement!");
		      }
		      else {
		         System.out.println("파일이 없거나 디렉토리입니다.");
		      }
		      }//while
		      
		}catch(Exception e) { 
		         e.printStackTrace();
		}
	}
}

