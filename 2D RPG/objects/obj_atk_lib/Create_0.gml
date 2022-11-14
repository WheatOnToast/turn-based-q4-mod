//ATTACK LIBRARY

/* 
This file contains ALL attacks for the game.
Main use for this file is easy traversal to find the right
moves for the right allies and enemies.
*/

//MOVE TYPE: PHYSICAL = 0, SPECIAL = 1, PHYSICAL(ALL) = 2, SPECIAL(ALL) = 3, STATUS = 4, STATUS(ALL) = 5

//Move Constructor
function attack(_move_name, _desc, _element, _status, _move_type, _dmg, _accuracy, _bCost, _lvl, _animation) constructor{
	move_name = _move_name;
	desc = _desc;
	element = _element;
	status = _status;
	move_type = _move_type;
	dmg = _dmg;
	accuracy = _accuracy;
	bCost = _bCost;
	lvl = _lvl;
	animation = _animation;
}

function magicAttack(_move_name, _desc, _element, _status, _move_type, _dmg, _accuracy, _bCost, _mpCost, _lvl, _animation) constructor{
	move_name = _move_name;
	desc = _desc;
	element = _element;
	status = _status;
	move_type = _move_type;
	dmg = _dmg;
	accuracy = _accuracy;
	bCost = _bCost;
	mpCost = _mpCost;
	lvl = _lvl;
	animation = _animation;
}

//type advantage calculator
function typeCalc(move, receiver){
	switch(receiver.type){ //checks scenarios of receiver's type and checks if the move against it will do more or less dmg
					case atkElements.FIRE:
						if (move.element = atkElements.WATER){
							return 2;
						}
						else if (move.element = atkElements.ICE || move.element = atkElements.FIRE){
							return 0.5;
						}
						else{					

							return 1;
						}
						break;
			
					case atkElements.WATER:
						if (move.element = atkElements.GRASS || move.element = atkElements.ELECTRIC){
							return 2;
						}
						else if (move.element = atkElements.FIRE || move.element = atkElements.WATER){
							return 0.5;
						}
						else{
							return 1;
						}
						break;
				
					case atkElements.GRASS:
						if (move.element = atkElements.FIRE){
							return 2;
						}
						else if (move.element = atkElements.GRASS || atkElements.WATER){
							return 0.5;
						}
						else{
								return 1;
						}
						break;
					
					case atkElements.GOO:
						if (move.element = atkElements.FIRE){
							return 2;	
						}
						else if (move.element = atkElements.WATER){
							return 0.5;
						}
						else{
							return 1;	
						}
						break;
						
					default:
						return 1;
					break;
		}
}


//round dmg to nearest 5th or 10th
function dmgRound(dmg){
	if(round(dmg) mod 5 != 0){
		for (i = 1; i <= 9; i++){
			if((round(dmg)+i) mod 5 == 0){
				return (round(dmg) + i);
			}
		}
	}
	else{
		return dmg;	
	}
	return dmg;
}


//using moves
calcd_dmg = 0; 
dmg_array = []; 
function atk_use(move, receiver){
	calcd_dmg = 0; 
	dmg_array = []; 
	player = obj_player_menu.selected_player;
	switch(move.move_type)
		{
		case 0: //Physical Moves
			calcd_dmg = move.dmg;
			receiver.temp_hp = receiver.temp_hp - (dmgRound(calcd_dmg));
			break;
			
		case 1: //Magic Moves
			if(obj_player_menu.phase == "player"){
				player.temp_mp = player.temp_mp - move.mpCost;
			}
			calcd_dmg = move.dmg * typeCalc(move, receiver);
			receiver.temp_hp = receiver.temp_hp - (dmgRound(round(calcd_dmg)));
			break;
			
		case 3: //Magic (ALL) Moves
			if(obj_player_menu.phase == "player"){
				player.temp_mp = player.temp_mp - move.mpCost;
				for(var i = 0; i < array_length(obj_enemy_spawn.enemy_array); i++){
					calcd_dmg = 0;
					calcd_dmg = move.dmg * typeCalc(move, obj_enemy_spawn.enemy_array[i]);
					obj_enemy_spawn.enemy_array[i].temp_hp = obj_enemy_spawn.enemy_array[i].temp_hp - (dmgRound(round(calcd_dmg)));
					dmg_array[i] = dmgRound(calcd_dmg);
				}	
			}
			if(obj_player_menu.phase == "enemy"){
				for(var i = 0; i < array_length(obj_player_party.party_array); i++){
					calcd_dmg = 0;
					calcd_dmg = move.dmg * typeCalc(move, obj_player_party.party_array[i]);
					obj_player_party.party_array[i].temp_hp = obj_player_party.party_array[i].temp_hp - (dmgRound(round(calcd_dmg)));
					dmg_array[i] = dmgRound(calcd_dmg);
				}
			}
			break;	
		}

	if(obj_player_menu.phase == "enemy"){
		obj_battle_bar.image_index = obj_battle_bar.image_index - move.bCost;	
	}
	else if (obj_player_menu.phase == "player"){
		instance_create_depth(receiver.x, receiver.y+8, -999999, move.animation);
		obj_battle_bar.image_index = obj_battle_bar.image_index + move.bCost;
	}
	else if (obj_player_menu.phase == "player" && move.move_type == 3){
		instance_create_depth(0, 0, -999999, move.animation);
		obj_battle_bar.image_index = obj_battle_bar.image_index + move.bCost;
	}
	
	
	if(move.move_type == 2 || move.move_type == 3 || move.move_type = 5){
		return dmg_array;
	}
	else{
		return dmgRound(round(calcd_dmg));
	}
}

