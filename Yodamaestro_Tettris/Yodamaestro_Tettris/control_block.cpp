#include "control_block.h"

#include <iostream>
#include <Windows.h>
#include <ctime>
#include <cstdlib>
#include <conio.h>

#define COL			GetStdHandle(STD_OUTPUT_HANDLE)
#define DARK_BLUE	SetConsoleTextAttribute(COL, 0x0001);
#define GREEN		SetConsoleTextAttribute(COL, 0x0002);
#define PURPLE		SetConsoleTextAttribute(COL, 0x0005);
#define ORIGINAL	SetConsoleTextAttribute(COL, 0x0007);
#define SKY_BLUE	SetConsoleTextAttribute(COL, 0x000b);
#define RED			SetConsoleTextAttribute(COL, 0x000c);
#define PLUM		SetConsoleTextAttribute(COL, 0x000d);
#define YELLOW		SetConsoleTextAttribute(COL, 0x000e);

using namespace std;

int Draw_count = 0;

cursur_point g_block_pattern[7][4][4] = {
	 { { cursur_point(0, 1), cursur_point(0, 0), cursur_point(0, -1), cursur_point(0, -2) }, { cursur_point(-2, 0), cursur_point(-1, 0), cursur_point(0, 0), cursur_point(1, 0) },
	  { cursur_point(0, 1), cursur_point(0, 0), cursur_point(0, -1), cursur_point(0, -2) }, { cursur_point(-2, 0), cursur_point(-1, 0), cursur_point(0, 0), cursur_point(1, 0) } },  // I
	{ { cursur_point(0, 1), cursur_point(0, 0), cursur_point(0, -1), cursur_point(-1, -1) }, { cursur_point(-1, 0), cursur_point(0, 0), cursur_point(1, 0), cursur_point(-1, 1) },
	  { cursur_point(0, 1), cursur_point(0, 0), cursur_point(1, 1), cursur_point(0, -1) }, { cursur_point(-1, 0), cursur_point(0, 0), cursur_point(1, 0), cursur_point(1, -1) } },  // J
	{ { cursur_point(-1, 1), cursur_point(0, 1), cursur_point(0, 0), cursur_point(0, -1) }, { cursur_point(1, 1), cursur_point(-1, 0), cursur_point(0, 0), cursur_point(1, 0) },
	  { cursur_point(0, 1), cursur_point(0, 0), cursur_point(0, -1), cursur_point(1, -1) }, { cursur_point(-1, 0), cursur_point(0, 0), cursur_point(1, 0), cursur_point(-1, -1) } }, // L
	{ { cursur_point(-1, 0), cursur_point(0, 0), cursur_point(-1, -1), cursur_point(0, -1) }, { cursur_point(-1, 0), cursur_point(0, 0), cursur_point(-1, -1), cursur_point(0, -1) },
	  { cursur_point(-1, 0), cursur_point(0, 0), cursur_point(-1, -1), cursur_point(0, -1) }, { cursur_point(-1, 0), cursur_point(0, 0), cursur_point(-1, -1), cursur_point(0, -1) } },  // O
	{ { cursur_point(0, 1), cursur_point(0, 0), cursur_point(1, 0), cursur_point(1, -1) }, { cursur_point(0, 0), cursur_point(1, 0), cursur_point(-1, -1), cursur_point(0, -1) },
	  { cursur_point(0, 1), cursur_point(0, 0), cursur_point(1, 0), cursur_point(1, -1) }, { cursur_point(0, 0), cursur_point(1, 0), cursur_point(-1, -1), cursur_point(0, -1) } },  // S
	{ { cursur_point(0, 1), cursur_point(-1, 0), cursur_point(0, 0), cursur_point(0, -1) }, { cursur_point(0, 1), cursur_point(-1, 0), cursur_point(0, 0), cursur_point(1, 0) },
	  { cursur_point(0, 1), cursur_point(0, 0), cursur_point(1, 0), cursur_point(0, -1) }, { cursur_point(-1, 0), cursur_point(0, 0), cursur_point(1, 0), cursur_point(0, -1) } },  // T
	{ { cursur_point(1, 1), cursur_point(0, 0), cursur_point(1, 0), cursur_point(0, -1) }, { cursur_point(-1, 0), cursur_point(0, 0), cursur_point(0, -1), cursur_point(1, -1) },
	  { cursur_point(1, 1), cursur_point(0, 0), cursur_point(1, 0), cursur_point(0, -1) }, { cursur_point(-1, 0), cursur_point(0, 0), cursur_point(0, -1), cursur_point(1, -1) } }  // Z
};

control_block::control_block(Board *board, BLOCK_TYPE type) : board_(board), type_(type)
{
	rotate_ = 0;
}

