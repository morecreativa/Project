#include <iostream>
#include <Windows.h>
#include "Board.h"

using namespace std;

#define COL			GetStdHandle(STD_OUTPUT_HANDLE)
#define ORIGINAL	SetConsoleTextAttribute(COL,0x0007);


Board::Board()
{
	int i, j;
	for (i = 0; i < 10; i++)
		for (j = 0; j < 20; j++) board_[i][j] = EMPTY;
}

int Board::GetState(cursur_point pos) {
	return board_[pos.GetX()][pos.GetY()];
}

void Board::SetState(cursur_point pos,int state) {
	board_[pos.GetX()][pos.GetY()] = state;
}

int Board::CheckLineFull(cursur_point reference_pos) {
	int count = 0;
	int check = 0;

	for (int val = 0; val < 19; val++) {
		for (int y = 0; y < 20; y++)
		{
			for (int x = 0; x < 10; x++)
				if (board_[x][y] == EMPTY) {
					check++;
					break;
				}
			if (check == 0) {
				count++;
				for (int j = y + 1; j < 19; j++) {
					for (int i = 0; i < 10; i++) {
						cursur_point::GotoXY(2 * (i + reference_pos.GetX()) + 2, 21 - j);
						cout << "  ";
						board_[i][j - 1] = board_[i][j];
					}
					for (int i = 0; i < 10; i++) board_[i][j - 1] = board_[i][j];
				}
				for (int i = 0; i < 10; i++) board_[i][19] = EMPTY;
				for (int j = 0; j < 20; j++) {
					for (int i = 0; i < 10; i++) {
						if (board_[i][j] != EMPTY) {
							cursur_point::GotoXY(2 * (i + reference_pos.GetX()) + 2, 20 - j);
							ORIGINAL cout << "бс";
						}
						else {
							cursur_point::GotoXY(2 * (i + reference_pos.GetX()) + 2, 20 - j);
							cout << "  ";
						}
					}
				}
			}
			check = 0;
		}
	}
	return count;
}