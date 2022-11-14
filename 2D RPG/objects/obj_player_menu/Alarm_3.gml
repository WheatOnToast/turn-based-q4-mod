/// @description Phase Check & Enemy Atk init.
if(/*obj_battle_bar.image_index >= 10 && phase != "win" || obj_battle_bar.image_index == 10 &&*/ phase = "enemy" /*&& phase != "win"*/){
		e_calcd_dmg = obj_atk_lib.atk_use(chosen_attack, chosen_player);
		
		chosen_enemy.y = chosen_enemy.y-4;
		chosen_enemy.shadow.y = chosen_enemy.shadow.y-4;
		
		enemy_chosen_flag = 0;
}

if(obj_battle_bar.image_index < 10 && phase = "enemy"){ //print total damage taken and give phase to player
	with(instance_create_depth(0, 0, -9999, obj_textbox))
	{
		textbox_x = 48;
		textbox_y = 144;
		textbox_height = 32;
		instance_time = 60;
		xscale = 13;
		yscale = 3;
		skip = false;
		text_speed = 2;
		attack_string = obj_player_menu.chosen_attack.move_name;
		scr_text("What will you do??");
	}
	menu_level = 0;
	alarm[1] = 60;
}