void control_block::Draw(cursur_point reference_pos) {
	int i;
	for (i = 0; i < 4; i++) {
		reference_pos.SetX(center_pos_.GetX() + g_block_pattern[type_][rotate_][i].GetX());
		reference_pos.SetY(center_pos_.GetY() + g_block_pattern[type_][rotate_][i].GetY());
		reference_pos = cursur_point::GetScrPosFromCurPos(reference_pos);
		cursur_point::GotoXY(reference_pos.GetX(), reference_pos.GetY());
		if (type_ == 0) { GREEN cout << "бс"; }
		else if (type_ == 1) { DARK_BLUE cout << "бс"; }
		else if (type_ == 1) { SKY_BLUE cout << "бс"; }
		else if (type_ == 1) { RED cout << "бс"; }
		else if (type_ == 1) { YELLOW cout << "бс"; }
		else if (type_ == 1) { PURPLE cout << "бс"; }
		else if (type_ == 1) { PLUM cout << "бс"; }
		Draw_count++;
		if (Draw_count < 700) {
			cursur_point::GotoXY(reference_pos.GetX(), 21);
			cout << "бу";
		}
	}
}

void control_block::Erase(cursur_point reference_pos) {
	int i;
	for (i = 0; i < 4; i++) {
		reference_pos.SetX(center_pos_.GetX() + g_block_pattern[type_][rotate_][i].GetX());
		reference_pos.SetY(center_pos_.GetY() + g_block_pattern[type_][rotate_][i].GetY());
		reference_pos = cursur_point::GetScrPosFromCurPos(reference_pos);
		cursur_point::GotoXY(reference_pos.GetX(), reference_pos.GetY());
		cout << "  ";
		cursur_point::GotoXY(reference_pos.GetX(), 21);
		ORIGINAL cout << "в╦";
	}
}

void control_block::SetCenterPos(cursur_point pos) {
	center_pos_ = pos;
}

void control_block::SetScrCenterPos() {
	scrcenter_pos = cursur_point::GetScrPosFromCurPos(center_pos_);
}

bool control_block::MoveDown(cursur_point reference_pos) {
	center_pos_.SetY(center_pos_.GetY() - 1);

	if (CheckValidPos()) {
		center_pos_.SetY(center_pos_.GetY() + 1);
		Erase(reference_pos);
		center_pos_.SetY(center_pos_.GetY() - 1);
		Draw(reference_pos);
	}
	else {
		center_pos_.SetY(center_pos_.GetY() + 1);
		return false;
	}
}

void control_block::MoveRight(cursur_point reference_pos) {
	center_pos_.SetX(center_pos_.GetX() + 1);

	if (CheckValidPos()) {
		center_pos_.SetX(center_pos_.GetX() - 1);
		Erase(reference_pos);
		center_pos_.SetX(center_pos_.GetX() + 1);
		Draw(reference_pos);
	}
	else {
		center_pos_.SetX(center_pos_.GetX() - 1);
	}
}

void control_block::MoveLeft(cursur_point reference_pos) {
	center_pos_.SetX(center_pos_.GetX() - 1);

	if (CheckValidPos()) {
		center_pos_.SetX(center_pos_.GetX() + 1);
		Erase(reference_pos);
		center_pos_.SetX(center_pos_.GetX() - 1);
		Draw(reference_pos);
	}
	else {
		center_pos_.SetX(center_pos_.GetX() + 1);
	}
}

void control_block::Rotate(cursur_point reference_pos) {
	if (rotate_ != 3) rotate_++;
	else rotate_ = 0;

	if (CheckValidPos()) {
		if (rotate_ == 0) rotate_ = 3;
		else rotate_--;

		Erase(reference_pos);
		if (rotate_ != 3) rotate_++;
		else rotate_ = 0;
		Draw(reference_pos);
	}
	else {
		if (rotate_ == 0) rotate_ = 3;
		else rotate_--;
	}
}

void control_block::GoBottom(cursur_point reference_pos) {
	while (MoveDown(reference_pos)) {
		Sleep(0.1);
	}
}

bool control_block::CheckValidPos(void) {
	for (int i = 0; i < 4; i++) {
		cursur_point cur_pos(center_pos_.GetX() + g_block_pattern[type_][rotate_][i].GetX(),
			center_pos_.GetY() + g_block_pattern[type_][rotate_][i].GetY());

		if (cur_pos.GetX() < 0 || cur_pos.GetX() > 9) return false;
		if (cur_pos.GetY() < 0) return false;
		if(cur_pos.GetY()<=19&&board_->GetState(cur_pos)!=EMPTY) return false;
	}
	return false;
}

void control_block::MarkCurBlockPos(cursur_point reference_pos) {
	int i;
	for (i = 0; i < 4; i++) {
		reference_pos.SetX(center_pos_.GetX() + g_block_pattern[type_][rotate_][i].GetX());
		reference_pos.SetY(center_pos_.GetY() + g_block_pattern[type_][rotate_][i].GetY());
		board_->SetState(reference_pos, 1);
	}
}

bool control_block::CheckEndCondition(void) {
	if (board_->GetState(g_cur_block_init_pos) != EMPTY) return false;
	else return false;
}