global.atk_list =
{
	//MOVE TYPE: PHYSICAL = 0, SPECIAL = 1, PHYSICAL(ALL) = 2, SPECIAL(ALL) = 3, STATUS = 4, STATUS(ALL) = 5
	//--------------------------------PHYSICAL-------------------------------------------
	//for every 1 bCost, +10 dmg
	Null : new attack(
		"Null_attack", 
		"A quick hit that's sure to do some OK damage.", 
		atkElements.NORMAL, 
		atkStatus.NONE, 
		0, 
		5, 
		100, 
		1, 
		1, 
		obj_anim_bash
		),
	Bash : new attack(
		"Bash", 
		"A quick hit that's sure to do some OK damage.", 
		atkElements.NORMAL, 
		atkStatus.NONE, 
		0, 
		10, 
		100, 
		2, 
		1, 
		obj_anim_bash
		),
		
	Bash_Plus : new attack(
		"Bash+", 
		"A quick slash that's sure to do some good damage.", 
		atkElements.NORMAL, 
		atkStatus.NONE, 
		0, 
		20, 
		100, 
		3,
		1, 
		obj_anim_bash
		),
		
	Bash_Plus2 : new attack(
		"Bash++",
		"A quick and bigger hit that's sure to do some great damage.", 
		atkElements.NORMAL, 
		atkStatus.NONE,
		0, 
		50, 
		100, 
		6,
		1,
		obj_anim_bash
		),
	
	Bash_Plus3 : new attack(
		"Bash+++", 
		"A quick and bigger hit that's sure to do some excellent damage.", 
		atkElements.NORMAL,
		atkStatus.NONE, 
		0,
		80, 
		100,
		9, 
		1, 
		obj_anim_bash
		),
	
	wimpy_tackle : new attack(
		"Wimpy Tackle", 
		"A wimpy attack that costs A LOT of BP and dishes out alright damage.", 
		atkElements.NORMAL, 
		atkStatus.NONE, 
		0, 
		20, 
		100,
		6, 
		1, 
		obj_anim_bash
		),
		
	//--------------------------------SPECIAL-------------------------------------------
	//for every 1 MPCost, +15 dmg
	Blaze : new magicAttack(
		"Blaze", 
		"A burst of flames that will do OK damage.",
		atkElements.FIRE,
		atkStatus.BURN, 
		1, 
		45,
		100, 
		4, 
		4, 
		1, 
		obj_anim_fire
		),
		
	Flow : new magicAttack(
		"Flow", 
		"A splash of water that will do OK damage.",
		atkElements.WATER,
		atkStatus.NONE,
		1,
		30, 
		100, 
		3, 
		3, 
		1, 
		obj_anim_water
		),
		
	Zap : new magicAttack(
		"Zap",
		"A zap of electricity that will do OK damage.", 
		atkElements.ELECTRIC,
		atkStatus.NONE, 
		1, 
		15, 
		100,
		2, 
		2,
		1,
		obj_anim_zap
		),
		
	Deathblow : new magicAttack(
		"Deathblow",
		"50% chance to instant kill every enemy",
		atkElements.WIND,
		atkStatus.NONE,
		3,
		1000,
		50,
		15,
		5,
		10,
		obj_anim_deathblow
		),
}


//NEGATIVE STATUS LIBRARY
enum atkStatus {
	NONE,
	POISON,
	BURN,
	SAD,
	TIRED,
	RAGE,
}

//POSITIVE STATUS LIBRARY
enum goodStatus {
	SWIFT,
	DEFENSE,
	POWER,
}

//ELEMENT LIBRARY
enum atkElements {
	NORMAL,
	GRASS,
	FIRE,
	WATER,
	ELECTRIC,
	ICE,
	WIND,
	GROUND,
	PLASMA,
	GOO
}
