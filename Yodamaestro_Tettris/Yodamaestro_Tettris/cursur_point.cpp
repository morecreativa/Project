#include "cursur_point.h"

#include <Windows.h>
#include <conio.h>
#include <ctime>

using namespace std;

cursur_point cursur_point::operator+(const cursur_point &pt) {
	return cursur_point(x_ + pt.x_, y_ + pt.y_);
}

void cursur_point::GotoXY(int x, int y) {
	COORD Pos = { x,y };
	SetConsoleCursorPosition(GetStdHandle(STD_OUTPUT_HANDLE), Pos);
}

void cursur_point::GotoXY(cursur_point pos) {
	GotoXY(pos.GetX(), pos.GetY());
}

cursur_point cursur_point::GetScrPosFromCurPos(const cursur_point &pos) {
	return cursur_point(2 * pos.x_ + 2, (-1)*pos.y_ + 20);
}
