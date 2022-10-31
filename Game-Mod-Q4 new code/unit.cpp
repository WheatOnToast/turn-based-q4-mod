#include <stdlib.h>

enum UnitTypes {
	WARRIOR,
	GUNNER,
	FLYER,
	ASSASSIN,
	TANK,
	CLERIC,
};

class Unit {
public:
	int movement;
	int health;
	int dmg;
	int UnitType;

	Unit() {
		movement = 6;
		health = 20;
		dmg = 10;
		UnitType = WARRIOR;
	}
	Unit(int a, int b, int c, int d) {
		movement = a;
		health = b;
		dmg = c;
		UnitType = d;
	}
};