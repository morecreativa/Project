#include <conio.h>
#include <cstdlib>
#include <iostream>
#include <Windows.h>
#include <iomanip>

#include "Center_control.h"
#include "control_key.h"
#include "control_block.h"
#include "score.h"
#include "Board.h"

#define COL			GetStdHandle(STD_OUTPUT_HANDLE)
#define ORIGINAL	SetConsoleTextAttribute(COL,0x0007);

using namespace std;

Center_control::Center_control(cursur_point reference_pos, int key_esc, int key_right, int key_left,
	int key_rotate, int key_down, int key_space)
{
	running_ = true;
	cur_Tettris_block_ = NULL;
	nxt_Tettris_blokck_ = NULL;
	start_time_ = clock();
	falling_speed_ = 0.8;

	SetCursorInvisible();

	control_key_.SetController(key_esc, key_right, key_left, key_rotate, key_down, key_space);
	DrawBoard();
	GenerateNextBlock();
	cur_Tettris_block_->Draw(reference_pos);
	nxt_Tettris_blokck_->Draw(reference_pos_);
	score_.Print(reference_pos_);
}

void Center_control::DrawBoard(void) {
	int i;
	cursur_point::GotoXY(reference_pos_);
	cout << "▦▦▦▦▦▦▦▦▦▦▦▦▦▦▦▦▦▦▦";
	for (i = 0; i < 20; i++) {
		if (i == 11) {
			cursur_point::GotoXY(reference_pos_ + cursur_point(0, i + 1));
			cout << "▦                    ▦ → 오른쪽  ▦";
		}
		else if (i == 13) {
			cursur_point::GotoXY(reference_pos_ + cursur_point(0, i + 1));
			cout << "▦                    ▦ ← 왼쪽    ▦";
		}
		else if (i == 15) {
			cursur_point::GotoXY(reference_pos_ + cursur_point(0, i + 1));
			cout << "▦                    ▦ ↑ 회전    ▦";
		}
		else if (i == 17) {
			cursur_point::GotoXY(reference_pos_ + cursur_point(0, i + 1));
			cout << "▦                    ▦ ↓ 아래    ▦";
		}
		else if (i == 19) {
			cursur_point::GotoXY(reference_pos_ + cursur_point(0, i + 1));
			cout << "▦                    ▦ SPACE 낙하▦";
		}
		else if (i == 6 || i==10) {
			cursur_point::GotoXY(reference_pos_ + cursur_point(0, i + 1));
			cout << "▦                    ▦▦▦▦▦▦▦▦";
		}
		else {
			cursur_point::GotoXY(reference_pos_ + cursur_point(0, i + 1));
			cout << "▦                    ▦           ▦";
		}
	}
	cursur_point::GotoXY(reference_pos_ + cursur_point(0, i + 1));
	cout << "▦▦▦▦▦▦▦▦▦▦▦▦▦▦▦▦▦▦▦";
}

void Center_control::RunStep(void) {
	if (kbhit()) {
		int key = control_key::Getkey();
		KeyHandler(key);
	}
	else {
		NormalStep();
	}
}

bool Center_control::KeyHandler(int key) {
	if (key == control_key_.Getkey_esc()) {
		running_ = false;
		return true;
	}
	else if (key == control_key_.Getkey_right()) {
		cur_Tettris_block_->MoveRight(reference_pos_);
		return true;
	}
	else if (key == control_key_.Getkey_rotate()) {
		cur_Tettris_block_->Rotate(reference_pos_);
		return true;
	}
	else if (key == control_key_.Getkey_down()) {
		cur_Tettris_block_->MoveDown(reference_pos_);
		return true;
	}
	else if (key == control_key_.Getkey_space()) {
		cur_Tettris_block_->GoBottom(reference_pos_);
		return true;
	}
	else if (key == control_key_.Getkey_left()) {
		cur_Tettris_block_->MoveLeft(reference_pos_);
		return true;
	}

	return false;
}

void Center_control::NormalStep(void) {
	int stage = score_.Stage();

	if (stage == 1) falling_speed_ = 0.8;
	else if (stage == 2) falling_speed_ = 0.6;
	else if (stage == 3) falling_speed_ = 0.6;
	else if (stage == 4) falling_speed_ = 0.4;
	else if (stage == 5) falling_speed_ = 0.1;
	else falling_speed_ = 0.05;

	if (GetDiffTime() >= falling_speed_) {
		if (cur_Tettris_block_->MoveDown(reference_pos_)) start_time_ = clock();
		else PrepareNextStep();
	}
}

void Center_control::PrepareNextStep(void) {
	cursur_point::GotoXY(cursur_point(0, 21));
	ORIGINAL cout << "▦▦▦▦▦▦▦▦▦▦▦▦▦▦▦▦▦▦▦";

	cur_Tettris_block_->MarkCurBlockPos(reference_pos_);

	int EraseLineCount = board_.CheckLineFull(reference_pos_);
	if (EraseLineCount > 0) score_.UpdateScore(reference_pos_, EraseLineCount);
	if (cur_Tettris_block_->CheckEndCondition()) {
		running_ = false;
		cursur_point::GotoXY(reference_pos_ + cursur_point(10, 10));
		cout << "The Game is Over !!!";
		getch();
	}
	else {
		nxt_Tettris_blokck_->control_block::Erase(reference_pos_);
		GetCurBlockFromNext();
		cur_Tettris_block_->Draw(reference_pos_);
		GenerateNextBlock();
		nxt_Tettris_blokck_->Draw(reference_pos_);
	}

	start_time_ = clock();
}

void Center_control::GenerateNextBlock(void) {
	BLOCK_TYPE Block_type = (BLOCK_TYPE)(rand() % BLOCK_TYPE_COUNT);

	nxt_Tettris_blokck_ = new control_block(&board_, Block_type);
	nxt_Tettris_blokck_->SetCenterPos(g_nxt_block_init_pos);
}

void Center_control::GetCurBlockFromNext(void) {
	if (cur_Tettris_block_ != NULL) delete cur_Tettris_block_;

	cur_Tettris_block_ = nxt_Tettris_blokck_;
	cur_Tettris_block_->SetCenterPos(g_cur_block_init_pos);
}

double Center_control::GetDiffTime(void) {
	clock_t Curtime;
	Curtime = clock();
	return ((double)(Curtime - start_time_) / CLOCKS_PER_SEC);
}

void Center_control::SetCursorInvisible(void) {
	CONSOLE_CURSOR_INFO ci = { 10,FALSE };
	SetConsoleCursorInfo(GetStdHandle(STD_OUTPUT_HANDLE), &ci);
}
