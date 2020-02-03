package board;

import java.util.ArrayList;
import java.util.Scanner;

import VO.BoardVO;
import dao.BoardDAO;

public class BoardPagingListView{

	public void input() throws Exception{
		// TODO Auto-generated method stub
				Scanner sc=new Scanner(System.in);
				System.out.println("페이지 번호 : ");	int pagenum=sc.nextInt();
				System.out.println("1페이지당 출력할 게시물 갯수  : "); int listPerPage=sc.nextInt();
				
				ArrayList<BoardVO> list=BoardDAO.getPageList(pagenum,listPerPage);
				
				int temp=0;
				for(BoardVO vo:list) {
					System.out.println("순차 : "+ ++temp);
					System.out.println("제목 : "+vo.getTitle());
					System.out.println("내용 : "+vo.getContents());
					System.out.println("작성자 : "+vo.getWriter());
					System.out.println("작성시간: "+vo.getTime());
					System.out.println("조회수: "+vo.getViewcount());
					System.out.println("==================================");
				}
				
//				=================================================================
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

