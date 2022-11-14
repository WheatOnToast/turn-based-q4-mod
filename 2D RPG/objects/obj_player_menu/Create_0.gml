enum battle_state {SELECTION, ATTACKING, USING, WON, NOTIFY, SWITCH};
phase = "player"
win = 0;
numOfEnemies = array_length(obj_enemy_spawn.enemy_array);
numOfPlayers = array_length(obj_player_party.party_array);
depth = -9999;
fight_state = battle_state.SELECTION;
enemy_dmg_total = 0;
width = 96;
height = 80;

op_border = 8;
op_space = 16;

pos = 0;

selected_player = obj_player_party.party_array[0];
selected_player_index = 0;

selected_move = selected_player.p1_attacks[0];
selected_item = obj_item_manager.inv;

using_move = false;
using_item = false;

exclamation = 0;
enemy_chosen_flag = 0;

option[0, 0] = "Attack";
option[0, 1] = "Magic";
option[0, 2] = "Items";
option[0, 3] = "Run";
option[0, 4] = "Switch";

//limbo option (blank UI when needed)
option[404, 404] = "";

//sets attacks
for (var i = 0 ; i < array_length(selected_player.p1_attacks); i++){
	option[1, i] = selected_player.p1_attacks[i];
}

//sets magic
for (var i = 0 ; i < array_length(selected_player.p1_magicAttacks); i++){
	option[2, i] = selected_player.p1_magicAttacks[i];	
}

//sets item array		
for(var i = 0; i < 20; i++){
	option[3, i] = "";	
}
for(var i = 0; i < array_length(obj_item_manager.inv); i++){
	option[3, i] = obj_item_manager.inv[i];	
}

//sets party switch choices
for(var i = 0; i < array_length(obj_player_party.party_array); i++){
	option[4, i] = obj_player_party.party_array[i];	
}


//sets choices to attack
for (var i = 0 ; i < numOfEnemies; i++){
	option[10, i] = obj_enemy_spawn.enemy_array[i]; 	
}

//sets choices (for players)
for (var i = 0 ; i < numOfPlayers; i++){
	option[11, i] = obj_player_party.party_array[i]; 	
}



op_length = 0;
menu_level = 0;


