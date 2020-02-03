#pragma once

#include "Board.h"
#include "Center_control.h"
#include "control_block.h"
#include "control_key.h"
#include "cursur_point.h"
#include "score.h"
#include <ctime>

using namespace std;

class Center_control
{

private:
	cursur_point reference_pos_;
	bool running_;
	Board board_;
	score score_;
	control_block *cur_Tettris_block_;
	control_block *nxt_Tettris_blokck_;
	control_key control_key_;
	clock_t start_time_;
	double falling_speed_;

protected:
	void DrawBoard();	//Draw Game 
	void PrepareNextStep(void);
	void GenerateNextBlock();
	void GetCurBlockFromNext();
	double GetDiffTime(void);
	void SetCursorInvisible(void);

public:
	Center_control(cursur_point reference_pos = cursur_point(1, 1),
		int key_esc = KEY_ESC, int key_right = KEY_RIGHT, int key_left=KEY_LEFT, 
		int key_rotate=KEY_UP, int key_down=KEY_DOWN, int key_space=KEY_SPACE);
	void Run(void);
	void RunStep(void);
	bool KeyHandler(int key);
	void NormalStep(void);
	bool IsRunning(void) { return running_; }

};

