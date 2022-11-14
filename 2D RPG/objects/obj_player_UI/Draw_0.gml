draw_set_font(global.font_tiny);
//player health and mp
if(array_length(obj_player_party.party_array) == 1){
	draw_text_color(20, 148, "HP: "+string(obj_player_party.party_array[0].temp_hp), c_white, c_white, c_white, c_white, 1);
	draw_text_color(20, 154, "MP: "+string(obj_player_party.party_array[0].temp_mp), c_white, c_white, c_white, c_white, 1);
}
else if(array_length(obj_player_party.party_array) == 2){
	draw_text_color(20, 148, "HP: "+string(obj_player_party.party_array[0].temp_hp), c_white, c_white, c_white, c_white, 1);
	draw_text_color(20, 154, "MP: "+string(obj_player_party.party_array[0].temp_mp), c_white, c_white, c_white, c_white, 1);

	draw_text_color(20, 162, "HP: "+string(obj_player_party.party_array[1].temp_hp), c_white, c_white, c_white, c_white, 1);
	draw_text_color(20, 168, "MP: "+string(obj_player_party.party_array[1].temp_mp), c_white, c_white, c_white, c_white, 1);
}
else if(array_length(obj_player_party.party_array) == 3){
	draw_text_color(20, 148, "HP: "+string(obj_player_party.party_array[0].temp_hp), c_white, c_white, c_white, c_white, 1);
	draw_text_color(20, 154, "MP: "+string(obj_player_party.party_array[0].temp_mp), c_white, c_white, c_white, c_white, 1);

	draw_text_color(20, 162, "HP: "+string(obj_player_party.party_array[1].temp_hp), c_white, c_white, c_white, c_white, 1);
	draw_text_color(20, 168, "MP: "+string(obj_player_party.party_array[1].temp_mp), c_white, c_white, c_white, c_white, 1);
	
	draw_text_color(20, 176, "HP: "+string(obj_player_party.party_array[2].temp_hp), c_white, c_white, c_white, c_white, 1);
	draw_text_color(20, 182, "MP: "+string(obj_player_party.party_array[2].temp_mp), c_white, c_white, c_white, c_white, 1);
}
//draw_text_color(64, 16, string(obj_player_menu.numOfEnemies), c_white, c_white, c_white, c_white, 1);
//draw_text_color(8, 16, string(obj_battle_bar.image_index), c_white, c_white, c_white, c_white, 1);


