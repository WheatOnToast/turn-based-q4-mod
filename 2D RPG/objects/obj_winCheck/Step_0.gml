if(obj_player_menu.numOfEnemies == 0){
	obj_player_menu.fight_state = battle_state.WON;
	obj_player_menu.menu_level = 404;
}

if(obj_player_menu.fight_state == battle_state.WON && win == 0){ 
	if(win == 0){
		alarm[0] = 120;
		alarm[1] = 400;
	}
	obj_player_menu.pos = 0;
	win = 1;
}
