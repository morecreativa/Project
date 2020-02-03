#pragma once

#include "cursur_point.h"
#include "Board.h"
#include "score.h"

#define BLOCK_TYPE_COUNT 7
#define ROTATE_COUNT	 4

const cursur_point g_nxt_block_init_pos(14, 17);
const cursur_point g_cur_block_init_pos(4, 18);

enum BLOCK_TYPE {
	BLOCK_I, BLOCK_J, BLOCK_L, BLOCK_O, BLOCK_S, BLOCK_T, BLOCK_Z
};

class control_block
{
public:
	control_block(Board *board, BLOCK_TYPE type);
	virtual void Draw(cursur_point reference_pos);
	virtual void Erase(cursur_point reference_pos);
	bool MoveDown(cursur_point reference_pos);
	void MoveRight(cursur_point reference_pos);
	void MoveLeft(cursur_point reference_pos);
	void Rotate(cursur_point reference_pos);
	void GoBottom(cursur_point reference_pos);
	virtual void MarkCurBlockPos(cursur_point reference_pos);
	bool CheckEndCondition(void);
	void SetCenterPos(cursur_point pos);
	void SetScrCenterPos(void);

protected:
	virtual bool CheckValidPos(void);

protected:
	cursur_point center_pos_;
	cursur_point scrcenter_pos;
	score score_;
	BLOCK_TYPE type_;
	int rotate_;
	Board *board_;
};

