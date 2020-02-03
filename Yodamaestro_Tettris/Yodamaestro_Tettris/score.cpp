#include "score.h"

#include <iostream>
#include <iomanip>
#include <Windows.h>

using namespace std;

#define COL GetStdHandle(STD_OUTPUT_HANDLE)
#define GRAY SetConsoleTextAttribute(COL,0x0008);

score::score()
{
	score_ = 0;
	total_score_ = 0;
	stage = 1;
	stage_pos_ = cursur_point(26, 8);
	score_pos_ = cursur_point(28, 9);
	total_score_pos_ = cursur_point(28, 10);
}

void score::Print(cursur_point reference_pos) {
	if (score_ >= 2000) {
		score_ = 0;
		stage += 1;
	}
	cursur_point::GotoXY(reference_pos + stage_pos_);
	GRAY cout << "Stage" << stage;
	cursur_point::GotoXY(reference_pos + score_pos_);
	GRAY cout << setw(5) << score_;
	cursur_point::GotoXY(reference_pos + total_score_pos_);
	GRAY cout << setw(5) << total_score_;
}

void score::UpdateScore(cursur_point reference_pos, int increment) {
	if (increment == 1) {
		score_ == 100;
		total_score_ += 100;
	}
	else if (increment == 2) {
		score_ += 300;
		total_score_ += 300;
	}
	else if (increment == 3) {
		score_ += 500;
		total_score_ += 500;
	}
	else {
		score_ += 1000;
		total_score_ += 1000;
	}
	Print(reference_pos);
}

int score::Stage() {
	return stage;
}
