draw_set_font(global.font_main);
//damage is shown for ONE ENEMY AT A TIME

if(c_move.move_type == 2 || c_move.move_type == 3 || c_move.move_type == 5){ //for all hitting moves (checks if the specific enemy in the enemy array is alive and should show dmg)
	if(instance_exists(obj_enemy_spawn.enemy_array[enemy_index])){
		//draw_text_color(x+2, y, string(c_damage[enemy_index]), c_white, c_white, c_white, c_white, 1);
		draw_text_transformed(x, y, string(c_damage_all[enemy_index]), 2, 2, 0);
	}
}

else if(obj_player_menu.fight_state == battle_state.USING){ //for items (checks if the specific enemy in the enemy array is alive and should show dmg)
	if(instance_exists(obj_enemy_spawn.enemy_array[enemy_index])){
		//draw_text_color(x+2, y, string(c_damage), c_white, c_white, c_white, c_white, 1);
		draw_text_transformed(x, y, string(c_damage), 2, 2, 0);
	}
}
else if(c_move.move_type == 0 || c_move.move_type == 1 || c_move.move_type == 4){ //for single hitting moves
	draw_text_transformed(x, y, string(c_damage), 2, 2, 0);
}

