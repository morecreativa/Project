package board;

import VO.BoardVO;

public class PrintDetailView {
	
	//일반 출력글
	public static void print() {
//		System.out.println("-----------");
		System.out.println("21.게시글 수정");
		System.out.println("22.게시글 삭제");
		System.out.println("23.첫화면");
//		System.out.println("-----------");
		System.out.println("번호를 입력하세요 : ");
	}
	
	//BaordVO DetailView 출력글
	public static void print_BOARDVO(BoardVO vo) {
		System.out.println("");
		System.out.println("=============================");
		System.out.println("제목 : "+vo.getTitle());
		System.out.println("내용 : "+vo.getContents());
		System.out.println("작성시간 : "+vo.getTime());
		System.out.println("작성자 : "+vo.getWriter());
		System.out.println("조회수 : "+vo.getViewcount());
		System.out.println("=============================");
	}
}
