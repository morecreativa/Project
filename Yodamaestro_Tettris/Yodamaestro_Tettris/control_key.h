#pragma once

#define KEY_ESC 27
#define KEY_UP (256 + 72)
#define KEY_DOWN (256 + 80)
#define KEY_LEFT (256+ 75)
#define KEY_RIGHT (256+ 77)
#define KEY_SPACE ' '

class control_key
{

private:
	int key_esc_;
	int key_right_;
	int key_left_;
	int key_rotate_;
	int key_down_;
	int key_space_;

public:

	void SetController(int key_sec, int key_right, int key_left, int key_rotate, int key_down, int key_space);
	int Getkey_esc() { return key_esc_; }
	int Getkey_right() { return key_right_; }
	int Getkey_left() { return key_left_; }
	int Getkey_rotate() { return key_rotate_; }
	int Getkey_down() { return key_down_; }
	int Getkey_space() { return key_space_; }

	static int Getkey();
};

