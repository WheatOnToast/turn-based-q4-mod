if(array_length(obj_player_party.party_array) == 1){
	member_1 = instance_create_depth(2, 144, -9999, obj_player_party.party_array[0].battle_face);
}
else if(array_length(obj_player_party.party_array) == 2){
	member_1 = instance_create_depth(2, 144, -9999, obj_player_party.party_array[0].battle_face);
	member_2 = instance_create_depth(2, 158, -9999, obj_player_party.party_array[1].battle_face);
}
else if(array_length(obj_player_party.party_array) == 3){
	member_1 = instance_create_depth(2, 148, -9999, obj_player_party.party_array[0].battle_face);
	member_2 = instance_create_depth(2, 162, -9999, obj_player_party.party_array[1].battle_face);
	member_3 = instance_create_depth(2, 182, -9999, obj_player_party.party_array[2].battle_face);
}