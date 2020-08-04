#pragma once

#include "cursur_point.h"

#define EMPTY -1

class Board
{

public:
	Board();

	int GetState(cursur_point pos);
	void SetState(cursur_point pos, int state);
	int CheckLineFull(cursur_point reference_pos);

private:
	int board_[10][20];
};

