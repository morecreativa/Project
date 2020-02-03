#include <iostream>
#include <cstdlib>
#include <ctime>
#include <conio.h>
#include "Center_control.h"

using namespace std;

int main() {
	srand(time(NULL));
	int input;

	cout << ">>>>>>> Yodamaestro <<<<<<" << endl;
	cout << ">>1인용, 2인용 선택 : ";
	cin >> input;

	system("cls");

	if (input == 1) {
		Center_control Game(cursur_point(0, 0));
		Game.Run();
	}
	else {
		Center_control Game1(cursur_point(0, 0), KEY_ESC, 'd', 'a', 'w', 's', 'z');
		Center_control Game2(cursur_point(38, 0), 'p');

		while (Game1.IsRunning() || Game2.IsRunning()) {
			bool key1 = false;
			bool key2 = false;

			if (kbhit()) {
				int key = control_key::Getkey();
				if (Game1.IsRunning()) key1 = Game1.KeyHandler(key);
				if (Game2.IsRunning() && !key1) key2 = Game2.KeyHandler(key);
			}

			if (Game1.IsRunning() && !key1) Game1.NormalStep();
			if (Game2.IsRunning() && !key2) Game2.NormalStep();
		}
	}

	return 0;
}