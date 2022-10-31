#include <stdlib.h>
#pragma once

class unit {
	enum UnitTypes {
		WARRIOR,
		GUNNER,
		FLYER,
		ASSASSIN,
		TANK,
		CLERIC
	};

	public:
		int movement;
		int health;
		int dmg;
		int UnitType;

		void setUnit(int a, int b, int c, int d) {
			movement = a;
			health = b;
			dmg = c;
			UnitType = d;
		}
}; 