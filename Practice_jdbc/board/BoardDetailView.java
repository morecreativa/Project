package board;

import java.util.Scanner;

import VO.BoardVO;
import dao.BoardDAO;

public class BoardDetailView {
	
	// 상세조회할 게시글을 찾았음.
	public void input(BoardVO vo) throws Exception{
		PrintDetailView.print_BOARDVO(vo);
		Scanner sc=new Scanner(System.in);
		
		boolean flag=false;
		while(!flag){
			PrintDetailView.print();
			int detail_num=sc.nextInt(); sc.nextLine();
			if(detail_num>23&&detail_num<21){
				System.out.println("색인에 없는 숫자입니다.");
			}
			else{
				if(detail_num==21||detail_num==22){
					System.out.println("패스워드를 입력하세요 : ");	String pw=sc.nextLine();
					if(pw.equals(vo.getPw())){
						//	21

						if(detail_num==21)	BoardDAO.updateBoard(vo);
						//	22
						else BoardDAO.DeleteBoard(vo,vo.getSeq());
						flag=true;
					}
					else System.out.println("패스워드가 일치하지 않습니다. 다시 입력하세요.");
				}
				else{
					System.out.println("!!첫화면으로 넘어갑니다.");
					System.out.println("");
					break;
				}
			}
		}
	}
}
