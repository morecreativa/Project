import java.util.Scanner;

import board.BoardMain;

public class ProjectMain {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		System.out.println("===Program Manger===");
		System.out.println("1. Go to Class");
		System.out.println("2. Go to member management");
		System.out.println("3. Close program");
		System.out.println("Input ur num");
		
		Scanner sc=new Scanner(System.in);
		int menu=sc.nextInt();
		try {
			if(menu==1) {
				BoardMain boardmain=new BoardMain();
				boardmain.main(args);
			}
			else if(menu==2) {
				
			}
			else {
				System.out.println("===Close main program===");
			}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
}
