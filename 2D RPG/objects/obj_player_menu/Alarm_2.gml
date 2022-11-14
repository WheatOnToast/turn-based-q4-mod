/// @description Enemy Choice
chosen_enemy.y = chosen_enemy.y+4;
chosen_enemy.shadow.y = chosen_enemy.shadow.y+4;

randomize()
phys_or_magic = irandom_range(0,1);

if(phase = "enemy" && chosen_enemy.temp_hp >= 0)
{
	
	if(irandom_range(1,100) >= 50){ //50% chance chosen player will be the selected player
		chosen_player = selected_player;
		rand_player = selected_player_index;
	}
	else{
		rand_player = irandom(array_length(obj_player_party.party_array)-1);
		chosen_player = obj_player_party.party_array[rand_player]; //randomly chooses player to attack
	}

		
	if(phase == "enemy"){
		
		if(rand_player == 0){
			instance_create_depth(2, 128, -99999, obj_exclamation);	
		}
		if(rand_player == 1){
			instance_create_depth(2, 142, -99999, obj_exclamation);	
		}
		if(rand_player == 2){
			instance_create_depth(2, 164, -99999, obj_exclamation);	
		}
	}
	
	switch(phys_or_magic){
		case 0:
			fight_state = battle_state.ATTACKING;
			chosen_attack = chosen_enemy.e_attacks[irandom(array_length(chosen_enemy.e_attacks)-1)]
			bbar_index = obj_battle_bar.image_index - chosen_attack.bCost;
			if(bbar_index < 0){ //makes sure enemy has enough bCost to use move
				break;	
			}
			with(instance_create_depth(0, 0, -9999, obj_textbox))
			{
				textbox_x = 48;
				textbox_y = 144;
				textbox_height = 32;
				instance_time = 80;
				xscale = 13;
				yscale = 3;
				text_speed = 2;
				skip = false;
				attack_string = obj_player_menu.chosen_attack.move_name;
				scr_text(obj_player_menu.chosen_enemy.e_name+" used "+attack_string+"!!");
			}
			if(alarm[3] <= -1){
				alarm[3] = 90;	
			}
			break;
		case 1:
			fight_state = battle_state.ATTACKING;
			chosen_attack = chosen_enemy.e_magicAttacks[irandom(array_length(chosen_enemy.e_magicAttacks)-1)]
			bbar_index = obj_battle_bar.image_index - chosen_attack.bCost;
			if(bbar_index < 0){ //makes sure enemy has enough bCost to use move
				break;	
			}
			with(instance_create_depth(0, 0, -9999, obj_textbox))
			{
				textbox_x = 48;
				textbox_y = 144;
				textbox_height = 32;
				instance_time = 80;
				xscale = 13;
				yscale = 3;
				text_speed = 2;
				skip = false;
				attack_string = obj_player_menu.chosen_attack.move_name;
				scr_text(obj_player_menu.chosen_enemy.e_name+" used "+attack_string+"!!");
			}
			if(alarm[3] <= -1){
				alarm[3] = 90;	
			}
			break;
	}
	
	if(phase == "enemy"){
		
		if(rand_player == 0 || (chosen_attack.move_type == 3 && numOfPlayers >= 1)){
			instance_create_depth(2, 128, -99999, obj_exclamation);	
		}
		if(rand_player == 1 || (chosen_attack.move_type == 3 && numOfPlayers >= 2)){
			instance_create_depth(2, 142, -99999, obj_exclamation);	
		}
		if(rand_player == 2 || (chosen_attack.move_type == 3 && numOfPlayers >= 3)){
			instance_create_depth(2, 164, -99999, obj_exclamation);	
		}
	}
}		
//chosen_enemy.image_blend = c_white;

