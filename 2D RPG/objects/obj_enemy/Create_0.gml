name = "TEST_ENEMY";
sprite = spr_enemy;

attacks = [Bash];
magic_attacks = [Flare];

element_type = AtkElements.FIRE;

hp = 200;
mp = 20;
atk = 40;
matk = 20;
def = 25;
mdef = 10;
xp = 150;

temp_hp = 200;
temp_mp = 20;
temp_atk = 40;
temp_matk = 20;
temp_def = 25;
temp_mdef = 10;
temp_xp = 150;

//ATTACK LIBRARY

/* 
This file contains ALL physical attacks for the game.
Main use for this file is easy traversal to find the right
moves for the right allies and enemies.
*/

//MOVE TYPE: PHYSICAL = 0, SPECIAL = 1, STATUS = 2

//PHYSICAL
Bash = new attack("Bash", "A quick hit that's sure to do some OK damage.", AtkElements.NORMAL, AtkStatus.NONE, 0, 30, 100, 3, 1, anim_bash);
Bash_Plus = new attack("Bash+", "A quick and bigger hit that's sure to do some decent damage.", AtkElements.NORMAL, AtkStatus.NONE, 0, 50, 100, 5, 1, anim_bash);

//SPECIAL
Flare = new magicAttack("Flare", "A burst of flames that will do OK damage.", AtkElements.FIRE, AtkStatus.BURN, 1, 25, 100, 3, 2, anim_bash);
