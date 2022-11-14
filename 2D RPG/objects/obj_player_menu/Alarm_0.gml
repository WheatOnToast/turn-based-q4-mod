/// @description Phase Decider & Player Choice
/*if(obj_battle_bar.image_index > 10 && phase = "player"){
	menu_level = 404;
	phase = "enemy";
}

//if bBar position is <= 10, do specified action
else if(obj_battle_bar.image_index <= 10 && phase = "player"){
	if(fight_state = battle_state.ATTACKING){
		calcd_dmg = obj_atk_lib.atk_use(selected_move, selected_enemy);
		menu_level = 0;
		phase = "player"	
	}	
	if(fight_state = battle_state.USING){
		obj_item_manager.item_use(pos, selected_item, selected_player);
		obj_battle_bar.image_index = obj_battle_bar.image_index + 3;
		menu_level = 0;
		phase = "player"
	}
}

if(obj_battle_bar.image_index > 10 && phase = "player"){
	menu_level = 404;
	phase = "enemy";
}*/
if(fight_state = battle_state.ATTACKING){
	calcd_dmg = obj_atk_lib.atk_use(selected_move, selected_enemy);
	menu_level = 0;	
}	
if(fight_state = battle_state.USING){
	obj_item_manager.item_use(pos, selected_item, selected_item_receiver);
	obj_battle_bar.image_index = obj_battle_bar.image_index + 3;
	menu_level = 0;
	
}

using_item = false;
using_move = false;

alarm[1] = 60;
