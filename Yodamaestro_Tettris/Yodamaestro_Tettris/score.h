#pragma once

#include "cursur_point.h"

class score
{
private:
	int score_;
	int total_score_;
	int stage;
	cursur_point score_pos_;
	cursur_point stage_pos_;
	cursur_point total_score_pos_;

public:
	score();
	void UpdateScore(cursur_point reference_pos, int increment);
	void Print(cursur_point reference_pos);
	int Stage();
};

