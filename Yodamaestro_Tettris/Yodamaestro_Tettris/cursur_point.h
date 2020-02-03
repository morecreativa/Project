#pragma once
class cursur_point
{
private: 
	int x_;
	int y_;

public:
	cursur_point(int x = -1, int y = -1) : x_(x), y_(y) {}
	int GetX() const { return x_; }
	int GetY() const { return y_; }
	void SetX(int x) { x_ = x; }
	void SetY(int y) { y_ = y; }
	cursur_point operator+(const cursur_point &pt);

	static void GotoXY(int x, int y);
	static void GotoXY(cursur_point pos);
	static cursur_point GetScrPosFromCurPos(const cursur_point &pos);
};

