if(obj_player_party.party_array[0].temp_hp <= (obj_player_party.party_array[0].temp_hp/3) + 20){
	image_index = 2;	
}
else if(obj_player_party.party_array[0].temp_hp >= (obj_player_party.party_array[0].temp_hp/3) + 20){
	image_index = 0;	
}
i--;