if(obj_battle_bar.image_index <= 10 && phase = "player"){
	//get input
	left_key = keyboard_check_pressed(vk_left);
	right_key = keyboard_check_pressed(vk_right);
	accept_key = keyboard_check_pressed(ord("X"));
    back_key = keyboard_check_pressed(ord("Z"));
	
	up_key = keyboard_check_pressed(vk_up);
	down_key = keyboard_check_pressed(vk_down);
	
	//if(menu_level = 4){
		if(up_key){
			audio_play_sound(snd_menu_select,1,false);
			pos -= 2;	
		}
		else if(down_key){
			audio_play_sound(snd_menu_select,1,false);
			pos += 2;	
		}
	//}
	//move in menu
	pos += right_key - left_key;
	
	//go to previous menu
	if(back_key && menu_level != 404){pos = 0; menu_level = 0;}
	
	//store number of options in current menu
	op_length = array_length(option[menu_level]);
	
	//checks is selection is out of bounds
	if (pos >= op_length){pos = 0;}
	if (pos < 0){pos = op_length-1;}
	

	//dynamically changing item array
	for(var i = 0; i < 20; i++){
		option[3, i] = global.item_list.null_item;	
	}
	for(var i = 0; i < array_length(obj_item_manager.inv); i++){
		option[3, i] = obj_item_manager.inv[i];	
	}
	
	//checks if item selection is out of bounds
	if(menu_level == 3 && option[3, pos].name == "" && pos != 19){
		pos = 0;	
	}
	if(menu_level == 3 && option[3, pos].name == "" && pos == 19){
		for(i = 0; i < array_length(obj_item_manager.inv); i++)
		{
			if(option[3,i+1].name == ""){
				pos = i	
			}
		}
	}
	
	/*=======================
	/
	/    PLAYER OPTIONS
	/
	=======================*/
	if(fight_state == battle_state.SELECTION)
	{
		//SFX
		if(left_key || right_key){audio_play_sound(snd_menu_select,1,false);}
		
		if(accept_key)
		{
			var _sml = menu_level;
			audio_play_sound(snd_menu_select,1,false);	
	
			switch(menu_level)
			{		
				//menu levels
				case 0:
					//menu options
					switch(pos)
					{

					//attack
					case 0:
						menu_level = 1;
						break;
					//Magic
					case 1:
						menu_level = 2;
						break;
					//Items
					case 2:
						menu_level = 3;
						break;
					//Run
					case 3:
						with(instance_create_depth(0,0, -999999999, obj_encounter))
						{
							target_rm = global.last_room
							target_x = global.last_x;
							target_y = global.last_y;
							target_face = DOWN;
						}	
						instance_destroy(obj_btl_lines);
						obj_player.move_status = move_state.GO;
						break;
					//switch
					case 4:
						menu_level = 4;
						break;
					}
					break;
	
				case 1:
					//attack
					switch(accept_key)
					{
						case true:
							using_move = true;
							selected_move = selected_player.p1_attacks[pos];
							bbar_index = obj_battle_bar.image_index +selected_move.bCost;
							if(bbar_index > 20){
								fight_state = battle_state.NOTIFY;
								with(instance_create_depth(0, 0, -9999, obj_textbox))
								{
									textbox_x = 48;
									textbox_y = 144;
									textbox_height = 32;
									instance_time = 80;
									xscale = 13;
									yscale = 3;
									skip = false;
									scr_text("Not enough bCost!");
								}
								menu_level = 0;
								if(alarm[1] <= -1){
									alarm[1] = 100;	
								}	
								break;
							}
							else{
								menu_level = 10;
							}
							break;
					}
					break;
			
				case 2:
					//magic
					switch(accept_key)
					{
						case true:
							using_move = true;
							selected_move = selected_player.p1_magicAttacks[pos];
							bbar_index = obj_battle_bar.image_index + selected_move.bCost;
							if(bbar_index > 20){ //check if enough bCost
								fight_state = battle_state.NOTIFY;
								with(instance_create_depth(0, 0, -9999, obj_textbox))
								{
									textbox_x = 48;
									textbox_y = 144;
									textbox_height = 32;
									instance_time = 80;
									xscale = 13;
									yscale = 3;
									skip = false;
									scr_text("Not enough bCost!");
								}
								menu_level = 0;
								if(alarm[1] <= -1){
									alarm[1] = 100;	
								}	
								break;
							}
							else{
								menu_level = 10;
							}
	
							if(selected_player.temp_mp < selected_move.mpCost){ //checks if you have enough MP
								fight_state = battle_state.NOTIFY;
								with(instance_create_depth(0, 0, -9999, obj_textbox))
								{
									textbox_x = 48;
									textbox_y = 144;
									textbox_height = 32;
									instance_time = 80;
									xscale = 13;
									yscale = 3;
									skip = false;
									scr_text("Not enough MP!");
								}
								menu_level = 0;
								if(alarm[1] <= -1){
									alarm[1] = 100;	
								}	
								break;
							}
							else{
								menu_level = 10;
							}
							break;
					}
					break;
					
				case 3:
					//items
					if(array_length(obj_item_manager.inv) <= 0){ //checks if you have no items
						fight_state = battle_state.NOTIFY;
						with(instance_create_depth(0, 0, -9999, obj_textbox))
						{
							textbox_x = 48;
							textbox_y = 144;
							textbox_height = 32;
							instance_time = 60;
							xscale = 13;
							yscale = 3;		
							skip = false;
							scr_text("You have no items!!");
						}
						
						if(alarm[1] <= -1){
							alarm[1] = 100;	
						}	
						menu_level = 0;
						break;	
					}
					
					switch(accept_key)
					{
						case true:
							using_item = true;
							selected_item = obj_item_manager.inv[pos];
							if(selected_item.item_type == 0 ){//healing item
								menu_level = 11;
							}
							if(selected_item.item_type == 1){//damage item
								menu_level = 10;
							}
							break;
					}
					break;
				case 4:
					//switch character
					switch(accept_key)
					{
						case true:
							fight_state = battle_state.SWITCH;
							selected_player = obj_player_party.party_array[pos];
							selected_player_index = pos;
							
							//sets attacks
							array_delete(option[1], 0, 4);
							for (var i = 0 ; i < array_length(selected_player.p1_attacks); i++){
								option[1, i] = selected_player.p1_attacks[i];
							}

							//sets magic
							array_delete(option[2], 0, 4);
							for (var i = 0 ; i < array_length(selected_player.p1_magicAttacks); i++){
								option[2, i] = selected_player.p1_magicAttacks[i];	
							}


							//sets party switch choices
							for(var i = 0; i < array_length(obj_player_party.party_array); i++){
								option[4, i] = obj_player_party.party_array[i];	
							}
							
							with(instance_create_depth(0, 0, -9999, obj_textbox))
							{
								textbox_x = 48;
								textbox_y = 144;
								textbox_height = 32;
								instance_time = 60;
								xscale = 13;
								yscale = 3;		
								skip = false;
								player_name = obj_player_menu.selected_player.name;
								scr_text("Switched to "+player_name+"!");
							}
							//instance_create_depth(48, 128, -999, selected_player.battle_head);
							if(alarm[1] <= -1){
							alarm[1] = 80;	
							}	
							menu_level = 0;
							break;
							
					}
					break;
				case 10:
					//player choosing enemy (choosing an attack or dmg item will lead to case 10)
					
					switch(accept_key)
					{
						case true:
							if(!instance_exists(obj_enemy_spawn.enemy_array[pos])){// [blank] is already knocked out
								with(instance_create_depth(0, 0, -9999, obj_textbox))
								{
									textbox_x = 48;
									textbox_y = 144;
									textbox_height = 32;
									instance_time = 80;
									xscale = 13;
									yscale = 3;
									skip = false;
									chosen_enemy = obj_enemy_spawn.enemy_array[obj_player_menu.pos].e_name
									scr_text(chosen_enemy+" is already knocked out!");
								}
								if(alarm[1] <= -1){
									alarm[1] = 100;	
								}	
								menu_level = 0;
								break;	
							}
							selected_enemy = obj_enemy_spawn.enemy_array[pos];

							if(using_item == true){	//checks if player is using an item
								fight_state = battle_state.USING;	
								selected_item_receiver = selected_enemy;
								with(instance_create_depth(0, 0, -999, obj_textbox)) // [blank] uses [item]!
								{
									textbox_x = 48;
									textbox_y = 144;
									textbox_height = 32;
									instance_time = 80;
									xscale = 13;
									yscale = 3;
									skip = false;
									text_speed = 2;
									item_string = obj_player_menu.selected_item.name;
									scr_text(obj_player_menu.selected_player.name+" used "+item_string+"!!");
								}
								
								if(alarm[0] <= -1){
									alarm[0] = 30;	
								}
							}
							
							else if(using_move == true){ //check if player is attacking
								fight_state = battle_state.ATTACKING;
								with(instance_create_depth(0, 0, -999, obj_textbox)) // [blank] uses [attack]!
								{
									textbox_x = 48;
									textbox_y = 144;
									textbox_height = 32;
									instance_time = 80;
									xscale = 13;
									yscale = 3;
									skip = false;
									text_speed = 2;
									attack_string = obj_player_menu.selected_move.move_name
									scr_text(obj_player_menu.selected_player.name+" used "+attack_string+"!!");
								}
								
								
								if(alarm[0] <= -1){
									alarm[0] = 30;	
								}
							}
							break;
					}
					break;
				
				//player choosing party member
				case 11:
					switch(accept_key)
					{
						case true:
							fight_state = battle_state.USING;
							selected_item_receiver = obj_player_party.party_array[pos];
							with(instance_create_depth(0, 0, -9999, obj_textbox))
							{
								textbox_x = 48;
								textbox_y = 144;
								textbox_height = 32;
								instance_time = 80;
								xscale = 13;
								yscale = 3;
								skip = false;
								text_speed = 2;
								item_string = obj_player_menu.selected_item.name
								selected_user = obj_player_menu.selected_item_receiver.name;
								scr_text(selected_user+" used "+item_string+"!!");
							}
							if(alarm[0] <= -1){
								alarm[0] = 30;	
							}
							break;
					}
					break;
			}
	
			if (_sml != menu_level){pos = 0};
			//correct option length
			op_length = array_length(option[menu_level]);
		}
	}
}
	
	/*=======================
	/
	/    ENEMY OPTIONS
	/
	=======================*/

if(obj_battle_bar.image_index >= 10 && phase = "enemy"){	
	
	
	//randomly does physical or magic attack
	for(i = 0; i < 999; i++){
		rand = irandom(array_length(obj_enemy_spawn.enemy_array)-1);
		if(instance_exists(obj_enemy_spawn.enemy_array[rand]) && obj_enemy_spawn.enemy_array[rand].temp_hp > 0 && enemy_chosen_flag == 0){
			chosen_enemy = obj_enemy_spawn.enemy_array[rand];
			enemy_chosen_flag = 1;
			if (alarm[2] <= -1){
				alarm[2] = 100;	
				break;
			}
		}
	}
	
	
}
