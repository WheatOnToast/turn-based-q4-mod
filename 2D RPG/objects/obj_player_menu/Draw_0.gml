draw_set_font(global.font_main);

//dynamic width and height for UI
var _new_w = 0;

op_length = array_length(option[menu_level]);
for (var i = 0 ; i < op_length; i++)
{
	var _op_w = string_width(option[menu_level, i]);
	_new_w = max(_new_w, _op_w);
}

width = _new_w + op_border*4;
height = op_border*2 + string_height(option[0,0]) + (op_length-1)*op_space;

//draw menu background
draw_sprite_ext(sprite_index, image_index, x, y, 13, 3, 0 , c_white, 1);

//options
draw_set_valign(fa_top);
draw_set_halign(fa_left);

if(fight_state == battle_state.SELECTION)
{
	
	if(menu_level = 0){
		for (var i = 0 ; i < op_length; i++)
		{
			var _c = c_white; 
	
			if (pos == i)
			{
				_c = c_yellow;	
			}
	
			draw_text_color(x+op_border+(i*40), y+op_border, option[menu_level, i], _c, _c, _c, _c, 1);
		}	
	}

	//regular attack selection
	if(menu_level = 1){
		for (var i = 0 ; i < array_length(selected_player.p1_attacks); i++)
		{
			var _c = c_white; 
	
			if (pos == i)
			{
				_c = c_yellow;	
			}
			
			draw_text_color(x+op_border+(i*40), y+op_border, option[menu_level, i].move_name, _c, _c, _c, _c, 1);
			draw_text_color(x+op_border+(i*40), (y+op_border)+12,  "BP - "+string(option[menu_level, i].bCost), _c, _c, _c, _c, 1);
		}	
	}
	
	//magic attack selection
	if(menu_level = 2){
		for (var i = 0 ; i < array_length(selected_player.p1_magicAttacks); i++)
		{
			var _c = c_white; 
	
			if (pos == i)
			{
				_c = c_yellow;	
			}
			
			draw_text_color(x+op_border+(i*40), y+op_border, option[menu_level, i].move_name, _c, _c, _c, _c, 1);
			draw_text_color(x+op_border+(i*40), (y+op_border)+12,  "BP - "+string(option[menu_level, i].bCost), _c, _c, _c, _c, 1);
		}	
	}
	
	//items
	if(menu_level = 3 && array_length(obj_item_manager.inv) > 0){
		draw_sprite_ext(sprite_index, image_index, 48, 16, 13, 7, 0 , c_white, 1);
		item_menu_incr = 0;
		
		for (var i = 0 ; i < op_length; i++){
			var _c = c_white; 
	
			if (pos == i){
				_c = c_yellow;	
			}
			if(i >= 2){
				item_menu_incr = item_menu_incr + 24;
			}
			if(i == 0 || i mod 2 == 0){
				draw_text_color(48+op_border, 16+op_border+(i*8), option[menu_level, i].name, _c, _c, _c, _c, 1);
			}
			else if(i mod 2 != 0){
				draw_text_color(120+op_border, 16+op_border+((i-1)*8), option[menu_level, i].name, _c, _c, _c, _c, 1);
			}
		
		}
		draw_text_color(52, 150, option[menu_level, pos].desc, c_white, c_white, c_white, c_white, 1);
	}
	
	//switch player selection
	if(menu_level = 4){
		for(var i = 0; i < array_length(obj_player_party.party_array); i++){
			var _c = c_white;
			
			if (pos == i){
				_c = c_yellow;
			}
			
			draw_text_color(x+op_border+(i*40), y+op_border, option[menu_level, i].name, _c, _c, _c, _c, 1);
		}
	}
	
	//attack enemy selection
	if(menu_level = 10){
		for (var i = 0 ; i < array_length(obj_enemy_spawn.enemy_array); i++){
			var _c = c_white; 
			var _c2 = c_gray;
			
			if (pos == i){
				_c = c_yellow;
				_c2 = c_yellow;
			}
		
			if(instance_exists(option[menu_level, i])){
			draw_text_color(x+op_border+(i*40), y+op_border, option[menu_level, i].e_name, _c, _c, _c, _c, 1);
			}
			else{
				draw_text_color(x+op_border+(i*40), y+op_border, option[menu_level, i].e_name, _c2, _c2, _c2, _c2, 1);
			}
		}	
		
		//enemy health
		if(array_length(obj_enemy_spawn.enemy_array) == 1){
			draw_text_color(x+op_border+(0*40), y+op_border+16, "HP: "+string(obj_enemy_spawn.enemy_array[0].temp_hp), c_white, c_white, c_white, c_white, 1);
		}
		if(array_length(obj_enemy_spawn.enemy_array) == 2){
			draw_text_color(x+op_border+(0*40), y+op_border+16, "HP: "+string(obj_enemy_spawn.enemy_array[0].temp_hp), c_white, c_white, c_white, c_white, 1);
			draw_text_color(x+op_border+(1*40), y+op_border+16, "HP: "+string(obj_enemy_spawn.enemy_array[1].temp_hp), c_white, c_white, c_white, c_white, 1);
		}
		if(array_length(obj_enemy_spawn.enemy_array) == 3){
			draw_text_color(x+op_border+(0*40), y+op_border+16, "HP: "+string(obj_enemy_spawn.enemy_array[0].temp_hp), c_white, c_white, c_white, c_white, 1);
			draw_text_color(x+op_border+(1*40), y+op_border+16, "HP: "+string(obj_enemy_spawn.enemy_array[1].temp_hp), c_white, c_white, c_white, c_white, 1);
			draw_text_color(x+op_border+(2*40), y+op_border+16, "HP: "+string(obj_enemy_spawn.enemy_array[2].temp_hp), c_white, c_white, c_white, c_white, 1);
		}
	}	
	
	if(menu_level = 11){
		
		//player selection
		for(var i = 0; i < numOfPlayers; i++){
						var _c = c_white; 
			var _c2 = c_gray;
			
			if (pos == i){
				_c = c_yellow;
				_c2 = c_yellow;
			}
		
			if(instance_exists(option[menu_level, i])){
			draw_text_color(x+op_border+(i*40), y+op_border, option[menu_level, i].name, _c, _c, _c, _c, 1);
			}
			else{
				draw_text_color(x+op_border+(i*40), y+op_border, option[menu_level, i].name, _c2, _c2, _c2, _c2, 1);
			}
		}
		
		//party member health
		if(numOfPlayers == 1){
			draw_text_color(x+op_border+(0*40), y+op_border+16, "HP: "+string(obj_player_party.party_array[0].temp_hp), c_white, c_white, c_white, c_white, 1);
		}
		if(numOfPlayers == 2){
			draw_text_color(x+op_border+(0*40), y+op_border+16, "HP: "+string(obj_player_party.party_array[0].temp_hp), c_white, c_white, c_white, c_white, 1);
			draw_text_color(x+op_border+(1*40), y+op_border+16, "HP: "+string(obj_player_party.party_array[1].temp_hp), c_white, c_white, c_white, c_white, 1);
		}
		if(numOfPlayers == 3){
			draw_text_color(x+op_border+(0*40), y+op_border+16, "HP: "+string(obj_player_party.party_array[0].temp_hp), c_white, c_white, c_white, c_white, 1);
			draw_text_color(x+op_border+(1*40), y+op_border+16, "HP: "+string(obj_player_party.party_array[1].temp_hp), c_white, c_white, c_white, c_white, 1);
			draw_text_color(x+op_border+(2*40), y+op_border+16, "HP: "+string(obj_player_party.party_array[2].temp_hp), c_white, c_white, c_white, c_white, 1);
		}
	}
}
