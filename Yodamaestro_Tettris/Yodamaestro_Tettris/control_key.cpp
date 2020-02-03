#include "control_key.h"

#include <iostream>
#include <conio.h>

using namespace std;

void control_key::SetController(int key_esc, int key_right, int key_left, int key_rotate,
	int key_down, int key_space) {
	key_esc_ = key_esc;
	key_right_ = key_right;
	key_left_ = key_left;
	key_rotate_ = key_rotate;
	key_down_ = key_down;
	key_space_ = key_space;
}

int control_key::Getkey(void) {
	int ch = getch();

	if (ch == 0 || ch == 224) ch = 256 + getch();
	return ch;
}